/**
 * Created by jingxl on 2016/10/10.
 * 新智能修改办公人员管理Form表单JS校验
 */
var FormValidation = function() {
    var e = function() {
        var addForm = $("#staffManagementForm");
        addForm.validate({
            errorElement: "span",
            errorClass: "help-block help-block-error",
            //focusInvalid: !1,
            ignore: ":hidden",//不对Hidden的元素进行验证
            messages: {
                "systemUserInstance.idCardName" : {required: "身份证姓名-不能为空.",byteMaxLength:"身份证姓名最大长度为10个汉字"},
                "systemUserInstance.phone" : {required: "手机号码-不能为空.",byteRangeLength:"请正确输入十一位手机号"},
                "systemUserInstance.idCardNo" : {required: "身份证号码-不能为空.",byteRangeLength:"请正确输入15或18位身份证号码"},
                "systemUserInstance.qq": {byteRangeLength:"请正确输入5到20位qq号码",digits:"qq号只能输入数字."},
                "systemUserInstance.wechat": {byteRangeLength:"请正确输入6到20位微信号码"},
                "systemUserInstance.email": {byteMaxLength:"邮箱地址过长"},
                "systemUserInstance.accountName":{byteRangeLength :"请正确输入账户名(1-60个字符)"},
                "systemUserInstance.settleAccount":{byteRangeLength:"请正确输入5或30位结算账号"},
                "systemUserInstance.birthDate":{required:"请填写或重新填写身份证号以自动识别出生日期"}
            },
            rules: {
                "systemUserInstance.idCardName": {required: true, byteMaxLength: 20 , idCardName : true },
                "systemUserInstance.phone": {onlyNum : true ,required: true, byteRangeLength: [11,11],phoneOnly:true},
                "systemUserInstance.idCardNo": {  required: true , byteRangeLength : [15,18]  , idCardNo : true,idCardNoOnly:true},
                "systemUserInstance.qq": { byteRangeLength : [5,20] ,digits:true,qq : true },
                "systemUserInstance.wechat": {   byteRangeLength : [6,20],wechat : true},
                "systemUserInstance.email": { email:true ,byteMaxLength:40},
                "systemUserInstance.accountName":{accountName :true,byteRangeLength : [1,60]},
                "systemUserInstance.settleAccount":{onlyNum : true ,byteRangeLength:[5,30] },
                "systemUserInstance.birthDate":{required: true}
            }
        })
    }
    return {
        init: function() {
            e()
        }
    }
}();
jQuery(document).ready(function() {
    FormValidation.init();  //TODO为方便调试，临时不进行校验
});

/** 自定义验证规则  */

// 《请输入15或18位身份证号》
     jQuery.validator.addMethod("idCardNo", function (value, element) {
        return this.optional(element) || /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/g.test(value);
    },"请输入15或18位身份证号");

// 《姓名校验支持少数民族还支持外国人》
     jQuery.validator.addMethod("idCardName", function (value, element) {
         return this.optional(element) || /^(([\u4E00-\u9FA5]+(?:·[\u4E00-\u9FA5]+)*)|([a-zA-Z]+(?:\s[a-zA-Z]+)*))$/.test(value);
    },"请输入合法的身份证姓名");
// 《姓名校验支持少数民族》
jQuery.validator.addMethod("idCardNameTChina", function (value, element) {
    return this.optional(element) || /[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*/g.test(value);
},"请输入合法的身份证姓名");



// 《是否是微信》
     jQuery.validator.addMethod("wechat", function (value, element) {
        return this.optional(element) || /[-_a-zA-Z0-9]{6,20}/g.test(value);
    },"请输入合法的微信号");

// 《是否是邮箱》
     jQuery.validator.addMethod("email", function (value, element) {
        return this.optional(element) || /[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/g.test(value);
    },"请输入合法的邮箱");
// 《是否是qq》
     jQuery.validator.addMethod("qq", function (value, element) {
        return this.optional(element) || /[0-9]/g.test(value);
    },"请输入合法的qq号码");


// 《中文字两个字节-区间验证》
    jQuery.validator.addMethod("byteRangeLength", function(value, element, param) {
        var length = value.length;
        for(var i = 0; i < value.length; i++){
            if(value.charCodeAt(i) > 127){
                length++;
            }
        }
        return this.optional(element) || ( length >= param[0] && length <= param[1] );
    }, $.validator.format("请输入 {0}-{1} 个字符."));


// 《中文字两个字节-最大验证》
    jQuery.validator.addMethod("byteMaxLength", function(value, element, param) {
        var length = value.length;
        for(var i = 0; i < value.length; i++){
            if(value.charCodeAt(i) > 127){
                length++;
            }
        }
        return this.optional(element) || ( length <= param);
    }, $.validator.format("最多输入 {0} 个字符."));

// 《中文字两个字节-最小验证》
    jQuery.validator.addMethod("byteMinLength", function(value, element, param) {
        var length = value.length;
        for(var i = 0; i < value.length; i++){
            if(value.charCodeAt(i) > 127){
                length++;
            }
        }
        return this.optional(element) || ( length >= param);
    }, $.validator.format("最少输入 {0} 个字符."));

//《只能填写英文字母和数字》
    jQuery.validator.addMethod("wordNumber", function (value, element) {
        return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
    }, "只能填写英文字母和数字.");

// 《只能填写汉字》
    jQuery.validator.addMethod("onlyCN", function(value, element) {
        var tel = /^[\u4e00-\u9fa5]+$/;
        return this.optional(element) || (tel.test(value));
    }, "请输入汉字.");
//《只能填写数字》
jQuery.validator.addMethod("onlyNum", function (value, element) {
    return this.optional(element) || /^[0-9]+$/.test(value);
}, "只能填写数字.");


// 《结算账户名》
jQuery.validator.addMethod("accountName", function(value, element) {
    var flag = false ;

    if(!this.optional(element)){

        if($("#settleAccountName").val().trim() == $("#idCardName").val().trim()){
            flag = true
        }
    }

    return this.optional(element) || flag;
}, "结算账户名必须与身份证姓名相同");
// 《身份证唯一性》
jQuery.validator.addMethod("idCardNoOnly", function(value, element) {
    var flag = false ;
    $.ajax({
        url: '/common/CheckIdCardNoOnly',
        data: {idCardNo: $("#idCardNo").val(),loginName: $('#loginName').text()},
        async: false,
    }).done(function (data) {
        if (data == "true") {
            flag = true;
        }
    })

    return flag;
}, "用户的身份证号必须唯一");

// 《手机号唯一性》
jQuery.validator.addMethod("phoneOnly",function(value,element){
    var flag=false;
    $.ajax({
        url: '/common/CheckPhoneOnly',
        data:{phone:$("#phone").val(), loginName : $('#loginName').text()},
        async:false,
    }).done(function (data) {
        if (data=="true"){

            flag=true;
        }
    })
    return flag;
},"用户的手机号必须唯一");

//《黑名单校验》
//jQuery.validator.addMethod("blacklist", function(value, element, param) {
//    var length = value.length;
//    for(var i = 0; i < value.length; i++){
//        if(value.charCodeAt(i) > 127){
//            length++;
//        }
//    }
//    return this.optional(element) || ( length >= param[0] && length <= param[1] );
//}, $.validator.format("只能输入{0}-{1}个字节(1个中文2个字节)"));





