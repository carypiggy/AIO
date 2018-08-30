/**
 * @autor syp
 * @content 区域列表页面js
 * @returns
 * @Time 2018-08-01
 */
layui.config({
	base : "../../../../static/js/"
}).extend({
	"application" : "application",
	"publicUtil"  : "publicUtil"
})
var formdatas; var isAdd;
layui.use(['element', 'layer', 'form', 'upload', 'treeGrid','publicUtil','application'], function () {
    var treeGrid = layui.treeGrid,
	    $ = layui.jquery,
		publicUtil = layui.publicUtil,
		application = layui.application,
	    laydate = layui.laydate,
		form = layui.form,
	    laytpl = layui.laytpl; 
		
	application.init();	
    var treeTable = treeGrid.render({
        elem: '#areaTree'
        ,url:application.SERVE_URL+'/sys/sysarea/list'
        ,cellMinWidth: 100,
		even : true     
        ,id: "areaTree"
		,headers : { 'Authorization' : application.HEADER}
        ,treeId:'id'//树形id字段名称
        ,treeUpId:'parentId'//树形父id字段名称
        ,treeShowName:'name'//以树形式显示的字段
        ,cols: [[
			{type:'checkbox'}
            ,{field:'name', edit:'text',title: '区域名称',event: 'setSign'}
			,{field:'code', edit:'text',title: '区域编码',event: 'setSign'}
			,{field:'type', edit:'text',title: '区域类型',event: 'setSign'}
			,{field:'sort', edit:'text',title: '排序号',event: 'setSign'}
			,{field:'remark', edit:'text',title: '备注信息',event: 'setSign'}
			,{field:'createDate', edit:'text',title: '更新时间',event: 'setSign'}
        ]]
		,done: function(res, curr, count){    //res 接口返回的信息,
			publicUtil.tableSetStr(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'AREA_TYPE'},'type');
		}
        ,page:false
    });
    
	//获取权限并加载按钮
	publicUtil.getPerms(application.PERMS_URL,application.HEADER,parent.cur_menu_id,'get','but_per');
	//行点击事件
	//监听单元格事件
	treeGrid.on('tool(areaTree)', function(obj){
		publicUtil.show_menu(obj);
	});

    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
    $(".search_btn").on("click",function(){
        if($(".searchVal").val() != ''){
        	treeGrid.reload("areaTree",{
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                    name: $(".searchVal").val()  //搜索的关键字
                }
            })
        }else{
            layer.msg("请输入搜索的内容");
        }
    });



    //添加区域
    function _addArea(edit){
		publicUtil.gotoEditPage(application.SERVE_URL +'/sys/sysarea/get',edit ==undefined?null:edit.id,"区域修改","areaAdd.html");
    }

	$(document).on('click','.PER_ADD',function(){
		var flag = publicUtil.jurgeSelectRows(treeGrid.checkStatus('areaTree').data);
		if(flag){
			isAdd = true;
			_addArea(treeGrid.checkStatus('areaTree').data[0]);
		}else{
			return false;
		}
		
	});
	
	//编辑操作
	$(document).on('click','.PER_EDIT',function(){		
		var flag = publicUtil.jurgeSelectRows(treeGrid.checkStatus('areaTree').data);
		if(flag){		
			isAdd = false;
			_addArea(treeGrid.checkStatus('areaTree').data[0]);
		}else{
			return false;
		}

	})
	
	//删除
	$(document).on('click','.PER_DEL',function(){		
		var flag = publicUtil.jurgeSelectRows(treeGrid.checkStatus('areaTree').data);
		if(flag){
			layer.confirm('确定删除此区域吗？',{icon:3, title:'提示信息'},function(index){
				$.ajax({
					url: application.SERVE_URL+"/sys/sysarea/delete", //ajax请求地址
					data:{
						id : treeGrid.checkStatus('areaTree').data[0].id 
					},
					headers : { 'Authorization' : application.HEADER},												
					success: function (res) {
						if(res.code==application.REQUEST_SUCCESS){
							treeTable.reload();
							layer.close(index);
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
		
});