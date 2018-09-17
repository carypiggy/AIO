/**
 * @autor syp
 * @content 用户列表页面js
 * @returns
 * @Time 2018-08-02
 */
layui.config({
	base: '../../../../static/js/' //此处路径请自行处理, 可以使用绝对路径
}).extend({
	formSelects: 'formSelects-v4',
	"application" : "application",
	'publicUtil' : 'publicUtil',
	"validparam"  : "validparam"
});

layui.use(['jquery','form','layer','formSelects','publicUtil','upload','validparam','application'],function(){
    var form = layui.form,
		$ = layui.jquery,
		formSelects = layui.formSelects,
		publicUtil  = layui.publicUtil,
		upload = layui.upload,
		application = layui.application,
		validparam = layui.validparam,
		layer =layui.layer;

		form.verify(validparam);
		
		var formSelectsdata;
		if(parent.editFormData != ''){
			data = parent.editFormData;
			$(".id").val(data.id);
			$(".username").val(data.username);
			$(".name").val(data.name);
			$(".email").val(data.email);
			$(".mobile").val(data.mobile);
			$(".idcard").val(data.idcard);  
			$(".remark").val(data.remark);
			$('#photoPath').html(data.photo);
			$('.orgName').val(data.orgName);
			$(".orgId").val(data.orgId);
			if(data.photo != null){
				document.getElementById("photo").src= data.photo;	
			}
			if($(".id").val()){
				$(".username").addClass("layui-disabled");
				$(".username").attr("readonly","true");
			}
			publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'USER_TYPE'} ,"type",data.type);	
			formSelectsdata = data.roleList;
			form.render();
			formSelects.render();
		}else{
			publicUtil.selectBase(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'USER_TYPE'} ,"type");
			form.render();		
		}


		var uploadInst = upload.render({
			elem: '#selectphoto'
			,url: application.SERVE_URL+'/sys/sysuser/uploadimg'
			,accept: 'images'
			,exts : 'jpg|png|gif|bmp|jpeg'
			,size : 50
			,choose: function(obj){
				//预读本地文件示例，不支持ie8
				obj.preview(function(index, file, result){
					$('#photo').attr('src', result); //图片链接（base64）
				});
			}
			,done: function(res){
				$('#photoPath').html(application.SERVE_URL+'/'+res.data);
				//如果上传失败
				if(res.code > 0){
					return layer.msg('上传成功');							
				}
				//上传成功
			}
			,error: function(){
				//演示失败状态，并实现重传
				var photoPath = $('#photoPath');
				photoPath.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
				photoPath.find('.demo-reload').on('click', function(){
					uploadInst.upload();
				});
			}
		});

		//多选下拉框配置
		formSelects.config('userRole', {
			keyName: 'name',            //自定义返回数据中name的key, 默认 name
			keyVal: 'id', 
		}, true);
		//初始化用户下拉框(此处应该时经后台过滤处理 选中与为选中)
		// selected: boolean,         //自定义返回数据中selected的key, 默认 selected
			// selected: boolean',         //自定义返回数据中disabled的key, 默认 disabled
		function initSelect(){
			$.ajax({
				url: application.SERVE_URL+'/sys/sysrole/loadAll', //ajax请求地址
				success: function (rs) {
					formSelects.data('userRole', 'local', {
						arr: rs.data					
					})
					if(formSelectsdata != null && formSelectsdata != '' && formSelectsdata != 'undefined'){
						layui.formSelects.value('userRole', formSelectsSetValue(formSelectsdata));								
					}
				}
			});
		}
		
		//自定义验证规则-校验用户名是否存在
		form.verify({
			user_exist: function(value){
				var message="";
				//判断是否是编辑
				if($(".id").val()){
					return;
				}else{
					$.ajax({
						url: application.SERVE_URL+'/sys/sysuser/checkUserExist',
						async: false,
						data:{
							username: value
						},											
						success: function (res) {
							if(res.code==application.DATA_USED){
								message = res.msg;
							}else{
								return;
							}
						}
					})
				}
				return message;
			}
		});
		
		
		initSelect();
		form.on("submit(addUser)",function(data){
			//弹出loading
			 var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});				 
			 $.ajax({
					url: application.SERVE_URL+'/sys/sysuser/save', //ajax请求地址
					contentType: "application/json",
					data: JSON.stringify({
						id : $(".id").val() ==null|| $(".id").val() =="" ? null : $(".id").val(),
						username : $(".username").val(),
						name : $(".name").val(),
						email : $(".email").val(),
						mobile : $(".mobile").val(),
						idcard : $(".idcard").val(),
						remark : $(".remark").val(),
						photo : $('#photoPath').html(),
						orgId : $(".orgId").val(),
						type : $("#type").val(),
						roleList : convert(layui.formSelects.value('userRole', 'val'))
					}),		
					success: function (res) {
						// if(res.code==200){
							top.layer.close(index);
							top.layer.msg(res.msg);	
							layer.closeAll("iframe");
							//刷新父页面
							parent.location.reload();
// 								}else{
// 									layer.msg(res.msg);
// 								}
					}
			 });
			 return false;
		})

		
		
		function convert (arr){
			var roleIds =new Array();
			for(var i =0;i<arr.length;i++){
				roleIds.push({"id" : arr[i]}); 
			}
			return roleIds;
		}

		//回显多选的下拉框
		function formSelectsSetValue(arr){
			var Ids =new Array();
			for(var i =0;i<arr.length;i++){
				Ids.push(arr[i].id); 
			}
			return Ids;
		}
		//(此处应该时经后台过滤处理 选中与为选中)
		// checked : boolean 
		function selectOrg(){
			var index = layui.layer.open({
				type: 2,
				title: '机构选择',
				shadeClose: true,
				shade: 0.8,
				area: ['280px', '65%'],
				// content: '../views/module/system/role/menuselect.html',
				content: 'orgselect.html',
				success : function(layero, index){
					//
					setTimeout(function(){
							layui.layer.tips('点击此处返回用户列表', '.layui-layer-setwin .layui-layer-close', {
									tips: 3
							});
					},500)											
				},
			})
		}
		
		
		//机构选择
		function selectOrg(){
			var index = layui.layer.open({
				type: 2,
				title: '机构选择',
				shadeClose: true,
				shade: 0.8,
				area: ['280px', '65%'],
				// content: '../views/module/system/menu/menuselect.html',
				content: '../org/orgselect.html',
				success : function(layero, index){
					//
					setTimeout(function(){
							layui.layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
									tips: 3
							});
					},500)											
				},
			})
		}
		
		$(".parentName").click(function(){
			selectOrg();
		})
})