/**
 * @autor syp
 * @content 机构增加页面js
 * @returns
 * @Time 2018-08-02
 */
 layui.config({
 	base : "../../../../static/js/"
 }).extend({
 	"validparam"  : "validparam"
 }) 
layui.use(['form','layer','upload','laydate','publicUtil','application'],function(){
    var form = layui.form
        layer =layui.layer,
		laydate = layui.laydate,
		application = layui.application,
		publicUtil  = layui.publicUtil,
		upload = layui.upload;
        $ = layui.jquery;
		
		function formEdit(FormDatas){
			if(FormDatas != ''){
				var data = FormDatas;	 
				 $(".id").val(data.id);
				 $(".parentId").val(data.parentId);
				 $(".name").val(data.name);
				 $(".code").val(data.code);													
				 $(".master").val(data.master);  
				 $(".mobile").val(data.mobile);  
				 $(".mobile").val(data.mobile);  
				 $("#openDate").val(data.openDate);  
				 $("#closeDate").val(data.closeDate); 
				 $(".remark").val(data.remark);
				 $(".sort").val(data.sort);
				 $(".parentName").val(data.parentSysOrg.name);
				publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'ORG_TYPE'} ,"type",data.type);		
				publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'ORG_USEABLE'} ,"useable",data.useable);
			}else{
				publicUtil.selectBase(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'ORG_TYPE'} ,"type");		
				publicUtil.selectBase(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'ORG_USEABLE'} ,"useable");
				return false;
			}
		}													
	
	
	/**
	* 表单回填
	*/
	formEdit(parent.editFormData);
	
	var openDate;
	var closeDate ;
	//执行一个laydate实例
	laydate.render({
		elem: '#openDate'
		,theme: 'molv'
		 //指定元素
		,done: function(value, date, endDate){
			//得到日期生成的值，如：2017-08-18
				openDate =value;
		}
	});

	//执行一个laydate实例
	laydate.render({
		elem: '#closeDate' //指定元素,,
		,theme: 'molv'
		,done: function(value, date, endDate){
			//得到日期生成的值，如：2017-08-18
				closeDate =value;
		}
	});		
		
    form.on("submit(addOrg)",function(data){
		
        var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
		var res = ($(".id").val() ==null|| $(".id").val() =="") ?"新增":"修改" ;
		$.ajax({
			url: application.SERVE_URL+"/sys/sysorg/save", //ajax请求地址
			type: "POST",
			contentType: "application/json",
			headers : { 'Authorization' : application.HEADER},
			data:JSON.stringify({
				id : $(".id").val() ==null|| $(".id").val() =="" ? null : $(".id").val(),
				parentId : $(".parentId").val(),
				name : $(".name").val(),
				useable : $("#useable").val(),
				type : $("#type").val(),
				code : $(".code").val(),
				master : $(".master").val(),
				mobile : $(".mobile").val(),
				sort : $(".sort").val(),
				openDate : openDate,
				closeDate : closeDate,
				remark : $(".remark").val()
			}),			
			success: function (data) {
				if(data == "success"){
				 	top.layer.close(index);
		            top.layer.msg("机构" + res + "成功");
		            layer.closeAll("iframe");
		            //刷新父页面
		            parent.location.reload();	
				}else{
					top.layer.msg("机构" + res + "失败！");
				}
			},
			error: function(data){
				top.layer.msg("机构" + res + "失败！");
			}
		}); 
        return false;
    })



	function selectOrg(){
		var index = layui.layer.open({
				type: 2,
				title: '机构选择',
				shadeClose: true,
				shade: 0.8,
				area: ['280px', '65%'],
				// content: '../views/module/system/menu/menuselect.html',
				content: 'orgselect.html',
				success : function(layero, index){
					//
					setTimeout(function(){
							layui.layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
									tips: 3
							});
					},500)											
				},
		})
	}
	
	$(".parentName").click(function(){
		selectOrg();
	})	
		
})