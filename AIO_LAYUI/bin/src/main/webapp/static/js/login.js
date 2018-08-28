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
layui.use(['form','layer','jquery','application'],function(){
    var form = layui.form,
		application = layui.application,
        layer = parent.layer === undefined ? layui.layer : top.layer
        $ = layui.jquery;

		$(document).ready(function(){
			  // document.getElementById("codeImg").src=application.SERVE_URL+"/captcha"; //这里的图片是更换后的图片           
						createCode();

    });
		
		$('#mpanel4').slideVerify({
    type : 2,   //类型
    vOffset : 5,  //误差量，根据需求自行调整
    vSpace : 5, //间隔
    imgName : ['1.jpg', '2.jpg'],
    imgSize : {
      width: '400px',
      height: '200px',
    },
    blockSize : {
      width: '40px',
      height: '40px',
    },
    barSize : {
      width : '400px',
      height : '40px',
    },
    ready : function() {
    },
    success : function() {
      alert('验证成功，添加你自己的代码！');
      //......后续操作
    },
    error : function() {
    //              alert('验证失败！');
    }
 
}); 
		
		
// 		/**
// 		 * 验证码
// 		 */
// 		var code ; //在全局定义验证码 
// 					
// 		function createCode(){
// 			 code = ""; 
// 			 var codeLength = 4;//验证码的长度
// 			 var checkCode = document.getElementById("code"); 
// 			 var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',
// 			 'S','T','U','V','W','X','Y','Z');//随机数
// 			 for(var i = 0; i < codeLength; i++) {//循环操作
// 				var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）
// 				code += random[index];//根据索引取得随机数加到code上
// 			}
// 			checkCode.value = code;//把code值赋给验证码
// 		}
// 		
// 		//校验验证码
// 		function validate(){
// 			var inputCode = document.getElementById("input").value.toUpperCase(); //取得输入的验证码并转化为大写      
// 			if(inputCode.length <= 0) { //若输入的验证码长度为0
// 				top.layer.msg("请输入验证码！");
// 				return;//则弹出请输入验证码
// 			}else if(inputCode != code ) { //若输入的验证码与产生的验证码不一致时
// 				top.layer.msg("验证码输入错误!"); //则弹出验证码输入错误
// 				createCode();//刷新验证码
// 				document.getElementById("input").value = "";//清空文本框
// 				return;
// 			}         
// 		}		
// 		
// 		$("#code").on('click',function(){
// 				createCode();
// 		})
		
		
    //登录按钮
    form.on("submit(login)",function(data){
			//$(this).text("登录中...").attr("disabled","disabled").addClass("layui-disabled");
			var inputCode = document.getElementById("input").value.toUpperCase(); //取得输入的验证码并转化为大写      
			if(inputCode.length <= 0) { //若输入的验证码长度为0
				top.layer.msg("请输入验证码！");
				return false;//则弹出请输入验证码
			}else if(inputCode != code ) { //若输入的验证码与产生的验证码不一致时
				top.layer.msg("验证码输入错误！@_@"); //则弹出验证码输入错误
				createCode();//刷新验证码
				document.getElementById("input").value = "";//清空文本框
				return false;
			}else {
				//请求登陆
				$.ajax({
					url: application.SERVE_URL+"/login", //ajax请求地址
					// url: "http://192.168.140.37:8080"+"/login", 
					type: "POST",
					data: { 
						username : $("#username").val(),
						password : $("#password").val(),
						authCode : $("#code").val(),
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
						top.layer.msg(result.msg+"("+result.code+")");
						$(this).text("登录").removeAttr("disabled").removeClass("layui-disabled");
					}
				});
			} 
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
