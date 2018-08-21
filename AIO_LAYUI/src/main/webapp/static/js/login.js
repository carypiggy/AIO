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

    //登录按钮
    form.on("submit(login)",function(data){
        //$(this).text("登录中...").attr("disabled","disabled").addClass("layui-disabled");
		//请求登陆
		$.ajax({
			url: application.SERVE_URL+"/login", //ajax请求地址
			// url: "http://192.168.140.37:8080"+"/login", 
			type: "POST",
			data: { 
				username : $("#userName").val(),
				password : $("#password").val(),
				authCode : $("#code").val()
			},
			success: function (data) {
				//将token保存在cookie中			
				sessionStorage.setItem("token", data.data);
				top.layer.msg("登陆成功");
				window.location.href = "../webapp/index.html";
			},
			error: function(data){
				top.layer.msg("错误"+data.status+":"+data.responseJSON.msg);
				$(this).text("登录").removeAttr("disabled").removeClass("layui-disabled");
			}
		}); 
//         setTimeout(function(){
//             window.location.href = "http://127.0.0.1:8848/AIO_LAYUI/src/main/webapp/index.html";
//         },1000);
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
