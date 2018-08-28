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
	"publicUtil" : "publicUtil"
})

layui.use(['table','form','element','layer','jquery','application','publicUtil'],function(){
	var layer = layui.layer,
		form = layui.form,
		laydate = layui.laydate,
		$ = layui.jquery,
		publicUtil = layui.publicUtil,
		table = layui.table,
		application = layui.application;
		
		application.init();
		//获取权限并加载按钮
		publicUtil.getPerms(application.PERMS_URL,application.HEADER,parent.cur_menu_id,'get','but_per');
		
		
		//根据Id 加载右侧用户数据
		/**
		 * 校友管理列表
		 */
		tableIns = table.render({
			elem: '#userList',
			url : application.SERVE_URL+'/sys/smSchoolmate/list',
			//生产坏境下请求后台
			cellMinWidth : 95,
			page : true,
			even : true ,
			where:{orgId : 0},
			height : "full-125",
			limit : 10,
			id : "userListTable",
			cols : [[
				//姓名、性别、证件类型、证件号码、入校日期、专业、班级、校友类型、申请日期、状态、操作
				// {field: 'id', title: 'ID', align:"center"},
				{type:'checkbox'},
				{field: 'name', title: '姓名'},
				{field: 'sex', title: '性别'},
				{field: 'cardtype', title: '证件类型'},
				{field: 'idcard', title: '证件号码'},
				{field: 'schoolDate', title: '入校日期'},
				{field: 'username', title: '专业'},
				{field: 'name', title: '班级'},
				{field: 'type', title: '校友类型'},
				{field: 'phone', title: '申请日期'},
				//{field: 'email', title: '联系电话'},
				{title: '操作', width:170, templet:'#userListBar',fixed:"right",align:"center"}
			]]
		});	


		//新增操作
		$(document).on('click','.PER_ADD',function(){
			addSm();
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
						type: "POST",
						data:{
							id : table.checkStatus('dictList').data[0].id  
						},
						beforSend: function () {
							publicUtil.refreshToken();
						},
						headers : { 'Authorization' : application.HEADER},												
						success: function (res) {
							if(res.code==application.REQUEST_SUCCESS){
								tableIns.reload();
								// location.reload();
								top.layer.close(index);	
								top.layer.msg(res.msg);							
							}else{
								top.layer.msg(res.msg);
							}

						},
						error: function(res){
							publicUtil.errofunc(res);
						}
					});	
				});			
			}else{
				return false;
			}
		})	





			
	    //列表操作
	    table.on('tool(userList)', function(obj){
	        var layEvent = obj.event,
	            data = obj.data;
	
	        if(layEvent === 'edit'){ //编辑
	        	addUser(data);
	        } else if(layEvent === 'del'){ //删除
	            layer.confirm('确定删除此用户？',{icon:3, title:'提示信息'},function(index){
										 layui.use('layer', function(){
												 $.post(application.SERVE_URL+'/sys/smSchoolmate/delete',{
													id : data.id  //将需要删除的newsId作为参数传入
												 },function(data){
													tableIns.reload();
													layer.close(index);
												 })
										 })
									 });	
							
	        } else if(layEvent === 'look'){ //预览
	            layer.alert("此功能需要前台展示，实际开发中传入对应的必要参数进行编码内容页面访问")
	        }
	    });	

		//新增用户
		$("#addUser_btn").click(function(){
			addUser();
		})	  
		
		//搜索【此功能需要后台配合，所以暂时没有动态效果演示】
		$(".search_btn").click(function(){
			if($(".searchVal").val() != ''){
				table.reload("userListTable",{
					page: {
						curr: 1 //重新从第 1 页开始
					},
					where: {
						key: $(".searchVal").val()  //搜索的关键字
					}
				})
				
			}else{
				layer.msg("请输入搜索的内容");
			}
		});
		
		
		//添加编码
		function addSm(edit){
			publicUtil.gotoEditPage(application.SERVE_URL +'/sys/smSchoolmate/get',edit ==undefined?null:edit.id,"校友管理","schoolmateAdd.html");
		}
		
		
		
	    //添加用户
	    function _addSm(edit){
				var title ="编辑校友"
				if(edit !=undefined && edit!="" )
				{
					title = title + "-" + edit.name;
				}
	        var index = layui.layer.open({
	            title : title,
	            type : 2,
	            content : "schoolmateAdd.html",
	            success : function(layero, index){
	                var body = layui.layer.getChildFrame('body', index);
	                if(edit){
						$.ajax({
							url: application.SERVE_URL +'/sys/smSchoolmate/get', //ajax请求地址
							type: "POST",
							data:{
								id :edit.id,
								},						
							success: function (data) {
								if(data){
								body.find("#schoolmateid").val(data.id);
								body.find("#sysUserId").val(data.id);
								body.find("#username").val(data.username);
								body.find("input[name='sysUserId']").val(data.id);
								body.find("input[name='username']").val(data.username);
								body.find(".sysUserUsername").val(data.username);
								body.find(".sex").val(data.sex);
								body.find(".name").val(data.name);
								body.find(".userType").val(data.userType);  
								body.find(".nation").val(data.nation);  
								body.find(".cardType").val(data.cardType);  
								body.find(".cardId").val(data.cardId);  
								body.find(".birthday").val(data.birthday);  
								//body.find(".userOrg").val(edit.orgId);
								//籍贯
								body.find(".country").val(edit.country);
								body.find(".province").val(data.province);
								body.find(".city").val(data.city);  
								body.find(".district").val(data.district);  
								}else{
								//console.data();
								top.layer.msg("用户信息获取失败！");
								}
								}
							}); 
	                    form.render();
	                }else{
										/* $.ajax({
													url: application.SERVE_URL +'/sys/sysuser/get', //ajax请求地址
													type: "POST",
													data:{
														id :edit.id,
													},						
													success: function (data) {
														if(data){
															body.find(".id").val(data.id);
															body.find(".username").val(data.username);
															body.find(".password").val(data.password)	
														}else{
															//console.data();
															top.layer.msg("用户信息获取失败！");
														}
													}
												}); */
		                    form.render();	
									}
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
})