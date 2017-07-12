/**
 * Created by jingxl on 2016/10/10.
 * 新增商户Form表单JS校验
 */
$("#scaffold-save-merchantIncome").validate({
    errorElement: "span",
    errorClass: "help-block help-block-error",
    //focusInvalid: !1,
    ignore: ":hidden",//不对Hidden的元素进行验证
    messages: {
        receiptsName: {required: "签购单名称-不能为空.",byteRangeLength:"请输入6-20个汉字或12-40个字符."},
        registName: {required: "注册名称-不能为空.",byteMaxLength:"最多输入80个字符."},
        subjectionMerchantCode: {required: "隶属商户编号-不能为空."},
        subjectionMerchantName: {required: "隶属商户名称-不能为空."},
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
        legalPersonName: {required: "法人姓名-不能为空.",byteMaxLength:"最多输入30个字符."},
        linkmanMobileNo: {required: "联系人手机号-不能为空.",digits:"只能输入正整数.",minlength:"请输入11位手机号.",maxlength:"请输入11位手机号."},
        settleManidNumber: {required: "结算人身份证-不能为空.",checkAge:"结算人年龄不符合要求，请重新录入."},
        settleManidNumber2: {required: "结算人身份证-不能为空.",checkAge:"结算人年龄不符合要求，请重新录入."},
        billingWay: {required: "计费方式-不能为空."},
        suiYiTongCountrFee: {required: "随意通手续费-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
        intradayPayCounterFee: {required: "即日付手续费-不能为空.",number:"请输入合法的数字."},// TODO 保留2位小数，可填写范围取值是bap系统设定的范围
        maintainFeeOfPos: {required: "POS维护费,收取金额-不能为空.",number:"请输入合法的数字.",min:"POS维护费,收取金额-不可低于1元.",max:"POS维护费,收取金额-不可高于15元."},
        collectAmount: {required: "维护通,收取金额-不能为空.",number:"请输入合法的数字.",min:"维护通,收取金额-不可低于1元.",max:"维护通,收取金额-不可高于500元."},
        gaoHuiTongMerchantCode: {required: "高汇通商编-不能为空.",byteRangeLength:"请输入15位-有效的高汇通商编.",wordNumber:"请输入15位-有效的高汇通商编."},
        toPrivateSettleAccountNo: {required:"结算账号不能为空",byteRangeLength:"请输入5-30个字符.",number:"请输入合法的数字."},
        toPrivateAccountName: {required:"结算账户名不能为空",accountNameLength: "结算账户名长度错误."},
        toPublicSettleAccountNo: {required:"结算账号不能为空",byteRangeLength:"请输入5-30个字符.",number:"请输入合法的数字."},
        toPublicAccountName: {required:"结算账户名不能为空",accountNameLength: "结算账户名长度错误."},


        rateVisa: {required: "交行外卡费率Visa-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
        rateMaster: {required: "交行外卡费率Master-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
        rateAmericanExpress: {required: "交行外卡费率AmericanExpress-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
        rateDiners: {required: "交行外卡费率Diners-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
        rateJCB: {required: "交行外卡费率JCB-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
        rateVISADCC: {required: "交行外卡费率VISA_DCC-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
        rateMCDCC: {required: "交行外卡费率MC_DCC-不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
        suggestion: {  byteMaxLength:"最多输入200个字符."},
        businessStartTime: {required: "营业时间不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
        businessEndTime: {required: "营业时间不能为空.",number:"请输入合法的数字.",range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值.")},
        businessScope:{required:"经营范围不能为空.",byteMaxLength:"最多输入200个字符."},
        siteArea:{required:"用地面积不能为空."},
        linkmanName:{required:"联系人姓名不能为空."},
        serviceTel:{required:"客服电话不能为空.",digits:"只能输入正整数.",minlength:"请输入11位手机号.",maxlength:"请输入11位手机号."},
        expandType:{required:"拓展类型不能为空."},
        merchantClassify:{required:"商户类别不能为空."},
        salesmanCode:{required:"业务员编号不能为空."},
        businessClassify:{required:"行业大类不能为空."},
        bankTeamworkSign:{required:"银行合作标识不能为空."},
        registName:{required:"注册名称不能为空",byteRangeLength:"最多输入80个字符."},
        registAddressProvince:{required:"注册地址不能为空"},
        registAddressStreet:{required:"注册地址街道不能为空",byteMaxLength:"最多输入60个字符."},
        registCode:{required:"注册登记号不能为空."},
        merchantNature:{required:"商户性质不能为空."},
        licenseStartTime:{required:"执照有效期不能为空."},
        legalPersonName:{required:"法人姓名不能为空."},
        // legalPersonLicenseType:{required:"法人证件类型不能为空."},
        // legalPersonCode:{required:"法人证件号不能为空.",byteMaxLength:"最多输入18个字符."},
        cardStartTime:{required:"证件有效期不能为空."},
        merchantDayChangeTime:{required:"商户日切时间不能为空."},
        settleDayCount:{required:"结算天数不能为空."},
        startSettleMoney:{required:"起始结算金额不能为空."},
        toPrivateSettleAccountNoTwo:{required:"结算卡1-结算账号确认信息不可为空",accountEqual:"确认结算账号必须和结算账号一致"},
        toPublicSettleAccountNoTwo:{required:"结算卡2-结算账号确认信息不可为空",accountEqual:"确认结算账号必须和结算账号一致"},
        preBusinessClassify: {required: "预设行业大类-不能为空."},
        managerPhone:{minlength:"请输入11位手机号",maxlength:"请输入11位手机号",required:"管理员手机号不能为空"},
        posRemark:{byteMaxLength:"最多输入150个字符."},
        mecNormalLevel:{required:"商户等级-不能为空."}

    },
    rules: {
        receiptsName: {required: true, byteRangeLength: [12, 40]},
        registName: {required: true, byteMaxLength: 80},
        subjectionMerchantCode: {  required: true},
        subjectionMerchantName: {  required: true},
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
        // legalPersonCode:{required: true,byteMaxLength: 18},
        linkmanMobileNo: { required: true,digits:true,minlength: 11,maxlength: 11 },
        settleManidNumber: { required: true,idcard:true,checkAge:true},
        settleManidNumber2: { required: true,idcard:true,checkAge:true},
        billingWay: { required: true},
        suiYiTongCountrFee: { required: true,number:true,range:[0.15,0.5]},
        intradayPayCounterFee: { required: true,number:true},
        maintainFeeOfPos: { required: true,number:true,min: 0.01,max: 15 ,hasDecimal2:true},
        collectAmount: { required: true,number:true,min: 1,max: 500 ,hasDecimal2:true},
        gaoHuiTongMerchantCode: {required: true, byteRangeLength: [15, 15],wordNumber:true},

                toPrivateSettleAccountNo: {byteRangeLength: [5, 30],number:true},
                toPrivateAccountName: {required: true,accountNameLength: 'settleAccountType1'},
                toPublicSettleAccountNo: {byteRangeLength: [5, 30],number:true},
                toPublicAccountName: {required: true,accountNameLength: 'settleAccountType2'},

        rateVisa: { required: true,number:true,range:[0,10],hasDecimal2:true},
        rateMaster: { required: true,number:true,range:[0,10],hasDecimal2:true},
        rateAmericanExpress: { required: true,number:true,range:[0,10],hasDecimal2:true},
        rateDiners: { required: true,number:true,range:[0,10],hasDecimal2:true},
        rateJCB: { required: true,number:true,range:[0,10],hasDecimal2:true},
        rateVISADCC: { required: true,number:true,range:[0,10],hasDecimal2:true},
        rateMCDCC: { required: true,number:true,range:[0,10],hasDecimal2:true},
        suggestion: {  byteMaxLength: 200},
        businessStartTime: { required: true,number:true,min: 00,max: 23},
        businessEndTime: { required: true,number:true,min: 00,max: 23},
        businessScope:{required:true,byteMaxLength: 200},
        siteArea:{required:true},
        linkmanName:{required:true,byteMaxLength:60},
        serviceTel:{required:true,digits:true,minlength: 11,maxlength: 11},
        managerPhone:{required:true,digits:true,minlength: 11,maxlength: 11},
        expandType:{required:true},
        merchantClassify:{required:true},
        salesmanCode:{required:true},
        businessClassify:{required:true},
        bankTeamworkSign:{required:true},
        registName:{required:true,byteMaxLength: 80},
        registAddressProvince:{required:true},
        registAddressStreet:{required:true,byteMaxLength: 60},
        registCode:{required:true,byteMaxLength:60},
        merchantNature:{required:true},
        licenseStartTime:{required:true},
        legalPersonName:{required:true,byteMaxLength: 30},
        // legalPersonLicenseType:{required:true},
        cardStartTime:{required:true},
        merchantDayChangeTime:{required:true},
        settleDayCount:{required:true},
        startSettleMoney:{required:true},
        toPrivateSettleAccountNoTwo: {required:true,accountEqual:'toPrivateSettleAccountNo'},
        toPublicSettleAccountNoTwo: {required:true,accountEqual:'toPublicSettleAccountNo'},
        preBusinessClassify:{required:true},
        posRemark:{byteMaxLength:150},
        mecNormalLevel:{required:true},


    }
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
// 《两字段一致校验》
    jQuery.validator.addMethod("accountEqual", function (value, element,param) {
        return  $('#'+param).val() == value;
    },"确认结算账户必须和结算账号一致");

// 对公对私结算账号名长度校验
jQuery.validator.addMethod("accountNameLength", function (value, element,param) {
    var type = $('#'+param).val();//结算账户类型为对公
    var min ;
    var max ;
    if(type == '1'){
        //结算账户类型为对公
        min = 10;
        max = 80;
    }else{
        min =1;
        max = 60;
    }
    var length = value.length;
    for(var i = 0; i < value.length; i++){
        if(value.charCodeAt(i) > 127){
            length++;
        }
    }
    return this.optional(element) || ( length >= min && length <= max )
},"结算账户名长度错误.");
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

jQuery.validator.addMethod("checkAge", function (value, element) {
    return this.optional(element) || checkAgeWithResult(value);
}, "结算人年龄不符合要求，请重新录入.");






