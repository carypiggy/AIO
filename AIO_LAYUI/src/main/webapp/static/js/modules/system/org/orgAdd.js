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
				 $(".id").val(publicUtil.htmlDecode(data.id));
				 $(".parentId").val(publicUtil.htmlDecode(data.parentId));
				 $(".name").val(publicUtil.htmlDecode(data.name));
				 $(".code").val(publicUtil.htmlDecode(data.code));													
				 $(".master").val(publicUtil.htmlDecode(data.master));  
				 $(".mobile").val(publicUtil.htmlDecode(data.mobile));  
				 $(".mobile").val(publicUtil.htmlDecode(data.mobile));  
				 $("#openDate").val(publicUtil.htmlDecode(data.openDate));  
				 $("#closeDate").val(publicUtil.htmlDecode(data.closeDate)); 
				 $(".remark").val(publicUtil.htmlDecode(data.remark));
				 $(".sort").val(publicUtil.htmlDecode(data.sort));
				 $(".parentName").val(publicUtil.htmlDecode(data.parentSysOrg.name));
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
        //参数封装
        var data={
    		"id" : $(".id").val() ==null|| $(".id").val() =="" ? null : $(".id").val(),
			"parentId" : $(".parentId").val(),
			"name" : $(".name").val(),
			"useable" : $("#useable").val(),
			"type" : $("#type").val(),
			"code" : $(".code").val(),
			"master" : $(".master").val(),
			"mobile" : $(".mobile").val(),
			"sort" : $(".sort").val(),
			"openDate" : openDate,
			"closeDate" : closeDate,
			"remark" : $(".remark").val()
        }
        
        $.ajax({
			url: application.SERVE_URL+"/sys/sysorg/save", //ajax请求地址
			contentType: "application/json",
			data:JSON.stringify(data),
			success: function (res) {
				if(res.code==application.REQUEST_SUCCESS){
				 	top.layer.close(index);
		            top.layer.msg(res.msg,{time:1000});	
		            layer.closeAll("iframe");
		            //刷新父页面
		            parent.location.reload();
				}else{
					layer.msg(res.msg,{time:1000});
				}
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