/**
 * @autor syp
 * @content 区域列表页面js
 * @returns
 * @Time 2018-08-01
 */
layui.config({
	base: "../../../../static/js/"
}).extend({
	"application": "application",
	"publicUtil": "publicUtil"
})
var formdatas;
var isAdd;
layui.use(['element', 'layer', 'form', 'upload', 'table', 'publicUtil', 'application'], function () {
	var table = layui.table,
		_$ = layui.jquery,
		publicUtil = layui.publicUtil,
		application = layui.application,
		laydate = layui.laydate,
		form = layui.form,
		table = layui.table,
		laytpl = layui.laytpl;

	application.init();
	//获取权限并加载按钮
	publicUtil.getPerms(application.PERMS_URL, application.HEADER, parent.cur_menu_id, 'get', 'but_per');


	//选中标记
	var flag;
	//节点标记
	var treeCheckNode;
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
			url: application.SERVE_URL + '/sys/sysarea/tree',
			type: "post",
			success: function (data) {
				treeObj = $.fn.zTree.init($("#areaTree"), setting,data.data); //加载数据
				//初始化
				//获取根节点个数,getNodes获取的是根节点的集合
				var nodeList = treeObj.getNodes();　　　　　　
				treeObj.expandNode(nodeList[0], true);     //展开第一个根节点
				treeObj.setting.callback.onClick(null, treeObj.setting.treeId, nodeList[0]); //调用事件	
			}
		});
	}


		//加载右侧数据
		function onClick(event, treeId, treeNode, clickFlag) {
			// console.log(treeNode.id);
			//生产坏境下请求后台
			treeCheckNode = treeNode.id;
				tableIns = table.render({
					elem: '#areaList',
					//生产坏境下请求后台
					url : application.SERVE_URL+'/sys/sysarea/list',
					where :{parentId : treeNode.id},
					cellMinWidth : 95,
					page : true,
					even : true ,
					height : "full-200",
					id : "areaList",
					cols : [[
						{type:'checkbox'}
						,{field:'name', title: '区域名称'}
						,{field:'code', title: '区域编码'}
						,{field:'type', title: '区域类型'}
						,{field:'sort', title: '排序号'}
						,{field:'remark', title: '备注信息'}
						,{field:'createDate', title: '更新时间'}			
					]]
					,done: function(res, curr, count){    //res 接口返回的信息,
						publicUtil.tableSetStr(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'AREA_TYPE'},'type');
					}
				});	
		}		

		//右键点击事件
		table.on('rowRight(areaList)', function(obj){
			publicUtil.show_menu(obj);
		});
		
		//左键点击事件
		table.on('row(areaList)', function(obj){
			publicUtil.hiddenMenu(obj);
		});

	//搜索【此功能需要后台配合，所以暂时没有动态效果演示】
	_$(".search_btn").on("click", function () {
		if ($(".searchVal").val() != '') {
			table.reload("areaList", {
				page: {
					curr: 1 //重新从第 1 页开始
				},
				where: {
					name: $(".searchVal").val() //搜索的关键字
				}
			})
		} else {
			layer.msg("请输入搜索的内容");
		}
	});



	//添加区域
	function _addArea(edit) {
		publicUtil.gotoEditPage(application.SERVE_URL + '/sys/sysarea/get', edit == undefined ? null : edit.id, "区域修改",
			"areaAdd.html");
	}

	_$(document).on('click', '.PER_ADD', function () {
		_addArea();
	});

	//编辑操作
	_$(document).on('click', '.PER_EDIT', function () {
		var flag = publicUtil.jurgeSelectRows(table.checkStatus('areaList').data);
		if (flag) {
			isAdd = false;
			_addArea(table.checkStatus('areaList').data[0]);
		} else {
			return false;
		}

	})

	//删除
	_$(document).on('click', '.PER_DEL', function () {
		var flag = publicUtil.jurgeSelectRows(table.checkStatus('areaList').data);
		if (flag) {
			layer.confirm('确定删除此区域吗？', {
				icon: 3,
				title: '提示信息'
			}, function (index) {
				_$.ajax({
					url: application.SERVE_URL + "/sys/sysarea/delete", //ajax请求地址
					data: {
						id: table.checkStatus('areaTree').data[0].id
					},
					success: function (res) {
						if (res.code == application.REQUEST_SUCCESS) {
							treeTable.reload();
							layer.close(index);
							top.layer.msg(res.msg);
						} else {
							top.layer.msg(res.msg);
						}
					}
				});
			});
		} else {
			return false;
		}
	})

});
