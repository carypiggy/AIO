/**
 * @autor syp
 * @content 区域列表页面js
 * @returns
 * @Time 2018-08-01
 */
layui.config({
	base : "../../../../static/js/"
}).extend({
	"application" : "application",
	"publicUtil"  : "publicUtil"
})
var formdatas;
layui.use(['element', 'layer', 'form', 'upload', 'treeGrid','publicUtil','application'], function () {
    var treeGrid = layui.treeGrid,
	    $ = layui.jquery,
		publicUtil = layui.publicUtil,
		application = layui.application,
	    laydate = layui.laydate,
		form = layui.form,
	    laytpl = layui.laytpl; 
    var treeTable = treeGrid.render({
        elem: '#areaTree'
        ,url:application.SERVE_URL+'/sys/sysarea/list'
        ,cellMinWidth: 100    
        ,id: "areaTree"
		,headers : { 'Authorization' : application.HEADER}
        ,treeId:'id'//树形id字段名称
        ,treeUpId:'parentId'//树形父id字段名称
        ,treeShowName:'name'//以树形式显示的字段
        ,cols: [[
			{type:'checkbox'}
            ,{field:'name', edit:'text',title: '区域名称'}
			,{field:'code', edit:'text',title: '区域编码'}
			,{field:'type', edit:'text',title: '区域类型'}
			,{field:'sort', edit:'text',title: '排序号'}
			,{field:'remark', edit:'text',title: '备注信息'}
			,{field:'createDate', edit:'text',title: '更新时间'}
        ]]
        ,page:false
    });
    
	//获取权限并加载按钮
	
    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
    $(".search_btn").on("click",function(){
        if($(".searchVal").val() != ''){
        	treeGrid.reload("areaTree",{
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                    name: $(".searchVal").val()  //搜索的关键字
                }
            })
        }else{
            layer.msg("请输入搜索的内容");
        }
    });



    //添加区域
    function addArea(edit,type){
        var index = layui.layer.open({
            title : "区域修改",
            type : 2,
            content : "areaAdd.html",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
				if(type == "edit"){
					$.ajax({
						url: application.SERVE_URL +'/sys/sysarea/get', //ajax请求地址
						type: "POST",
						data:{
							id :edit.id,
						},
						headers : { 'Authorization' : application.HEADER},												
						success: function (data) {
							formdatas = data;
							if(data){
								body.find(".parentId").val(edit.parentId);
								body.find(".name").val(edit.name);
								body.find(".sort").val(edit.parentId);
								body.find(".code").val(edit.code);
								body.find(".type").val(edit.type);
								body.find(".remark").val(edit.remark);
								body.find(".parentName").val(data.parentSysArea.name);
								form.render();
							}else{
								//console.data();
								top.layer.msg("编码获取失败！");
							}
						}
					}); 
				}else{
					$.ajax({
						url: application.SERVE_URL +'/sys/sysarea/get', //ajax请求地址
						type: "POST",
						data:{
							id :edit.id,
						},
						headers : { 'Authorization' : application.HEADER},						
						success: function (data) {
							if(data){
								body.find(".parentId").val(data.id);
								body.find(".parentName").val(data.name);  
							}else{
								//console.data();
								top.layer.msg("编码获取失败！");
							}
						}
					}); 
					form.render();
				}
                setTimeout(function(){
                    layui.layer.tips('点击此处返回区域列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                },500)
            }
        })
        layui.layer.full(index);
        //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize",function(){
            layui.layer.full(index);
        })
    }

	$(document).on('click','#ADD',function(){
		var flag = publicUtil.jurgeSelectRows(treeGrid.checkStatus('areaTree').data);
		if(flag){
			addArea(treeGrid.checkStatus('areaTree').data[0],'add');
		}else{
			return false;
		}
	});
	
	//编辑操作
	$(document).on('click','#EDIT',function(){		
		var flag = publicUtil.jurgeSelectRows(treeGrid.checkStatus('areaTree').data);
		if(flag){
			addArea(treeGrid.checkStatus('areaTree').data[0],'edit');
		}else{
			return false;
		}

	})
	
	//删除
	$(document).on('click','#DEL',function(){		
		var flag = publicUtil.jurgeSelectRows(treeGrid.checkStatus('areaTree').data);
		if(flag){
			layer.confirm('确定删除此区域吗？',{icon:3, title:'提示信息'},function(index){
				$.ajax({
					url: application.SERVE_URL+"/sys/sysarea/delete", //ajax请求地址
					type: "POST",
					data:{
						id : treeGrid.checkStatus('areaTree').data[0].id 
					},
					headers : { 'Authorization' : application.HEADER},												
					success: function (data) {
						if(data = "success"){
							treeTable.reload();
							layer.close(index);	
						}
					}
				});					 
			});			
		}else{
			return false;
		}
	})
		
});