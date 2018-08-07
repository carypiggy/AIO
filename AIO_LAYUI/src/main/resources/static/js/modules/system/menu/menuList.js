/**
 * @autor syp
 * @content 菜单列表页面js
 * @returns
 * @Time 2018-08-01
 */
layui.use(['element', 'layer', 'form', 'upload', 'treeGrid'], function () {
    var treeGrid = layui.treeGrid,
	    $ = layui.jquery,
	    laydate = layui.laydate,
		form = layui.form,
	    laytpl = layui.laytpl; //很重要
    var treeTable =treeGrid.render({
        elem: '#menuTree'
        ,url:'../../../../static/json/menuList.json'
        ,cellMinWidth: 100    
        ,id: "menuTreeTable"
        ,treeId:'id'//树形id字段名称
        ,treeUpId:'pId'//树形父id字段名称
        ,treeShowName:'name'//以树形式显示的字段
        ,cols: [[
            {field:'name', edit:'text',title: '菜单名称'}
            ,{field:'id', edit:'text',title: 'id'}
            ,{field:'pId', edit:'text',title: '父ID'}
            ,{fixed:'right', title:'操作',align:'center', toolbar:'#optBar'}
        ]]
        ,page:false
    });
    
    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
    $(".search_btn").on("click",function(){
        if($(".searchVal").val() != ''){
        	treeTable.reload("menuTreeTable",{
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

    //添加菜单
    function addMenu(edit,type){
        var index = layui.layer.open({
            title : "菜单修改",
            type : 2,
            content : "menuAdd.html",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
				if(type == "edit"){
					if(edit){
						body.find(".name").val(edit.name);
						body.find(".pId").val(edit.pId);
						form.render();
					}
				}else{
					body.find(".pId").val(edit.pId);
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
	
    //列表操作
    treeGrid.on('tool(menuTree)', function(obj){
        var layEvent = obj.event,
            data = obj.data;
        if(layEvent === 'edit'){ //编辑
        	addMenu(data,'edit');
        } else if(layEvent === 'add'){ //新增
			addMenu(data,'add');
		}else if(layEvent === 'del'){ //删除
            layer.confirm('确定删除此此编码？',{icon:3, title:'提示信息'},function(index){
                // $.get("删除菜单接口",{
                //     newsId : data.newsId  //将需要删除的newsId作为参数传入
                // },function(data){
                    treeTable.reload();
                    layer.close(index);
                // })
            });
        }
    });	
});