/**
 * @autor syp
 * @content 用户列表页面js
 * @returns
 * @Time 2018-08-03
 */

layui.config({
	base : "../../../../static/js/"
}).extend({
	"application" : "application",
	"publicUtil"  : "publicUtil",
	"dateUtils"  : "dateUtils"
})
$(function(){ 
layui.use(['table','form','element','layer','jquery','application','publicUtil','dateUtils'],function(){
	var layer = layui.layer,
		form = layui.form,
		laydate = layui.laydate,
		_$ = layui.jquery,
		dateUtils = layui.dateUtils,
		publicUtil = layui.publicUtil,
		table = layui.table;
		application = layui.application;
		
		
		//获取权限并加载按钮
		publicUtil.getPerms(application.PERMS_URL,application.HEADER,parent.cur_menu_id,'get','but_per');
		
		//节点标记
		var treeObj;
		var tableIns;
		//ztree设置
		var setting = {
			view: {
				selectedMulti: false
			},
			data: {
				simpleData: {
					enable: true,
					idKey: "id",
					pIdKey: "parentId"			
				}
			},
			callback: {
				onClick: onClick
				
			}
		};
		
	//初始化树
	initTree();
	function initTree() {
		$.ajax({
				url: application.SERVE_URL+'/sys/sysorg/tree',
				headers : { 'Authorization' : application.HEADER},//ajax请求地址
				success: function (data) {
				treeObj = $.fn.zTree.init($("#orgTree"), setting, covert(data.data)); //加载数据
				//初始化
				var node = treeObj.getNodeByParam('id', 0);//获取id为1的点
				treeObj.selectNode(node);//选择点
				treeObj.expandAll(true);
				treeObj.setting.callback.onClick(null, treeObj.setting.treeId, node);//调用事件	
			}
		});		
		// $.fn.zTree.init($("#treeDemo"), setting);
	}	
		
	function covert(data) {
		for (var i = 0; i < data.length; i++) {
			data[i].name = data[i].name +"("+dateUtils.getYearAndDay(data[i].openDate)+"--"+ judgeNull(data[i].closeDate)+")"
		}
		return data;
	}
	
	function judgeNull(data){
		if(data == null ||data =='null' ||data ==""){
			return "至今";
		}else{
			return dateUtils.getYearAndDay(data);
		}
	}
             

		//根据Id 加载右侧用户数据
		/**
		 * treeNode 为选中的节点
		 */
		function onClick(event, treeId, treeNode, clickFlag) {
			// console.log(treeNode.id);
			//生产坏境下请求后台
			tableIns = table.render({
						elem: '#userList',
						//生产坏境下请求后台
						url : application.SERVE_URL+'/sys/sysuser/list',
						cellMinWidth : 95,
						page : true,
						where:{orgId : treeNode.id},
						height : "full-125",
						limit : 10,
						id : "userList",
						cols : [[
							{type:'checkbox'},
							{field: 'username', title: '登录名'},
							{field: 'name', title: '姓名'},
							{field: 'type', title: '用户类型'},
							{field: 'mobile', title: '手机'},
							{field: 'email', title: '邮箱'},
						]]
					});	
				}
		/* 	});
		} */		
		
			
	    //列表操作
	    table.on('tool(userList)', function(obj){
	        var layEvent = obj.event,
	            data = obj.data;
	
	        if(layEvent === 'edit'){ //编辑
	        	addUser(data);
	        } else if(layEvent === 'del'){ //删除
	            layui.use('layer', function(){
												 $.post(application.SERVE_URL+'/sys/sysuser/delete',{
													id : data.id  //将需要删除的newsId作为参数传入
												 },function(data){
													tableIns.reload();
													layer.close(index);
												 })
										 })
									
	        } else if(layEvent === 'look'){ //预览
	            layer.alert("此功能需要前台展示，实际开发中传入对应的必要参数进行编码内容页面访问")
	        }
	    });	

		//新增操作
		_$(document).on('click','#ADD',function(){
				addUser();
    }); 
		
		//编辑操作
		_$(document).on('click','#EDIT',function(){		
			var flag = publicUtil.jurgeSelectRows(table.checkStatus('userList').data);
			if(flag){
				addUser(table.checkStatus('userList').data[0]);
			}else{
				return false;
			}
	
	  })		
		
		//搜索【此功能需要后台配合，所以暂时没有动态效果演示】
		$(".search_btn").click(function(){
			if($(".searchVal").val() != ''){
				table.reload("dictListTable",{
					page: {
						curr: 1 //重新从第 1 页开始
					},
					where: {//搜索的关键字
						username: $(".username").val(),
						name:$(".name").val(),
						}
				})
			}else{
				layer.msg("请输入搜索的内容");
			}
		});
		
	    //添加用户
	    function $addUser(edit){
	        var index = layui.layer.open({
	            title : "添加用户",
	            type : 2,
	            content : "userAdd.html",
	            success : function(layero, index){
	                var body = layui.layer.getChildFrame('body', index);
	                if(edit){
	                   body.find(".userOrg").val(edit.orgId);
	                	//数据回填可参考如下
										$.ajax({
												url: application.SERVE_URL +'/sys/sysuser/get', //ajax请求地址
												type: "POST",
												headers : { 'Authorization' : application.HEADER},
												data:{
													id :edit.id,
												},						
												success: function (data) {
													if(data){
														body.find(".id").val(data.id);
														body.find(".username").val(data.username);
														body.find(".password").val(data.password);
														body.find(".parentId").val(data.parentId);
														body.find(".name").val(data.name);
														body.find(".idcard").val(data.idcard);  
														body.find(".permission").val(data.permission);  
														body.find(".userPhoto").val(data.mobile);  
														body.find(".userEmail").val(data.email);  
														body.find(".userType").val(data.type);  
														body.find(".orgId").val(data.orgId);  
														body.find(".userOrg").val(edit.orgId);
														body.find(".userDesc").val(edit.desc);
													}else{
														//console.data();
														top.layer.msg("用户信息获取失败！");
													}
												}
										}); 
	                }
		                    form.render();	
	                setTimeout(function(){
	                    layui.layer.tips('点击此处返回机构列表', '.layui-layer-setwin .layui-layer-close', {
	                        tips: 3
	                    });
	                },500)
	            }
	        })
	        layui.layer.full(index);
	        //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
	        _$(window).on("resize",function(){
	            layui.layer.full(index);
	        })
	    }		

		
	    //添加用户
	    function addUser(edit){
				publicUtil.gotoEditPage(application.SERVE_URL +'/sys/sysuser/get',application.HEADER,edit ==undefined?null:edit.id,"用户管理","userAdd.html")
	    }		
})
})