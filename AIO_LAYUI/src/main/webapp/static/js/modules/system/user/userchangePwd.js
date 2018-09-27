/**
 * @autor syp
 * @desc 密码修改
 * @returns
 */
layui.config({
	base : "../../../../static/js/"
}).extend({
	"application" : "application",
	"publicUtil"  : "publicUtil"
})
layui.use(['form','layer','laytpl','application','publicUtil'],function(){
    var form = layui.form,
        layer = layui.layer,
        $ = layui.jquery,
		application = layui.application,
		publicUtil=layui.publicUtil;
		
        $(function(){
        	$("#username").val(parent.username);
            //输入框的值改变时触发
            $("#pwd").change("input",function(e){
                //获取input输入的值
				$.ajax({
					url: application.SERVE_URL+'/sys/sysuser/checkOldPwd',
					async: false,
					type : 'post',
					data:{
						username: $("#username").val(),
						oldPwd: $("#pwd").val()
					},											
					success: function (res) {
						if(res.code==application.REQUEST_SUCCESS){
							layer.msg(res.msg);
						}else{
							$("#pwd").focus();
							layer.msg(res.msg, {icon: 5, shift: 6});
						}
					}
				})
            });
        })
    //添加验证规则
    form.verify({
        oldPwd : function(value, item){
        	var message ="";
				$.ajax({
					url: application.SERVE_URL+'/sys/sysuser/checkOldPwd',
					async: false,
					type : 'post',
					data:{
						username: $("#username").val(),
						oldPwd: $("#pwd").val()
					},											
					success: function (res) {
						if(res.code==application.REQUEST_SUCCESS){
							return;
						}else{
							message = res.msg;
						}
					}
				})
				return message;
        },
        newPwd : function(value, item){
            if(value.length < 5){
                return "密码长度不能小于5位";
            }
        },
        confirmPwd : function(value, item){
            if($("#oldPwd").val() != $("#confirmPwd").val()){
				$("#confirmPwd").focus();
                return "两次输入密码不一致，请重新输入！";
            }
        }
    }) 
    form.on("submit(changePwd)",function(){
		$.ajax({
			url: application.SERVE_URL+'/sys/sysuser/changePwd',
			data:{
				username: $("#username").val(),
				oldPwd: $("#pwd").val(),
				newPwd : $("#confirmPwd").val()
			},											
			success: function (res) {
				if(res.code==application.REQUEST_SUCCESS){
					window.sessionStorage.clear();
					window.localStorage.clear();
					layer.msg(res.msg+"请重新登录",{time: 1000},function(){
						top.location.href = application.BASE_URL+"/login.html";
					});
					
				}else{
					layer.msg(res.msg,{time: 1000});
				}
			}
		})
		return false;
    })
	
	$("#reset").click(function(){
		$("#pwd").val("");
		$("#confirmPwd").val("");
		$("#oldPwd").val("");
	})
})