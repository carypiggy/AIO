/**
 * @autor syp
 * @content 角色列表页面js
 * @returns
 * @Time 2018-08-02
 */
layui.config({
	base: '../../../../static/js/' //此处路径请自行处理, 可以使用绝对路径
}).extend({
/* 	formSelects: 'formSelects-v4', */
	"application" : "application"
});

layui.use(['jquery','form','layer','laydate',/* 'formSelects', */'publicUtil','application','element'],function(){
    var form = layui.form,
		$ = layui.jquery,
/* 		formSelects = layui.formSelects, */
    publicUtil  = layui.publicUtil,
		application = layui.application,
		layer =layui.layer,
		element = layui.element,
	  laydate = layui.laydate;
		
		
		
	// 卡片页签点击触发事件
	element.on('tab(info)', function(elem){
		location.hash = 'info='+ $(this).attr('lay-id');
		//获取卡片对应的数据
	});
		
		//出入日期绑定
	 laydate.render({
    elem: '#birthday'
    ,lang: 'en'
  });
	$("#addEduinfo").click(function(){
		addElement('eduFrom','firstEdu');
		
	});
	
	//荣誉成功
	laydate.render({
		elem: '#honor_date'
		,lang: 'en'
	});
	$("#addHonorinfo").click(function(){
		addElement('honorForm','firstHonor');
		
	});
		//职业经历默认模块入职和离职时间监听绑定
		laydate.render({
			elem: '#pro_startdate'
			,lang: 'en'
		});
		laydate.render({
			elem: '#pro_enddate'
			,lang: 'en'
		});
	
	$("#addProfessioninfo").click(function(){
		addElement('eduFrom','firstEdu');
		
	});
	
	//复制当前页面的第一个块，用于信息新增
	function addElement(fatherid,cloneis)
	{
		var element = $('#'+cloneis).clone();
		$('#'+fatherid).before(element);
	}
/* 
	//校友类型
	formSelects.config('userType', {
		keyName: 'value',            //自定义返回数据中name的key, 默认 name
		keyVal: 'typeCode', 
	}, false);
	//民族
	formSelects.config('nation', {
		keyName: 'value',            //自定义返回数据中name的key, 默认 name
		keyVal: 'typeCode', 
	}, true);
	//证件类型
	formSelects.config('cardType', {
		keyName: 'value',            //自定义返回数据中name的key, 默认 name
		keyVal: 'typeCode', 
	}, true);
	//国家
	formSelects.config('country', {
		keyName: 'value',            //自定义返回数据中name的key, 默认 name
		keyVal: 'typeCode', 
	}, true); 
	
	function initSelect(url,type){
		$.ajax({
			url: url, //ajax请求地址
			success: function (rs) {
				console.log(rs);
				formSelects.data(type, 'local', {
						arr: rs.list					
				})
			}
		});
	} */
	
	
	//临时加载下拉框的数据
	selectBase("../../../../static/json/userType.json",'userType');	
	selectBase("../../../../static/json/nation.json",'nation');
	selectBase("../../../../static/json/cardType.json",'cardType');
	selectBase("../../../../static/json/country.json",'country');
			//取字典下拉框
		function selectBase(url,selectid){
			$.ajax({
				url:url,
				success:function(res){
					$("#"+selectid).empty();
					$("#"+selectid).append('<option value="">请选择</option>');
					for(var i =0;i<res.length;i++){
						$("#"+selectid).append('<option selected value="'+res[i].value+'">'+res[i].label+'</option>');//往下拉菜单里添加元素
					}
					form.render();//菜单渲染 把内容加载进去
				},
				error: function(){
					console.log("shibai")
				}
			})
		}
			

// 	//加载校友类型   AIO_LAYUI/src/main/webapp/static/json/userType.json
// 	// initSelect("../../../../static/json/userType.json",'userType');
// 	publicUtil.selectBase('http://127.0.0.1:8848' +"/AIO_LAYUI/src/main/webapp/static/json/userType.json",{'typeCode':''},'userType');
// 
// 	//加载民族
// 	// 

// initSelect("../../../../static/json/nation.json",'nation');
// 	publicUtil.selectBase('http://127.0.0.1:8848'+"/AIO_LAYUI/src/main/webapp//static/json/nation.json",{'typeCode':''},'userType');
// 
// 	//加载证件类型
// 	// initSelect("../../../../static/json/cardType.json",'cardType');
// 	publicUtil.selectBase('http://127.0.0.1:8848'+"/AIO_LAYUI/src/main/webapp//static/json/cardType.json",{'typeCode':''},'userType');
// 
// 	//加载国家
// 	// initSelect("../../../../static/json/country.json",'country');
// 	publicUtil.selectBase('http://127.0.0.1:8848'+"/AIO_LAYUI/src/main/webapp//static/json/country.json",{'typeCode':''},'userType');


	


	

//触发事件
/*  var active = {
    tabAdd: function(){
      //新增一个Tab项
      element.tabAdd('demo', {
        title: '新选项'+ (Math.random()*1000|0) //用于演示
        ,content: '内容'+ (Math.random()*1000|0)
        ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
      })
    }
    ,tabDelete: function(othis){
      //删除指定Tab项
      element.tabDelete('demo', '44'); //删除：“商品管理”
      
      othis.addClass('layui-btn-disabled');
    }
    ,tabChange: function(){
      //切换到指定Tab项
      element.tabChange('demo', '22'); //切换到：用户管理
    }
  };
  */
	
	
   //submit(addUser)  绑定提交按钮
    form.on("submit(addUser)",function(data){
        //弹出loading
      var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
		  // console.log(data);
		  layui.use('layer', function(){
			/* 	$.post(application.SERVE_URL+'/sys/sysuser/save',{
				//保存用户参数
				 username: data.field.username,
				 password: data.field.password,
				 name: data.field.name,
				 idcard: data.field.idcard,
				 photo: data.field.photo,
				 mobile: data.field.mobile,
				 email: data.field.email,
				 type: 1,
				 orgId: data.field.userOrg,
				 safecode:data.field.safecode
				},function(data){
				top.layer.close(index);
				top.layer.msg(data.message);
				layer.closeAll("iframe");
				}) */
		})
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
	
	//用户名判断提醒
	$(".username").change(function(){
		var  that = this;
		var username =  $(this).val();
		/*layui.use('layer', function(){
			 	$.post(application.SERVE_URL+'/sys/sysuser/getusername',{
				//保存用户参数
				username: username
				},function(data){
					
	      console.log("返回结果");
				console.log(data);

				if(data!="" && data.id !="undefined")
				{
					$(".showname").val("该账号已经被使用！");
					$(".showname").css("display","block");
				}else{
					$(".showname").css("display","none");
				}
			
				})
	}) */
	})

})