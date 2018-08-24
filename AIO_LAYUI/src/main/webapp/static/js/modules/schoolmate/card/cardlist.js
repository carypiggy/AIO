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
				field: 'createDate',
				title: '创建时间'
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
							tableIns.reload();
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
		var restUrl=application.SERVE_URL + '/sys/smCard/get';
		var id=edit?(edit.id?edit.id:null):null;
		publicUtil.gotoEditPage(restUrl,id,"添加校友卡","cardadd.html")
	}
})