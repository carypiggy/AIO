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

layui.use(['jquery','form','layer','laydate',/* 'formSelects', */'publicUtil','application','element','laytpl'],function(){
    var form = layui.form,
		$ = layui.jquery,
/* 		formSelects = layui.formSelects, */
    publicUtil  = layui.publicUtil,
		application = layui.application,
		layer =layui.layer,
		element = layui.element,
	  laydate = layui.laydate,
		laytpl = layui.laytpl;
	var config = {
  open: '{{',
  close: '}}'
};
		
	// 卡片页签点击触发事件
	element.on('tab(info)', function(elem){
		location.hash = 'info='+ $(this).attr('lay-id');
		//获取卡片对应的数据,回显数据
		var username = $("#username").val();
	  if(elem.index == 0) //基本信息
		{
		}else if(elem.index == 1) //教育经历
		{
			var dataInfo = clicktable(application.SERVE_URL+"/sys/smEducation/list",{"username":username,"pageNo":0, "pageSize":10});
			//填充数据
			var edu = document.getElementById("eduFrom").getElementsByTagName("fieldset").length;
			if(dataInfo.size >0)
			{
				var eduList = dataInfo.list;
				for(var i=0; i<edu; i++)
				{
					var eduData = eduList[i];
					$("#edu_id_"+i).val(eduData.id);
					$("#edu_academy_"+i).val(eduData.academy);
					$("#edu_className_"+i).val(eduData.className);
					$("#edu_collage_"+i).val(eduData.college);
					$("#edu_degree_"+i).val(eduData.degree);
					$("#edu_degreetype_"+i).val(eduData.degreetype);
					$("#edu_enddate_"+i).val(eduData.enddate);
					$("#edu_school_"+i).val(eduData.school);
					$("#edu_schoollen_"+i).val(eduData.schoollen);
					$("#edu_series_"+i).val(eduData.eries);
					$("#edu_specialty_"+i).val(eduData.specialty);
					$("#edu_startdate_"+i).val(eduData.startdate);
					$("#edu_studentid_"+i).val(eduData.studentid);
	// 				$("#sysUserId").val(eduData.sysUserId);
	// 				$("#username").val(eduData.sysUserUsername);
					initSchoolInfo(i);
					}
				}else{
					for(var i=0; i<edu; i++)
					{
						initSchoolInfo(i);
					}
				}

		
		}else if(elem.index == 2) //校园经历
		{
			var dataInfo =clicktable(application.SERVE_URL+"/sys/smExperience/list",{"username":username,"pageNo":10, "pageSize":0})
				var edu = document.getElementById("expForm").getElementsByTagName("fieldset").length;
				if(dataInfo.size >0)
				{
					var eduList = dataInfo.list;
					for(var i=0; i<edu; i++)
						{
						var eduData = eduList[i];
							$("#exp_id_"+i).val(eduData.id);
							$("#exp_organization_"+i).val(eduData.organization);
							$("#exp_position_"+i).val(eduData.position);
							$("#exp_jiondate_"+i).val(eduData.startdate);
							$("#exp_enddate_"+i).val(eduData.studentid);
							initSchoolInfo(i);
						}
					}else{
					for(var i=0; i<edu; i++)
					{
						initSchoolInfo(i);
					}
			}

		}else if(elem.index == 3)//联系方式
		{
			var dataInfo =clicktable(application.SERVE_URL+"/sys/smContact/list",{"username":username,"pageNo":10, "pageSize":0});
			var edu = document.getElementById("contactForm").getElementsByTagName("fieldset").length;
			
				var eduList = dataInfo.list;
				for(var i=0; i<edu; i++)
				{
					if(dataInfo.size >0)
					{
					var eduData = eduList[i];
					$("#cont_id_"+i).val(eduData.id);
					$("#cont_type_"+i).val(eduData.type);
					$("#cont_contacte_"+i).val(eduData.contacte);
					}
				}
		}else if(elem.index == 4)//通讯地址
		{
			var dataInfo =clicktable(application.SERVE_URL+"/sys/smAddress/list",{"username":username,"flag":"NORMAL","pageNo":10, "pageSize":0});
			var edu = document.getElementById("addFrom").getElementsByTagName("fieldset").length;
			
				var eduList = dataInfo.list;
				for(var i=0; i<edu; i++)
				{
					
					if(dataInfo.size >i)
					{
					var eduData = eduList[i];
					$("#add_id_"+i).val(eduData.id);
					$("#add_country_"+i).val(eduData.country);
					$("#add_province_"+i).val(eduData.province);
					$("#add_city_"+i).val(eduData.city);
					$("#add_district_"+i).val(eduData.district);
					$("#add_detail_"+i).val(eduData.detail);
				//$("input[name='ispost"+i+"']").val(eduData.ispost);
				 }
				
			//	selectBase(application.SERVE_URL+"/sys/sysarea/loadChildrenByParent", {'parentId' : 'Root'} ,"dd_country"+i);
				//国家改变
				var countryid = "add_country_"+i;
				form.on('select('+countryid +')', function(data){
					var index = data.elem.options.selectedIndex;
					var parent_name = data.elem.options[index].text;
					var tag =  document.getElementById(countryid).options[index].getAttribute("tag");
					selectBase(application.SERVE_URL+"/sys/sysarea/loadChildrenByParent",{'parentId' : tag} ,"dd_province_"+i);
				})
				//省
				var provinceid = "add_province_"+i;
				form.on('select('+provinceid +')', function(data){
					var index = data.elem.options.selectedIndex;
					var parent_name = data.elem.options[index].text;
					var tag =  document.getElementById(provinceid).options[index].getAttribute("tag");
					selectBase(application.SERVE_URL+"/sys/sysarea/loadChildrenByParent",{'parentId' : tag} ,"add_city_"+i);
				})
				//市
				var cityid = "add_city_"+i;
				form.on('select('+cityid+')', function(data){
					var index = data.elem.options.selectedIndex;
					var parent_name = data.elem.options[index].text;
					var tag =  document.getElementById(cityid).options[index].getAttribute("tag");
					selectBase(application.SERVE_URL+"/sys/sysarea/loadChildrenByParent",{'parentId' : tag} ,"add_district"+i);
				})
				
				}

		}else if(elem.index == 5)//家庭成员
		{
			var dataInfo =clicktable(application.SERVE_URL+"/sys/smFamily/list",{"username":username,"pageNo":10, "pageSize":0});
			var edu = document.getElementById("addFrom").getElementsByTagName("fieldset").length;
			
				var eduList = dataInfo.list;
				for(var i=0; i<edu; i++)
				{
					
					if(dataInfo.size >0)
			{
					var eduData = eduList[i];
					$("#family_id_"+i).val(eduData.id);
					$("#family_name_"+i).val(eduData.name);
					$("#fam_sex_"+i).val(eduData.sex);
					$("#fam_relation_"+i).val(eduData.relation);
					$("#fam_birthday_"+i).val(eduData.birthday);
					$("#fam_profession_"+i).val(eduData.profession);
					$("#fam_phone_"+i).val(eduData.phone);
					$("#fam_workplace_"+i).val(eduData.workplace);
					$("input[name='isschool"+i+"']").val(eduData.isschool);
				}	
			}
		

		}else if(elem.index == 6)//政治面貌
		{
			var dataInfo =clicktable(application.SERVE_URL+"/sys/smSocial/list",{"username":username,"type":"政治面貌","pageNo":10, "pageSize":0});
			var edu = document.getElementById("addFrom").getElementsByTagName("fieldset").length;
		
				var eduList = dataInfo.list;
				for(var i=0; i<edu; i++)
				{
					
					if(dataInfo.size >0)
					{
				var eduData = eduList[i];
				$("#soc_id_"+i).val(eduData.id);
				$("#soc_type_"+i).val(eduData.type);
				$("#soc_name_"+i).val(eduData.name);
				$("#soc_startdate_"+i).val(eduData.startdate);
				$("#soc_remark_"+i).val(eduData.remark);
				}
			}			

		}else if(elem.index == 7)//社会兼职
		{
			var dataInfo =clicktable(application.SERVE_URL+"/sys/smSocial/list",{"username":username,"type":"社会兼职","pageNo":10, "pageSize":0});
			var edu = document.getElementById("addFrom").getElementsByTagName("fieldset").length;
			
					var eduList = dataInfo.list;
					for(var i=0; i<edu; i++)
					{
						
						if(dataInfo.size >0)
						{
						var eduData = eduList[i];
					$("#edu_id_"+i).val(eduData.id);
					$("#socia_type_"+i).val(eduData.type);
					$("#socia_name_"+i).val(eduData.name);
					$("#socia_position_"+i).val(eduData.position);
					$("#socia_infoval_"+i).val(eduData.infoval);
					$("#soc_s_startdate_"+i).val(eduData.startdate);
					$("#soc_s_enddate_"+i).val(eduData.enddate);
					}
			}
		}else if(elem.index == 8)//荣誉成就
		{
			 var dataInfo =clicktable(application.SERVE_URL+"/sys/smHonor/list",{"username":username,"pageNo":10, "pageSize":0});
	
			var edu = document.getElementById("addFrom").getElementsByTagName("fieldset").length;
			
				var eduList = dataInfo.list;
				for(var i=0; i<edu; i++)
				{
					
					if(dataInfo.size >0)
					{
					var eduData = eduList[i];
				$("#honor_id_"+i).val(eduData.id);
				$("#honor_name_"+i).val(eduData.name);
				$("#honor_domain_"+i).val(eduData.domain);
				$("#honor_type_"+i).val(eduData.type);
				$("#honor_date_"+i).val(eduData.date);
				$("#honor_infoval_"+i).val(eduData.infoval);
				}
			}
		}else if(elem.index == 9)//职业经历
		{
			var dataInfo =clicktable(application.SERVE_URL+"/sys/smProfession/list",{"username":username,"pageNo":10, "pageSize":0});
			 
			 var edu = document.getElementById("addFrom").getElementsByTagName("fieldset").length;
			
					 var eduList = dataInfo.list;
					 for(var i=0; i<edu; i++)
					 {
						 if(dataInfo.size >0)
						 {
						 var eduData = eduList[i];
						$("#pro_id_"+i).val(eduData.id);
						$("#pro_workplace_"+i).val(eduData.workplace);
						$("#pro_nature_"+i).val(eduData.nature);
						$("#pro_industry_"+i).val(eduData.industry);
						$("#pro_department_"+i).val(eduData.department);
						$("#pro_position_"+i).val(eduData.position);
						$("#pro_telephone_"+i).val(eduData.telephone);
						$("#pro_fax_"+i).val(eduData.fax);
						$("#pro_remark_"+i).val(eduData.remark);
						$("#pro_startdate_"+i).val(eduData.startdate);
						$("#pro_enddate_"+i).val(eduData.enddate);
					}
			}
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
	  selectBase(application.SERVE_URL+"/sys/sysarea/loadChildrenByParent", {'parentId' : 'Root'} ,"country");
		//生日日期绑定
		laydate.render({
			elem: '#birthday',
			lang: 'en'
		});
	}

//地址修改
		form.on('select(country)', function(data){
			var index = data.elem.options.selectedIndex;
			var parent_name = data.elem.options[index].text;
			var tag =  document.getElementById("country").options[index].getAttribute("tag");
			selectBase(application.SERVE_URL+"/sys/sysarea/loadChildrenByParent",{'parentId' : tag} ,"province");
		})
		//省
		form.on('select(province)', function(data){
			var index = data.elem.options.selectedIndex;
			var parent_name = data.elem.options[index].text;
			var tag =  document.getElementById("province").options[index].getAttribute("tag");
			selectBase(application.SERVE_URL+"/sys/sysarea/loadChildrenByParent",{'parentId' : tag} ,"city");
		})
		//市
		form.on('select(city)', function(data){
			var index = data.elem.options.selectedIndex;
			var parent_name = data.elem.options[index].text;
			var tag =  document.getElementById("city").options[index].getAttribute("tag");
			selectBase(application.SERVE_URL+"/sys/sysarea/loadChildrenByParent",{'parentId' : tag} ,"district");
		})

	
	//教育经历数据填充
	function initSchoolInfo()
	{
		//学校
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_school_0");	
		//学院
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_collage_0");	
		//书院
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_academy_0");	
		//系
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_series_0");	
		//专业
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_specialty_0");	
		//学历
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_degree_0");	
		//学位类型
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_degreetype_0");	
		//学制
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_schoollen_0");	
		//生日日期绑定
		laydate.render({
			elem: '#edu_startdate_0',
			lang: 'en'
		});
		//生日日期绑定
		laydate.render({
			elem: '#edu_enddate_0',
			lang: 'en'
		});
		//学校
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_school_1");	
		//学院
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_collage_1");	
		//书院
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_academy_1");	
		//系
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_series_1");	
		//专业
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_specialty_1");	
		//学历
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_degree_1");	
		//学位类型
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_degreetype_1");	
		//学制
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"edu_schoollen_1");	
		//生日日期绑定
		laydate.render({
			elem: '#edu_startdate_1',
			lang: 'en'
		});
		//生日日期绑定
		laydate.render({
			elem: '#edu_enddate_1',
			lang: 'en'
		});
	}
	initSchoolInfo()
	 $("#addEduinfo").click(function(){
		 addElement('eduFrom','firstEdu');
	}); 
	
	//校园经历填充数据
	function intiExperience()
	{
		//加入时间绑定
		laydate.render({
			elem: '#exp_jiondate',
			lang: 'en'
		});
		//退出时间绑定
		laydate.render({
			elem: '#exp_enddate',
			lang: 'en'
		});
	}	
	
	$("#addExperienceinfo").click(function(){
		addElement('expForm','firstExp');
	});
	
	intiExperience();
		
		//联系方式填充数据
		function intiContact()
		{
			publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'CONTACT_TYPE'} ,"cont_type");	
			//
			/* $("#addContact").click(function(){
				addElement('contactForm','firstContact');
			}); */
		}	
	  initSchoolmateData();	
		intiExperience();
		intiContact(); 
		
		//通讯地址填充数据
		function intiAddress()
		{
			//国家地址表
			publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'CONTACT_TYPE'} ,"cont_type");	
			//
		/* 	$("#addAddinfo").click(function(){
				addElement('addFrom','firstAdd');
			}); */
		}	

	
	//家庭信息填充数据
	function intiFamily()
	{
		//性别
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"fam_sex");	
		//关系
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"fam_relation");	
		
		//
		laydate.render({
			elem: '#fam_birthday',
			lang: 'en'
		});
		
		/* $("#addFamilyinfo").click(function(){
			addElement('familyFrom','firstFamily');
		}); */
	}	
	
	initSchoolmateData();	
	intiExperience();
	intiContact();
	intiAddress();
	intiFamily();
	
	function initSocia()
	{
		//名称
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"soc_name");	
		
		laydate.render({
			elem: '#soc_startdate',
			lang: 'en'
		});
	/* 	$("#addSociainfo").click(function(){
			addElement('sociaForm','firstSocia');
		}); */
	}
	initSocia();
	
	function initSocia_s()
	{
		laydate.render({
			elem: '#soc_s_startdate',
			lang: 'en'
		});
		laydate.render({
			elem: '#soc_s_enddate',
			lang: 'en'
		});
		/* $("#addSocia_sinfo").click(function(){
			addElement('socia_sForm','firstSocia_s');
		}); */
	}
	initSocia_s();
	
	function initHonor()
	{
		//荣誉类型
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"honor_type");	
		//领域
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"honor_domain");	
		//荣誉成功
		laydate.render({
			elem: '#honor_date'
			,lang: 'en'
		});
		/* $("#addHonorinfo").click(function(){
			addElement('honorForm','firstHonor');
		}); */
	}
	initHonor();
	initProfession();
	
	function initProfession()
	{
		//单位性质
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"pro_nature");	
		//单位行业
		publicUtil.selectBaseAndSetVal(application.SERVE_URL+"/sys/sysdict/getByTypeCode", {'typeCode' : 'SEX'} ,"pro_industry");	
		
			//职业经历默认模块入职和离职时间监听绑定
			laydate.render({
				elem: '#pro_startdate'
				,lang: 'en'
			});
			laydate.render({
				elem: '#pro_enddate'
				,lang: 'en'
			});
		
		/* $("#addProfessioninfo").click(function(){
			addElement('professionFrom','firstProfession');
		}); */
	}
	
	//复制当前页面的第一个块，用于信息新增
	/* function addElement(fatherid,cloneis)
	{
		var element = $('#'+cloneis).clone();
		//修改当前块的id，并且绑定响应的值
		$('#'+fatherid).before(element);
	} */

   //submit(addUser)  绑定提交按钮（基本信息）
    form.on("submit(addSchoolfellow)",function(data){
        //弹出loading
      var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
		 		$.ajax({
						url: application.SERVE_URL+'/sys/smSchoolmate/save', //ajax请求地址
						type: "GET",
						headers : { 'Authorization' : application.HEADER},
						data:{
							 sysUserId  :'',
							 username: username,
							 name: data.field.name,
							 sex: data.field.sex,
							 truePhoto: data.field.truePhoto,
							 birthday: data.field.birthday,
							 type :  data.field.userType,
// 							 country: data.field.country,
// 							 city: data.field.city,
// 							 province: data.field.province,
// 							 district :  data.field.district
						},			
						success: function (data) {
							var res = $(".id").val() ==null|| $(".id").val() =="" ? "新增":"修改" ;
							if(data == "success"){
								//top.layer.close(index);
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
			
					var edu = document.getElementById("expForm").getElementsByTagName("fieldset").length;
					var jsondata;
					var expList = [];
					for(var i=0; i<edu; i++)
					{
						expList.push({"id":$("#exp_id_"+i).val(),"organization":$("#exp_organization_"+i).val(),"position":$("#exp_position_"+i).val(),"startdate":$("#exp_jiondate_"+i).val(),"studentid":$("#exp_enddate_"+i).val(),"sysUserId":$("#sysUserId").val(),"sysUserUsername":$("#username").val()});
					}
			jsondata = JSON.stringify(expList);
			ajaxinfo(application.SERVE_URL+'/sys/smExperience/save', jsondata,"校园经历");
		})
		
		//submit(addUser)  绑定提交按钮（教育经历）
		form.on("submit(addEdu)",function(data){
			var edu = document.getElementById("eduFrom").getElementsByTagName("fieldset").length;
			var jsondata;
			
	var eduList = [];
	for(var i=0; i<edu; i++)
	{
		eduList.push({"id":$("#edu_id_"+i).val(),"academy":$("#edu_academy_"+i).val(),"className":$("#edu_className_"+i).val(),"college":$("#edu_collage_"+i).val(),"degree":$("#edu_degree_"+i).val(),"degreetype":$("#edu_degreetype_"+i).val(),"enddate":$("#edu_enddate_"+i).val(),"school":$("#edu_school_"+i).val(),"schoollen":$("#edu_schoollen_"+i).val(),"eries":$("#edu_series_"+i).val(),"specialty":$("#edu_specialty_"+i).val(),"startdate":$("#edu_startdate_"+i).val(),"studentid":$("#edu_studentid_"+i).val(),"sysUserId":$("#sysUserId").val(),"sysUserUsername":$("#username").val()});
		}
			jsondata = JSON.stringify(eduList);

			ajaxinfo(application.SERVE_URL+'/sys/smEducation/save', jsondata,"教育经历");
		})
		
		//submit(addUser)  绑定提交按钮（联系方式）
		form.on("submit(addContact)",function(data){
				var edu = document.getElementById("contactForm").getElementsByTagName("fieldset").length;
				var jsondata;
				var expList = [];
				for(var i=0; i<edu; i++)
				{
					expList.push({"id":$("#cont_id_"+i).val(),"type":$("#cont_type_"+i).val(),"contacte":$("#cont_contacte_"+i).val(),"sysUserId":$("#sysUserId").val(),"sysUserUsername":$("#username").val()});
				}
		jsondata = JSON.stringify(expList);
	ajaxinfo(application.SERVE_URL+'/sys/smContact/save', jsondata,"联系方式");

		})
		
		//submit(addUser)  绑定提交按钮（通讯地址）
		form.on("submit(addAdd)",function(data){
				var edu = document.getElementById("addFrom").getElementsByTagName("fieldset").length;
				var jsondata;
				var expList = [];
				for(var i=0; i<edu; i++)
				{
					expList.push({"id":$("#add_id_"+i).val(),"country":$("#add_country_"+i).val(),"province":$("#add_province_"+i).val(),"city":$("#add_city_"+i).val(),"district":$("#add_district_"+i).val(),"detail":$("#add_detail_"+i).val(),"ispost":$("input[name='ispost"+i+"']").val(),"sysUserId":$("#sysUserId").val(),"sysUserUsername":$("#username").val()});
				}
		jsondata = JSON.stringify(expList);
			ajaxinfo(application.SERVE_URL+'/sys/smAddress/save', jsondata,"通讯地址");
		})
		
		//submit(addUser)  绑定提交按钮（家庭信息）
		form.on("submit(familyFrom)",function(data){
			
					var edu = document.getElementById("familyFrom").getElementsByTagName("fieldset").length;
					var jsondata;
					var expList = [];
					for(var i=0; i<edu; i++)
					{
						expList.push({"id":$("#family_id_"+i).val(),"name":$("#family_name_"+i).val(),"sex":$("#fam_sex_"+i).val(),"relation":$("#fam_relation_"+i).val(),"birthday":$("#fam_birthday_"+i).val(),"profession":$("#fam_profession_"+i).val(),"phone":$("#fam_phone_"+i).val(),"workplace":$("#fam_workplace_"+i).val(),"isschool":$("input[name='isschool"+i+"']").val(),"sysUserId":$("#sysUserId").val(),"sysUserUsername":$("#username").val()});

					}
			jsondata = JSON.stringify(expList);
	    ajaxinfo(application.SERVE_URL+'/sys/smAddress/save', jsondata,"家庭信息");
		})
		
		//submit(addUser)  绑定提交按钮（政治面貌）
		form.on("submit(addSocia)",function(data){
					var edu = document.getElementById("sociaForm").getElementsByTagName("fieldset").length;
					var jsondata;
					var expList = [];
					for(var i=0; i<edu; i++)
					{
						expList.push({"id":$("#soc_id_"+i).val(),"type":$("#soc_type_"+i).val(),"name":$("#soc_name_"+i).val(),"startdate":$("#soc_startdate_"+i).val(),"remark":$("#soc_remark_"+i).val(),"sysUserId":$("#sysUserId").val(),"sysUserUsername":$("#username").val()});
									
									}
									jsondata = JSON.stringify(expList);

			
			ajaxinfo(application.SERVE_URL+'/sys/smSocial/save', jsondata,"政治面貌");
		});
		
		//submit(addUser)  绑定提交按钮（社会兼职）
		form.on("submit(addSocia_s)",function(data){
			
					var edu = document.getElementById("socia_sForm").getElementsByTagName("fieldset").length;
					var jsondata;
					var expList = [];
					for(var i=0; i<edu; i++)
					{
						expList.push({"id":$("#edu_id_"+i).val(),"type":$("#socia_type_"+i).val(),"name":$("#socia_name_"+i).val(),"position":$("#socia_position_"+i).val(),"infoval":$("#socia_infoval_"+i).val(),"startdate":$("#soc_s_startdate_"+i).val(),"enddate":$("#soc_s_enddate_"+i).val(),"sysUserId":$("#sysUserId").val(),"sysUserUsername":$("#username").val()});
					}
			jsondata = JSON.stringify(expList);
			ajaxinfo(application.SERVE_URL+'/sys/smSocial/save', jsondata,"社会兼职");
		});
		
		//submit(addUser)  绑定提交按钮（荣誉成就）
		form.on("submit(addHonor)",function(data){
					var edu = document.getElementById("honorForm").getElementsByTagName("fieldset").length;
					var jsondata;
					var expList = [];
					for(var i=0; i<edu; i++)
					{
						expList.push({"id":$("#honor_id_"+i).val(),"name":$("#honor_name_"+i).val(),"domain":$("#honor_domain_"+i).val(),"type":$("#honor_type_"+i).val(),"date":$("#honor_date_"+i).val(),"infoval":$("#honor_infoval_"+i).val(),"sysUserId":$("#sysUserId").val(),"sysUserUsername":$("#username").val()});
					}
			jsondata = JSON.stringify(expList);
			ajaxinfo(application.SERVE_URL+'/sys/smHonor/save', jsondata,"荣誉成就");
		});
		
		//submit(addUser)  绑定提交按钮（职业经历）
		form.on("submit(addProfession)",function(data){
			
					var edu = document.getElementById("expForm").getElementsByTagName("fieldset").length;
					var jsondata;
					var expList = [];
					for(var i=0; i<edu; i++)
					{
						expList.push({"id":$("#pro_id_"+i).val(),"workplace":$("#pro_workplace_"+i).val(),"nature":$("#pro_nature_"+i).val(),"industry":$("#pro_industry_"+i).val(),"department":$("#pro_department_"+i).val(),"position":$("#pro_position_"+i).val(),"telephone":$("#pro_telephone_"+i).val(),"fax":$("#pro_fax_"+i).val(),"remark":$("#pro_remark_"+i).val(),"startdate":$("#pro_startdate_"+i).val(),"enddate":$("#pro_enddate_"+i).val(),"sysUserId":$("#sysUserId").val(),"sysUserUsername":$("#username").val()});
						}

			jsondata = JSON.stringify(expList);
			ajaxinfo(application.SERVE_URL+'/sys/smProfession/save', jsondata,"职业经历");
		});
		
		//提交数据
		function ajaxinfo(url, data,res)
		{
				//弹出loading
			var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
				$.ajax({
						url: url, //ajax请求地址
						type: "POST",
						headers : { 'Authorization' : sessionStorage.getItem('token')},
						contentType: "application/json",
						data:data,			
						success: function (data) {
							if(data == "success"){
								// top.layer.close(index);
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
		});
	}
	//机构选择
	$(".userOrg").click(function(){
		selectOrg();
	})
	
	
	
		
function selectBase(url,data,selectid){
	var that = $(this);
			$.ajax({
				url:url,
				type: "POST",
				data: data ,
			 headers : { 'Authorization' : application.HEADER},
				success:function(res){
					$("#"+selectid).empty();
					$("#"+selectid).append('<option value="">请选择</option>')
					for(var i =0;i<res.length;i++){
						$("#"+selectid).append('<option  value="'+res[i].code+'"  tag="'+res[i].id +'">'+res[i].name+' </option>');//往下拉菜单里添加元素
					}
					form.render();//菜单渲染 把内容加载进去
				},
				error: function(){
					console.log("shibai")
				}
			});
		}
		
		//点击卡片切换时，填充值
		function clicktable(url,data)
		{
			var data = '{"size":0}';
			$.ajax({
				url:url,
				type: "GET",
				data: data ,
				//async: true,
				headers : { "Access-Control-Allow-Origin": "*"},
				success:function(res){
					/* if(res.list.length >0)
					{
					} */
					data = res;
				},error:function(){
					}
				});
				return data;
		}
})

