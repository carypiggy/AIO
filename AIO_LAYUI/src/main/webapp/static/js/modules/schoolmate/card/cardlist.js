/**
 * @autor syp
 * @content 字典列表页面js
 * @returns
 * @Time 2018-08-02
 */
layui.config({
	base: "../../../../static/js/"
}).extend({
	"application": "application",
	"publicUtil": "publicUtil"
})
var formdata;
layui.use(['form', 'layer', 'laydate', 'table', 'laytpl', 'application', 'publicUtil'], function() {
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : top.layer,
		$ = layui.jquery,
		publicUtil = layui.publicUtil,
		application = layui.application,
		laydate = layui.laydate,
		laytpl = layui.laytpl,
		table = layui.table;

	application.init();

	var tableIns = table.render({
		elem: '#cardList',
		url: application.SERVE_URL + '/sys/smCard/list',
		cellMinWidth: 95,
		page: true,
		height: "full-160",
		limit: 10,
		headers: {
			'Authorization': application.HEADER
		},
		id: "cardList",
		cols: [
			[{
				type: 'checkbox'
			}, {
				field: 'name',
				title: '卡片名称'
			}, {
				field: 'type',
				title: '卡片类型'
			}, {
				field: 'create_date',
				title: '创建时间'
			}, {
				title: '操作',
				width: 170,
				templet: '#userListBar',
				fixed: "right",
				align: "center"
			}]
		]
	});

	//新增操作
	$(document).on('click', '#ADD', function() {
		addCard();
	});

	//编辑操作
	$(document).on('click', '#EDIT', function() {
		var flag = publicUtil.jurgeSelectRows(table.checkStatus('cardList').data);
		if(flag) {
			addCard(table.checkStatus('cardList').data[0]);
		} else {
			return false;
		}

	})

	//删除
	$(document).on('click', '#DEL', function() {
		var flag = publicUtil.jurgeSelectRows(table.checkStatus('cardList').data);
		if(flag) {
			layer.confirm('确定删除此校友卡吗？', {
				icon: 3,
				title: '提示信息'
			}, function(index) {
				$.ajax({
					url: application.SERVE_URL + "/sys/smCard/delete", //ajax请求地址
					type: "POST",
					data: {
						id: table.checkStatus('cardList').data[0].id
					},
					headers: {
						'Authorization': application.HEADER
					},
					success: function(data) {
						if(data = "success") {
							table.reload();
							layer.close(index);
						}
					}
				});
			});
		} else {
			return false;
		}
	})

	//获取权限并加载按钮
	publicUtil.getPerms(application.PERMS_URL, application.HEADER, parent.cur_menu_id, 'get', 'but_per');
	//搜索【此功能需要后台配合，所以暂时没有动态效果演示】
	$(".search_btn").on("click", function() {
		table.reload("cardList", {
			page: {
				curr: 1 //重新从第 1 页开始
			},
			where: {
				typeCode: $(".searchTypeCode").val(),
				label: $(".searchLabel").val(),
			}
		})
	});

	//添加编码
	function addCard(edit) {
		$.ajax({
			url: application.SERVE_URL + '/sys/smCard/get', //ajax请求地址
			type: "POST",
			data: {
				id: edit?(edit.id?edit.id:null):null,
			},
			headers: {
				'Authorization': application.HEADER
			},
			success: function(data) {
				formdata=data;
				var index = layui.layer.open({
					title: "添加校友卡",
					type: 2,
					content: "cardadd.html",
					success: function(layero, index) {
						var body = layui.layer.getChildFrame('body', index);
						if(edit) {
							body.find("#cardid").val(data.id);
							body.find(".name").val(data.name);
							form.render();
						}
						setTimeout(function() {
							layui.layer.tips('点击此处返回校友卡列表', '.layui-layer-setwin .layui-layer-close', {
								tips: 3
							});
						}, 500)
					}
				})
				layui.layer.full(index);
				//改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
				$(window).on("resize", function() {
					layui.layer.full(index);
				})
			}
		});
		
	}
})