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
var formdatas;
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
		,done: function(res, curr, count){    //res 接口返回的信息
			$("[data-field = 'isShow']").children().each(function(){
				if($(this).text() == 1){
					$(this).text("展示");
				}else if($(this).text() == 0){
					$(this).text("禁用");
				}
			}),
			$("[data-field = 'type']").children().each(function(){
				if($(this).text() == 0){
					$(this).text("菜单");
				}else if($(this).text() == 1){
					$(this).text("权限");
				}
			})
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

    //添加菜单
    function addMenu(edit,type){
        var index = layui.layer.open({
            title : "菜单修改",
            type : 2,
            content : "menuAdd.html",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
				
                if(type == "edit"){
					$.ajax({
						url: application.SERVE_URL +'/sys/sysmenu/get', //ajax请求地址
						type: "POST",
						data:{
							id :edit.id,
						},
						headers : { 'Authorization' : application.HEADER},						
						success: function (data) {
							formdatas = data;
							if(data){
								body.find(".id").val(data.id);
								body.find(".remark").val(data.remark);
								body.find(".code").val(data.code);
								body.find(".parentId").val(data.parentId);
								body.find(".name").val(data.name);
								body.find(".type select").val(data.type); 
								// body.find(".operate select").val(data.operate);
								body.find(".permission").val(data.permission);  
								body.find(".sort").val(data.sort);  
								body.find(".icon").val(data.icon);  
								body.find(".target").val(data.target);  
								body.find(".href").val(data.href); 
								body.find(".isShow input[name='isShow'][value='"+edit.isShow+"']").prop("checked","checked"); 
								body.find(".parentName").val(data.parentSysMenu.name);  
								form.render();
							}else{
								//console.data();
								top.layer.msg("编码获取失败！");
							}
						}
					}); 
                }else{
					$.ajax({
						url: application.SERVE_URL +'/sys/sysmenu/get', //ajax请求地址
						type: "POST",
						data:{
							id :edit.id,
						},
						headers : { 'Authorization' : application.HEADER},						
						success: function (data) {
							if(data){
								body.find(".parentId").val(data.id);
								body.find(".parentName").val(data.name);  
							}else{
								//console.data();
								top.layer.msg("菜单获取失败！");
							}
						}
					}); 
					form.render();
				}
                setTimeout(function(){
                    layui.layer.tips('点击此处返回菜单列表', '.layui-layer-setwin .layui-layer-close', {
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
	
		//新增操作
		$(document).on('click','#ADD',function(){
	    	var flag = publicUtil.jurgeSelectRows(treeGrid.checkStatus('menuTree').data);
	    	if(flag){
	    		addMenu(treeGrid.checkStatus('menuTree').data[0],'add');
	    	}else{
	    		return false;
	    	}
	    });
		
		//编辑操作
		$(document).on('click','#EDIT',function(){		
			var flag = publicUtil.jurgeSelectRows(treeGrid.checkStatus('menuTree').data);
			if(flag){
				addMenu(treeGrid.checkStatus('menuTree').data[0],'edit');
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
	
	
	
});