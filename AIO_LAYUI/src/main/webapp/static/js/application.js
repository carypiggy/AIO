"use strict";
layui.define(["jquery",'layer'],function(exports){
    var $ = layui.jquery;
    
    var obj ={
        //初始化
        init : function (){
            if(sessionStorage.getItem("token") === null ||
            sessionStorage.getItem("token") === "" ||
            sessionStorage.getItem("token") === undefined){
        	top.layer.msg("因长时间未操作，请重新登陆!",{time:1000},function(){
        		top.location.href = "../../../../login.html";
			});
            	
            }
            $(document).bind("contextmenu",function(e){
               return false;
            });
        },
        //初始化
        initindex : function (){
            if(sessionStorage.getItem("token") === null ||
            sessionStorage.getItem("token") === "" ||
            sessionStorage.getItem("token") === undefined){ 	
            	top.layer.msg("因长时间未操作，请重新登陆!",{time:1000},function(){
            		top.location.href = "login.html";
    			});
            }
        },
        //请求加密
        encryptData : function (key,value){
            key=CryptoJS.enc.Utf8.parse(key);
            value=CryptoJS.enc.Utf8.parse(value);
            var encryptedData = CryptoJS.AES.encrypt(value, key, {  
                mode: CryptoJS.mode.ECB,  
                padding: CryptoJS.pad.Pkcs7  
            }); 
            return encryptedData.toString();
        },
        
        //ajax请求返回的状态码
        REQUEST_SUCCESS:200,
        REQUEST_ERROR:500,
        DATA_USED:201,
        //Login
        BASE_URL : "http://127.0.0.1:80",
        //服务的IP及端口
        SERVE_PORT: "8080",
        SERVE_IP: "127.0.0.1",
        SERVE_URL: "http://127.0.0.1:8080",
        TMP_SERVE_URL: "http://127.0.0.1:8080",
        //获取权限的URL
        PERMS_URL : "http://127.0.0.1:8080/getPagePer",
        //token相关
        HEADER : sessionStorage.getItem("token"),
        TOKENTIME : sessionStorage.getItem("tokenTime"),
        TOKENISSUE : 5*60*1000, //五分钟续约有效期
        COMEFROM : "WEB",
        KEY : "tXbjTgdcQ32mmr6g",
        SPACE: 25 //Token刷新请求频度(毫秒数) 频度毫秒数内不进行重复请求.
    }
    
    exports("application", obj);
});