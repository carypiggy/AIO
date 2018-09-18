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
	var layer = parent.layer === undefined ? layui.layer : top.layer
			,_$ = layui.jquery,
			form = layui.form,
			laydate = layui.laydate,
			laytpl = layui.laytpl,
			application = layui.application,
			dateUtils = layui.dateUtils,
			publicUtil = layui.publicUtil,
			table = layui.table;
			
			application.init();
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
			_$.ajax({
				url: application.SERVE_URL+'/sys/sysorg/tree',
				type:"post",
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
					where :{parentId : treeNode.id},
					cellMinWidth : 95,
					page : true,
					even : true ,
					height : "full-180",
					id : "orgList",
					cols : [[
						{type:'checkbox'},
						{field: 'name', title: '机构名称'},
						{field: 'code', title: '机构编码'},
						{field: 'type', title: '机构类型'},
						{field: 'master', title: '机构负责人'},
						{field: 'mobile', title: '手机号'},
						{field: 'useable', title: '启用状态'},
						{field: 'openDate', title: '开创时间'},
						{field: 'closeDate', title: '关闭时间'}						
					]]
					,done: function(res, curr, count){    //res 接口返回的信息,
						publicUtil.tableSetStr(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'ORG_USEABLE'},'useable');
						publicUtil.tableSetStr(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'ORG_TYPE'},'type');
						$("[data-field = 'closeDate']").children().each(function(){							
							if($(this).text().trim() ==''){								
								$(this).text('至今');
							}
						})
					}
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

		
		//右键点击事件
		table.on('rowRight(orgList)', function(obj){
			publicUtil.show_menu(obj);
		});
		
		//左键点击事件
		table.on('row(orgList)', function(obj){
			publicUtil.hiddenMenu(obj);
		});
 
		//新增操作
		_$(document).on('click','.PER_ADD',function(){
				_addOrg();
    });

		
		//编辑操作
		_$(document).on('click','.PER_EDIT',function(){		
			var flag = publicUtil.jurgeSelectRows(table.checkStatus('orgList').data);
				if(flag){
					_addOrg(table.checkStatus('orgList').data[0]);
				}else{
					return false;
				}

		})
		
		//删除
		_$(document).on('click','.PER_DEL',function(){		
				var flag = publicUtil.jurgeSelectRows(table.checkStatus('orgList').data);
				if(flag){
					layer.confirm('确定删除此机构吗？',{icon:3, title:'提示信息'},function(index){
						$.ajax({
							url: application.SERVE_URL+"/sys/sysorg/delete", //ajax请求地址
							data:{
								id : table.checkStatus('orgList').data[0].id  
							},							
							success: function (res) {
								if(res.code==application.REQUEST_SUCCESS){
									tableIns.reload();
									// location.reload();
									top.layer.close(index);	
									top.layer.msg(res.msg);							
								}else{
									top.layer.msg(res.msg);
								}

							}
						})
					});													
				}else{
					return false;
				}
			})			
		 
	  
		//添加机构
		function _addOrg(edit){
			publicUtil.gotoEditPage(application.SERVE_URL +'/sys/sysorg/get',edit ==undefined?null:edit.id,"机构修改","orgAdd.html");
		}
		
});