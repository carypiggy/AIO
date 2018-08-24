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
		if(parent.editFormData != ''){
			data = parent.editFormData;
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
			headers : { 'Authorization' : application.HEADER},			
			success: function (data) {
				if(data == "success"){
				 	top.layer.close(index);
		            top.layer.msg("编码" + $(".id").val() ==null|| $(".id").val() =="" ? "新增":"修改" + "成功");
		            layer.closeAll("iframe");
		            //刷新父页面
		            parent.location.reload();	
				}else{
					top.layer.msg("编码" + $(".id").val() ==null|| $(".id").val() =="" ? "新增":"修改" + "失败！");
				}
			},
			error: function(data){
				top.layer.msg("编码" + $(".id").val() ==null|| $(".id").val() =="" ? "新增":"修改" + "失败！");
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