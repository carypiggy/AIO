/**
 * @autor syp
 * @content index页面js
 * @returns
 * @Time 2018-08-03
 */
var $, tab, dataStr, layer; var menuDatas; var cur_menu_id;var username;
layui.config({
	base: "static/js/"
}).extend({
	"bodyTab": "bodyTab"
})
layui.use(['bodyTab', 'form', 'element', 'layer', 'jquery', 'application'], function () {
	var form = layui.form,
		application = layui.application,
		element = layui.element;
	$ = layui.$;
	layer = parent.layer === undefined ? layui.layer : top.layer;

	application.initindex();
	
	
	tab = layui.bodyTab({
		openTabNum: "20", //最大可打开窗口数量
		// url: "static/json/menu.json" //获取菜单json地址,
	});

	
	
	//初始化一级菜单
	initTopMenu();
	
	//初始化一级菜单
	function initTopMenu(url) { //Ajax调用处理
		$.ajax({
			// url: "static/json/topMenu.json",
			url: application.SERVE_URL + "/index",
			headers: {
				'Authorization': application.HEADER
			},
			success: function (res) {
				$('.userName').html(res.user.name);
				username = res.user.username;
				var photo= res.user.photo;
				if(photo!=null&&photo!=""){
					$(".user-photo a img").Attr("src",photo);
				}
				id = res.user.id;
				//初始化顶部菜
				menuDatas = res.menu;
				var data = menuDatas.children;
				if(data!=null){
					for (var i = 0; i < data.length; i++) {
						var cur = data[i];
						var tittle = "";
						if (i == 0) {
							tittle = '<li class="layui-nav-item layui-this" data-menu="' + cur.code + '" id = "' + cur.code + '">'
							tittle += '<a href="javascript:;"><i class="layui-icon '+cur.icon+'"></i>';
							tittle += '<cite>' + cur.name + '</cite></a></li>'
							after = cur.code;
							$("#topLevelMenus").append(tittle);
	
						} else {
							tittle = '<li class="layui-nav-item" data-menu="' + cur.code + '">'
							tittle += '<a href="javascript:;"><i class="layui-icon '+cur.icon+'"></i>';
							tittle += '<cite>' + cur.name + '</cite></a></li>'
							$("#topLevelMenus").append(tittle);
						}
						element.init();
					}
				}else{
					top.layer.msg("您没有被授权使用系统，请联系管理员！");
				}
			}
		});
	}
	
	//通过顶部菜单获取左侧二三级菜单 
	function getData(json) {
		if(menuDatas == null){
			return;
		}
		var data = menuDatas.children;
		for(var i= 0; i<data.length; i++){
			if(json == data[i].code){
				dataStr = data[i].children;
				//重新渲染左侧菜单
				if(dataStr != null || dataStr != ""){
					 tab.render();
				}
			}
		}
		
	}

	//页面加载时判断左侧菜单是否显示
	//通过顶部菜单获取左侧菜单
	$("#topLevelMenus").on('click', 'li', function () {
		if ($(this).parents(".mobileTopLevelMenus").length != "0") {
			$(".topLevelMenus li").eq($(this).index()).addClass("layui-this").siblings().removeClass("layui-this");
		} else {
			$(".mobileTopLevelMenus dd").eq($(this).index()).addClass("layui-this").siblings().removeClass("layui-this");
		}
		$(".layui-layout-admin").removeClass("showMenu");
		$("body").addClass("site-mobile");
		getData($(this).data("menu"));
		//渲染顶部窗口
		tab.tabMove();
	})

	//隐藏左侧导航
	$(".hideMenu").click(function () {
		if ($(".topLevelMenus li.layui-this a").data("url")) {
			layer.msg("此栏目状态下左侧菜单不可展开"); //主要为了避免左侧显示的内容与顶部菜单不匹配
			return false;
		}
		$(".layui-layout-admin").toggleClass("showMenu");
		//渲染顶部窗口
		tab.tabMove();
	})


	//清除缓存
	$(".clearCache").click(function () {
		window.sessionStorage.clear();
		window.localStorage.clear();
		var index = layer.msg('清除缓存中，请稍候', {
			icon: 16,
			time: false,
			shade: 0.8
		});
		setTimeout(function () {
			layer.close(index);
			layer.msg("缓存清除成功！");
		}, 1000);
	})

	// 添加新窗口
	$("body").on("click", ".layui-nav .layui-nav-item a:not('.mobileTopLevelMenus .layui-nav-item a')", function () {
		//如果不存在子级
		if ($(this).siblings().length == 0) {
			addTab($(this));
			$('body').removeClass('site-mobile'); //移动端点击菜单关闭菜单层
		}
		$(this).parent("li").siblings().removeClass("layui-nav-itemed");
	})

	$("#navBar_ul").on('click','li',function(){
		cur_menu_id = $(this).children('a').attr('id');
	})

	/**
	 * 初始化点击侧边栏导航
	 */
// 	var layid = location.hash.replace(/^#bodyTab=/, '');
// 	// layui-this
// 	if (layid) {
// 		$('.layui-side-scroll').find('[data-id=' + layid + ']').eq(0)
// 			.click(); // 根据传入的ID跳转
// 	} else {
// 		$('.layui-side-scroll').find('[data-url][data-id]').eq(0)
// 			.click(); // 点击第一个
// 	}
	//清除缓存
	$(".clearCache").click(function () {
		window.sessionStorage.clear();
		window.localStorage.clear();
		var index = layer.msg('清除缓存中，请稍候', {
			icon: 16,
			time: false,
			shade: 0.8
		});
		setTimeout(function () {
			layer.close(index);
			layer.msg("缓存清除成功！");
		}, 1000);
	})

	//刷新后还原打开的窗口
	if (cacheStr == "true") {
		if (window.sessionStorage.getItem("menu") != null) {
			menu = JSON.parse(window.sessionStorage.getItem("menu"));
			curmenu = window.sessionStorage.getItem("curmenu");
			var openTitle = '';
			for (var i = 0; i < menu.length; i++) {
				openTitle = '';
				if (menu[i].icon) {
					if (menu[i].icon.split("-")[0] == 'icon') {
						openTitle += '<i class="seraph ' + menu[i].icon + '"></i>';
					} else {
						openTitle += '<i class="layui-icon">' + menu[i].icon + '</i>';
					}
				}
				openTitle += '<cite>' + menu[i].title + '</cite>';
				openTitle += '<i class="layui-icon layui-unselect layui-tab-close" data-id="' + menu[i].layId + '">&#x1006;</i>';
				element.tabAdd("bodyTab", {
					title: openTitle,
					content: "<iframe src='" + menu[i].href + "' data-id='" + menu[i].layId + "'></frame>",
					id: menu[i].layId
				})
				//定位到刷新前的窗口
				if (curmenu != "undefined") {
					if (curmenu == '' || curmenu == "null") { //定位到后台首页
						element.tabChange("bodyTab", '');
					} else if (JSON.parse(curmenu).title == menu[i].title) { //定位到刷新前的页面
						element.tabChange("bodyTab", menu[i].layId);
					}
				} else {
					element.tabChange("bodyTab", menu[menu.length - 1].layId);
				}
			}
			//渲染顶部窗口
			tab.tabMove();
		}
	} else {
		window.sessionStorage.removeItem("menu");
		window.sessionStorage.removeItem("curmenu");
	}


})

//打开新窗口
function addTab(_this) {
	tab.tabAdd(_this);
}
