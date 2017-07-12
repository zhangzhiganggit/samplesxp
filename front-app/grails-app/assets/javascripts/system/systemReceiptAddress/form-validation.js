/**
 * Created by jingxl on 2016/10/10.
 * 收货地址Form表单JS校验
 */
var FormValidation = function() {
    var e = function() {
        var addForm = $("#systemReceiptAddressForm");

        addForm.validate({
            errorElement: "span",
            errorClass: "help-block help-block-error",
            //focusInvalid: !1,
            ignore: ":hidden",//不对Hidden的元素进行验证
            messages: {
                "systemReceiptAddressInstance.receiverName" : {required: "收货人姓名-不能为空.",chineseTwobyteLength:"收货人信息过多，请更新！"},
                "systemReceiptAddressInstance.mobileNo" : {required: "手机号码-不能为空.",byteRangeLength:"请正确输入十一位手机号"},
                "systemReceiptAddressInstance.postcode" : {byteRangeLength:"请正确输入六位邮编"},
                "systemReceiptAddressInstance.address" : {required: "详细地址-不能为空.",byteRangeLength:"详细地址信息过多，请更新！"},
                // "systemReceiptAddressInstance.provincespan":{required:"不能为空"},
                // "systemReceiptAddressInstance.cityspan":{required:"不能为空"},
                // "systemReceiptAddressInstance.areaspan":{required:"不能为空"}
            },
            rules: {
                "systemReceiptAddressInstance.receiverName": {required: true, receiverName : true ,chineseTwobyteLength: 20  },
                "systemReceiptAddressInstance.mobileNo": {required: true, byteRangeLength: [11,11],onlyNum:true},
                "systemReceiptAddressInstance.postcode": {required: false, byteRangeLength: [6,6],onlyNumPostcode:true},
                "systemReceiptAddressInstance.address": {required: true , byteRangeLength: [1,200] },
                // "systemReceiptAddressInstance.provincespan":{required: true},
                // "systemReceiptAddressInstance.cityspan":{required: true},
                // "systemReceiptAddressInstance.areaspan":{required: true},
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

//收货人姓名
jQuery.validator.addMethod("receiverName", function(value, element) {
    return this.optional(element) || /^(([\u4E00-\u9FA5a-zA-Z0-9]+(?:·[\u4E00-\u9FA5a-zA-Z0-9]+)*)|([a-zA-Z]+(?:\s[a-zA-Z]+)*))$/.test(value);
}, "请正确输入收货人姓名.");

//中文字算两个字节
jQuery.validator.addMethod("chineseTwobyteLength", function(value, element, param) {
    var str= value.replace(/[\u4E00-\u9FA5]/g,"11")
    var length=str.length
    return this.optional(element) || ( length <= param);
}, $.validator.format("最多输入 {0} 个字符."));

// 《中文字两个字节-区间验证》
jQuery.validator.addMethod("address", function(value, element, param) {
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
//《只能填写数字》
jQuery.validator.addMethod("onlyNum", function (value, element) {
    return this.optional(element) || /^[0-9]+$/.test(value);
}, "请正确输入十一位手机号.");
jQuery.validator.addMethod("onlyNumPostcode", function (value, element) {
    return this.optional(element) || /^[0-9]+$/.test(value);
}, "请正确输入六位邮编.");

//《省市联动空校验》
jQuery.validator.addMethod("addressNotNull", function (value, element) {

    alert("123")
    var flag=true;
    if (value.trim()=="请选择"){
        flag=false
    }

    return this.optional(element) || flag;
}, "请选择地区.");

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





