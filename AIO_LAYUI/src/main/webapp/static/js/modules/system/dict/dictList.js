/**
 * @autor syp
 * @content 字典列表页面js
 * @returns
 * @Time 2018-08-02
 */
layui.config({
	base : "../../../../static/js/"
}).extend({
	"application" : "application",
	"publicUtil"  : "publicUtil"
})
layui.use(['form','layer','laydate','table','laytpl','application','publicUtil'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
		publicUtil = layui.publicUtil,
        application = layui.application,
        laydate = layui.laydate,
        laytpl = layui.laytpl,
        table = layui.table;

	 application.init();
	
    //编码列表
    var tableIns = table.render({
		pageName: 'pageNo' //页码的参数名称，默认：page
		,limitName: 'pageSize' //每页数据量的参数名，默认：limit,
		,dataName: 'list'
		,statusCode: 200,
		even : true 		
        ,elem: '#dictList'
        ,url : application.SERVE_URL+'/sys/sysdict/list',
        cellMinWidth : 95,
        page : true,
        height : "full-160",
        limit : 10,
		headers : { 'Authorization' : application.HEADER},	
        id : "dictList",
        cols : [[
/*            {field: 'id', title: 'ID', align:"center",style:'display:none;'},*/
			{type:'checkbox'},
            {field: 'typeCode', title: '编码类型',event: 'setSign'},
            {field: 'label', title: '编码名称',event: 'setSign'},
            {field: 'value', title: '编码值',event: 'setSign'},
			{field: 'sort',sort: true, title: '排序',event: 'setSign'},
            {field: 'remark', title: '备注',event: 'setSign'}
        ]],
		done: function (res, curr, count) {
			$('th div span').css({'font-weight:': 'bold'});
		}
    });

	//新增操作
	$(document).on('click','.PER_ADD',function(){
    	_addDict();
    });
	
	//编辑操作
	$(document).on('click','.PER_EDIT',function(){		
		var flag = publicUtil.jurgeSelectRows(table.checkStatus('dictList').data);
		if(flag){			
			_addDict(table.checkStatus('dictList').data[0]);
		}else{
			return false;
		}

    })
	
	//删除
	$(document).on('click','.PER_DEL',function(){		
		var flag = publicUtil.jurgeSelectRows(table.checkStatus('dictList').data);
		if(flag){
            layer.confirm('确定删除此此编码？',{icon:3, title:'提示信息'},function(index){				
				$.ajax({
					url: application.SERVE_URL+"/sys/sysdict/delete", //ajax请求地址
					data:{
						id : table.checkStatus('dictList').data[0].id  
					},										
					success: function (res) {
						if(res.code==application.REQUEST_SUCCESS){
							tableIns.reload();
							// location.reload();
							top.layer.close(index);	
							top.layer.msg(res.msg);							
						}else{
							top.layer.msg(res.msg);
						}

					}
				});	
            });			
		}else{
			return false;
		}
    })	
	
	//获取权限并加载按钮
	publicUtil.getPerms(application.PERMS_URL,application.HEADER,parent.cur_menu_id,'get','but_per');
	//行点击事件
	//监听单元格事件
	table.on('tool(dictList)', function(obj){
		
		publicUtil.show_menu(obj);
	});
	
	
    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
    $(".search_btn").on("click",function(){
            table.reload("dictList",{
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                	typeCode: $(".searchTypeCode").val(),
					label: $(".searchLabel").val(),
                }
            })
    });

	
	
	//添加编码
	function _addDict(edit){
		publicUtil.gotoEditPage(application.SERVE_URL +'/sys/sysdict/get',edit ==undefined?null:edit.id,"编码管理","dictAdd.html");
	}

})