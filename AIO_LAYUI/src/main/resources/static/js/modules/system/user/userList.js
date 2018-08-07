/**
 * @autor syp
 * @content 用户列表页面js
 * @returns
 * @Time 2018-08-03
 */
$(function(){ 
layui.use(['table','form','element','layer','jquery'],function(){
	var layer = layui.layer,
		form = layui.form,
		laydate = layui.laydate,
		_$ = layui.jquery;
		table = layui.table;
		//节点标记
		var treeObj;
		var tableIns;
		//ztree设置
		var setting = {
			view: {
				selectedMulti: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: onClick
				
			}
		};
		
		//初始化树
		initTree();
		function initTree() {
			$.ajax({
				url: "../../../../static/json/orgTree_sim.json", //ajax请求地址
				success: function (data) {
					treeObj = $.fn.zTree.init($("#orgTree"), setting, covert(data)); //加载数据
					//初始化
					var node = treeObj.getNodeByParam('id', 111);//获取id为1的点
					treeObj.selectNode(node);//选择点
					treeObj.setting.callback.onClick(null, treeObj.setting.treeId, node);//调用事件	
				}
			});
		
			// $.fn.zTree.init($("#treeDemo"), setting);
		}
             

		//根据Id 加载右侧用户数据
		/**
		 * treeNode 为选中的节点
		 */
		function onClick(event, treeId, treeNode, clickFlag) {
			// console.log(treeNode.id);
			//生产坏境下请求后台
		
			$.ajax({
				url: "../../../../static/json/user.json", //ajax请求地址
				success: function (data) {
					//加载数据
					var tabData =[];

					for(var i =0;i<data.length;i++){
						
						if(data[i].orgId == treeNode.id){
								tabData.push(data[i]);
						}
					}
					tableIns = table.render({
						elem: '#userList',
						//生产坏境下请求后台
						data : tabData,
						cellMinWidth : 95,
						page : true,
						height : "full-125",
						id : "userListTable",
						cols : [[
							{field: 'id', title: 'ID', align:"center"},
							{field: 'orgId', title: '所属机构ID'},
							{field: 'name', title: '机构名称'},
							{title: '操作', width:170, templet:'#userListBar',fixed:"right",align:"center"}
						]]
					});	
				}
			});

		}		
		
		function covert(data) {
			var nodes = [];
			for (var i = 0; i < data.length; i++) {
				if(data[i].open == true){
					nodes.push({
						id: data[i].id,
						pId: data[i].parentId,
						name: data[i].name,
						open: data[i].open
					});
				}else{
					nodes.push({
						id: data[i].id,
						pId: data[i].parentId,
						name: data[i].name
					});
				}

			}
			return nodes;
		}
			
	    //列表操作
	    table.on('tool(userList)', function(obj){
	        var layEvent = obj.event,
	            data = obj.data;
	
	        if(layEvent === 'edit'){ //编辑
	        	addUser(data);
	        } else if(layEvent === 'del'){ //删除
	            layer.confirm('确定删除此用户？',{icon:3, title:'提示信息'},function(index){
	                // $.get("删除文章接口",{
	                //     newsId : data.newsId  //将需要删除的newsId作为参数传入
	                // },function(data){
	                    tableIns.reload();
	                    layer.close(index);
	                // })
	            });
	        } else if(layEvent === 'look'){ //预览
	            layer.alert("此功能需要前台展示，实际开发中传入对应的必要参数进行编码内容页面访问")
	        }
	    });	

		//新增用户
		$("#addUser_btn").click(function(){
			addUser();
		})	  
		
		//搜索【此功能需要后台配合，所以暂时没有动态效果演示】
		$(".search_btn").click(function(){
			if($(".searchVal").val() != ''){
				table.reload("dictListTable",{
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
		
		
	    //添加用户
	    function addUser(edit){
	        var index = layui.layer.open({
	            title : "添加用户",
	            type : 2,
	            content : "userAdd.html",
	            success : function(layero, index){
	                var body = layui.layer.getChildFrame('body', index);
	                if(edit){
	//                 	body.find(".parentId").val(edit.parentId);
	//                 	body.find(".name").val(edit.name);
	
	                   body.find(".userOrg").val(edit.orgId);
	                	//数据回填可参考如下
	//                    body.find(".newsName").val(edit.newsName);
	//                    body.find(".abstract").val(edit.abstract);
	//                    body.find(".thumbImg").attr("src",edit.newsImg);
	//                    body.find("#news_content").val(edit.content);
	//                    body.find(".newsStatus select").val(edit.newsStatus);
	//                    body.find(".openness input[name='openness'][title='"+edit.newsLook+"']").prop("checked","checked");
	//                    body.find(".newsTop input[name='newsTop']").prop("checked",edit.newsTop);
	                    form.render();
	                }else{
	
									}
	                setTimeout(function(){
	                    layui.layer.tips('点击此处返回机构列表', '.layui-layer-setwin .layui-layer-close', {
	                        tips: 3
	                    });
	                },500)
	            }
	        })
	        layui.layer.full(index);
	        //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
	        _$(window).on("resize",function(){
	            layui.layer.full(index);
	        })
	    }		
})
})