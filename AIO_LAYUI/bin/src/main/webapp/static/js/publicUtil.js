/**
 * 	@Author: syp
	@Time: 2018-8
	@Tittle: application
	@Description: 封装一些公用
 */
var editFormData;
layui.define(['form','layer','jquery','application'],function(exports){
	var form = layui.form;
	var layer = layui.layer;
	var $ = layui.jquery;
	var application = layui.application;
	
	var obj ={
		
		
		 //封装Ajax 未完成
		 /**
		  * sync 
		  * cache
		  * type
		  * url
		  * datatype
		  * data
		  * sucfunc
		  * errfunc
		  */
		 aio_ajax :  function (sync,  type, url, datatype, data, sucfunc,errfunc) { 
			$.ajax({
				sync: sync,
				type: type,
				url: url,
				dataType: datatype,
				data: data,
				beforSend: function () {
							beforefunc();
				},
				success: function (sucdata) {
							sucfunc(sucdata)
				},
				error: function (errdata) {
							errfunc(errdata);
				}
			});
		 },		
		
		
		//由子页面回填至父页面（多参数）
		setAcrossNames : function(value , _idClass ,_nameClass) {
			for(var i=0; i<value.length ;i++){
				var _idValue= $(window.parent.document).find(_idClass).val();
				var _nameValue= $(window.parent.document).find(_nameClass).val();
				$(window.parent.document).find(_idClass).val(value[i].id+","+_idValue);
				$(window.parent.document).find(_nameClass).val(value[i].name+","+_nameValue);	
			}
			var index=parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		},
		
		//由子页面回填至父页面（多参数）
		setAcrossName : function(value , _idClass ,_nameClass) {
			$(window.parent.document).find(_idClass).val(value[0].id);
			$(window.parent.document).find(_nameClass).val(value[0].name);	
			var index=parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		},
		
		
		//不跨页面的回填
		setNames : function(value , _idClass ,_nameClass) {
			for(var i=0; i<value.length ;i++){
				var _idValue= $(_idClass).val();
				var _nameValue= $(_nameClass).val();
				$(_idClass).val(value[i].id+","+_idValue);
				$(_nameClass).val(value[i].name+","+_nameValue);	
			}
			var index=parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		},
		
		//不跨页面的回填
		setName : function(value , _idClass ,_nameClass) {

			$(_idClass).val(value[0].id);
			$(_nameClass).val(value[0].name);	

			var index=parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		},
		
		//取字典下拉框
		selectBase: function(url,data,selectid,flag){
			$.ajax({
				url:url,
				type: "POST",
				data: data ,
				headers : { 'Authorization' : application.HEADER},
				beforeSend: function(){
					beforefunc();
				}, 
				success:function(res){
					if(res.code==application.REQUEST_SUCCESS){
						var data = res.data;
						$("#"+selectid).empty();
						if(flag){
							$("#"+selectid).append('<option  value="" >'+"请选择"+' </option>');
						}
						for(var i =0;i<data.length;i++){
							$("#"+selectid).append('<option  value="'+data[i].value+'" >'+data[i].label+' </option>');//往下拉菜单里添加元素
						}
					}
					form.render();//菜单渲染 把内容加载进去
				},
				error: function(){
					errofuntion();
				}
			})
		},
		
		//判断选中的行数
		jurgeSelectRows: function(selectRows){
			if(selectRows.length != 1){
				top.layer.msg("请选中一行进行操作");
				return false;
			}else{
				return true;
			}
		},
		
		//根据权限加载a按钮
		lodingPerBut : function(permissons,butgroupId){
			var butHtml = '';
			for(var i=0;i<permissons.length;i++){
				var icon = permissons[i].icon ==null || permissons[i].icon =="null"  ? "": permissons[i].icon;
				butHtml += '<a class="layui-btn" id="'+permissons[i].operate+'" ><i class="layui-icon"> '+icon +' </i> '+permissons[i].name+'</a>';
			}
			$("#"+butgroupId).append(butHtml);
		},
		
		/**
		 * 跳转到编辑页面
		 * @param {String} getByIdUrl 获取entity接口地址
		 * @param {Object} header
		 * @param {Object} ID
		 * @param {Object} titleName
		 * @param {Object} pageUrl
		 * 
		 */
		gotoEditPage:function(getByIdUrl,ID,titleName,pageUrl)
		{
			if(ID == null){
				editFormData= "";
				var index = layui.layer.open({
					title: titleName,
					type: 2,
					content: pageUrl,
					success: function(layero, index) {
						setTimeout(function() {
							layui.layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
								tips: 3
							});
						}, 500)
					}
				})
				layui.layer.full(index);
				//改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
				$(window).on("resize", function() {
					layui.layer.full(index);
				})
			}else{
				$.ajax({
					url: getByIdUrl, //ajax请求地址
					type: "POST",
					data: {
						id: ID,
					},
					headers: {
						'Authorization': application.HEADER
					},
					beforSend: function () {
								beforefunc();
					},
					success: function(res) {
						 if(res.code==application.REQUEST_SUCCESS){
								editFormData=res.data;
								var index = layui.layer.open({
									title: titleName,
									type: 2,
									content: pageUrl,
									success: function(layero, index) {
										setTimeout(function() {
											layui.layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
												tips: 3
											});
										}, 500)
									}
								})
								layui.layer.full(index);
								//改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
								$(window).on("resize", function() {
									layui.layer.full(index);
								})
						 }else{
							 layui.layer.msg(res.msg);
							 return false;
						 }
					},
					error: function(){
						errofuntion();
					}
				});				
			}
		},
		
		//取下拉菜单并进行回填
		selectBaseAndSetVal : function (url,data,selectid,selectValue){
			$.ajax({
				url:url,
				type: "POST",
				data: data ,
				headers : { 'Authorization' : application.HEADER},
				beforeSend: function(){
					beforefunc();
				},
				success:function(res){
					if(res.code==application.REQUEST_SUCCESS){
						var data = res.data;
						$("#"+selectid).empty();
						for(var i =0;i<data.length;i++){
							$("#"+selectid).append('<option  value="'+data[i].value+'">'+data[i].label+'</option>');//往下拉菜单里添加元素
						}
						$('#'+selectid).val(selectValue);
						form.render('select');//菜单渲染 把内容加载进去
					}else{
						layui.layer.msg(res.msg);
						return false;
					}
				},
				error: function(){
					errofuntion();
				}
			})
		},
		
		//radio的回显
		setCheckBoxVal : function(checkboxName,checkedVal){
			$(".isShow input[name='"+checkboxName+"'][value='"+checkedVal+"']").prop("checked","checked"); 
			form.render();
		},
		
		//获取权限列表
		getPerms : function (url,header,menuId,methodType,butGroupId){
			$.ajax({
				url: url, //ajax请求地址
				type: methodType,			
				headers : { 'Authorization' : application.HEADER},
				data:{
					menuId : menuId
				},
				beforeSend: function(){
					beforefunc();
				},										
				success: function (result) {
					// if(result.code==application.REQUEST_SUCCESS){
						
						var permissons = result;
						var butHtml = '';
						var leftMenu="";
						$("table").first().after("<dl class='show_menu' id='show_menu'></dl>");
						for(var i=0;i<permissons.length;i++){
							var icon = permissons[i].icon ==null || permissons[i].icon =="null"  ? "": permissons[i].icon;
							butHtml += '<a class="layui-btn PER_'+permissons[i].operate+'" ><i class="layui-icon '+ icon +'"></i> '+permissons[i].name+'</a>';
							/**
							 * 此处应将权限唯一标识符进行处理，使得两处菜单可以调用同一方法
							 */
							leftMenu+="<dd><a href='javascript:;' class='PER_"+permissons[i].operate+"' ><i class='layui-icon "+icon+"'></i> "+permissons[i].name+"</a></dd>";
						}
						$("#"+butGroupId).append(butHtml);
						$("#show_menu").append(leftMenu);
// 					}else{
// 						// layui.layer.msg(result.msg);
// 						return false;
// 					}
				},
				error: function(){
					errofuntion();
				}
			}); 
		},
		
		
		/**
		 * 表格字段取字典表回显
		 */
		tableSetStr : function(url,data,str){
			$.ajax({
				url:url,
				type: "POST",
				data: data ,
				beforeSend: function(){
					beforefunc();
				},
				headers : { 'Authorization' : application.HEADER},
				success:function(res){
					if(res.code==application.REQUEST_SUCCESS){
						/*渲染表格*/
						$("[data-field = '"+str+"']").children().each(function(){
							for(var i =0;i<res.length;i++){
								if($(this).text().trim() == res[i].value){								
									$(this).text(res[i].label);
								}
							}
						})
					}else{
						// layui.layer.msg(res.msg);
						return false;
					}
				},
				error: function(data){
					errofuntion(data);
				}
			})
		},
		
		//ztree 回显
		/**
		 * treeNode 回显数据
		 * Tree    树id
		 * 
		 */
		setTreeSel : function(treeNode,treeObj){
			if(typeof treeNode == 'string'){
				var nodes = treeObj.getNodesByParam("id",
						treeNode, null);
				//勾选当前选中的节点
				treeObj.checkNode(nodes[0], true, true);
				ztreeObj.expandNode(nodes[0], true);
			}else{
				//遍历勾选角色关联的菜单数据
				for (var i = 0; i < treeNode.length; i++) {
					//根据角色菜单节点数据的属性搜索，获取与完整菜单树完全匹配的节点JSON对象集合
					var nodes = treeObj.getNodesByParam("id",
							treeNode[i].id, null);
					//勾选当前选中的节点
					treeObj.checkNode(nodes[0], true, true);
					ztreeObj.expandNode(nodes[0], true);
				}
			}
		},
		
		/**
		 * 权限左键菜单
		 */
		show_menu:function(data){
			
			$("#show_menu").css({
				//定义菜单显示位置为事件发生的X坐标和Y坐标
				top : window.event.pageY,
				left : window.event.pageX,
				display:'block'
			}).show().delay(3000).hide(300);
		// 		$("#oplog").click(function(){
		// 			
		// 			openLogsInfo(data);
		// 			
		// 		});
		
		},
			
		//刷新Token方法
		refreshToken	: function (){
				if(judgeTokenIssue()){
					$.ajax({
						async:false,
						url: application.SERVE_URL +'/refreshToken', //ajax请求地址
						type: "POST",
						headers : { 'Authorization' : application.HEADER},						
						success: function (data) {
							sessionStorage.clear();
							sessionStorage.setItem("token", data.data.token);
							sessionStorage.setItem("tokenTime", data.data.tokenTime);
						},
						error: function (errdata) {
							window.location.href = application.BASE_URL+"/login.html";
						}
					});
				}
		},
		
		//erro 方法 
		errofunc :function(res){
			var result=res.responseJSON;
			top.layer.msg(result.msg+"("+result.code+")");
		}
	
}






		function judgeTokenIssue(){
			var timelogin= application.TOKENTIME - new Date().getTime() ;		
			if(timelogin < application.TOKENISSUE){
				return true;
			}else if(timelogin < 0) {
				window.location.href = application.BASE_URL+"/login.html";
			}else{
				return false;
			}
		}

		 //封装Ajax 未完成
		 /**
		  * sync 
		  * cache
		  * type
		  * url
		  * datatype
		  * data
		  * sucfunc
		  * errfunc
		  */
			function aio_ajax(sync,  type, url, datatype, data, sucfunc,errfunc) { 
					$.ajax({
						sync: sync,
						type: type,
						url: url,
						dataType: datatype,
						data: data,
						beforSend: function () {
							beforefunc();
						},
						success: function (sucdata) {
							sucfunc(sucdata);
						},
						error: function (errdata) {
							errfunc(errdata)
						}
					});
			}		


		//erro 方法
		function errofuntion(res){
			var result=data.responseJSON;
			top.layer.msg(result.msg+"("+result.code+")");
		}

		//刷新token的方法（）
		function beforefunc(){
			if(judgeTokenIssue()){
				$.ajax({
					async:false,
					url: application.SERVE_URL +'/refreshToken', //ajax请求地址
					type: "POST",
					headers : { 'Authorization' : application.HEADER},						
					success: function (data) {
						sessionStorage.clear();
						sessionStorage.setItem("token", data.data.token);
						sessionStorage.setItem("tokenTime", data.data.tokenTime);
					}
				});
			}
		}
		
    exports('publicUtil', obj);
})