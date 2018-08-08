/**
 * @autor syp
 * @content 角色列表页面js
 * @returns
 * @Time 2018-08-02
 */
layui.config({
	base: '../../../../static/js/' //此处路径请自行处理, 可以使用绝对路径
}).extend({
	formSelects: 'formSelects-v4'
});
layui.use(['jquery','form','layer','formSelects'],function(){
    var form = layui.form,
		$ = layui.jquery,
		formSelects = layui.formSelects,
        layer = parent.layer === undefined ? layui.layer : top.layer;

	
	//多选下拉框配置
	formSelects.config('userRole', {
	    keyName: 'roleName',            //自定义返回数据中name的key, 默认 name
		keyVal: 'id', 
	}, true);
	//初始化角色下拉框(此处应该时经后台过滤处理 选中与为选中)
	// selected: boolean,         //自定义返回数据中selected的key, 默认 selected
    // selected: boolean',         //自定义返回数据中disabled的key, 默认 disabled
	function initSelect(){
		$.ajax({
			url: "../../../../static/json/rolelist.json", //ajax请求地址
			success: function (rs) {
				console.log(rs);
				formSelects.data('userRole', 'local', {
						arr: rs.list					
				})
			}
		});
	}
	
	
	initSelect();
    form.on("submit(addUser)",function(data){
        //弹出loading
        var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});

        setTimeout(function(){
            top.layer.close(index);
            top.layer.msg("编码添加成功！");
            layer.closeAll("iframe");
            //刷新父页面
            parent.location.reload();
        },2000);
        return false;
    })
	//(此处应该时经后台过滤处理 选中与为选中)
	// checked : boolean 
	function selectOrg(){
		var index = layui.layer.open({
				type: 2,
				title: '机构选择',
				shadeClose: true,
				shade: 0.8,
				area: ['280px', '65%'],
				// content: '../views/module/system/role/menuselect.html',
				content: 'orgselect.html',
				success : function(layero, index){
					//
					setTimeout(function(){
							layui.layer.tips('点击此处返回用户列表', '.layui-layer-setwin .layui-layer-close', {
									tips: 3
							});
					},500)											
				},
		})
	}
	//机构选择
	$(".userOrg").click(function(){
		selectOrg();
	})

})