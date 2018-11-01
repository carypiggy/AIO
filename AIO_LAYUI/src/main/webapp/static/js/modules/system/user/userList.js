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
			
			application.init();
			//获取权限并加载按钮
			publicUtil.getPerms(application.PERMS_URL,application.HEADER,parent.cur_menu_id,'post','but_per');
			publicUtil.selectBase(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'USER_TYPE'} ,"type",true);
		
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
				_$.ajax({
					url: application.SERVE_URL+'/sys/sysorg/tree',
					success: function (data) {
						treeObj = $.fn.zTree.init($("#orgTree"), setting, covert(data.data)); //加载数据
						//初始化
						var nodeList = treeObj.getNodes();
			　　　　　　	//展开第一个根节点
						treeObj.expandNode(nodeList[0], true);
						treeObj.setting.callback.onClick(null, treeObj.setting.treeId, nodeList[0]);//调用事件	
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
				var tableIns = table.render({
					elem: '#userList',
					//生产坏境下请求后台
					url : application.SERVE_URL+'/sys/sysuser/list',
					cellMinWidth : 95,
					loading : true,
					page : true,
					even : true ,
					where:{orgId : treeNode.id},
					height : "full-200",
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
					,done: function(res, curr, count){    //res 接口返回的信息,
						publicUtil.tableSetStr(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'USER_TYPE'},'type');
					}	
				});	
			}
	
			//右键点击事件
			table.on('rowRight(userList)', function(obj){
				publicUtil.show_menu(obj);
			});
		
			//左键点击事件
			table.on('row(userList)', function(obj){
				publicUtil.hiddenMenu(obj);
			});
				
			//新增操作
			_$(document).on('click','.PER_ADD',function(){
				addUser();
			}); 
		
			//编辑操作
			_$(document).on('click','.PER_EDIT',function(){		
				var flag = publicUtil.jurgeSelectRows(table.checkStatus('userList').data);
				if(flag){
					addUser(table.checkStatus('userList').data[0]);
				}else{
					return false;
				}
	
			})		
		
			//重置密码操作
			_$(document).on('click','.PER_RESETPWD',function(){		
				var flag = publicUtil.jurgeSelectRows(table.checkStatus('userList').data);
				var parm = table.checkStatus('userList').data[0].id ;
				if(flag){
					layer.confirm('确定重置此用户密码吗？',{icon:3, title:'提示信息'},function(index){
						_$.ajax({
								url: application.SERVE_URL+'/sys/sysuser/resetPwd', //ajax请求地址
								data:{
									id :  parm
								},										
								success: function (res) {
									if(res.code==application.REQUEST_SUCCESS){
										table.reload('userList');
										// location.reload();
										layer.close(index);	
										layer.msg(res.msg,{time: 1000});							
									}else{
										layer.msg(res.msg,{time: 1000});
									}
								}
						})
					});		
				}else{
					return false;
				}
	
			});	
			//删除
			_$(document).on('click','.PER_DEL',function(){		
				var flag = publicUtil.jurgeSelectRows(table.checkStatus('userList').data);
				var parm = table.checkStatus('userList').data[0].id ;
				if(flag){
					layer.confirm('确定删除此用户吗？',{icon:3, title:'提示信息'},function(index){
						_$.ajax({
								url: application.SERVE_URL+'/sys/sysuser/delete', //ajax请求地址
								data:{
									id :  parm
								},										
								success: function (res) {
									if(res.code==application.REQUEST_SUCCESS){
										table.reload('userList');
										// location.reload();
										layer.close(index);	
										layer.msg(res.msg,{time: 1000});							
									}else{
										layer.msg(res.msg,{time: 1000});
									}
								}
						})
					});		
				}else{
					return false;
				}
			})	
		
			//搜索【此功能需要后台配合，所以暂时没有动态效果演示】
			form.on("submit(searchForm)",function(data){
				table.reload("userList",{
					page: {
						curr: 1 //重新从第 1 页开始
					},
					where: {//搜索的关键字
							username: $(".username").val(),
							name:$(".name").val(),
							type: $("#type").val()
					}
				})
			})
		
			//添加用户
			function addUser(edit){
				publicUtil.gotoEditPage(application.SERVE_URL +'/sys/sysuser/get',edit ==undefined?null:edit.id,"用户管理","userAdd.html")
			}		
		})
})