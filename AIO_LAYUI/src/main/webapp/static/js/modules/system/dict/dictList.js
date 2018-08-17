/**
 * @autor syp
 * @content 字典列表页面js
 * @returns
 * @Time 2018-08-02
 */
layui.config({
	base : "../../../../static/js/"
}).extend({
	"application" : "application"
})
layui.use(['form','layer','laydate','table','laytpl','application'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        application = layui.application,
        laydate = layui.laydate,
        laytpl = layui.laytpl,
        table = layui.table;
    	
    //编码列表
    var tableIns = table.render({
        elem: '#dictList',
        url : application.SERVE_URL+'/sys/sysdict/list',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limit : 10,
        headers : { 'Authorization' : sessionStorage.getItem('token')},
        id : "dictListTable",
        cols : [[
/*            {field: 'id', title: 'ID', align:"center",style:'display:none;'},*/
            {field: 'typeCode', title: '编码类型'},
            {field: 'label', title: '编码名称'},
            {field: 'value', title: '编码值'},
			{field: 'sort',sort: true, title: '排序'},
            {field: 'remark', title: '备注'},
            {title: '操作', width:170, templet:'#dictListBar',fixed:"right",align:"center"}
        ]]
    });


    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
    $(".search_btn").on("click",function(){
            table.reload("dictListTable",{
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
    function addDict(edit){
        var index = layui.layer.open({
            title : "添加编码",
            type : 2,
            content : "dictAdd.html",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                if(edit){
					$.ajax({
						url: application.SERVE_URL +'/sys/sysdict/get', //ajax请求地址
						type: "POST",
						data:{
							id :edit.id,
						},						
						success: function (data) {
							if(data){
								body.find(".id").val(data.id);
								body.find(".remark").val(data.remark);
								body.find(".value").val(data.value);
								body.find(".typeCode").val(data.typeCode);
								body.find(".label").val(data.label);
								body.find(".value").val(data.value);
								body.find(".sort").val(data.sort);  	
							}else{
								//console.data();
								top.layer.msg("编码获取失败！");
							}
						}
					}); 
                    form.render();
                }
                setTimeout(function(){
                    layui.layer.tips('点击此处返回编码列表', '.layui-layer-setwin .layui-layer-close', {
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
    $(".addDict_btn").click(function(){
    	addDict();
    })


    //列表操作
    table.on('tool(dictList)', function(obj){
        var layEvent = obj.event,
            data = obj.data;

        if(layEvent === 'edit'){ //编辑
        	addDict(data);
        } else if(layEvent === 'del'){ //删除
            layer.confirm('确定删除此此编码？',{icon:3, title:'提示信息'},function(index){
                 $.post(application.SERVE_URL+"/sys/sysdict/delete",{
                     id : data.id  
                 },function(data){
                	if(data = "success"){
                        tableIns.reload();
                        layer.close(index);	
                	}
                 })
            });
        }
    });

})