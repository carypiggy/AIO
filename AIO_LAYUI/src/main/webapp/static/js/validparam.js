/*
	@Author: syp
	@Time: 2018-8
	@Tittle: validparam
	@Description: 封装一些参数验证
*/
layui.define('form',function(exports){
    var form = layui.form
	
    //自定义验证规则  每个form初始化都得调用
    var obj ={
		//名字
    	Name: [/^(?!_)(?!.*?_$)[_a-zA-Z0-9_\u4e00-\u9fa5]{2,20}$/, '请输入正确格式！'],
		QQ : [/^[1-9][0-9]{4,12}/, '请输入正确格式！'],
		WeiChat :[/^[a-zA-Z]{1}[-_a-zA-Z0-9]{5,19}$/,'请输入正确格式！'],
		CardID : [/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/,'请输入正确格式！'],
		Mobile : [/^1\d{10}$/,'请输入正确格式！'],
		Num : [/^[0-9]*$/,'请输入正确格式！' ]		
	}
	exports('validparam', obj);
});
