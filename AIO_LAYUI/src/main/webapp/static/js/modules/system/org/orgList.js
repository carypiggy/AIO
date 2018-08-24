/**
 * @autor syp
 * @content 机构列表页面js
 * @returns
 * @Time 2018-08-01
 */
layui.config({
	base : "../../../../static/js/"
}).extend({
	"application" : "application",
	"publicUtil"  : "publicUtil",
	"dateUtils"  : "dateUtils"
})
//表单回填
var formdatas;
layui.use(['element', 'layer', 'form', 'tree','table','laydate','application','publicUtil','dateUtils','upload'], function () {
	var layer = layui.layer
			,_$ = layui.jquery,
			form = layui.form,
			laydate = layui.laydate,
			laytpl = layui.laytpl,
			application = layui.application,
			dateUtils = layui.dateUtils,
			publicUtil = layui.publicUtil,
			table = layui.table;
			
			//获取权限并加载按钮
			publicUtil.getPerms(application.PERMS_URL,application.HEADER,parent.cur_menu_id,'get','but_per');
			
	//选中标记
	var flag ;
	//节点标记
	var treeCheckNode ;
	//节点标记
	var treeObj;
	//ztree设置
	var setting = {		
				view: {
					selectedMulti: false
				},
				data: {
					simpleData: {
						enable: true,
						idKey: "id",
						pIdKey: "parentId"				
					}
				},
				callback: {
					onClick: onClick
				}
	};
	//初始化树
	initTree();
	function initTree() {
		$.ajax({
				url: application.SERVE_URL+'/sys/sysorg/tree',
				headers : { 'Authorization' : application.HEADER},//ajax请求地址
				success: function (data) {
				treeObj = $.fn.zTree.init($("#orgTree"), setting, covert(data.data)); //加载数据
				//初始化
									//获取根节点个数,getNodes获取的是根节点的集合
				var nodeList = treeObj.getNodes();
	　　　　　　//展开第一个根节点
				treeObj.expandNode(nodeList[0], true);
				treeObj.setting.callback.onClick(null, treeObj.setting.treeId, nodeList[0]);//调用事件	
			}
		});		
		// $.fn.zTree.init($("#treeDemo"), setting);
	}	
		
	function covert(data) {
		for (var i = 0; i < data.length; i++) {
			data[i].name = data[i].name +"("+dateUtils.getYearAndDay(data[i].openDate)+"--"+ judgeNull(data[i].closeDate)+")"
		}
		return data;
	}
	
	function judgeNull(data){
		if(data == null ||data =='null' ||data ==""){
			return "至今";
		}else{
			return dateUtils.getYearAndDay(data);
		}
	}
	
	//加载右侧数据
	function onClick(event, treeId, treeNode, clickFlag) {
		// console.log(treeNode.id);
		//生产坏境下请求后台
		treeCheckNode = treeNode.id;
				tableIns = table.render({
					elem: '#orgList',
					//生产坏境下请求后台
					url : application.SERVE_URL+'/sys/sysorg/list',
					headers : { 'Authorization' : application.HEADER},
					where :{parentId : treeNode.id},
					cellMinWidth : 95,
					page : true,
					height : "full-160",
					id : "orgList",
					cols : [[
						{type:'checkbox'},
						{field: 'name', title: '机构名称'},
						{field: 'code', title: '机构编码'},
						{field: 'type', title: '机构类型'},
						{field: 'master', title: '机构负责人'},
						{field: 'mobile', title: '手机号'},
						{field: 'useable', title: '机构名称'},
						{field: 'openDate', title: '开创时间'},
						{field: 'closeDate', title: '关闭时间'}
						
					]]
				});	
	}		
			
	//搜索【此功能需要后台配合，所以暂时没有动态效果演示】
	$(".search_btn").click(function(){
		if($(".searchVal").val() != ''){
			table.reload("orgList",{
				page: {
					curr: 1 //重新从第 1 页开始
				},
				where: {
					name: $(".searchVal").val()
				}
			})
		}else{
			layer.msg("请输入搜索的内容");
		}
	});			


    //添加编码
    function addOrg(edit){
        var index = layui.layer.open({
            title : "添加机构",
            type : 2,
            content : "orgAdd.html",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                if(edit){
										$.ajax({
											url: application.SERVE_URL +'/sys/sysorg/get', //ajax请求地址
											type: "POST",
											data:{
												id :edit.id,
											},
											headers : { 'Authorization' : application.HEADER},						
											success: function (data) {
												formdatas = data;
												if(data){
													console.log(data.parentSysOrg.name);
													body.find(".id").val(data.id);
													body.find(".parentId").val(data.parentId);
													body.find(".name").val(data.name);
													body.find(".code").val(data.code);													
													body.find(".master").val(data.master);  
													body.find(".mobile").val(data.mobile);  
													body.find(".mobile").val(data.mobile);  
													body.find("#openDate").val(data.openDate);  
													body.find("#closeDate").val(data.closeDate); 
													body.find(".remark").val(data.remark);
													body.find(".sort").val(data.sort);
													body.find(".parentName").val(data.parentSysOrg.name);  
												}
											},
											error: function(data){
												top.layer.msg("机构失败！");
											}
										});                   
                }
								form.render();
                setTimeout(function(){
                    layui.layer.tips('点击此处返回机构列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                },500)
            }
        })
        layui.layer.full(index);
        //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        _$(window).on("resize",function(){
            layui.layer.full(index);
        })
    }
		
		//新增操作
		_$(document).on('click','#ADD',function(){
				addOrg();
    });

		
		//编辑操作
		_$(document).on('click','#EDIT',function(){		
			var flag = publicUtil.jurgeSelectRows(table.checkStatus('orgList').data);
				if(flag){
					addOrg(table.checkStatus('orgList').data[0]);
				}else{
					return false;
				}

		})
		
		//删除
		_$(document).on('click','#DEL',function(){		
				var flag = publicUtil.jurgeSelectRows(table.checkStatus('orgList').data);
				if(flag){
								layer.confirm('确定删除此机构吗？',{icon:3, title:'提示信息'},function(index){
										$.ajax({
											url: application.SERVE_URL+"/sys/sysorg/delete", //ajax请求地址
											type: "POST",
											data:{
												id : table.checkStatus('orgList').data[0].id  
											},
											headers : { 'Authorization' : application.HEADER},												
											success: function (data) {
												if(data = "success"){
													treeTable.reload();
													layer.close(index);	
												}
											}
										})
								});													
				}else{
					return false;
				}
			})			
		
		
		
		
    $(".addOrg_btn").click(function(){
			if(flag !=''){
				addOrg();
			}else{
				layer.msg("请选中一个节点后增加机构");
			}
    })	  
	  
});