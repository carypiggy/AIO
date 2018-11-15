/**
 * @autor Cary
 * @content 字典列表页面js
 * @returns
 * @Time 2018-10-23
 */
layui.config({
	base : "../../../../static/js/"
}).extend({
	"application" : "application",
	"publicUtil"  : "publicUtil"
})
layui.use(['form','layer','laydate','table','laytpl','application','publicUtil'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
		publicUtil = layui.publicUtil,
        application = layui.application,
        laydate = layui.laydate,
        laytpl = layui.laytpl,
        table = layui.table;

	application.init();
	
	//获取权限并加载按钮
	publicUtil.getPerms(application.PERMS_URL,application.HEADER,parent.cur_menu_id,'post','but_per');
	
    //列表
    var tableIns = table.render({
		pageName: 'pageNo' //页码的参数名称，默认：page
		,limitName: 'pageSize' //每页数据量的参数名，默认：limit,
		,dataName: 'list'
		,statusCode: 200,
		where :{salaryId : parent.salaryId}
		,even : true 		
        ,elem: '#detailList'
        ,url : application.SERVE_URL+'/finance/salary/getDetail',
        cellMinWidth : 95,
        page : true,
        height : "full-160",
        limit : 10,
        id : "detailList",
        cols : [[
        	//{field: 'id', title: 'ID', align:"center",style:'display:none;'},
            {field: 'card', title: '工号'},
			{field: 'name', title: '姓名'},
            {field: 'email', title: '邮箱'},
            {field: 'status', title: '状态'}
        ]],
		done: function (res, curr, count) {
			$("[data-field = 'status']").children().each(function(){
					if($(this).text() == "YES"){								
						$(this).text("成功");
					}else if($(this).text() == "NO"){
						$(this).text("失败");
					}else{
						return;   
					}
			})
		}
    });

// 	//右键点击事件
// 	table.on('rowRight(salaryList)', function(obj){
// 		publicUtil.show_menu(obj);
// 	});
// 	
// 	//左键点击事件
// 	table.on('row(salaryList)', function(obj){
// 		publicUtil.hiddenMenu(obj);
// 	});
// 	
// 	//导入
// 	$(document).on('click','.PER_ADD',function(){
// 		_addSalary();
// 	});
// 	
// 	
// 	//查看操作
// 	$(document).on('click','.PER_VIEW',function(){		
// 		var flag = publicUtil.jurgeSelectRows(table.checkStatus('salaryList').data);
// 		if(flag){			
// 			_viewSalary(table.checkStatus('salaryList').data[0]);
// 		}else{
// 			return false;
// 		}
// 
//     })
// 	
// 	//删除
// 	$(document).on('click','.PER_DEL',function(){		
// 		var flag = publicUtil.jurgeSelectRows(table.checkStatus('salaryList').data);
// 		if(flag){
//             layer.confirm('确定删除此此数据？',{icon:3, title:'提示信息'},function(index){				
// 				$.ajax({
// 					url: application.SERVE_URL+"/fince/salary/delete", //ajax请求地址
// 					data:{
// 						id : table.checkStatus('salaryList').data[0].id  
// 					},										
// 					success: function (res) {
// 						if(res.code==application.REQUEST_SUCCESS){
// 							tableIns.reload();
// 							// location.reload();
// 							top.layer.close(index);	
// 							top.layer.msg(res.msg,{time:1000});							
// 						}else{
// 							top.layer.msg(res.msg,{time:1000});
// 						}
// 
// 					}
// 				});	
//             });			
// 		}else{
// 			return false;
// 		}
//     })	
// 	
//     //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
//     $(".search_btn").on("click",function(){
//             table.reload("salaryList",{
//                 page: {
//                     curr: 1 //重新从第 1 页开始
//                 },
//                 where: {
//                 	typeCode: $(".data-month").val()
//                 }
//             })
//     });
// 	
// 
// 	//添加
// 	function _addSalary(edit){
// 		publicUtil.gotoEditPage(application.SERVE_URL +'/finance/salary/get',edit ==undefined?null:edit.id,"发放信息","salaryAdd.html");
// 	}
// 	
// 	//查看
// 	function _addSalary(edit){
// 		publicUtil.gotoEditPage(application.SERVE_URL +'/finance/salary/getDetail',edit ==undefined?null:edit.id,"发送详情","salaryDetail.html");
// 	}

	
})