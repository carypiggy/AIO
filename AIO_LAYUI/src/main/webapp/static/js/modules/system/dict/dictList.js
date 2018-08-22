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
        elem: '#dictList',
        url : application.SERVE_URL+'/sys/sysdict/list',
        cellMinWidth : 95,
        page : true,
        height : "full-160",
        limit : 10,
		headers : { 'Authorization' : application.HEADER},	
        id : "dictList",
        cols : [[
/*            {field: 'id', title: 'ID', align:"center",style:'display:none;'},*/
			{type:'checkbox'},
            {field: 'typeCode', title: '编码类型'},
            {field: 'label', title: '编码名称'},
            {field: 'value', title: '编码值'},
			{field: 'sort',sort: true, title: '排序'},
            {field: 'remark', title: '备注'}
        ]]
    });

	//新增操作
	$(document).on('click','#ADD',function(){
    	addDict();
    });
	
	//编辑操作
	$(document).on('click','#EDIT',function(){		
		var flag = publicUtil.jurgeSelectRows(table.checkStatus('dictList').data);
		if(flag){
			addDict(table.checkStatus('dictList').data[0]);
		}else{
			return false;
		}

    })
	
	//删除
	$(document).on('click','#DEL',function(){		
		var flag = publicUtil.jurgeSelectRows(table.checkStatus('dictList').data);
		if(flag){
            layer.confirm('确定删除此此编码？',{icon:3, title:'提示信息'},function(index){				
				$.ajax({
					url: application.SERVE_URL+"/sys/sysdict/delete", //ajax请求地址
					type: "POST",
					data:{
						id : table.checkStatus('dictList').data[0].id  
					},
					headers : { 'Authorization' : application.HEADER},												
					success: function (data) {
						if(data = "success"){
							treeTable.reload();
							layer.close(index);	
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
    function addDict(edit){
        var index = layui.layer.open({
            title : "添加编码",
            type : 2,
            content : "dictAdd.html",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                if(edit){
					$.ajax({
						url: application.SERVE_URL +'/sys/sysdict/get', //ajax请求地址
						type: "POST",
						data:{
							id :edit.id,
						},
						headers : { 'Authorization' : application.HEADER},						
						success: function (data) {
							if(data){
								body.find(".id").val(data.id);
								body.find(".remark").val(data.remark);
								body.find(".value").val(data.value);
								body.find(".typeCode").val(data.typeCode);
								body.find(".label").val(data.label);
								body.find(".value").val(data.value);
								body.find(".sort").val(data.sort);  	
							}else{
								//console.data();
								top.layer.msg("编码获取失败！");
							}
						}
					}); 
                    form.render();
                }
                setTimeout(function(){
                    layui.layer.tips('点击此处返回编码列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                },500)
            }
        })
        layui.layer.full(index);
        //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize",function(){
            layui.layer.full(index);
        })
    }
	

})