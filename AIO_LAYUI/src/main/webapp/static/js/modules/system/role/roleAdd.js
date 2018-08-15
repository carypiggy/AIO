/**
 * @autor syp
 * @content 角色增加页面js
 * @returns
 * @Time 2018-08-02
 */
layui.use(['form','layer','validparam'],function(){
    var form = layui.form,
	validparam = layui.validparam,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery;

	form.verify(validparam);
    form.on("submit(addRole)",function(data){
        //弹出loading
        var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
        // 实际使用时的提交信息
        // $.post("上传路径",{
        //     userName : $(".userName").val(),  //登录名
        //     userEmail : $(".userEmail").val(),  //邮箱
        //     userSex : data.field.sex,  //性别
        //     userGrade : data.field.userGrade,  //会员等级
        //     userStatus : data.field.userStatus,    //用户状态
        //     newsTime : submitTime,    //添加时间
        //     userDesc : $(".userDesc").text(),    //用户简介
        // },function(res){
        //
        // })
        setTimeout(function(){
            top.layer.close(index);
            top.layer.msg("角色添加成功添加成功！");
            layer.closeAll("iframe");
            //刷新父页面
            parent.location.reload();
        },2000);
        return false;
    })

})