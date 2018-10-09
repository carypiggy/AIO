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
		
		//清缓存
		window.sessionStorage.clear();
		window.localStorage.clear();	

	    //登录按钮
	    form.on("submit(login)",function(data){
	    	//构建弹窗
			layer.open({
				type: 1,
				skin: "layui-layer-rim", //加上边框
				title: false,
				closeBtn: 1,
				anim: 5,
				area: ['440px', '255px'], //宽高
				content: "<div id='verify'></div>"
			});
			
			//验证登陆
			$('#verify').slideVerify({
	    		title:"",
	    	    type : 2,
	    	    mode : 'fixed',
	    	    vOffset : 5,
	    	    vSpace : 5,
	    	    explain : '向右滑动完成验证',
	    	    imgUrl : 'static/verify/images/',
	    	    imgName : ['1.jpg', '2.jpg','3.jpg'],
	    	    imgSize : {
	    		    width: '430px',
	    		    height: '200px',
	    	    },
	    	    blockSize : {
	    		    width: '45px',
	    		    height: '45px',
	    	    },
	    	    barSize : {
	    		    width: '430px',
	    		    height : '40px',
	    	    },
	    	    ready : function(){},
	    	    success : function(){
	    	    	//登陆
	    	    	var password = application.encryptData(application.KEY,$("#password").val());
					//请求登陆
					$.ajax({
						url: application.SERVE_URL+"/login", //ajax请求地址
						type: "POST",
						dataType: "json",
						headers : { 
							"Authorization" : ""
						},
						data: { 
							username : $("#username").val(),
							password : password,
							// authCode : $("#code").val(),
							comeFrom : application.COMEFROM
						},
						success: function (data) {
							if(data.code==application.REQUEST_SUCCESS){
								//将token保存在cookie中	
								sessionStorage.setItem("token", data.data.token);
								sessionStorage.setItem("tokenTime", data.data.tokenTime);
								top.layer.msg("登陆成功",{anim: 5,time: 1000},function(){
									layer.closeAll();
									window.location.href = "index.html";
								});
								
							}else{
								top.layer.msg(data.msg+"("+data.code+")",{anim: 5,time: 1000},function(){
									layer.closeAll();
								});
							}
						},
						error: function(data){
							var result=data.responseJSON;
							if(result==undefined){
								top.layer.msg("服务连接中断，请检查网络连接情况",{anim: 5,time: 1000}, function(){
									layer.closeAll();
								});
							}else{
								top.layer.msg(result.msg+"("+result.code+")",{anim: 5,time: 1000}, function(){
									layer.closeAll();
								});
							}
						}
					});
	    	    }
	    	});
			return false;
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
