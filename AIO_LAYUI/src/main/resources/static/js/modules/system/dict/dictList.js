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
        id : "dictListTable",
        cols : [[
/*            {field: 'id', title: 'ID', align:"center",style:'display:none;'},*/
            {field: 'typeCode', title: 'typeCode'},
            {field: 'label', title: 'label'},
            {field: 'value', title: 'value', align:'center'},
            {field: 'remark', title: 'remark',  align:'center'},
            {field: 'flag', title: 'flag', align:'center'},
            {title: '操作', width:170, templet:'#dictListBar',fixed:"right",align:"center"}
        ]]
    });


    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
    $(".search_btn").on("click",function(){
        if($(".searchVal").val() != ''){
            table.reload("dictListTable",{
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                	typeCode: $(".searchVal").val()  //搜索的关键字
                }
            })
        }else{
            layer.msg("请输入搜索的内容");
        }
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
                	body.find(".remark").val(edit.remark);
                	body.find(".value").val(edit.value);
                	body.find(".typeCode").val(edit.typeCode);
                	body.find(".label").val(edit.label);
                	body.find(".value").val(edit.value);
                	body.find(".sort").val(edit.sort);            	
                	//可参考如下
//                    body.find(".newsStatus select").val(edit.newsStatus);
//                    body.find(".openness input[name='openness'][title='"+edit.newsLook+"']").prop("checked","checked");
//                    body.find(".newsTop input[name='newsTop']").prop("checked",edit.newsTop);
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
                 $.get("http://127.0.0.1:8080/sys/sysdict/delete",{
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