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

	function formEdit(FormDatas){
		if(FormDatas != ''){
			console.log(parent.isAdd)
			var data = FormDatas;
			if(parent.isAdd){
				$(".parentId").val(publicUtil.htmlDecode(data.id));
				$(".parentName").val(publicUtil.htmlDecode(data.name)); 
				publicUtil.selectBase(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'AREA_TYPE'} ,"type");
			}else{
				 $(".id").val(publicUtil.htmlDecode(data.id));
				 $(".parentId").val(publicUtil.htmlDecode(data.parentSysArea.id));
				 $(".name").val(publicUtil.htmlDecode(data.name));
				 $(".sort").val(publicUtil.htmlDecode(data.sort));
				 $(".code").val(publicUtil.htmlDecode(data.code));
				 $(".remark").val(publicUtil.htmlDecode(data.remark));
				 $(".parentName").val(publicUtil.htmlDecode(data.parentSysArea.name));
				 publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'AREA_TYPE'} ,"type",data.type);
			}
		}else{
			return false;
		}
	}

	/**
	 * 表单回填
	 */
	formEdit(parent.editFormData);


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
		var res = ($(".id").val() ==null|| $(".id").val() =="") ? "新增":"修改" ;
		var data={
			id : $(".id").val() ==null|| $(".id").val() =="" ? null : $(".id").val(),
			parentId : $(".parentId").val(),
			name : $(".name").val(),
			code : $(".code").val(),
			type : $("#type").val(),
			sort : $(".sort").val(),
			remark : $(".remark").val()
		}
		$.ajax({
			url: application.SERVE_URL+"/sys/sysarea/save", //ajax请求地址
			data:data,			
			success: function (data) {
				if(data.code==application.REQUEST_SUCCESS){
					top.layer.close(index);
					top.layer.msg(data.msg,{time:1000});
					layer.closeAll("iframe");
					//刷新父页面
					parent.location.reload();
				}else{
					top.layer.msg(data.msg+"("+data.code+")",{time:1000});
				}
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