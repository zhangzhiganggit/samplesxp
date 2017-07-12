/**
 * Created by qiudong on 2017/01/16.
 * 小微进件Form表单JS校验
 */
var FormValidation = function() {
    var e = function() {
        var addForm = $("#scaffold-save-merchantSmallAndMicro");
        if(addForm.children().length==0){
            addForm = $("#scaffold-update-merchantSmallAndMicro");
        }
        addForm.validate({
            errorElement: "span",
            errorClass: "help-block help-block-error",
            //focusInvalid: !1,
            ignore: ":hidden",//不对Hidden的元素进行验证
            messages: {
                businessClassify: {required: "行业大类-不能为空."},
                businessScope: {required:"主营业务-不能为空"},
                legalPersonName: {required:"法人姓名-不能为空",byteMaxLength:"最多输入30个字符."},
                receiptsName: {required:"商户名称-不能为空"},
                salesmanCode:{required: "业务员名称-不能为空."},
                 registName: {required: "注册名称-不能为空.",byteMaxLength:"最多输入80个字符."},
                //subjectionMerchantCode: {required: "隶属商户编号-不能为空."},
                subjectionMerchantName: {required: "商户名称-不能为空.",byteMaxLength:"最多输入40个汉字."},
                registAddressProvince: {required: "注册地址(省)-不能为空."},
                registAddressCity: {required: "注册地址(市)-不能为空."},
                registAddressArea: {required: "注册地址(区)-不能为空."},
                registAddressStreet: {required: "注册地址街道-不能为空.",byteMaxLength:"最多输入60个字符."},
                bindAddressProvince: {required: "装机地址(省)-不能为空."},

                bindAddressCity: {required: "装机地址(市)-不能为空."},
                bindAddressArea: {required: "装机地址(区)-不能为空."},
                bindAddressStreet: {required: "装机地址街道-不能为空.",byteMaxLength:"最多输入60个字符."},
                mainManageBusiness: {required: "主营业务-不能为空.",byteMaxLength:"最多输入200个字符."},
                registCode: {required: "注册登记号-不能为空.",byteMaxLength:"最多输入60个字符."},
                salesmanName: {required: "业务员名称-不能为空."},
                // legalPersonName: {required: "商户负责人姓名-不能为空.",byteMaxLength:"最多输入30个字符."},
               // legalPersonCode:{required:"法人证件号不能为空."},
                linkmanMobileNo: {required: "联系人手机号-不能为空.",digits:"只能输入正整数.",minlength:"请输入11位手机号.",maxlength:"请输入11位手机号."},
                settleManidNumber: {required: "结算人身份证-不能为空.",checkAge:"结算人年龄不符合要求，请重新录入."},
                billingWay: {required: "计费方式-不能为空."},

                // suiYiTongCountrFee: {required: "随意通手续费-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
                // intradayPayCounterFee: {required: "即日付手续费-不能为空.",number:"请输入合法的数字."},// TODO 保留2位小数，可填写范围取值是bap系统设定的范围
                // maintainFeeOfPos: {required: "POS维护费,收取金额-不能为空.",number:"请输入合法的数字.",min:"POS维护费,收取金额-不可低于0.01元.",max:"POS维护费,收取金额-不可高于15元."},
                // collectAmount: {required: "维护通,收取金额-不能为空.",number:"请输入合法的数字.",min:"维护通,收取金额-不可低于1元.",max:"维护通,收取金额-不可高于500元."},
                // gaoHuiTongMerchantCode: {required: "高汇通商编-不能为空.",byteRangeLength:"请输入15位-有效的高汇通商编.",wordNumber:"请输入15位-有效的高汇通商编."},
                toPrivateSettleAccountNo: {required: "结算账号-不能为空.",byteRangeLength:"请输入5-30个字符.",number:"请输入合法的数字."},
                 toPrivateAccountName: {required: "账户名-不能为空.",byteMaxLength:"最多输入60个字符."},
                toPrivateOpenbankInfomation: {required: "开户行信息-不能为空."},

                toPublicSettleAccountNo: {byteRangeLength:"请输入5-30个字符.",number:"请输入合法的数字."},
                toPublicAccountName: {byteRangeLength:"请输入10-80个字符."},


                rateVisa: {required: "交行外卡费率Visa-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
                rateMaster: {required: "交行外卡费率Master-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
                rateAmericanExpress: {required: "交行外卡费率AmericanExpress-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
                rateDiners: {required: "交行外卡费率Diners-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
                rateJCB: {required: "交行外卡费率JCB-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
                rateVISADCC: {required: "交行外卡费率VISA_DCC-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
                rateMCDCC: {required: "交行外卡费率MC_DCC-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
                suggestion: {  byteMaxLength:"最多输入200个字符."},
                accountLegalPersonName: {  required:"账户法人姓名不能为空."},

            },
            rules: {
                businessClassify: {required: true},
                salesmanCode:{required: true},
                businessScope: {required:true},
               // legalPersonName1: {required:true},
                receiptsName: {required:true},
                // receiptsName: {required: true, byteRangeLength: [12, 40]},
                registName: {required: true, byteMaxLength: 80},
                // subjectionMerchantCode: {  required: true},
                subjectionMerchantName: {  required: true,byteMaxLength: 80},
                registAddressProvince: {  required: true },
                registAddressCity: {  required: true },
                registAddressArea: {  required: true },
                registAddressStreet: { required: true,byteMaxLength: 60 },
                bindAddressProvince: {  required: true },
                bindAddressCity: {  required: true },
                bindAddressArea: {  required: true },
                bindAddressStreet: { required: true,byteMaxLength: 60 },
                mainManageBusiness: { required: true,byteMaxLength: 200 },
                registCode: { required: true,byteMaxLength: 60 },
                salesmanName: { required: true },
                legalPersonName: { required: true,byteMaxLength: 30 ,maxlength:30},
              //  legalPersonCode:{ idcard:true},
                linkmanMobileNo: { required: true,digits:true,minlength: 11,maxlength: 11 },
                settleManidNumber: { required: true,idcard:true,checkAge:true},
                billingWay: { required: true},
                // suiYiTongCountrFee: { requireda: true,number:true,range:[0.15,0.5]},
                // intradayPayCounterFee: { required: true,number:true},
                // maintainFeeOfPos: { required: true,number:true,min: 0.01,max: 15 ,hasDecimal2:true},
                // collectAmount: { required: true,number:true,min: 1,max: 500 ,hasDecimal2:true},
                // gaoHuiTongMerchantCode: {required: true, byteRangeLength: [15, 15],wordNumber:true},

                toPrivateSettleAccountNo: {required: true,byteRangeLength: [5, 30],number:true},
                   toPrivateAccountName: { required: true,byteMaxLength: 60},
                toPrivateOpenbankInfomation: {required: true},
                toPublicSettleAccountNo: {byteRangeLength: [5, 30],number:true},
                toPublicAccountName: {required: false,byteRangeLength: [10,80]},

                rateVisa: { required: true,number:true,min: 0,max: 10,hasDecimal2:true},
                rateMaster: { required: true,number:true,min: 0,max: 10,hasDecimal2:true},
                rateAmericanExpress: { required: true,number:true,min: 0,max: 10,hasDecimal2:true},
                rateDiners: { required: true,number:true,min: 0,max: 10,hasDecimal2:true},
                rateJCB: { required: true,number:true,min: 0,max: 10,hasDecimal2:true},
                rateVISADCC: { required: true,number:true,min: 0,max: 10,hasDecimal2:true},
                rateMCDCC: { required: true,number:true,min: 0,max: 10,hasDecimal2:true},
                suggestion: {  byteMaxLength: 200},
                accountLegalPersonName: {  required:true},

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
jQuery.validator.addMethod("idcard", function (value, element) {
    return this.optional(element) || /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/g.test(value);
},"请输入15或18位身份证号");

// 《小数点后仅可包括两位数字》
jQuery.validator.addMethod("hasDecimal2", function (value, element) {
    return this.optional(element) || /(^\d{1,7}(\.\d{1,2})?)$/.test(value);
}, "小数点后仅可包括两位数字");

// 《中文字两个字节-区间验证》
jQuery.validator.addMethod("byteRangeLength", function(value, element, param) {
    var length = value.length;
    for(var i = 0; i < value.length; i++){
        if(value.charCodeAt(i) > 127){
            length++;
        }
    }
    return this.optional(element) || ( length >= param[0] && length <= param[1] );
}, $.validator.format("请输入 {0}-{1} 个字符(汉字算2个字符)."));

// 《中文字两个字节-最大验证》
jQuery.validator.addMethod("byteMaxLength", function(value, element, param) {
    var length = value.length;
    for(var i = 0; i < value.length; i++){
        if(value.charCodeAt(i) > 127){
            length++;
        }
    }
    return this.optional(element) || ( length <= param);
}, $.validator.format("最多输入 {0} 个字符(汉字算2个字符)."));

// 《中文字两个字节-最小验证》
jQuery.validator.addMethod("byteMinLength", function(value, element, param) {
    var length = value.length;
    for(var i = 0; i < value.length; i++){
        if(value.charCodeAt(i) > 127){
            length++;
        }
    }
    return this.optional(element) || ( length >= param);
}, $.validator.format("最少输入 {0} 个字符(汉字算2个字符)."));

//《只能填写英文字母和数字》
jQuery.validator.addMethod("wordNumber", function (value, element) {
    return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
}, "只能填写英文字母和数字.");

// 《只能填写汉字》
jQuery.validator.addMethod("onlyCN", function(value, element) {
    var tel = /^[\u4e00-\u9fa5]+$/;
    return this.optional(element) || (tel.test(value));
}, "请输入汉字.");

jQuery.validator.addMethod("checkAge", function (value, element) {
    return this.optional(element) || checkAgeWithResult(value);
}, "结算人年龄不符合要求，请重新录入.");

jQuery.validator.addMethod("toPublicAccountName", function (value, element) {
    var toPublicAccountName = $("#toPublicAccountName").val().trim()
    var registName = $("#registName").val().trim()
    return this.optional(element) || (toPublicAccountName==registName);
}, "对公结算账户名与注册名称不一致,请重新录入");
// jQuery.validator.addMethod("registName", function (value, element) {
//     var toPublicAccountName = $("#toPublicAccountName").val().trim()
//     var registName = $("#registName").val().trim()
//     return this.optional(element) || (toPublicAccountName==registName);
// }, "对公结算账户名与注册名称不一致,请重新录入");

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





