/*
	@Author: syp
	@Time: 2018-8
	@Tittle: application
	@Description: 封装一些配置项
*/
layui.define(function(exports){
	var obj ={
		//服务的IP及端口
		SERVE_PORT: "8080",
		SERVE_IP: "127.0.0.1",
		SERVE_URL: "http://127.0.0.1:8080",
		TMP_SERVE_URL: "http://192.168.140.37:8080",
		//获取权限的URL
		PERMS_URL : 'http://127.0.0.1:8080/getPagePer',
		
		HEADER : sessionStorage.getItem('token')
	}
    exports('application', obj);
})