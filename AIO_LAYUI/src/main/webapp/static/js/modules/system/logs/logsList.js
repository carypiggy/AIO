/**
 * @autor syp
 * @content 日志列表页面js
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
    
		
				var start;
				var end ;
				//执行一个laydate实例
				laydate.render({
					elem: '#start'
					,type:'datetime'
					 //指定元素
					,done: function(value, date, endDate){
						//得到日期生成的值，如：2017-08-18
							start	 =value;
					}
				});

				//执行一个laydate实例
				laydate.render({
					elem: '#end' //指定元素,,
					,type:'datetime'
					,done: function(value, date, endDate){
						//得到日期生成的值，如：2017-08-18
							end	 =value;
					}
				});
			
    //日志列表
    var tableIns = table.render({
        elem: '#logsList',
        url : application.SERVE_URL+'/sys/syslogs/list',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limit : 10,
        id : "logsListTable",
        cols : [[
            {field: 'type', title: '日志类型',event: 'setSign'},
            {field: 'username', title: '创建者',event: 'setSign'},
			{field: 'createDate', title: '创建日期',event: 'setSign'},
            {field: 'remoteAddr', title: '操作IP地址',event: 'setSign'},
		    {field: 'userAgent', title: '用户代理',event: 'setSign'},
		    {field: 'requestUri', title: '请求URI',event: 'setSign'},
		    {field: 'method', title: '操作方式',event: 'setSign'},
            {field: 'params', title: '操作提交的数据',event: 'setSign'},
            {field: 'excContent', title: '异常信息',event: 'setSign'}
        ]]
    });
	
	//搜索【此功能需要后台配合，所以暂时没有动态效果演示】
	$(".search_btn").on("click",function(){
		 if(end < start){
			 top.layer.msg("开始时间不能大于结束时间");
			 return;
		 }		
			table.reload("logsListTable",{
				page: {
					curr: 1 //重新从第 1 页开始
				},
				where: {
					username: $(".searchVal").val(),  //搜索的关键字
					beginDate : start,
					endDate : end
				}
			})
	});
	
	//行点击事件
	  //监听单元格事件
	table.on('tool(logsList)', function(obj){
		var data = obj.data;
		console.log((".start").val());
			openLogsInfo(data);
	});
	
	function openLogsInfo(edit){
		var index = layui.layer.open({
				type: 2,
				title: '日志详情',
				shadeClose: true,
				shade: 0.8,
				area: ['500px', '75%'],
				// content: '../views/module/system/menu/menuselect.html',
				content: 'logsInfo.html',
				success : function(layero, index){
				var body = layui.layer.getChildFrame('body', index);
				if(edit){
					$.ajax({
						url: application.SERVE_URL +'/sys/syslogs/get', //ajax请求地址
						type: "POST",
						data:{
							id :edit.id,
						},						
						success: function (data) {
							if(data){
								body.find(".id").val(data.id);
								body.find(".type").val(data.type);
								body.find(".username").val(data.username);
								body.find(".createDate").val(data.createDate);
								body.find(".remoteAddr").val(data.remoteAddr);
								body.find(".userAgent").val(data.userAgent);
								body.find(".requestUri").val(data.requestUri); 
								body.find(".method").val(data.method);
								body.find(".params").val(data.params);
								body.find(".excContent").val(data.excContent);
							}else{
								//console.data();
								top.layer.msg("日志获取失败！");
							}
						}
					}); 
                    form.render();
           }
					setTimeout(function(){
							layui.layer.tips('点击此处返回日志列表', '.layui-layer-setwin .layui-layer-close', {
									tips: 3
							});
					},30)											
				},
		})
	}	
})