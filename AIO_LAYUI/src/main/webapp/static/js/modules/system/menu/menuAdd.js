/**
 * @autor syp
 * @content 菜单增加页面js
 * @returns
 * @Time 2018-08-01
 */
 layui.config({
 	base : "../../../../static/js/"
 }).extend({
 	"validparam"  : "validparam"
 }) 
layui.use(['form','layer','application','validparam','publicUtil'],function(){
    var form = layui.form,
		application = layui.application,
		validparam = layui.validparam,
		publicUtil  = layui.publicUtil
        layer = layui.layer,
        $ = layui.jquery;

	if(parent.formdatas != undefined){
		publicUtil.setCheckBoxVal('isShow',parent.formdatas.isShow);	
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'MENUTYPE'} ,"type",parent.formdatas.type);		
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'PERMISSION'} ,"operate",parent.formdatas.operate);
	}else{
		publicUtil.selectBase(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'MENUTYPE'} ,"type");		
		publicUtil.selectBase(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'PERMISSION'} ,"operate");
	}


    form.on("submit(addMenu)",function(data){
        //弹出loading
        //弹出loading
        var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
        var res = $(".id").val() ==null|| $(".id").val() =="" ? "新增":"修改" ;
		$.ajax({
			url: application.SERVE_URL+"/sys/sysmenu/save", //ajax请求地址
			type: "POST",
			data:{
				id : $(".id").val() ==null|| $(".id").val() =="" ? null : $(".id").val(),
				parentId : $(".parentId").val(),
				name : $(".name").val(),
				code : $(".code").val(),
				href : $(".href").val(),
				icon : $(".icon").val(),
				type : $("#type").val(),
				operate : $("#operate").val(),
				permission : $(".permission").val(),
				sort : $(".sort").val(),
				operate : $("#operate").val(),
				remark : $(".remark").val(),
				isShow : $('input[name="isShow"]').filter(':checked').val(),
				target : $(".target").val()
			},
			headers : { 'Authorization' : application.HEADER},			
			success: function (data) {
				
				if(data == "success"){
				 	top.layer.close(index);
		            top.layer.msg("菜单" + res + "成功");
		            layer.closeAll("iframe");
		            //刷新父页面
		            parent.location.reload();	
				}else{
					top.layer.msg("菜单" + res + "失败！");
				}
			},
			error: function(data){
				top.layer.msg("菜单" + res + "失败！");
			}
		}); 
        return false;
    })
	
	function selectMenu(){
		var index = layui.layer.open({
				type: 2,
				title: '菜单选择',
				shadeClose: true,
				shade: 0.8,
				area: ['280px', '65%'],
				// content: '../views/module/system/menu/menuselect.html',
				content: 'menuselect.html',
				success : function(layero, index){
					//
					setTimeout(function(){
							layui.layer.tips('点击此处返回菜单列表', '.layui-layer-setwin .layui-layer-close', {
									tips: 3
							});
					},500)											
				},
		})
	}	
	
	function selectIcon(){
		var index = layui.layer.open({
				type: 2,
				title: '图标选择',
				shadeClose: true,
				shade: 0.8,
				area: ['480px', '75%'],
				// content: '../views/module/system/menu/menuselect.html',
				content: '../../../../static/icon/icon.html',
				success : function(layero, index){
					//
					setTimeout(function(){
							layui.layer.tips('点击此处返回菜单列表', '.layui-layer-setwin .layui-layer-close', {
									tips: 3
							});
					},500)											
				},
		})
	}	
	
	$(".parentName").click(function(){
		selectMenu();
	})	
	
	$(".icon").click(function(){
		selectIcon();
	})
	
	$("#close").click(function(){
		layer.closeAll("iframe");
		//刷新父页面
		parent.location.reload();	
	})
})