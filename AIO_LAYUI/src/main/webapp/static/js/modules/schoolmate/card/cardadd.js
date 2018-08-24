/**
 * @autor syp
 * @content 角色列表页面js
 * @returns
 * @Time 2018-08-02
 */
layui.config({
	base: '../../../../static/js/' //此处路径请自行处理, 可以使用绝对路径
}).extend({
/* 	formSelects: 'formSelects-v4', */
	"application" : "application"
});

layui.use(['jquery','form','layer','laydate',/* 'formSelects', */'publicUtil','upload','application','element'],function(){
    var form = layui.form,
		$ = layui.jquery,
/* 		formSelects = layui.formSelects, */
    publicUtil  = layui.publicUtil,
		application = layui.application,
		layer =layui.layer,
		element = layui.element,
	  laydate = layui.laydate,
		username = parent.parent.username,
		upload = layui.upload;
		
	//页面打开时，或者基本信息时，点击填充数据
	function initSchoolmateData()
	{
		if(parent.editFormData)
		{
			$("#cardid").val(parent.editFormData.id);
			$(".name").val(parent.editFormData.name);
			$("#front_photoPath").text(parent.editFormData.frontBackground);
			$("#behind_photoPath").text(parent.editFormData.backBackground);
			$('#front_photo').attr('src', application.SERVE_URL+"/"+parent.editFormData.frontBackground);
			$('#behind_photo').attr('src', application.SERVE_URL+"/"+parent.editFormData.backBackground);
		}
		//校友卡类型
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'CARD_TYPE'} ,"type",parent.editFormData?parent.editFormData.type:null);
	}
	initSchoolmateData();	
	
	var uploadInst = upload.render({
		elem: '.selectphoto'
		,url: application.SERVE_URL+'/sys/sysuser/uploadimg'
		,choose: function(obj){
			var photoType=this.item.data("phototype");
			//预读本地文件示例，不支持ie8
			obj.preview(function(index, file, result){
				$('#'+photoType+'_photo').attr('src', result); //图片链接（base64）
			});
		}
		,bindAction: '#addUser'
		,done: function(res,index, upload){
			var photoType=this.item.data("phototype");
			$('#'+photoType+'_photoPath').text(res.data);
			//如果上传失败
			if(res.code > 0){
				return layer.msg('上传成功');							
			}
			//上传成功
		}
		,error: function(){
			var photoType=this.item.data("phototype");
			//演示失败状态，并实现重传
			var photoPath = $('#'+photoType+'_photoPath');
			photoPath.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
			photoPath.find('.demo-reload').on('click', function(){
				uploadInst.upload();
			});
		}
	});

   //submit(addUser)  绑定提交按钮（基本信息）
    form.on("submit(addSchoolfellow)",function(data){
        //弹出loading
      var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
			console.log(application.SERVE_URL+'/sys/smCard/save');
		 		$.ajax({
						url: application.SERVE_URL+'/sys/smCard/save', //ajax请求地址
						type: "POST",
						data:{
							 id:$(".id").val(),
							 name: $(".name").val(),
							 type :$("#type").val(),
							 frontBackground :$("#front_photoPath").text(),
							 backBackground :$("#behind_photoPath").text()
						},			
						success: function (data) {
							var res = $(".id").val() ==null|| $(".id").val() =="" ? "新增":"修改" ;
							if(data == "success"){
								top.layer.close(index);
											top.layer.msg("校友卡信息" + res + "成功");
											parent.location.reload();	
							}else{
								top.layer.msg("校友卡信息" + res + "失败！");
							}
						},
						error: function(data){
							top.layer.msg("校友卡信息" + res + "失败！");
						}
					}); 
        return false;
    })
})