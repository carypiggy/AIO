/**
 * @autor syp
 * @content 区域增加页面js
 * @returns
 * @Time 2018-08-18
 */
layui.config({
	base : "../../../../static/js/"
}).extend({
	"application" : "application",
	"publicUtil"  : "publicUtil"
})
layui.use(['form','layer','publicUtil','application'],function(){
    var form = layui.form,
		publicUtil = layui.publicUtil,
		application = layui.application,
        layer = layui.layer ,
        $ = layui.jquery;

	function selectArea(){
		var index = layui.layer.open({
				type: 2,
				title: '区域选择',
				shadeClose: true,
				shade: 0.8,
				area: ['280px', '65%'],
				content: 'areaselect.html',
				success : function(layero, index){
					//
					setTimeout(function(){
							layui.layer.tips('点击此处返回区域列表', '.layui-layer-setwin .layui-layer-close', {
									tips: 3
							});
					},500)											
				},
		})
	}	

    form.on("submit(addArea)",function(data){
        //弹出loading
        var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
		$.ajax({
			url: application.SERVE_URL+"/sys/sysarea/save", //ajax请求地址
			type: "POST",
			headers : { 'Authorization' : application.HEADER},	
			data:{
				id : $(".id").val() ==null|| $(".id").val() =="" ? null : $(".id").val(),
				parentId : $(".parentId").val(),
				name : $(".name").val(),
				code : $(".code").val(),
				type : $(".type").val(),
				sort : $(".sort").val(),
				remark : $(".remark").val(),
			},			
			success: function (data) {
				var res = $(".id").val() ==null|| $(".id").val() =="" ? "新增":"修改" ;
				if(data == "success"){
				 	top.layer.close(index);
		            top.layer.msg("区域" + res + "成功");
		            layer.closeAll("iframe");
		            //刷新父页面
		            parent.location.reload();	
				}else{
					top.layer.msg("区域" + res + "失败！");
				}
			},
			error: function(data){
				top.layer.msg("区域" + res + "失败！");
			}
		}); 
        setTimeout(function(){
            top.layer.close(index);
            top.layer.msg("区域添加成功！");
            layer.closeAll("iframe");
            //刷新父页面
            parent.location.reload();
        },2000);
        return false;
    })
	
	$(".parentName").click(function(){
		selectArea();
	})
		
	$("#close").click(function(){
		layer.closeAll("iframe");
		//刷新父页面
		parent.location.reload();	
	})
})