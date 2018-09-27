/**
 * @autor syp
 * @content 角色增加页面js
 * @returns
 * @Time 2018-08-02
 */
layui.config({
	base : "../../../../static/js/"
}).extend({
	"validparam" : "validparam"
})
layui.use(['form','layer','validparam','publicUtil','application'],function(){
    var form = layui.form,
		publicUtil  = layui.publicUtil,
		application = layui.application,
		validparam = layui.validparam,
        layer =layui.layer,
        $ = layui.jquery;
		
	
	function formEdit(FormDatas){
		if(FormDatas != ''){
			var data = FormDatas;
			$(".id").val(publicUtil.htmlDecode(data.id));
			$(".role").val(publicUtil.htmlDecode(data.role));
			$(".code").val(publicUtil.htmlDecode(data.code));
			$(".name").val(publicUtil.htmlDecode(data.name));
			$(".remark").val(publicUtil.htmlDecode(data.remark));	
		}else{
			return false;
		}
	}

	
	/**
	 * 表单回显
	 */
	formEdit(parent.editFormData);		
		
	if(parent.formdatas != undefined){
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'ROLE_TYPE'} ,"type",parent.formdatas.type);		
	}else{
		publicUtil.selectBase(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'ROLE_TYPE'} ,"type");		
	}
	form.verify(validparam);
	
    form.on("submit(addRole)",function(data){
        //弹出loading
        var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
        //参数封装
		var data={
			"id" : $(".id").val() ==null|| $(".id").val() =="" ? null : $(".id").val(),
			"name" : $(".name").val(),
			"code" : $(".code").val(),
			"type" : $("#type").val(),
			"sort" : $(".sort").val(),
			"remark" : $(".remark").val()
		}
		//处理参数中可能的特殊字符
		//var json_str=publicUtil.htmlEscape(JSON.stringify(data));
		//将json字符串转化为json对象（依据后台是否具有requestbody）
		//var json_obj=JSON.parse(json_str);
		//异步请求
		$.ajax({
			url: application.SERVE_URL+"/sys/sysrole/save", //ajax请求地址
			data:data,
			//contentType: "application/json",
			success: function (res) {
				if(res.code==application.REQUEST_SUCCESS){
				 	top.layer.close(index);
				 	layer.closeAll("iframe");
	            	//刷新父页面
		            parent.location.reload();
		            top.layer.msg(res.msg,{time: 1000});			            
				}else{
					layer.msg(res.msg,{time: 1000});
				}
			}
		}); 
        return false;
    })
	
	$("#close").click(function(){
		layer.closeAll("iframe");
		//刷新父页面
		parent.location.reload();	
	})

})