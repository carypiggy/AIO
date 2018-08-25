/**
 * @autor syp
 * @content 菜单列表页面js
 * @returns
 * @Time 2018-08-01
 */
layui.config({
	base : "../../../../static/js/"
}).extend({
	"application" : "application",
	"publicUtil"  : "publicUtil"
})
//表单回填
var formdatas;var isAdd;
layui.use(['element', 'layer', 'form', 'upload', 'treeGrid','application','publicUtil'], function () {
    var treeGrid = layui.treeGrid,
	    $ = layui.jquery,
		publicUtil = layui.publicUtil,
		application = layui.application,
	    laydate = layui.laydate,
		form = layui.form,
	    laytpl = layui.laytpl; //很重要
	
	application.init();	
    var treeTable =treeGrid.render({
        elem: '#menuTree'
        ,url: application.SERVE_URL+'/sys/sysmenu/list'
        ,id: "menuTree"
	
		,headers : { 'Authorization' : application.HEADER}
        ,treeId:'id'//树形id字段名称
        ,treeUpId:'parentId'//树形父id字段名称
        ,treeShowName:'name'//以树形式显示的字段
        ,cols: [[
			{type:'checkbox'},			
            {field:'name', title: '菜单名称'}
            ,{field:'code', title: '菜单编码'}
			,{field:'href', title: '菜单链接'}
			,{field:'type', title: '菜单类型'}
			,{field:'permission', title: '权限标记'}
            ,{field:'isShow', title: '是否显示'}
        ]]        
		,done: function(res, curr, count){    //res 接口返回的信息,
			publicUtil.tableSetStr(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'MENU_SHOW'},'isShow');
			publicUtil.tableSetStr(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'MENU_TYPE'},'type');
		}

    });
    
	//获取权限并加载按钮
	publicUtil.getPerms(application.PERMS_URL,application.HEADER,parent.cur_menu_id,'get','but_per');
	
	
    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
    $(".search_btn").on("click",function(){
		treeGrid.reload("menuTree",{
			page: {
				curr: 1 //重新从第 1 页开始
			},
			where: {
				name: $(".searchVal").val()  //搜索的关键字
			}
		})
    });

   
		//新增操作
		$(document).on('click','#ADD',function(){
	    	var flag = publicUtil.jurgeSelectRows(treeGrid.checkStatus('menuTree').data);
	    	if(flag){
				isAdd = true;
	    		_addMenu(treeGrid.checkStatus('menuTree').data[0],'add');
	    	}else{
	    		return false;
	    	}
	    });
		
		//编辑操作
		$(document).on('click','#EDIT',function(){		
			var flag = publicUtil.jurgeSelectRows(treeGrid.checkStatus('menuTree').data);
			if(flag){
				isAdd = false;
				_addMenu(treeGrid.checkStatus('menuTree').data[0],'edit');
			}else{
				return false;
			}
	
	    })
		
		//删除
		$(document).on('click','#DEL',function(){		
			var flag = publicUtil.jurgeSelectRows(treeGrid.checkStatus('menuTree').data);
			if(flag){
	            layer.confirm('确定删除此菜单吗？',{icon:3, title:'提示信息'},function(index){
					$.ajax({
						url: application.SERVE_URL+"/sys/sysmenu/delete", //ajax请求地址
						type: "POST",
						data:{
							id : treeGrid.checkStatus('menuTree').data[0].id 
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
	
	
	//添加菜单
	function _addMenu(edit,type){
		publicUtil.gotoEditPage(application.SERVE_URL +'/sys/sysmenu/get',edit ==undefined?null:edit.id,"菜单修改","menuAdd.html");
	}
});