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

layui.use(['jquery','form','layer','laydate',/* 'formSelects', */'publicUtil','application','element'],function(){
    var form = layui.form,
		$ = layui.jquery,
/* 		formSelects = layui.formSelects, */
    publicUtil  = layui.publicUtil,
		application = layui.application,
		layer =layui.layer,
		element = layui.element,
	  laydate = layui.laydate;
		username = parent.parent.username;
		
	//页面打开时，或者基本信息时，点击填充数据
	function initSchoolmateData()
	{
		if(parent.editFormData)
		{
			$("#cardid").val(parent.editFormData.id);
			$(".name").val(parent.editFormData.name);
			//校友卡类型
			publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'CARD_TYPE'} ,"type",parent.editFormData.type);
		}
	}
	initSchoolmateData();	
	
	

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
							 type :$("#type").val()
						},			
						success: function (data) {
							var res = $(".id").val() ==null|| $(".id").val() =="" ? "新增":"修改" ;
							if(data == "success"){
								top.layer.close(index);
											top.layer.msg("校友卡信息" + res + "成功");
											//layer.closeAll("iframe");
											//刷新父页面
											//parent.location.reload();	
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