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
		username = parent.parent.username;
		
	// 卡片页签点击触发事件
	element.on('tab(info)', function(elem){
		location.hash = 'info='+ $(this).attr('lay-id');
		//获取卡片对应的数据,放对应的值
		//console.log(elem);
	  if(elem.index == 0) //基本信息
		{
			
		}else if(elem.index == 1) //教育经历
		{
			
		}else if(elem.index == 2) //校友经历
		{
			
		}else if(elem.index == 3)//联系方式
		{
			
		}else if(elem.index == 4)//通讯地址
		{
			
		}else if(elem.index == 5)//家庭成员
		{
			
		}else if(elem.index == 6)//政治面貌
		{
			
		}else if(elem.index == 7)//社会兼职
		{
			
		}else if(elem.index == 8)//荣誉成就
		{
			
		}else if(elem.index == 9)//职业经历
		{
			
		}
	});
	
	//页面打开时，或者基本信息时，点击填充数据
	function initSchoolmateData()
	{
		//性别
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"sex");	
		//校友类型
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'USERTYPE'} ,"userType");
		//民族
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'NATION'} ,"nation");
		//证件类型
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'CARDTYPE'} ,"cardType");	
	//国籍
	//	publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'COUNTRY'} ,"country");
	
   publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysarea/list", {'parent_id' : 'Root'} ,"country");
		//生日日期绑定
		laydate.render({
			elem: '#birthday',
			lang: 'en'
		});
		//
		$("#addEduinfo").click(function(){
			addElement('eduFrom','firstEdu');
		});
		
	}
	initSchoolmateData();	
	
	
	//教育经历数据填充
	function initSchoolInfo()
	{
		//学校
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_school");	
		//学院
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_collage");	
		//书院
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_academy");	
		//系
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_series");	
		//专业
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_specialty");	
		//学历
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_degree");	
		//学位类型
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_degreetype");	
		//学制
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_schoollen");	
		//生日日期绑定
		laydate.render({
			elem: '#edu_startdate',
			lang: 'en'
		});
		//生日日期绑定
		laydate.render({
			elem: '#edu_enddate',
			lang: 'en'
		});
	}
	initSchoolInfo()
	
	//校园经历填充数据
	function intiExperience()
	{
		//加入时间绑定
		laydate.render({
			elem: '#exp_jiondate'
		});
		//退出时间绑定
		laydate.render({
			elem: '#exp_enddate'

		});
		
		//
		$("#addExperienceinfo").click(function(){
			addElement('expForm','firstExp');
		});
	}	
	intiExperience();
		
		//联系方式填充数据
		function intiExperience()
		{
			publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'CONTACT_TYPE'} ,"cont_type");	
			//
			$("#addContact").click(function(){
				addElement('contactForm','firstContact');
			});
		}	
		intiExperience();
		
		//通讯地址填充数据
		function intiAddress()
		{
			//国家地址表
			publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'CONTACT_TYPE'} ,"cont_type");	
			//
			$("#addAddinfo").click(function(){
				addElement('addFrom','firstAdd');
			});
		}	
		//地址选择
		function selectItem(type,elementid)
		{
			
		}
		intiAddress();
	
	//家庭信息填充数据
	function intiFamily()
	{
		//性别
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"sex");	
		//
		$("#addFamily").click(function(){
			addElement('addFamilyinfo','firstFamily');
		});
	}	
	intiFamily();
	
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
		addElement('professionFrom','firstProfession');
		
	});
	
	//复制当前页面的第一个块，用于信息新增
	function addElement(fatherid,cloneis)
	{
		var element = $('#'+cloneis).clone();
		//修改当前块的id，并且绑定响应的值
		
		$('#'+fatherid).before(element);
	}

   //submit(addUser)  绑定提交按钮（基本信息）
    form.on("submit(addSchoolfellow)",function(data){
        //弹出loading
      var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
			console.log(application.SERVE_URL+'/sys/smSchoolmate/save');
		 		$.ajax({
						url: application.SERVE_URL+'/sys/smSchoolmate/save', //ajax请求地址
						type: "GET",
						data:{
							 sysUserId  :'',
							 username: username,
							 name: data.field.name,
							 sex: data.field.sex,
							 truePhoto: data.field.truePhoto,
							 birthday: data.field.birthday,
							 type :  data.field.userType
						},			
						success: function (data) {
							var res = $(".id").val() ==null|| $(".id").val() =="" ? "新增":"修改" ;
							if(data == "success"){
								top.layer.close(index);
											top.layer.msg("校友信息" + res + "成功");
											//layer.closeAll("iframe");
											//刷新父页面
											//parent.location.reload();	
							}else{
								top.layer.msg("校友信息" + res + "失败！");
							}
						},
						error: function(data){
							top.layer.msg("校友信息" + res + "失败！");
						}
					}); 
        return false;
    })
		
		//submit(addUser)  绑定提交按钮（校园经历）
		form.on("submit(addExperience)",function(data){
			//ajaxinfo(application.SERVE_URL+'/sys/smExperience/save', data,"校园经历");
			var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
				$.ajax({
						url: application.SERVE_URL+'/sys/smExperience/save', 
						type: "POST",
						headers : { 'Authorization' : sessionStorage.getItem('token')},
						contentType: "application/json",
						data:JSON.stringify({
							 sysUserId:data.field.sysUserId,
							 id : "",
							 username:data.field.username,
							 organization:data.field.organization,
							 position:data.field.position,
							 startdate:data.field.startdate,
							 enddate:data.field.enddate,
							
						}),			
						success: function (data) {
							if(data == "success"){
								top.layer.close(index);
											top.layer.msg("添加成功");
										//	layer.closeAll("iframe");
											//刷新父页面
										//	parent.location.reload();	
							}else{
								top.layer.msg("添加失败！");
							}
						},
						error: function(data){
							top.layer.msg("添加失败！");
						}
					}); 
				return false;
		})
		
		//submit(addUser)  绑定提交按钮（联系方式）
		form.on("submit(addContact)",function(data){
			ajaxinfo(application.SERVE_URL+'/sys/smContact/save', data,"联系方式");
		})
		
		//submit(addUser)  绑定提交按钮（通讯地址）
		form.on("submit(addAdd)",function(data){
			ajaxinfo(application.SERVE_URL+'/sys/smAddress/save', data,"通讯地址");
		})
		
		//submit(addUser)  绑定提交按钮（家庭信息）
		form.on("submit(addFamily)",function(data){
	    ajaxinfo(application.SERVE_URL+'/sys/smAddress/save', data,"家庭信息");
		})
		
		function ajaxinfo(url, data,res)
		{
				//弹出loading
			var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
				$.ajax({
						url: url, //ajax请求地址
						type: "POST",
						headers : { 'Authorization' : sessionStorage.getItem('token')},
						contentType: "application/json",
						data:JSON.stringify(data.field),			
						success: function (data) {
							if(data == "success"){
								top.layer.close(index);
											top.layer.msg(res+"添加成功");
										//	layer.closeAll("iframe");
											//刷新父页面
										//	parent.location.reload();	
							}else{
								top.layer.msg(res+"添加失败！");
							}
						},
						error: function(data){
							top.layer.msg(res+"添加失败！");
						}
					}); 
				return false;
		}
		
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