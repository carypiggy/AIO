/**
 * @autor syp
 * @content 字典增加页面js
 * @returns
 * @Time 2018-08-02
 */
layui.config({
	base: "../../../../static/js/"
}).extend({
	"validparam": "validparam"
})
layui.use(['form', 'upload', 'layer', 'laydate', 'application', 'validparam', 'publicUtil'], function() {
	var form = layui.form,
		application = layui.application,
		validparam = layui.validparam,
		publicUtil = layui.publicUtil,
		layer = parent.layer,
		upload = layui.upload,
		laydate = layui.laydate,
		$ = layui.jquery;

	form.verify(validparam);

	//月份选择器
	laydate.render({
		elem: '#dateMonth',
		type: 'month',
		value: new Date(),
		//指定元素
		done: function() {}
	});

	var fileUrl ="";
	//拖拽上传
	upload.render({
		elem: '#upfile',
		url: application.SERVE_URL+'/finance/salary/uploadimg',
		accept: 'file',
		exts: 'xls|xlsx',
		size: 10240,
		done: function(res) {
			var data=res;
			fileUrl = res.data;
				console.log(fileUrl);
				top.layer.msg(data.msg,{time: 800});
		}
	});

	/**
	 * 表单回显
	 */
	//formEdit(parent.editFormData);

	form.on("submit(send)", function() {
		if(fileUrl =="" || null == fileUrl){
			top.layer.msg("请先选择要发送的文件", {
				time: 800
			});
			return false;
		}else{
			//弹出loading
			var index = top.layer.msg('发送中，请稍候', {
				icon: 16,
				time: false,
				shade: 0.8
			});
			
			$.ajax({
				url: application.SERVE_URL + "/finance/salary/sendFinace", //ajax请求地址
				data: {
					fileUrl : fileUrl,
					dateMonth : $("#dateMonth").val(),
					remark :  $(".remark").val()
				},
				success: function(res) {
					if (res.code == application.REQUEST_SUCCESS) {
						top.layer.close(index);
						top.layer.msg(res.msg, {
							time: 1000
						});
						layer.closeAll("iframe");
						//刷新父页面
						parent.location.reload();
					} else {
						layer.msg(res.msg, {
							time: 1000
						});
					}
				}
			});
		}
		
		

// 		var data = {
// 			id: $(".id").val() == null || $(".id").val() == "" ? null : $(".id").val(),
// 			typeCode: $(".typeCode").val(),
// 			value: $(".value").val(),
// 			remark: $(".remark").val(),
// 
// 		}


		return false;
	})

	$("#close").click(function() {
		layer.closeAll("iframe");
		//刷新父页面
		//parent.location.reload();	
	})

	/**
	 * 表单回显
	 */
	function formEdit(FormDatas) {
		if (FormDatas != "") {
			var data = FormDatas;
			$(".id").val(publicUtil.htmlDecode(data.id));
			$(".remark").val(publicUtil.htmlDecode(data.remark));
			$(".value").val(publicUtil.htmlDecode(data.value));
			$(".typeCode").val(publicUtil.htmlDecode(data.typeCode));
			$(".label").val(publicUtil.htmlDecode(data.label));
			$(".value").val(publicUtil.htmlDecode(data.value));
			$(".sort").val(publicUtil.htmlDecode(data.sort));
		} else {
			return false;
		}
	}
})
