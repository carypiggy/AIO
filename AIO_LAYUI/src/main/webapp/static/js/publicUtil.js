/**
 * 	@Author: syp
	@Time: 2018-8
	@Tittle: application
	@Description: 封装一些公用
 */
layui.define(['form','layer','jquery'],function(exports){
	var form = layui.form;
	var layer = layui.layer;
	var $ = layui.jquery;
	var obj ={
		
		//由子页面回填至父页面（多参数）
		setAcrossNames : function(value , _idClass ,_nameClass) {
			for(var i=0; i<value.length ;i++){
				var _idValue= $(window.parent.document).find(_idClass).val();
				var _nameValue= $(window.parent.document).find(_idClass).val();
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
		selectBase: function(url,data,selectid){
			$.ajax({
				url:url,
				type: "POST",
				data: data ,
				headers : { 'Authorization' : sessionStorage.getItem('token')},
				success:function(res){
					$("#"+selectid).empty();
					$("#"+selectid).append('<option value="">请选择</option>')
					for(var i =0;i<res.length;i++){
						$("#"+selectid).append('<option  value="'+res[i].value+'" >'+res[i].label+' </option>');//往下拉菜单里添加元素
					}
					form.render();//菜单渲染 把内容加载进去
				},
				error: function(){
					console.log("shibai")
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
		
		
		
		//取下拉菜单并进行回填
		selectBaseAndSetVal : function (url,data,selectid,selectValue){
			$.ajax({
				url:url,
				type: "POST",
				data: data ,
				success:function(res){
					$("#"+selectid).empty();
					for(var i =0;i<res.length;i++){
						$("#"+selectid).append('<option  value="'+res[i].value+'">'+res[i].label+'</option>');//往下拉菜单里添加元素
					}
					$('#'+selectid).val(selectValue);
					form.render('select');//菜单渲染 把内容加载进去
				},
				error: function(){
					console.log("shibai")
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
				headers : { 'Authorization' : header},
				data:{
					menuId : menuId
				},						
				success: function (data) {
					var permissons = data;
					var butHtml = '';
					for(var i=0;i<permissons.length;i++){
						var icon = permissons[i].icon ==null || permissons[i].icon =="null"  ? "": permissons[i].icon;
						butHtml += '<a class="layui-btn" id="'+permissons[i].operate+'" ><i class="layui-icon"> '+icon +' </i> '+permissons[i].name+'</a>';
					}
					$("#"+butGroupId).append(butHtml);
				},
				error: function(data){
					top.layer.msg("失败！");
				}
			}); 
		}
	}
    exports('publicUtil', obj);
})