/*
	@Author: syp
	@Time: 2018-8
	@Tittle: application
	@Description: 封装一些配置项
*/
layui.define('jquery',function(exports){
	var $ = layui.jquery;
	
	var obj ={
		
		//初始化
		init : function (){
			if(sessionStorage.getItem("token") == null ||
				sessionStorage.getItem("token") == '' ||
				sessionStorage.getItem("token") == undefined){			
				parent.location.href = "../../../../login.html";
			}
			$(document).bind("contextmenu",function(e){
				return false;
				
			});
		},
		//初始化
		initindex : function (){
			if(sessionStorage.getItem("token") == null ||
				sessionStorage.getItem("token") == '' ||
				sessionStorage.getItem("token") == undefined){			
				window.location.href = "login.html";
			}
		},
		
		//ajax请求返回的状态码
		REQUEST_SUCCESS:200,
		REQUEST_ERROR:500,
		//Login
		BASE_URL : "http://127.0.0.1:80",
		
		//服务的IP及端口
		SERVE_PORT: "8080",
		SERVE_IP: "127.0.0.1",
		SERVE_URL: "http://127.0.0.1:8080",
		TMP_SERVE_URL: "http://127.0.0.1:8080",
		//获取权限的URL
		PERMS_URL : 'http://127.0.0.1:8080/getPagePer',
		
		HEADER : sessionStorage.getItem('token'),
		TOKENTIME : sessionStorage.getItem('tokenTime'),
		TOKENISSUE : 5*60*1000, //五分钟续约有效期
		COMEFROM : 'WEB'
	}
    exports('application', obj);
})