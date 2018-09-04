/**
 * 	@Author: syp
	@Time: 2018-8
	@Tittle: application
	@Description: 封装一些公用
 */
var editFormData;
layui.define(['form','layer','jquery','application','table','treeGrid'],function(exports){
	var form = layui.form;
	var layer = layui.layer;
	var $ = layui.jquery;
	var application = layui.application;
	var table = layui.table;
	var treeGrid=layui.treeGrid;
	
	/**
	 * 初始化AJAX的请求
	 */
	$.ajaxSetup( {
	    type: "POST", // 默认使用POST方式
	    headers : { "Authorization" : application.HEADER},
	    beforeSend: function(){
	    	refreshToken();
		},
	    error: function(res){ // 出错时默认的处理函数
	    	console.log(res);
	    	//publicUtil.errofunc(res);
	    }
	} );
	
	
	//刷新当前
	$(document).on("click",".refreshTable",function(){ 
		parent.$(".refresh").click();
	})
	
	var obj ={
		
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
					data: {
						id: ID,
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
				data:{
					menuId : menuId
				},									
				success: function (result) {
					// if(result.code==application.REQUEST_SUCCESS){
						
						var permissons = result;
						var butHtml = '';
						var leftMenu="<dd><a href='javascript:;' class='PER_REFRESH  refreshTable refreshThis'><i class='layui-icon layui-icon-refresh-3'></i> 刷新</a></dd>";
						$("body div").first().after("<dl class='show_menu' id='show_menu'></dl>");
						for(var i=0;i<permissons.length;i++){
							var icon = permissons[i].icon ==null || permissons[i].icon =="null"||permissons[i].icon ==""  ? "layui-icon-ok-circle": permissons[i].icon;
							
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
				success:function(res){
					var data = res.data;
					if(res.code==application.REQUEST_SUCCESS){
						/*渲染表格*/
						$("[data-field = '"+str+"']").children().each(function(){
							for(var i =0;i<data.length;i++){
								if($(this).text().trim() == data[i].value){								
									$(this).text(data[i].label);
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
		 * 权限左/右键菜单
		 */
		show_menu:function(obj){
			var data = obj.data;
			//兼容性 Chrome
			$("#show_menu").css({
				//定义菜单显示位置为事件发生的X坐标和Y坐标
				top : window.event.pageY,
				left : window.event.pageX,
				display:'block'
			}).show().delay(5000).hide(300);
			//选中处理
			check_ed(obj);
			
		},
			
		//error 方法 
		errofunc :function(res){
			var result=data.responseJSON;
			if(result==undefined){
				top.layer.msg("服务连接中断，请检查网络连接情况！");
			}else{
				top.layer.msg(result.msg+"("+result.code+")");
			}
		},
		
		hiddenMenu : function(obj){
			check_ed(obj);
			//隐藏右键菜单
			$("#show_menu").css({display:'block'}).hide();
			return;
		}
		
	
	}
		//checkbox 被选中事件
		function check_ed(obj){		
			//清空列表内checkbox
			var item = $("table").first();
			for(var i=0;i<item.length;i++){
				$("input").prop("checked", false);				
				form.render('checkbox');
			}
			var pro = Object.keys(table.cache)[0];
			/*  tabCache 需要return*/
			if(pro!=undefined){
				var tbCaches = table.cache[pro];
				table.cache[pro] = execTbCache(tbCaches);
			}else{
				var grid_pro = Object.keys(treeGrid.cache)[0];
				var tbCaches = treeGrid.cache[grid_pro];
				treeGrid.cache[grid_pro] = execTbCache(tbCaches);
			}
			
		
			obj.tr.find('input[name="layTableCheckbox"]+').click();
			form.render('checkbox');
		
		}
	
		//清空table缓存
		function execTbCache(tbCaches){
			var arr = [];
			for(var i=0;i<tbCaches.length;i++){
				var tbCache=tbCaches[i];
				/**
				 * 此处虽然有效但逻辑错误，未区分TG和T的类型，仅因两个结构一体同生，处理方式方法相同
				 */
				if(tbCache[table.config.checkName]){
					arr.push(table.clearCacheKey(tbCaches[i]));
				}else{
					arr.push(tbCache);
				}
			}
			return arr;
		}

		//error方法
		function errofuntion(res){	
			var result=data.responseJSON;
			if(result==undefined){
				top.layer.msg("服务连接中断，请检查网络连接情况，并重新登陆！");
			}else{
				top.layer.msg(result.msg+"("+result.code+")");
			}
		}
		
		//刷新token的方法（）
		function refreshToken(){
			if(judgeTokenIssue()){
				$.ajax({
					async:false,
					beforeSend: function(){},
					url: application.SERVE_URL +'/refreshToken', //ajax请求地址
					data : {"comeFrom" : application.COMEFROM},
					success: function (data) {
						sessionStorage.clear();
						sessionStorage.setItem("token", data.data.token);
						sessionStorage.setItem("tokenTime", data.data.tokenTime);
					},
					error: function (errdata) {
						top.location.href = application.BASE_URL+"/login.html";
					}
				});
			}
		}
		
		//判断token起效时间的方法
		function judgeTokenIssue(){
			var timelogin= application.TOKENTIME - new Date().getTime() ;
			if(timelogin < application.TOKENISSUE && timelogin>0){
				return true;
			}else if(timelogin < 0) {
				top.layer.alert("因长时间未操作，请重新登陆!",function(){
					top.location.href = application.BASE_URL+"/login.html";
				});
			}else{
				return false;
			}
		}
		
		
		
    exports('publicUtil', obj);
})