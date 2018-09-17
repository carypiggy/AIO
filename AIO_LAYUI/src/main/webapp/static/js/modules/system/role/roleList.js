/**
 * @autor syp
 * @content 角色列表页面js
 * @returns
 * @Time 2018-08-02
 */
layui.config({
	base: "../../../../static/js/"
}).extend({
	"application": "application",
	"publicUtil": "publicUtil"
})
//表单回填
var formdatas;
layui.use(['application', 'form', 'layer', 'laydate', 'table', 'publicUtil'], function () {
	var form = layui.form,
		layer = layui.layer,
		$ = layui.jquery,
		publicUtil = layui.publicUtil,
		application = layui.application,
		laydate = layui.laydate,
		laytpl = layui.laytpl,
		table = layui.table;
	//选中标记
	var flag;

	application.init();
	//编码列表
	var tableIns = table.render({
		elem: '#roleList',
		url: application.SERVE_URL + '/sys/sysrole/list',
		cellMinWidth: 95,
		method: "POST",
		even : true ,
		page: true,
		height: "full-160",
		limit: 20,
		limits: [10, 15, 20, 25],
		id: "roleList",
		cols: [
			[{
					type: 'checkbox'
				},
				{
					field: 'name',
					title: '角色名称'
				},
				{
					field: 'type',
					title: '角色类型'
				},
				{
					field: 'code',
					title: '角色编码'
				},
				{
					field: 'createDate',
					title: '创建时间'
				},
				{
					field: 'remark',
					title: '备注信息'
				}
			]
		],
		done: function (res, curr, count) { //res 接口返回的信息,
			publicUtil.tableSetStr(application.SERVE_URL + "/sys/sysdict/getByTypeCode", {
				'typeCode': 'ROLE_TYPE'
			}, 'type');
		}
	});

	//获取权限并加载按钮
	publicUtil.getPerms(application.PERMS_URL, application.HEADER, parent.cur_menu_id, 'get', 'but_per');

	//右键点击事件
	table.on('rowRight(roleList)', function (obj) {
		publicUtil.show_menu(obj);
	});

	//左键点击事件
	table.on('row(roleList)', function (obj) {
		publicUtil.hiddenMenu(obj);
	});

	//搜索【此功能需要后台配合，所以暂时没有动态效果演示】
	$(".search_btn").on("click", function () {
		if ($(".searchVal").val() != '') {
			table.reload("roleList", {
				page: {
					curr: 1 //重新从第 1 页开始
				},
				where: {
					key: $(".searchVal").val() //搜索的关键字
				}
			})
		} else {
			layer.msg("请输入搜索的内容");
		}
	});

	//新增操作
	$(document).on('click', '.PER_ADD', function () {
		_addRole()
	});

	//编辑操作
	$(document).on('click', '.PER_EDIT', function () {
		flag = publicUtil.jurgeSelectRows(table.checkStatus('roleList').data);
		if (flag) {
			_addRole(table.checkStatus('roleList').data[0]);
		} else {
			return false;
		}

	})

	//删除
	$(document).on('click', '.PER_DEL', function () {
		flag = publicUtil.jurgeSelectRows(table.checkStatus('roleList').data);
		if (flag) {
			layer.confirm('确定删除此此角色？', {
				icon: 3,
				title: '提示信息'
			}, function (index) {
				$.ajax({
					url: application.SERVE_URL + "/sys/sysrole/delete", //ajax请求地址
					data: {
						id: table.checkStatus('roleList').data[0].id
					},
					success: function (res) {
						if (res.code == application.REQUEST_SUCCESS) {
							top.layer.msg(res.msg);
							layer.close(index);
							table.reload();
						} else {
							layer.msg('权限配置失败');
						}
					}
				})
			});
		} else {
			return false;
		}
	})

	//权限操作
	$(document).on('click', '.PER_PERM', function () {
		var flag = publicUtil.jurgeSelectRows(table.checkStatus('roleList').data);
		if (flag) {
			$.ajax({
				url: application.SERVE_URL + '/sys/sysrole/get',
				data: {
					"id": table.checkStatus('roleList').data[0].id
				}, //ajax请求地址
				success: function (res) {
					formdatas = res.data;
					var index = layui.layer.open({
						type: 2,
						title: '菜单选择',
						shadeClose: true,
						shade: 0.8,
						area: ['280px', '65%'],
						// content: '../views/module/system/role/menuselect.html',
						content: 'menuselect.html',
						success: function (layero, index) {
							setTimeout(function () {
								layui.layer.tips('点击此处返回角色列表', '.layui-layer-setwin .layui-layer-close', {
									tips: 3
								});
							}, 500)
						},
					})
				}
			});

		} else {
			return false;
		}

	})

	//添加角色
	function _addRole(edit) {
		publicUtil.gotoEditPage(application.SERVE_URL + '/sys/sysrole/get', edit == undefined ? null : edit.id, "角色管理",
			"roleAdd.html");
	}

})
