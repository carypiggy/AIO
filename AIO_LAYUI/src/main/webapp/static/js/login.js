/**
 * @autor syp
 * @content 登录页面js
 * @returns
 * @Time 2018-08-03
 */
layui.config({
	base : "static/js/"
}).extend({
	"application" : "application"
})
layui.use(['form','layer','application'],function(){
    var form = layui.form,
		application = layui.application,
        layer = parent.layer === undefined ? layui.layer : top.layer;
		
		//验证码
		$('#mpanel4').codeVerify({
        	type : 1,
        	width : '100px',
		    height : '36px',
		    fontSize : '20px',
				codeLength : 4,
				ready : function() {
				},
				success : function() {
					alert('验证成功，添加你自己的代码！');
					//......后续操作
				},
				error : function() {
				// alert('验证失败！');
				}
 
		}); 
		
		//清缓存
		window.sessionStorage.clear();
		window.localStorage.clear();	

	    //登录按钮
	    form.on("submit(login)",function(data){
			//$(this).text("登录中...").attr("disabled","disabled").addClass("layui-disabled");
			var inputCode = document.getElementById("input").value.toUpperCase(); //取得输入的验证码并转化为大写  
			//获取验证吗内容	 
			var code_area = '';
			for(var i=0;i<$(".verify-code").find("font").length;i++){
				code_area += $(".verify-code").find("font").eq(i).html();//遍历所有font的文本
			} 
			code_area = code_area.toUpperCase();
//			if(inputCode.length <= 0) { //若输入的验证码长度为0
//				top.layer.msg("请输入验证码！");
//				return false;//则弹出请输入验证码
//			}else if(inputCode != code_area ) { //若输入的验证码与产生的验证码不一致时
//				top.layer.msg("验证码输入错误！"); //则弹出验证码输入错误
//				document.getElementById("input").value = "";//清空文本框
//				return false;
//			}else {
				//请求登陆
				$.ajax({
					url: application.SERVE_URL+"/login", //ajax请求地址
					type: "POST",
					dataType: "json",
					headers : { "Authorization" : "" },
					data: { 
						username : $("#username").val(),
						password : $("#password").val(),
						// authCode : $("#code").val(),
						comeFrom : application.COMEFROM
					},
					success: function (data) {
						if(data.code==application.REQUEST_SUCCESS){
							//将token保存在cookie中	
							sessionStorage.setItem("token", data.data.token);
							sessionStorage.setItem("tokenTime", data.data.tokenTime);
							top.layer.msg("登陆成功");
							window.location.href = "../index.html";
						}else{
							top.layer.msg(data.msg+"("+data.code+")");
						}
					},
					error: function(data){
						var result=data.responseJSON;
						if(result==undefined){
							top.layer.msg("服务连接中断，请检查网络连接情况");
						}else{
							top.layer.msg(result.msg+"("+result.code+")");
							$(this).text("登录").removeAttr("disabled").removeClass("layui-disabled");
						}
					}
				});
		//	} 
        return false;
    })

	$("#codeImg").on('click',function(){
		document.getElementById("codeImg").src = document.getElementById("codeImg").src + "?nocache=" + new Date().getTime();
	})



    //表单输入效果
    $(".loginBody .input-item").click(function(e){
        e.stopPropagation();
        $(this).addClass("layui-input-focus").find(".layui-input").focus();
    })
    $(".loginBody .layui-form-item .layui-input").focus(function(){
        $(this).parent().addClass("layui-input-focus");
    })
    $(".loginBody .layui-form-item .layui-input").blur(function(){
        $(this).parent().removeClass("layui-input-focus");
        if($(this).val() != ''){
            $(this).parent().addClass("layui-input-active");
        }else{
            $(this).parent().removeClass("layui-input-active");
        }
    })
})
