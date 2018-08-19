/**
 * @autor syp
 * @content 角色列表页面js
 * @returns
 * @Time 2018-08-02
 */
layui.config({
	base : "../../../../static/js/"
}).extend({
	"application" : "application",
	"publicUtil"  : "publicUtil"
})
//表单回填
var formdatas;
layui.use(['application','form','layer','laydate','table','publicUtil'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
				publicUtil = layui.publicUtil,
		application = layui.application,
        laydate = layui.laydate,
        laytpl = layui.laytpl,
        table = layui.table;

		application.init();
    //编码列表
    var tableIns = table.render({
        elem: '#roleList',
        url : application.SERVE_URL+'/sys/sysrole/list',
        cellMinWidth : 95,
        page : true,
				headers : { 'Authorization' : sessionStorage.getItem('token')},
        height : "full-160",
        limit : 20,
        limits : [10,15,20,25],
        id : "roleList",
        cols : [[
            {type:'checkbox'},
            {field: 'name', title: '角色名称'},
            {field: 'type', title: '角色类型'},
            {field: 'code', title: '角色编码'},
            {field: 'createDate', title: '创建时间'},
            {field: 'remark', title: '备注信息'}
        ]]
    });

		//获取权限并加载按钮
		publicUtil.getPerms(application.PERMS_URL,application.HEADER,parent.cur_menu_id,'get','but_per');

	
    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
    $(".search_btn").on("click",function(){
        if($(".searchVal").val() != ''){
            table.reload("roleList",{
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                    key: $(".searchVal").val()  //搜索的关键字
                }
            })
        }else{
            layer.msg("请输入搜索的内容");
        }
    });

    //添加角色
    function addRole(edit){
        var index = layui.layer.open({
            title : "添加角色",
            type : 2,
            content : "roleAdd.html",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                if(edit){
										$.ajax({
											url: application.SERVE_URL +'/sys/sysrole/get', //ajax请求地址
											type: "POST",
											data:{
												id :edit.id,
											},						
											success: function (data) {
												if(data){
													 formdatas = data;
													 body.find(".id").val(data.id);
													 body.find(".role").val(edit.role);
													 body.find(".code").val(edit.code);
													 body.find(".name").val(edit.name);
													 body.find(".remark").val(edit.remark);	
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
		//新增操作
		$(document).on('click','#ADD',function(){
	    	addRole()
	  });
		
		//编辑操作
		$(document).on('click','#EDIT',function(){		
			var flag = publicUtil.jurgeSelectRows(table.checkStatus('roleList').data);
			if(flag){
				addRole(table.checkStatus('roleList').data[0]);
			}else{
				return false;
			}
	
	  })
		
		//删除
		$(document).on('click','#DEL',function(){		
				var flag = publicUtil.jurgeSelectRows(table.checkStatus('roleList').data);
				if(flag){
								layer.confirm('确定删除此此角色？',{icon:3, title:'提示信息'},function(index){
										 $.post(application.SERVE_URL+"/sys/sysrole/delete",{
												 id : table.checkStatus('roleList').data[0].id  
										 },function(data){
											if(data = "success"){
														tableIns.reload();
														layer.close(index);	
											}
										 })
								});			
				}else{
					return false;
				}
	    })	

		//权限操作
		$(document).on('click','#PERM',function(){		
			var flag = publicUtil.jurgeSelectRows(table.checkStatus('roleList').data);
				if(flag){
					formdatas = table.checkStatus('roleList').data[0];
					var index = layui.layer.open({
							type: 2,
							title: '菜单选择',
							shadeClose: true,
							shade: 0.8,
							area: ['280px', '65%'],
							// content: '../views/module/system/role/menuselect.html',
							content: 'menuselect.html',
							success : function(layero, index){
								//
								setTimeout(function(){
										layui.layer.tips('点击此处返回角色列表', '.layui-layer-setwin .layui-layer-close', {
												tips: 3
										});
								},500)											
							}
					});	
				}else{
					return false;
				}
	
		})


//     //列表操作
//     table.on('tool(roleList)', function(obj){
//         var layEvent = obj.event,
//             data = obj.data;
// 
//         if(layEvent === 'edit'){ //编辑
//         	addRole(data);
//         } else if(layEvent === 'del'){ //删除
//             layer.confirm('确定删除此此编码？',{icon:3, title:'提示信息'},function(index){
//                 // $.get("删除文章接口",{
//                 //     newsId : data.newsId  //将需要删除的newsId作为参数传入
//                 // },function(data){
//                     tableIns.reload();
//                     layer.close(index);
//                 // })
//             });
//         } else if(layEvent === 'permission'){ //配置权限			
// 				var index = layui.layer.open({
// 					type: 2,
// 					title: '菜单选择',
// 					shadeClose: true,
// 					shade: 0.8,
// 					area: ['280px', '65%'],
// 					// content: '../views/module/system/role/menuselect.html',
// 					content: 'menuselect.html',
// 					success : function(layero, index){
// 						//
// 						setTimeout(function(){
// 								layui.layer.tips('点击此处返回角色列表', '.layui-layer-setwin .layui-layer-close', {
// 										tips: 3
// 								});
// 						},500)											
// 					}
// 			});		
//         }
//     });

})