/**
 * @autor syp
 * @content 字典增加页面js
 * @returns
 * @Time 2018-08-02
 */
layui.config({
	base : "../../../../static/js/"
}).extend({
	"validparam"  : "validparam"
}) 
layui.use(['form','layer','application','validparam'],function(){
    var form = layui.form,
    	application = layui.application,
    	validparam = layui.validparam,
        layer = parent.layer,
        $ = layui.jquery;
    
    form.verify(validparam);
	
	function formEdit(FormDatas){
		if(FormDatas != ''){
			var data = FormDatas;
			$(".id").val(data.id);
			$(".remark").val(data.remark);
			$(".value").val(data.value);
			$(".typeCode").val(data.typeCode);
			$(".label").val(data.label);
			$(".value").val(data.value);
			$(".sort").val(data.sort);
		}else{
			return false;
		}
	}

	
	/**
	 * 表单回显
	 */
	formEdit(parent.editFormData);
	
    form.on("submit(addDict)",function(){
        //弹出loading
        var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
		$.ajax({
			url: application.SERVE_URL+"/sys/sysdict/save", //ajax请求地址
			type: "POST",
			data:{
				id : $(".id").val() ==null|| $(".id").val() =="" ? null : $(".id").val(),
				typeCode : $(".typeCode").val(),
				value : $(".value").val(),
				label : $(".label").val(),
				sort : $(".sort").val(),
				remark : $(".remark").val(),
			},
			beforSend: function () {
				publicUtil.refreshToken();
			},
			headers : { 'Authorization' : application.HEADER},			
			success: function (res) {
				if(res.code==application.REQUEST_SUCCESS){
				 	top.layer.close(index);
		            top.layer.msg(res.msg);	
		            layer.closeAll("iframe");
		            //刷新父页面
		            parent.location.reload();
				}else{
					layer.msg(res.msg);
				}
			},
			error: function(res){
				publicUtil.errofunc(res);
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