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
    
		application.init();
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
				headers : { 'Authorization' : application.HEADER},
        height : "full-160",
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
					queryBeginDate : start,
					queryEndDate : end
				}
			})
	});
	
	//行点击事件
	  //监听单元格事件
	table.on('tool(logsList)', function(obj){
		var data = obj.data;
			openLogsInfo(data);
	});
	
	function openLogsInfo(edit){
		var index = layui.layer.open({
				type: 2,
				title: '日志详情',
				shadeClose: true,
				shade: 0.8,
				area: ['80%', '75%'],
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
						headers : { 'Authorization' : application.HEADER},
						beforeSend: function(){
							$.ajax({
								async:false,
								url: application.SERVE_URL +'/refreshToken', //ajax请求地址
								type: "POST",
								headers : { 'Authorization' : application.HEADER},						
								success: function (data) {
									console.log(data);
								}
							});
						},
						success: function (result) {
							if(result.code==application.REQUEST_SUCCESS){
								body.find(".id").val(result.data.id);
								body.find(".type").val(result.data.type);
								body.find(".username").val(result.data.username);
								body.find(".createDate").val(result.data.createDate);
								body.find(".remoteAddr").val(result.data.remoteAddr);
								body.find(".userAgent").val(result.data.userAgent);
								body.find(".requestUri").val(result.data.requestUri); 
								body.find(".method").val(result.data.method);
								body.find(".params").val(result.data.params);
								body.find(".excContent").val(result.data.excContent);
							}
						},
						error(data){
							var result=data.responseJSON;
							top.layer.msg(result.msg+"("+result.code+")");
						}
					}); 
                    form.render();
        }
				setTimeout(function(){
					layui.layer.tips('点击此处返回日志列表', '.layui-layer-setwin .layui-layer-close', {
						tips: 3
					});
				},120)											
				},
		})
	}	
})