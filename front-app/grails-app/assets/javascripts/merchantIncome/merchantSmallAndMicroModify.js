/**
 * create by zhou_ning
 * 修改小微商户界面脚本
 */
var loadTime = new Date().getTime()-6000;
var oldMap={};
if (typeof jQuery !== 'undefined') {




    $(function(){
        //预设计费方式链接绑定事件
        $('#presetRateLink').on('click',function(e){
            e.preventDefault();
            presetFeeRate();
        });

        //回填pos信息
        backfillPosInfo();

        /**加载后自动触发元素状态*/
        //如果是审核数据管理编辑页面，需要初始化重复次数校验信息
        if($("#pageType").val() != undefined && $("#pageType").val()=='auditModify'){
            initOldMap();
            //初始化是否长期有效
            if($('#cardStartTime').val()=='Mon Jan 01 00:00:00 CST 1900'&&$('#cardEndTime').val()=='Thu Dec 31 00:00:00 CST 2099'){
                $('#cardAlwaysEnabled'). prop('checked',true);
                clicklegalCredentials();
            }
            //初始化预设费率信息
            renderx();
        }

        //add by liyang 绑定结算部分onKeyup
        settleCardBindOnKeyUp();

        /**  操作错误提示信息  */
        var state=$('#saveState').val();
        var option=$('#option').val();
        if(option=="add" && state=="error"){
            OKDialog("系统写入错误，请联系管理员");
        }else if(option=="edit" && state=="error"){
            OKDialog("系统写入错误，请联系管理员");
        }

        var itemPrivate=$('#toPrivateOpenbankInfomation').attr('value');
        setSelect2Value('toPrivateOpenbankInfomation',itemPrivate,itemPrivate);//个体开户行信息设置




        /** <结算人身份证号> 黑名单校验 */
        $('#settleManidNumber').blur(function () {
            var cardNo = $('#settleManidNumber').val();
            var reg = /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/g;
            if (cardNo.length == 0) {
                console.log("没有数据不发起请求.")
            } else if (!reg.test(cardNo)) {
                console.log("请输入15或18位身份证号.")
            } else {
                if(cardNo != oldMap['settleManidNumber']) {
                    $.ajax({
                        url: "/merchantIncome/blacklist",
                        data: {'cardNo': cardNo},
                        type: "POST",
                        dataType: "json",
                        success: function (json) {
                            console.log(json);
                            //Object {result: 1, returnMsg: "{"retCode":"0000","opMsg":"结算人身份证号码正常","bFlag":false,"gFlag":false}"}
                            if (json.result == "1") {
                                var returnObj = eval("(" + json.returnMsg + ")")
                                if (returnObj.bFlag == true) {
                                    OKDialogCallBack("结算身份证号存在风险，禁止进件！", 'settleManidNumber');
                                }
                            } else {
                                console.log("结算人身份证号:" + cardNo + " 正常.")
                            }
                        },
                        error: function (xhr, status) {
                            alert("黑名单校验异常。");
                        }
                    })
                }
            }
        });

        /** 重复次数校验:
         个体结算信息 个体结算信息必须整组填写（对公结算信息同理），点击“开户行信息输入框查询结算银行”可以补全联行行号及开户行信息.
         * <注册名称（上面函数中定义）、注册登记号、结算人身份证号、结算卡(对公)账户名、结算卡号(个体)、结算卡号（对公）>
         * */
        $('#settleManidNumber,#toPrivateSettleAccountNo').blur(function () {
            //判断重复次数校验的商户类型(0=[普通商户、1+N总店、1+N分店]  1=[连锁总店、连锁分店])
            var repeatType = '0';
            var v = $('#merchantType').val();
            if (v == '2' || v == '3') {
                //连锁总店/连锁分店
                repeatType = '1';
            }

            //获取商户等级类型
            var mecNormalLevel = judgeLevelForValidate($('#mecNormalLevel').val());

            /**<结算人身份证号> blur 事件绑定*/
            if ("settleManidNumber" == $(this).attr("id")) {
                var findVal = $(this).val();
                if (findVal.length == 0) {
                    return false;
                }
                if(ifCheckRepeat('settleManidNumber',$(this).val(),mecNormalLevel)) {
                    $.ajax({
                        url: '/merchantIncome/settleCardNoRepeat',
                        data: {merchantType: repeatType, cardNo: findVal,mecNormalLevel:mecNormalLevel},
                        type: "POST",
                        dataType: "json",
                        success: function (json) {
                            if (json.code == "1") {
                                console.log("结算人身份证号Yes")
                            } else {
                                OKDialogCallBack("结算人身份证1的重复次数超出系统限制，请联系相关人员！", 'settleManidNumber');
                            }
                        },
                        error: function (xhr, status) {
                            console.log("--------------结算人身份证号-重复次数校验,异常.--------------------")
                        }
                    });
                }
            }//end

            /**<结算账号(个体/对公)> blur 事件绑定*/
            if ("toPrivateSettleAccountNo" == $(this).attr("id")) {
                var findVal = $(this).val();
                if (findVal.length == 0) {
                    return false;
                }
                var showlbl = ("toPrivateSettleAccountNo" == $(this).attr("id")) ? "个体" : "对公";
                var showId = ("toPrivateSettleAccountNo" == $(this).attr("id")) ? "toPrivateSettleAccountNo" : "toPublicSettleAccountNo";
                if(ifCheckRepeat($(this).attr("id"),$(this).val(),mecNormalLevel)) {
                    $.ajax({
                        url: '/merchantIncome/settleAccountNoRepeat',
                        data: {merchantType: repeatType, accoutNo: findVal,mecNormalLevel:mecNormalLevel},
                        type: "POST",
                        dataType: "json",
                        success: function (json) {
                            if (json.code == "1") {
                                console.log("结算账号Yes")
                            } else {
                                OKDialogCallBack(showlbl + "结算账号的重复次数超出系统限制，请联系相关人员！", showId);
                            }
                        },
                        error: function (xhr, status) {
                            console.log("--------------结算账号-重复次数校验,异常.--------------------")
                        }
                    });
                }
            }//end
        });



        /** ----------标签End----------------- */
        $('#findMerchantInfo').click(function () {
            var mecCode = $('#merchantCode').val();
            $('#findMerchantInfo').hide();
            console.log("商户修改的商户编号：" + mecCode)
            findMerchantInfoFun(this, mecCode);
        });


        //商户管理页面进来进行查询
        if(($("#merchantCode").val()!=null)&&($("#merchantCode").val()!="")) {
            $('#findMerchantInfo').trigger("click");
        }

        //禁止输入框输入空格
        $("input[type='text']").keyup(function () {
            this.value = this.value.replace(/\s/gi, '');//去除空格
            this.value = this.value.replace(/\'/g, "");//去除单引号[']

            //输入的最大字节数判断
            //var maxLen=$(this).attr("data-maxLen");
            //console.log(maxLen)
            //WidthCheck(this, maxLen)
        });

        /**
         * 法人证件号是否长期有效按钮事件
         */
        $('#cardAlwaysEnabled').click(function () {
            clicklegalCredentials();
        })

        //调用费率信息接口
        renderx();

    })





    /**
     * 查询是否参加欢乐组
     * @param merchantCode 商编号
     */
    function findHanLeZu(merchantCode){
        $.ajax({
            url:"/totalShop/checkHanLeZu",
            data:{merchantCode:merchantCode,},
            type:"POST",
            dataType:"json",
            success:function(json){
                if(json.hanLeZu==true){
                    var happyRentGroup=VUECMPReg.getInstance().getCmp("happyRentGroup");
                    happyRentGroup.setChecked(json.id);
                    var checks = document.getElementsByName(happyRentGroup.name);
                    $(checks).prop('disabled', true);
                    $("#ifHuanLeZu").val(json.id);
                }else{
                    //$("#ifHuanLeZu").prop('checked',false);
                }
            },
            error:function(xhr, status){
                // alert("查询内部异常....。");

            }
        })


    }



    //***************************根据商户编号，查询BAP中的商户信息***********************************************************
    function findMerchantInfoFun(thisButton,merchantCode){
        var flag=1;
        //检查是否参加欢乐组
        findHanLeZu(merchantCode);
        $.ajax({
            url:"/totalShop/findMerchantInfo",
            data:{merchantCode:merchantCode,},
            type:"POST",
            dataType:"json",
            success:function(json){
                console.log("**********************");
                // console.log(json);
                var bapMecInfo=JSON.stringify(json);
                console.info(bapMecInfo);
                console.log("======================");

                if(json.rtnCod == '-1'){
                    OKDialog(json.msg);
                }
                if(json.rtnCod == '4'){
                    OKDialog("该商户不是二类小微商户不能执行修改!");
                    $('#findMerchantInfo').show();
                    return false;
                }
                if(json.rtnCod == '2'){

                    if($("#handle").val()==''||$("#handle").val()==null){
                        OKDialog("该商户存在未完成的商户信息变更任务");
                        $('#findMerchantInfo').show();
                        return false;
                    }else{
                        initOldMapValidate();
                        //$('#receiptsName').val($("#registName").val());// 回填-签购单名称*/
                        return true;
                    }
                }
                if(json.rtnCod == '3'){

                    if($("#handle").val()==''||$("#handle").val()==null){
                        OKDialog("该商户不支持此流程类型");
                        $('#findMerchantInfo').show();
                        return false;
                    }else{
                       // $('#receiptsName').val($("#registName").val());// 回填-签购单名称*/
                        return true;
                    }
                }
                if(json.msgCd != "MEC00000"){
                    OKDialog("该商户不存在");
                    $('#findMerchantInfo').show();
                    return false;
                }
                /*if(json.isXw !='01'){
                 OKDialog("该商户不是小微商戶");
                 $('#findMerchantInfo').show();
                 return false;
                 }*/
                console.log("=是否已经注销:"+json.retMercIfPo.tBapMecIfPo.mecSts);
                if('02'==json.retMercIfPo.tBapMecIfPo.mecSts){
                    OKDialog("该商户已注销");
                    $('#findMerchantInfo').show();
                    return;
                }
                //todo 暂时不开放分店的修改
                if(flag == "1"&&(json.retMercIfPo.tBapMecIfPo.mecTypeFlag=="02"||json.retMercIfPo.tBapMecIfPo.mecTypeFlag=="04"))
                {
                    OKDialog("系统暂时不开放分店类型商户的修改.");
                    return;
                }

                $("#bapMecInfo").val(bapMecInfo);

                $("#findMerchantInfo").prop('disabled',true);
              $("#merchantCode").prop('readonly',true);
                /*            $("#receiptsName").prop('readonly',true);
                //  $("#legalPersonName").prop('readonly',true);
                $("#businessScope").prop('readonly',true)
                $("#mainManageBusiness").prop('readonly',true)*/
                console.log("====================开始回填商户信息=========================")
                $(thisButton).prop('disabled',true);//回填信息时禁止再次查询
                var data = json.retMercIfPo;

                data1 = data.tBapUsrStmIfPo;
                console.log(data);
                console.log(data1);
                $("#settleManidNumber").val(data.tBapMecIfDetailPo.legPerCrdNo)
                oldMap['settleManidNumber']=data.tBapMecIfDetailPo.legPerCrdNo
                //pos信息
                $("#posInfoJson").val(JSON.stringify(data.trmIfs));

                //回填-商户类别
                var mercPreferenceType =  data.tBapMecIfPo.mecBusiType;
                if(mercPreferenceType == undefined){
                    console.log("==>没有查询到，商户类别");
                }else{
                    $('#merchantClassify').val(mercPreferenceType);
                    if(mercPreferenceType =='01'){
                        $("#merchantClassifyShow").val("标准类");
                    }else if(mercPreferenceType =='02'){
                        $("#merchantClassifyShow").val("优惠类");
                    }else if(mercPreferenceType =='03'){
                        $("#merchantClassifyShow").val("减免类");
                    }else if(mercPreferenceType =='04'){
                        $("#merchantClassifyShow").val("特殊优惠类");
                    }
                }

                //回填商户等级
                var mecNormalLevel = data.tBapMecIfPo.mecNormalLevel;
                console.log("商户等级是："+mecNormalLevel);
                if(mecNormalLevel == '11'){
                    mecNormalLevel = '10'
                }
                $("#hiddenMecNormalLevelFinal").val(mecNormalLevel);
                $("#mecNormalLevel").val(mecNormalLevel);
                $("#mecNormalLevel").trigger("change");
                $("#mecNormalLevel").trigger("chosen:updated");

                //回填-商户编号 或者 总店分店信息 TODO 待确认
                if(flag=="1"){
                    $("#merchantCode").val(data.tBapMecIfPo.mno);
                }else if(flag == "0"){
                    var parentMercId = data.tBapMecIfPo.mno;// 隶属总店商编
                    var parentMercNm = data.tBapMecIfPo.cprRegNmCn;// 隶属总店注册名称
                    $("#subjectionMerchantCode").val(parentMercId);
                    $('#subjectionMerchantName').val(parentMercNm);
                }

                var mercPreferenceType =  data.tBapMecIfPo.mecBusiType;
                //回填-协议编号(隐藏域)　
                var agrno = data.tBapMecIfPo.agrno;
                $('#agreementCode').val(agrno);

                //回填-特殊商户
                var little = data.tBapMecIfPo.isXw;
                if(little != null && little != undefined && little !="")
                    little = little.substring(1,2);
                $("#specialMerchant").val(little);
                //$("#specialMerchant").trigger("change"); //TODO 待确认
                // 回填商户类型
                var mercMod = data.tBapMecIfPo.mecTypeFlag;
                //设置对私结算账号名隐藏域

                $("#toPrivateAccountName").val(data.stmBnks.actNm)
                //设置对私结算账号隐藏域
                $("#toPrivateHiddenSettleAccountNo").val(data.stmBnks.actNo)

                $('#receiptsName').val(data.tBapMecIfPo.mecDisNm);// 回填-签购单名称
                console.log("**************************")
                console.log(mercMod)
                if(flag == "1"){
                    if(mercMod=="00"){
                        $("#merchantType").val("1");
                    }else if(mercMod=="01"){
                        $("#merchantType").val("2");
                    }else if(mercMod=="02"){
                        $("#merchantType").val("3");
                    }else if(mercMod=="03"){
                        $("#merchantType").val("4");
                    }else if(mercMod=="04"){
                        $("#merchantType").val("5");
                    }
                    //$("#merchantType").val("3");//TODO 临时设置,方便调试系统信息是否回填
                    mtchange();//触发change事件
                }

                //回填法人姓名

                //回填-分店设置
                var independentModel = data.oaFunSw.independentModel;//独立结算
                var menbersShare = data.oaFunSw.menbersShare//会员共享
                var allowAudit = data.oaFunSw.allowAudit;//允许查账

                //--->老系统注释：修改商户信息为分店时不操作分店设置和隶属商户商户编号名称
                if(flag == "1"){
                    //设置分点设置是否被选中
                    if((mercMod == '02' || mercMod == '04')){

                    }
                    //TODO 老代码等于"0"，代表开启状态，待确认
                    //独立结算
                    if(independentModel != undefined && independentModel=="0"){
                        $("#branchShopSet1").prop('checked',true);
                    }else{
                        $("#branchShopSet1").prop('checked',false);
                    }
                    //会员共享
                    if(menbersShare != undefined && menbersShare=="1"){
                        $("#branchShopSet2").prop('checked',true);
                    }else{
                        $("#branchShopSet2").prop('checked',false);
                    }
                    //允许查账
                    if(allowAudit != undefined && allowAudit=="1"){
                        $("#branchShopSet3").prop('checked',true);
                    }else{
                        $("#branchShopSet3").prop('checked',false);
                    }
                    //触发-独立结算，check事件
                    if($('#branchShopSet1').prop('checked')){
                        $('#branchShopSet1').trigger('checked');
                    }

                    var childMercTyp = $("#mercTyp").val();
                    var mecTypeFlag = '';
                    if(childMercTyp == "3")
                        mecTypeFlag = "01";	//连锁总店
                    else if(childMercTyp == "5")
                        mecTypeFlag = "03";	//1+N总店
                    var parentMercId = data.tBapMecIfPo.parentInMno;
                    $("#parentMercId").val(parentMercId);
                    //TODO 获取隶属商户注册名称
                    if(parentMercId != undefined && parentMercId !=''){
                        // $.ajax({
                        //     url: '/mercInfoUpdate/getAffiliatedMerchantRegNmByMercId.do?mno='+parentMercId+'&mecTypeFlag='+mecTypeFlag,
                        //     cache: false,
                        //     async:true,
                        //     success: function(parentMercNm) {
                        //         if(parentMercNm == null || parentMercNm==''){
                        //             alert('无法获取隶属商户名称!');
                        //         }else{
                        //             $("#parentMercNm").val(parentMercNm);
                        //         }
                        //     }
                        // });
                    }
                }
                console.log("@@@@@@@@@@@@@@@@@@@@@@@经营名称"+data.tBapMecIfPo.cprOperNmCn);
                console.log("@@@@@@@@@@@@@@@@@@@@@@经营概述"+data.tBapMecIfPo.busOverview);
                $('#businessName').val(data.tBapMecIfPo.cprOperNmCn);// 回填-商户经营名称
                //$("#businessName").val(data.tBapMecIfPo.busOverview);//商户经营概述


                $('#mainManageBusiness').val(data.tBapMecIfDetailPo.operScope);// 回填-经营范围
                $("#legalPersonName").val(data.tBapMecIfDetailPo.legPerNm)
                // 回填-营业地址(装机地址)
                var merctrddesc=data.tBapMecIfDetailPo.busAddr;
                var mercProv=data.tBapMecIfPo.mecProvCd;
                var mercCity=data.tBapMecIfPo.mecCityCd;
                var mercTown=data.tBapMecIfPo.mecDistCd;
                $('[name=bindAddrProvinceHidden]').val(mercProv);
                $('[name=bindAddrCityHidden]').val(mercCity);
                $('[name=bindAddrAreaHidden]').val(mercTown);
                startPCA("provincespan","cityspan",      "areaspan",  "bindAddressProvince",  "bindAddressCity", "bindAddressArea",   "bindAddrProvinceHidden", "bindAddrCityHidden",  "bindAddrAreaHidden");
                setTimeout(function () {
                    if(merctrddesc!=null && merctrddesc!=undefined && merctrddesc!=""){
                        merctrddesc=merctrddesc.replace($("#bindAddressProvince option:selected").text(),"");
                        merctrddesc=merctrddesc.replace($("#bindAddressCity option:selected").text(),"");
                        merctrddesc=merctrddesc.replace($("#bindAddressArea option:selected").text(),"");
                        $('[name=bindAddressStreet]').val(merctrddesc);
                    }
                },600);
                //回填-营业时间
                var startTime = data.tBapMecIfDetailPo.operStt;
                if(startTime !=null && startTime != undefined &&startTime!="" && startTime.length >=4){
                    $('#businessStartTime').val(startTime.substring(0,2));
                }else{
                    $('#businessStartTime').val('09');
                }
                var endTime = data.tBapMecIfDetailPo.operEdt;
                if(endTime !=null && endTime != undefined &&endTime!="" && endTime.length >=4){
                    console.log("*********endTime**************")
                    console.log(endTime);
                    $('#businessEndTime').val(endTime.substring(0,2));
                }else{
                    $('#businessStartTime').val('00');
                }
                $('#siteArea').val(data.tBapMecIfDetailPo.operArea);//回填-营业用地面积
                $('#linkmanName').val(data.tBapMecIfDetailPo.contNmCn);//回填-联系人姓名
                $('#linkmanMobileNo').val(data.tBapMecIfDetailPo.contTelNo);// 回填-联系人手机号电话
                // $('#telNo').val(data.tBapUsrIfCrpPo.contTelNo);// TODO 找不到-回填-联系人电话
                $('#serviceTel').val(data.tBapMecIfPo.csTelNo);// 回填-商户客服电话
                $('#managerPhone').val(data.tBapMecIfDetailPo.mecAdminTel);// 回填-管理员手机号

                // 商户归属机构 TODO 如何回填设置
                var orgNo = data.tBapMecItnAttrIfPo.orgNo;
                $('#orgNo').val(orgNo);
                //根据机构编号查询机构名称
                $.ajax({
                    url:"/merchantIncomeModify/getOrgName",
                    data:{orgNo:orgNo},
                    type:"POST",
                    success:function(data){
                        console.log("========getOrgName==============");
                        console.info(data);
                        console.log("==========getOrgName============");

                        $('#belongToOrg').val(data);
                    }
                })
                //$("#salesmanName").val(data.tBapMecItnAttrIfPo.empNm);
                $('#salesmanCode').val(data.tBapMecItnAttrIfPo.empNo);
                //add by hss 获取除dubbo以外的回显信息
                $.ajax({
                    url:"/totalShop/findDetails",
                    data:{merchantCode:merchantCode},
                    type:"POST",
                    success:function(data){
                        console.log("*********findDetails*************");
                        // console.log(json);
                        var findDetails=JSON.stringify(data);
                        console.info(findDetails);
                        console.log("=========findDetails=============");
                        $('#findDetails').val(findDetails);

                        //$('#salesmanCode').val(data.salesmanCode);//回填业务员编号
                        $('#salesmanName').val(data.salesmanName);         //回填业务员名称
                        $('#subjectionMerchantCode').val(data.subjectionMerchantCode);       //回填隶属商户编号
                        $('#subjectionMerchantName').val(data.subjectionMerchantName);       //回填隶属商户名称
                        $('#bankTeamwork').val(data.bankTeamwork).trigger("change");         //银行合作
                        $('#customClassifyText').val(data.customClassifyText).trigger("change"); //自定义分类
                        $('#bankTeamworkSign').val(data.bankTeamworkSign);
                        $('#bankTeamworkSignText').val(data.bankTeamworkSignText).trigger("change");//合作银行标识
                        $('#hideCustomerManagerBank').val(data.customerManagerBank);
                        $('#hideCustomerManager').val(data.customerManager);
                        $('#customerManagerBank').val(data.customerManagerBank).trigger("change"); ;//合作银行标识
                        $('#customerManager').val(data.customerManager);

                        /**
                         * 自定义标签回填customClassify
                         */
                        $('#customClassify').val(data.customClassify).trigger("change"); //自定义分类
                    }
                })
                //end by hss
                //回填-拓展类型
                var mecDevTyp = data.tBapMecItnAttrIfPo.mecDevTyp;
                mecDevTyp = mecDevTyp.substring(mecDevTyp.length-1,mecDevTyp.length);
                var mercDevTypArray = ['直营','机构代理','伙伴拓展'];
                if(mecDevTyp == "3" || mecDevTyp == "4"){
                    mecDevTyp = '3';
                }
                $('#expandType').html("<option value='"+mecDevTyp+"'>"+mercDevTypArray[parseInt(mecDevTyp)-1]+"</option>");
                //$('#devOfficerNm').val(data.tBapMecItnAttrIfPo.devOfficerNm);//拓展员名称
                //$('#devOfficerNo').val(data.tBapMecItnAttrIfPo.devOfficerNo);//拓展员编号
                //TODO 不知是什么逻辑，此处暂时注销
                //if(mecDevTyp == "2"){
                //$('#busManName').val(data.tBapMecItnAttrIfPo.empNm);//业务员名称
                //$('#busManNo').val(data.tBapMecItnAttrIfPo.empNo);//业务员编号
                //}


                //$('#salesmanName').val(data.tBapMecItnAttrIfPo.empNm);// 业务员名称
                //$('#salesmanName').val(data.tBapMecItnAttrIfPo.empNo);// 业务员名称
                //$("#salesmanName").trigger("chosen:updated");
                //$('#salesmanCode').val(data.tBapMecItnAttrIfPo.empNo);// 业务员编号
                //回填-费率信息设置
                //add by lcf 2016-07-23 查询商户当前生效费率产品信息并展示到（newMccInfoDiv 中）
                console.log("1111111111111111111111111111111111111");
                console.log(mercPreferenceType);
                console.log("2222222222222222222222222222222222222");
                // getCurrentRateAgreement(data.tBapMecIfPo.inMno,data.tBapMecIfPo.agrno,mercPreferenceType);
                //getCurrentRateAgreement(data.tBapMecIfPo.inMno,data.tBapMecIfPo.agrno,'01');
                //获取费率
                //getCurrentRateInfo(data.tBapMecIfPo.inMno,data.tBapMecIfPo.agrno,'01')

                var feeRateList = eval(data.tBapMecRatePo);
                var feeRateNum = feeRateList.length;	//费率记录的条数
                //	因为T9接口中返回费率信息是没有排序的，所以需要判断哪条记录为预设费率信息
                var rec2EffDtBigThanRec1 = true;//第二条记录的费率生效日期大于第一条，如果为ture第二条记录为为预设费率
                if(feeRateNum>1){
                    var rec1EffDt = feeRateList[0].effDt;
                    var rec2EffDt = feeRateList[1].effDt;
                    var rec1Year = parseInt(rec1EffDt.substring(0,4));
                    var rec2Year = parseInt(rec2EffDt.substring(0,4));
                    var rec1Mon = parseInt(rec1EffDt.substring(4,6));
                    var rec2Mon = parseInt(rec2EffDt.substring(4,6));
                    var rec1Day = parseInt(rec1EffDt.substring(6,8));
                    var rec2Day = parseInt(rec2EffDt.substring(6,8));
                    if(rec1Year > rec2Year){
                        rec2EffDtBigThanRec1 = false;
                    }else if(rec1Year == rec2Year && rec1Mon > rec2Mon){
                        rec2EffDtBigThanRec1 = false;
                    }else if(rec1Year == rec2Year && rec1Mon == rec2Mon && rec1Day > rec2Day){
                        rec2EffDtBigThanRec1 = false;
                    }
                }
                // lcf 2016-7-27 费率、金牌商户相关逻辑
                var feeRate1 = {};
                var feeRate2 = {};//预设费率信息
                if(feeRateNum == 1){
                    feeRate1 = feeRateList[0];
                }else if(feeRateNum > 1){
                    if(rec2EffDtBigThanRec1 == true){
                        feeRate1 = feeRateList[0];
                        feeRate2 = feeRateList[1];
                    }else{
                        feeRate1 = feeRateList[1];
                        feeRate2 = feeRateList[0];
                    }
                }

                //设置预设费率 TODO 待确认信息
                //$("#feeRate1").removeAttr("disabled");
                $("#merchantMccId").val(feeRate1.mccCd);//行业编号 TODO 待确认字段信息

                //回填-行业大类
                $("#businessClassify").val(feeRate1.mccCd);
                var mercTrddesc = feeRate1.idtTypOa;
                if(mercTrddesc == '1001'){
                    $("#businessClassify").append('<option value="1" selected="selected" >餐娱类</option>');
                    $("#businessClassify").val('1');
                }

                else if(mercTrddesc == '3001'){
                    $("#businessClassify").append('<option value="2" selected="selected" >一般类</option>');
                    $("#businessClassify").val('2');
                }
                else if(mercTrddesc == '2001'){
                    $("#businessClassify").append('<option value="3" selected="selected" >民生类</option>');
                    $("#businessClassify").val('3');
                }
                else if(mercTrddesc == '1002'){
                    $("#businessClassify").append('<option value="4" selected="selected" >房产汽车类</option>');
                    $("#businessClassify").val('4');
                }
                else if(mercTrddesc == '3002'){
                    $("#businessClassify").append('<option value="5" selected="selected" >批发类</option>');
                    $("#businessClassify").val('5');
                }
                else if(mercTrddesc == '4001'){
                    $("#businessClassify").append('<option value="6" selected="selected" >公益类</option>');
                    $("#businessClassify").val('6');
                }
                $("#businessClassify").trigger("change");//TODO 优化回显时的信息提示
                if(data.oaFunSw.isCreditCard=="1"){
                    $('#allowCreditCard').prop('checked',true);
                    $("#allowCreditCard").val("1");//是否允许信用卡
                }else{
                    $("#allowCreditCard").prop('checked',false);
                    $("#allowCreditCard").val("0");//是否允许信用卡
                }
                //功能授理
                var bnkPayCard = data.oaFunSw.bnkPayCard;//一般刷卡
                var bnkPreAu = data.oaFunSw.bnkPreAu;//预授权
                var bnkReturnGoods = data.oaFunSw.bnkReturnGoods;//在线退货
                if(bnkPayCard=='1'){
                    $('#functionAcceptanceSettle1').prop('checked',true);
                }else{
                    $('#functionAcceptanceSettle1').prop('checked',false);
                }
                if(bnkPreAu=='1'){
                    $('#functionAcceptanceSettle2').prop('checked',true);
                }else{
                    $('#functionAcceptanceSettle2').prop('checked',false);
                }
                if(bnkReturnGoods=='1'){
                    $('#functionAcceptanceSettle3').prop('checked',true);
                }else{
                    $('#functionAcceptanceSettle3').prop('checked',false);
                }

                //TODO [是否允许信用卡]页面没有显示，此处没有设置
                // if(data.oaFunSw.isCreditCard=="1"){
                //     $('#isCreditCard').prop('checked',true);
                //     $("#isCreditCard").val("1");//是否允许信用卡
                // }else{
                //     $("#isCreditCard").prop('checked',false);
                //     $("#isCreditCard").val("0");//是否允许信用卡
                // }

                //POS申请信息设置 TODO 待处理
                //.......................


                //回填商户性质
                $('#registName').val(data.tBapMecIfPo.cprRegNmCn);//注册名称
                oldMap['registName']=data.tBapMecIfPo.cprRegNmCn;//设置初始注册名称
                var mercNature=data.tBapUsrIfCrpPo.cprTyp;	//商户性质
                if(mercNature=='08')
                    $("#merchantNature").val('1');
                else if(mercNature=='10')
                    $("#merchantNature").val('2');
                else if(mercNature=='11')
                    $("#merchantNature").val('3');
                //$("#merchantNature").trigger("change");

                //TODO 回填银行合作

                //TODO 回填自定义分类

                //*******************************************
                //************【资质信息】设置******************
                //*******************************************
                //获取注册地址详情的字符串
                var array = [];
                if(data.tBapMecIfDetailPo.cprRegAddr != null && data.tBapMecIfDetailPo.cprRegAddr != '' && data.tBapMecIfDetailPo.cprRegAddr.indexOf('-') != -1){
                    array = data.tBapMecIfDetailPo.cprRegAddr.split('-');
                    //回填注册地址到select2控件
                    var provinceCode = getCodeByAreaName(1,array[0]);
                    var cityCode = getCodeByAreaName(provinceCode,array[1]);
                    var areaCode = getCodeByAreaName(cityCode,array[2]);

                    $('[name=registAddrProvinceHidden]').val(provinceCode);
                    $('[name=registAddrCityHidden]').val(cityCode);
                    $('[name=registAddrAreaHidden]').val(areaCode);

                    startPCA("r_provincespan","r_cityspan","r_areaspan",  "registAddressProvince","registAddressCity","registAddressArea", "registAddrProvinceHidden","registAddrCityHidden","registAddrAreaHidden");
                    $("#r_cityspan").trigger("change");
                }
                $('#registAddressStreet').val(array[3]);//注册地址,TODO 仅设置了街道，待确认省市区信息
                $('#registCode').val(data.tBapMecIfDetailPo.operLicNo);//注册登记号
                oldMap['registCode']=data.tBapMecIfDetailPo.operLicNo;
                var busExpFlg=data.tBapMecIfDetailPo.operLicLeffFlg;//营业执照是否长期有效
                //不加busExpFlg == undefined的判断条件是因为T9迁移过程中丢失了一部分数据
                if(busExpFlg=='00'){
                    $('#licenseAlwaysEnabled').prop('checked',false);
                    clicklicenseEff();
                    var operLicEffStt = data.tBapMecIfDetailPo.operLicEffStt;
                    var operLicEffEdt = data.tBapMecIfDetailPo.operLicEffEdt;
                    if(isNotEmpty(operLicEffStt)){
                        var start =operLicEffStt.substring(0,4)+"-"+operLicEffStt.substring(4,6)+"-"+operLicEffStt.substring(6,8);
                        $('#licenseStartTime').val(start);//执照有效期开始
                    }
                    if(isNotEmpty(operLicEffEdt)){
                        var end =operLicEffEdt.substring(0,4)+"-"+operLicEffEdt.substring(4,6)+"-"+operLicEffEdt.substring(6,8);
                        $('#licenseEndTime').val(end);//执照有效期结束
                    }
                    if(operLicEffStt=='19000101'&&operLicEffEdt=='20991231'){
                        $('#licenseAlwaysEnabled').prop('checked',true);
                        clicklicenseEff();
                    }
                }else{
                    $('#licenseAlwaysEnabled').prop('checked',true);
                    clicklicenseEff();
                }
                //$('#legalPersonName').val(data.tBapMecIfDetailPo.legPerNm);//法人姓名
                $("#legalPersonName").val(data.tBapMecIfDetailPo.legPerNm)
                oldMap['legalPersonName']=data.tBapMecIfDetailPo.legPerNm;
                var cardType=data.tBapMecIfDetailPo.legPerCrdTyp;//法人证件类型
                var cardTypNew='';
                if(cardType=='00')cardTypNew='1';
                if(cardType=='03')cardTypNew='2';
                if(cardType=='04')cardTypNew='3';
                if(cardType=='05')cardTypNew='4';
                if(cardType=='06')cardTypNew='5';
                if(cardType=='07')cardTypNew='6';
                if(cardType=='99')cardTypNew='7';
                $("#legalPersonLicenseType").val(cardTypNew);
                //$("#legalPersonLicenseType").trigger("change");
                $('#legalPersonCode').val(data.tBapMecIfDetailPo.legPerCrdNo==undefined?"":data.tBapMecIfDetailPo.legPerCrdNo);//证件号码
                console.log("=NO=>法人证件号:"+data.tBapMecIfDetailPo.legPerCrdNo)
                var crpidexpFlag=data.tBapMecIfDetailPo.legCrdLeffFlg;//法人证件是否长期有效
                if(crpidexpFlag=='00'){
                    $('#cardAlwaysEnabled').prop('checked',false);
                    clicklegalCredentials();
                    var legCrdEffStt = data.tBapMecIfDetailPo.legCrdEffStt;
                    var legCrdEffEdt = data.tBapMecIfDetailPo.legCrdEffEdt;
                    if(isNotEmpty(legCrdEffStt)){
                        var start =legCrdEffStt.substring(0,4)+"-"+legCrdEffStt.substring(4,6)+"-"+legCrdEffStt.substring(6,8);
                        $('#cardStartTime').val(start);//执照有效期开始
                    }
                    if(isNotEmpty(legCrdEffEdt)){
                        var end =legCrdEffEdt.substring(0,4)+"-"+legCrdEffEdt.substring(4,6)+"-"+legCrdEffEdt.substring(6,8);
                        $('#cardEndTime').val(end);//执照有效期结束
                    }
                    if(legCrdEffStt=='19000101'&&legCrdEffEdt=='20991231'){
                        $('#cardAlwaysEnabled'). prop('checked',true);
                        clicklegalCredentials();
                    }
                }else{
                    $('#cardAlwaysEnabled'). prop('checked',true);
                    clicklegalCredentials();
                }
                $('#taxRegistLicense').val(data.tBapMecIfDetailPo.taxRegNo);//税务登记号
                $('#orgCode').val(data.tBapMecIfDetailPo.orgCod);//机构代码
                console.log("=NO=>税务登记号:"+data.tBapMecIfDetailPo.taxRegNo)
                console.log("=NO=>机构代码:"+data.tBapMecIfDetailPo.orgCod)
                console.log("***********End***************")



                //*******************************************
                //************【结算信息】设置******************
                //*******************************************
                console.log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~开始回填结算信息~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                if(flag == '1'){
                    // 朝富通
                    if (data.mecBusTypePo != undefined) {
                        var zftFlg = data.mecBusTypePo.zftFlg;
                        if (zftFlg == '01') {
                            $("#ifZft").val("01");
                        } else if (zftFlg == '02') {
                            $("#ifZft").val("02");
                        } else {
                            $("#ifZft").val("00");
                        }
                    }

                    //--------非工作日
                    if(data.offDayStmt == '1'){
                        $('#ifNonworkdaySettle').prop('checked',true);
                        // 此处隐藏“添加结算卡”链接
                        //$("#operateSettleCard").hide();//TODO 待确认为何在此处隐藏"结算卡连接"
                    }else{
                        $('#ifNonworkdaySettle').prop('checked',false);
                    }

                    //--------即日付
                    if(data.newTZeroStmt == 1){
                        $('#ifIntradaySettle').prop('checked',true);
                        $('#intradayPayCounterFee').val(data.newTjrfRate);
                    }else if(data.newTZeroStmt == 2){
                        $('#ifIntradaySettle').prop('checked',false);
                        //即日付暂停状态的商户，不允许开通
                        $('#ifIntradaySettle').click(function(){
                            alert('即日付为暂停状态，不允许重新开通！');
                            return false;
                        });
                    }else{
                        $('#ifIntradaySettle').prop('checked',false);
                    }
                    //---------其他消费开关
                    if(data.tBapMecIfPo.qrcodeFlg != undefined && data.tBapMecIfPo.qrcodeFlg == '1'){
                        $("#ifOtherConsumption").val("on");
                    }
                    //--------随意通
                    if(data.tZeroStmt == '1'){
                        $('#ifSuiYiTongSettle').prop('checked',true);
                        //ifChecked('ifSuiYiTongSettle','sytDiv1','sytDiv2');//随意通,触发状态事件
                        console.log("===>随意通限额:"+data.tZeroLimit);
                        $("#suiYiTongQuota").val(data.tZeroLimit);//回填-随意通限额
                        $("#suiYiTongCountrFee").val(data.tZeroCharge);//回填-随意通手续费
                        $("#suiYiTongQuota").attr('readonly', 'readonly');//回填-随意通限额
                        $("#suiYiTongCountrFee").attr('readonly', 'readonly');//回填-随意通手续费
                        if(data.tZeroLimit == '10000'){
                            $("#suiYiTongQuota").html('<option value="10000" selected="selected" >10,000元</option>');
                        }else if(data.tZeroLimit == '20000'){
                            $("#suiYiTongQuota").html('<option value="20000" selected="selected" >20,000元</option>');
                        }else if(data.tZeroLimit == '50000'){
                            $("#suiYiTongQuota").html('<option value="50000" selected="selected" >50,000元</option>');
                        }else if(data.tZeroLimit == '100000'){
                            $("#suiYiTongQuota").html('<option value="100000" selected="selected" >100,000元</option>');
                        }
                        //$("#operation6").hide(); //todo 待确认
                        // 隐藏“添加结算卡”链接
                        //$("#operation6").hide();
                        //已开通随意通的商户，走信息变更时不允许关闭 TODO checkbox设置后，click事件是无效的不能触发
                        // $('#ifSuiYiTongSettle').click(function(){
                        //     alert('随意通暂未提供取消开通功能！');
                        //     return false;
                        // });
                    }else if(data.tZeroStmt == '2'){
                        //$('#tZeroStmtFlag').val('2');//todo 待确认值?

                        $('#ifSuiYiTongSettle').prop('checked',false);
                        //随意通暂停状态，不允许开通
                        // $('#ifSuiYiTongSettle').click(function(){
                        //     alert('随意通为暂停状态，不允许开通！');
                        //     return false;
                        // });
                    }else{
                        $('#ifSuiYiTongSettle').prop('checked',false);
                    }
                    //$('#ifSuiYiTongSettle').attr('disabled', 'disabled');
                    //$('#ifIntradaySettle').attr('disabled', 'disabled');
                    $("#ifSuiYiTongSettle").click(function () {
                        return false;
                    });
                    $('#ifIntradaySettle').click(function () {
                        return false;
                    });
                    console.log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                    console.log(data.tBapUsrStmIfPo);
                    //回填-商户日切时间
                    if(data.tBapUsrStmIfPo != undefined && data.tBapUsrStmIfPo.stmTm != undefined){
                        var tps = data.tBapUsrStmIfPo.stmTm.split(',');
                        //var tps = "09,10,13".split(',');//测试使用
                        console.log("==================日切时间==:"+tps);
                        var tpsLen=tps.length;
                        if(tpsLen > 0){
                            var timePoint = parseInt(tps[0]);
                            console.log("=>:"+timePoint);
                            $("#merchantDayChangeTime").val(timePoint).trigger("change");//日切时间 TODO 为啥取第一个值
                            for(var i = 0;i<tps.length;i++){
                                if(tps[i] == "09"){
                                    $("#automaticSettleTime9").prop("checked",true);
                                }else if(tps[i] == "10"){
                                    $("#automaticSettleTime10").prop("checked",true);
                                }else if(tps[i] == "11"){
                                    $("#automaticSettleTime11").prop("checked",true);
                                }else if(tps[i] == "12"){
                                    $("#automaticSettleTime12").prop("checked",true);
                                }else if(tps[i] == "13"){
                                    $("#automaticSettleTime13").prop("checked",true);
                                }else if(tps[i] == "14"){
                                    $("#automaticSettleTime14").prop("checked",true);
                                }else if(tps[i] == "15"){
                                    $("#automaticSettleTime15").prop("checked",true);
                                }else if(tps[i] == "16"){
                                    $("#automaticSettleTime16").prop("checked",true);
                                }else if(tps[i] == "17"){
                                    $("#automaticSettleTime17").prop("checked",true);
                                }else if(tps[i] == "20"){
                                    $("#automaticSettleTime20").prop("checked",true);
                                }
                            }//end for
                        }//end if
                    }//end if
                }//end if flag=1

                //如果开通了随意通或非工作日结算，则不允许开通预授权
                if($("#ifSuiYiTongSettle").prop('checked') || $("#ifNonworkdaySettle").prop('checked')){
                    //功能受理-预授权
                    if($("#functionAcceptanceSettle2").prop('checked')){
                        $("#functionAcceptanceSettle2").prop('checked',false);
                    }

                    //预付卡-功能受理-预授权
                    if($("#functionAcceptancePrepaidCard2").prop('checked')){
                        $("#functionAcceptancePrepaidCard2").prop('checked',false);
                    }
                }

                //回填-是否隔日对账
                var nextDayDeal = data.oaFunSw.nextDayDeal;
                if(nextDayDeal=='1'){
                    $('#ifNextSettle').prop('checked',true);
                }else{
                    $('#ifNextSettle').prop('checked',false);
                }

                $('#settleDayCount').val(data.tBapUsrStmIfPo==undefined ?"" : data.tBapUsrStmIfPo.payTrfDays);//回填-结算天数
                $('#startSettleMoney').val(data.tBapUsrStmIfPo==undefined ?"" : data.tBapUsrStmIfPo.minStmAmt);//回填-起始结算金额


                //回填-结算卡信息
                var stmBanks = data.stmBnks;
                console.log("==================结算卡信息=======================");
                console.log(stmBanks);

                //如果是连锁分店或者(1+N分店)
                if(($("#merchantType").val()=='3' || $("#merchantType").val()=='5')){
                    //如果"独立结算"被勾选,则显示'添加结算卡操作'连接
                    if($("#branchShopSet1").prop('checked')){
                        $('#operateSettleCard').show();
                    }else{
                        $('#operateSettleCard').hide();
                    }
                }else{
                    $('#operateSettleCard').show();
                }

                //如果[总店查询]回填-->是连锁分店或者(1+N分店)
                if(($("#merchantType").val()=='3' || $("#merchantType").val()=='5')  && flag=='0'){
                    //setHiddenBankInfo(stmBanks); //设置结算卡信息到隐藏域 TODO 暂时不设置
                    var stmActTyp1=stmBanks[defaultSettleCardIndex].actTyp;//结算账户类型1
                    if(stmActTyp1=='00'){
                        $("#settleHoAccountType1").val("1");
                    }else{
                        $("#settleHoAccountType1").val("2");
                    }
                    if(stmBanks.length >= 2) {
                        var stmActTyp2 = stmBanks[secondSettleCardIndex].actTyp;//结算账户类型2
                        if (stmActTyp2 == '00') {
                            $("#settleHoAccountType2").val("1");
                        } else {
                            $("#settleHoAccountType2").val("2");
                        }
                    }
                }

                //如果是[商户修改]回填
                if( flag=='1'){
                    //setHiddenOldBankInfo(stmBanks); //设置结算卡信息到隐藏域,用于标记变动信息 TODO 暂时不设置
                }

                if(($("#merchantType").val()=='3' || $("#merchantType").val()=='5') && $("#branchShopSet1").prop('checked') && flag=='0'){
                    //do nothing
                }else{
                    //如果是分店且是统一结算，需要将总店信息保存到Hidden区域中
                    if(($("#merchantType").val()=='3' || $("#merchantType").val()=='5') && $("#parentMercId").val()!='' && flag=='1'){
                        if(!$("#branchShopSet1").prop('checked')){

                            //todo 临时不处理
                            //setHiddenBankInfo(stmBanks);   //-------------jingxl保存到隐藏域中-------------------
                            var stmActTyp2=stmBanks[secondSettleCardIndex].actTyp;//结算账户类型2
                            if(stmActTyp2=='00'){
                                $("#settleHoAccountType2").val("1");
                            }else{
                                $("#settleHoAccountType2").val("2");
                            }

                            // //隐藏“结算卡操作”链接
                            $("#operateSettleCard").hide();
                            //
                            //把2张结算卡下的输入框设置为只读
                            /*var settleInfoInputIds = ['toPrivateAccountName','toPrivateSettleAccountNo','toPrivateSettleAccountNoTwo','settleManidNumber',
                                'toPublicAccountName','toPublicSettleAccountNo','settleManidNumber2'];
                            for(var i=0;i<settleInfoInputIds.length;i++){
                                $('#'+settleInfoInputIds[i]).attr('readonly','readonly');
                            }*/
                            $("#accountLegalPersonName").attr('readonly','readonly');//账户法人姓名设为只读
                        }
                    }

                    //TODO 结算卡设置，待处理 modify by liyang 20161122
                    if(stmBanks!=null && stmBanks!=undefined && stmBanks.length>0){
                        console.log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~开始赋值结算卡信息~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                        var defaultSettleCardIndex = 0;
                        for(var i=0;i<stmBanks.length;i++){
                            var stmBank = stmBanks[i];
                            if(stmBank.stmMetNo != undefined && stmBank.stmMetNo == '01'){
                                defaultSettleCardIndex = i;
                            }
                        }
                        var stmActTyp1=stmBanks[defaultSettleCardIndex].actTyp;//结算账户类型1
                        if(stmActTyp1=='00'){
                            $("#settleAccountType1").val("1");
                            $('#accountLegalPersonName').val(stmBanks[defaultSettleCardIndex].legPerNm);
                            var opDiv = $('#accountLegalNmDiv');//账户法人姓名DIV
                            var legalName = $('#accountLegalPersonName');//账户法人姓名控件
                            opDiv.removeClass("hidden");
                            legalName.removeClass("hidden");
                        }else{
                            $("#settleAccountType1").val("2");
                            $("#settleManidNumberDiv").show();
                            $("#accountLegalNmDiv").addClass("hidden");
                        }

                        console.log(stmBanks)






                        //     $("#firstStmActTyp").trigger("chosen:updated");
                        //     $('#firstStmBankCd').val(stmBanks[defaultSettleCardIndex].bnkCd);
                        //     //获取结算银行名称
                        //     getBankNameByBankCd('text','firstStmBankName',stmBanks[defaultSettleCardIndex].bnkCd);
                        //     $('#firstProvCd').val(stmBanks[defaultSettleCardIndex].lbnkProv);//结算银行1所在省编号
                        //     $('#firstCityCd').val(stmBanks[defaultSettleCardIndex].lbnkCity);//结算银行1所在市编号
                        //     //获取结算银行归属省市信息
                        //     getBankAttrProvAndCity('text','firstProvName',stmBanks[defaultSettleCardIndex].lbnkProv,'firstCityName',stmBanks[defaultSettleCardIndex].lbnkCity);
                        //     $('#firstStmBankDetail').val(stmBanks[defaultSettleCardIndex].lbnkDesc);//结算银行详细1
                        $('#toPrivateCnapsCode').val(stmBanks[defaultSettleCardIndex].lbnkNo);//联行行号1
                        oldMap['toPrivateCnapsCode']=stmBanks[defaultSettleCardIndex].lbnkNo;//联行行号1隐藏
                        $('#toPrivateAccountName').val(stmBanks[defaultSettleCardIndex].actNm);//结算账户名1
                        $('#toPrivateSettleAccountNo').val(stmBanks[defaultSettleCardIndex].actNo); //结算账号1
                        oldMap['toPrivateSettleAccountNo']=stmBanks[defaultSettleCardIndex].actNo
                        $('#toPrivateSettleAccountNoTwo').val(stmBanks[defaultSettleCardIndex].actNo); //结算账号1
                        //$('#settleManidNumber').val(stmBanks[defaultSettleCardIndex].idCardNo);
                        //oldMap['settleManidNumber']=stmBanks[defaultSettleCardIndex].idCardNo



                        //根据联行行号 查询银行详细信息 赋值汉字

                        //$("#"+elementID+"").append(new Option(textVal, idVal, false, true));
                        if( stmBanks[defaultSettleCardIndex].lbnkNo != 'undefined' && stmBanks[defaultSettleCardIndex].lbnkNo != '' ){
                            $.ajax({
                                url: '/merchantIncome/autoComplete',
                                data:{
                                    q:stmBanks[defaultSettleCardIndex].lbnkNo
                                },
                                async : true,
                                cache: true,
                                success : function(resultJson) {
                                    $("#toPrivateOpenbankInfomation").append(new Option(resultJson.items[0].text,resultJson.items[0].text, false, true));
                                    $("#toPrivateOpenbankInfomationOld").append(new Option(resultJson.items[0].text,resultJson.items[0].text, false, true));
                                    oldMap['toPrivateOpenbankInfomation']=resultJson.items[0].text;
                                }
                            });
                        }
                        //     $('#stmInfoUuid1').val(stmBanks[defaultSettleCardIndex].uuid); //结算信息1uuid
                        //     for(var i=0;i<hoSettleCardInputIds.length;i++){
                        //         $('#first'+hoSettleCardInputIds[i]).trigger('blur');
                        //     }
                        //
                        //加载账户法人姓名
                        /**默认结算卡账户类型为对公时账户户名与注册名称如不一致，需录入结算账户法人姓名及身份证号
                         如一致，则取法人姓名字段的值作为账户法人姓名的字段值进行保存。*/
                        var firstStmActTyp = $("#settleAccountType1").val();//默认结算账户类型，1为对公，2为对私
                        var firstStmActNm = $("#toPrivateAccountName").val();//账户户名
                        var mercRegNm = $("#registName").val();//注册名称
                        var legalNm = $("#legalPersonName").val();//法人姓名
                        var stmLegalNm=$("#accountLegalPersonName").val();//账户法人姓名
                        oldMap['toPrivateAccountName'] = firstStmActNm
                        if(firstStmActTyp==1){
                            if(firstStmActNm != mercRegNm){
                                $("#accountLegalNmDiv").show();
                                $("#settleManidNumberDiv").show();
                            }else{
                                $("#accountLegalNmDiv").hide();
                                $("#settleManidNumberDiv").show();
                                $("#accountLegalPersonName").val(legalNm);
                            }
                        }else{
                            // $("#accountLegalNmDiv").hide();
                        }
                        //     stmLegalNm1=$("#accountLegalPersonName").val();
                        //     $("#stmLegalNmHo").val(stmLegalNm1);
                        //     $("#stmLegalNm").trigger('blur');
                        //     //如果存在两张结算卡，需要获取非默认结算卡的下标  显示为取消卡2
                        if(stmBanks.length >= 2){
                            $('#operateSettleCardLink').html('点击取消结算卡二');
                            var secondSettleCardIndex = 0;
                            if(defaultSettleCardIndex == 0)
                                secondSettleCardIndex = 1;
                            var stmActTyp2=stmBanks[secondSettleCardIndex].actTyp;//结算账户类型2
                            if(stmActTyp2=='00'){
                                $("#settleAccountType2").val("1");
                                $("#settleManidNumber2Div").hide();
                            }else{
                                $("#settleAccountType2").val("2");
                                $("#settleManidNumber2Div").show();
                            }
                            // $("#secondStmActTyp").trigger("chosen:updated");
                            // $('#secondStmBankCd').val(stmBanks[secondSettleCardIndex].bnkCd);
                            // //获取结算银行名称
                            // getBankNameByBankCd('text','secondStmBankName',stmBanks[secondSettleCardIndex].bnkCd);
                            // $('#secondProvCd').val(stmBanks[secondSettleCardIndex].lbnkProv);//结算银行1所在省编号
                            // $('#secondCityCd').val(stmBanks[secondSettleCardIndex].lbnkCity);//结算银行1所在市编号
                            // //获取结算银行归属省市信息
                            // getBankAttrProvAndCity('text','secondProvName',stmBanks[secondSettleCardIndex].lbnkProv,'secondCityName',stmBanks[secondSettleCardIndex].lbnkCity);
                            // $('#secondStmBankDetail').val(stmBanks[secondSettleCardIndex].lbnkDesc);//结算银行详细1
                            $('#toPublicCnapsCode').val(stmBanks[secondSettleCardIndex].lbnkNo);//联行行号2
                            $('#toPublicAccountName').val(stmBanks[secondSettleCardIndex].actNm);//结算账户名2
                            oldMap['toPublicAccountName'] = stmBanks[secondSettleCardIndex].actNm
                            $('#toPublicSettleAccountNo').val(stmBanks[secondSettleCardIndex].actNo); //结算账号2
                            oldMap['toPublicSettleAccountNo'] = stmBanks[secondSettleCardIndex].actNo
                            $('#toPublicSettleAccountNoTwo').val(stmBanks[secondSettleCardIndex].actNo); //结算账号2
                            // $('#secondIdCardNo').val(stmBanks[secondSettleCardIndex].idCardNo);
                            $('#settleManidNumber2').val(stmBanks[secondSettleCardIndex].idCardNo); //结算信息2uuid
                            oldMap['settleManidNumber2'] = stmBanks[secondSettleCardIndex].idCardNo;
                            if(stmBanks[secondSettleCardIndex].lbnkNo != 'undefined' && stmBanks[secondSettleCardIndex].lbnkNo != ''){
                                $.ajax({
                                    url: '/merchantIncome/autoComplete',
                                    data:{
                                        q:stmBanks[secondSettleCardIndex].lbnkNo
                                    },
                                    async : true,
                                    cache: true,
                                    success : function(resultJson) {
                                        $("#toPublicOpenbankInfomation").append(new Option(resultJson.items[0].text,resultJson.items[0].text, false, true));
                                    }
                                });
                            }
                            // for(var i=0;i<hoSettleCardInputIds.length;i++){
                            //     $('#second'+hoSettleCardInputIds[i]).trigger('blur');
                            // }
                            //显示结算卡2
                            $('#settleCard2Info').show();

                            // 隐藏“添加结算卡”链接
                        }
                    }
                }


                //*******************************************
                //************【费用信息】设置******************
                //*******************************************
                var mainteFee=data.oaFunSw.maintCharFlg;//是否收取维护费
                if(mainteFee=='01'){
                    $('#ifWeiHuTong').prop('checked',true);//维护通选中
                    ifChecked('ifWeiHuTong','whtDiv');//《维护通》触发的状态事件
                    var chargingMod=data.tBapMecFeeInfoPo.charMod;
                    if(chargingMod=='01'){//收取模式 TODO 目前是隐藏域赋值保存，没有显示控件
                        $("#collectPattern").val('2');
                    }else{
                        $("#collectPattern").val('1');
                    }

                    var chargingWay=data.tBapMecFeeInfoPo.charMeth;//收取方式  TODO 目前是隐藏域赋值保存，没有显示控件
                    if(chargingWay=='01')
                        $("#collectWay").val('1');
                    else if(chargingWay=='02')
                        $("#collectWay").val('2');
                    else if(chargingWay=='03')
                        $("#collectWay").val('3');

                    var freeCycle=data.tBapMecFeeInfoPo.maintFreeMon;//免收周期 TODO 目前是隐藏域赋值保存，没有显示控件
                    if(freeCycle=='0')
                        $("#freePeriod").val('1');
                    else if(freeCycle=='1')
                        $("#freePeriod").val('2');
                    else if(freeCycle=='2')
                        $("#freePeriod").val('3');
                    else if(freeCycle=='3')
                        $("#freePeriod").val('4');

                    $('#expectCollectAmount').val(data.tBapMecFeeInfoPo.preCharAmt);//预收金额

                    $('#collectAmount').val(data.tBapMecFeeInfoPo.mtFee);//收取金额 TODO 找不到对应的值
                    $('#freeOrigin').val(data.tBapMecFeeInfoPo.validAmtMin);//免收起点
                    $('#minTradeQuantity').val(data.tBapMecFeeInfoPo.validTimesMin);//最低有效交易笔数

                    var calcurFlag=data.tBapMecFeeInfoPo.calCurMonFlag;//当月是否收取维护费
                    if(calcurFlag==1){
                        $('#ifCurrentMonthCollectFee').prop('checked',true);
                    }else{
                        $('#ifCurrentMonthCollectFee').prop('checked',false);
                    }

                    $('#singleMachineCollectFee').val(data.tBapMecFeeInfoPo.mtfeeLanAdsl);//TODO 待确认 单台收取维护费 =? 单台收取金额 以太网/拨号POS

                    $('#freeCollectQuantityNet').val(data.tBapMecFeeInfoPo.freeNumLan);//免收台数  以太网/拨号POS

                    //$('#feeAmtGprs').val(data.tBapMecFeeInfoPo.mtfeeGprs);//单台收取金额 GPRS TODO 少一这个属性

                    $('#freeCollectQuantityGprs').val(data.tBapMecFeeInfoPo.freeNumGprs);//免收台数  GPRS

                }else if(mainteFee=='02'){
                    $("#ifMaintainFeeOfPos").prop("checked",true);//POS维护费
                    ifChecked('ifMaintainFeeOfPos','posDiv');//《POS维护费》触发的状态事件

                    //如果是日累计扣费
                    if(data.tBapMecFeeInfoPo.isDayLeiji=='01'){
                        $('#ifMaintainFeeOfPos2').attr('checked',true);
                        $('#ifMaintainFeeOfPos3').attr('checked',false);
                    }else if(data.tBapMecFeeInfoPo.isDayLeiji=='00'){
                        $('#ifMaintainFeeOfPos2').attr('checked',false);
                        $('#ifMaintainFeeOfPos3').attr('checked',true);
                    }

                    $('#maintainFeeOfPos').val(data.tBapMecFeeInfoPo.mtFee);//POS维护费收取金额

                }else{
                    $('#ifWeiHuTong').prop('checked',false);
                    $('#ifMaintainFeeOfPos2').attr('checked',false);//清空日累计扣费
                    $('#ifMaintainFeeOfPos3').attr('checked',false);//清空日非累计扣费
                    $('#maintainFeeOfPos').val("");//清空POS维护费收取金额
                    ifChecked('ifWeiHuTong','whtDiv');//《维护通》触发的状态事件
                }


                //*******************************************
                //************【功能信息】设置******************
                //*******************************************

                //预付卡信息
                var prepCrd = data.tBapMecPrepCrdPo;
                if(prepCrd != undefined){
                    var preMercId = prepCrd.preMecId;
                    if(preMercId!=null && preMercId != undefined && preMercId!=""){
                        $('#ifPrepaidCard').prop('checked',true);
                    }else{
                        $('#ifPrepaidCard').prop('checked',false);
                    }
                    ifChecked('ifPrepaidCard','preH','preDiv1','preDiv2');// 预付卡单击处理事件

                    $("#gaoHuiTongMerchantCode").val(preMercId);//回填-高汇通商户编

                }else{
                    $('#ifPrepaidCard').prop('checked',false);
                    ifChecked('ifPrepaidCard','preH','preDiv1','preDiv2');// 预付卡单击处理事件
                }

                //预付卡--->功能受理设置
                var func1=data.oaFunSw.prePayCard;
                var func2=data.oaFunSw.prePreAu;
                var func3=data.oaFunSw.preReturnGoods;
                if(func1=='1'){
                    $('#functionAcceptancePrepaidCard1').prop('checked',true);
                }else{
                    $('#functionAcceptancePrepaidCard1').prop('checked',false);
                }
                if(func2=='1'){
                    $('#functionAcceptancePrepaidCard2').prop('checked',true);
                }else{
                    $('#functionAcceptancePrepaidCard2').prop('checked',false);
                }
                if(func3=='1'){
                    $('#functionAcceptancePrepaidCard3').prop('checked',true);
                }else{
                    $('#functionAcceptancePrepaidCard3').prop('checked',false);
                }

                //回填-交行外卡信息
                // var foreignCards = data.tBapMecForeCrdS;
                // if(foreignCards.length > 0 ){
                //     for(var i = 0; i<foreignCards.length;i++){
                //         if(foreignCards[i].foreignCcyCardTyp == "02"){
                //             if(foreignCards[i].feeRateVisa !=""){
                //                 $('#ifOutBCMCard').prop('checked',true);//设置"交行外卡"
                //             }else{
                //                 $('#ifOutBCMCard').prop('checked',false);
                //             }
                //             ifChecked('ifOutBCMCard','bcmH','bcmDiv1','bcmDiv2','bcmDiv3');//交行外卡触发事件
                //
                //             $('#rateVisa').val(foreignCards[i].feeRateVisa);
                //             $('#rateMaster').val(foreignCards[i].feeRateMaster);
                //             $('#rateAmericanExpress').val(foreignCards[i].feeRateAmericanExpress);
                //             $('#rateDiners').val(foreignCards[i].feeRateDiners);
                //             $('#rateJCB').val(foreignCards[i].feeRateJcb);
                //             $('#rateVISADCC').val(foreignCards[i].feeVisaDcc);
                //             $('#rateMCDCC').val(foreignCards[i].feeMcDcc);
                //         }
                //     }
                // }else{
                //     $('#ifOutBCMCard').prop('checked',false);
                //     ifChecked('ifOutBCMCard','bcmH','bcmDiv1','bcmDiv2','bcmDiv3');//交行外卡触发事件
                // }

                //************************************************************************************
                //************************************POS信息设置**************************************
                //************************************************************************************
                var posList = eval(data.trmIfs);
                if(posList.length > 0 ){
                    for(var i=0;i<posList.length;i++){
                        if(posList[i].isHavePinPad == "01"){
                            $('#isHavePinPad'+(i+1)).prop('checked',true);
                        }else{
                            $('#isHavePinPad'+(i+1)).prop('checked',false);
                        }
                        var trmCommModName = "trmCommMod"+(i+1);
                        var trmModName = "trmMod"+(i+1);
                        var trmQuantityName = "trmQuantity"+(i+1);
                        var trmRentalFeeName = "trmRentalFee"+(i+1);
                        $("#"+trmCommModName).val(parseInt(posList[i].trmCommMod));//通讯方式
                        $("#"+trmCommModName).trigger("chosen:updated");//触发change事件
                        fillPosModelByCommMode(trmCommModName,trmModName,posList[i].trmMod);	//终端型号 TODO 需要动态查询出来,页面是写死的GPRS的POS型号
                        $("#"+trmModName).val(posList[i].trmMod);//POS型号 TODO 要根据上面的函数fillPosModelByCommMode来设置，此处临时手动赋值
                        $("#"+trmQuantityName).val(posList[i].trmQuantity);//POS数量
                        $("#"+trmRentalFeeName).val(posList[i].trmRentalFee);//终端租赁费

                        //重新验证指定字段的信息
                        //revalidateFieldByFieldName('mercInfoForm','trmQuantity'+(i+1));
                        //revalidateFieldByFieldName('mercInfoForm','posInfo'+(i+1)+'.trmRentalFee');
                    }

                    $('#posRemark').val(posList[0].rmk);  //POS备注信息
                }
                //***************************************END***************************************************8

                /**
                 * 风险控制信息
                 */
                $("#businessDescribe").val(data.tBapMecIfPo.busOverview);//商户经营概述
                $("#keywords").val(data.tBapMecIfPo.keyWords);//关键字
                $("#merchantLevel").val(data.tBapMecRiskInfoPo.mecLvl);//商户级别
                var noBran = data.tBapMecRiskInfoPo.noBran;
                $("#noSubCompany").val(noBran);//无分公司
                var mixOper = data.tBapMecRiskInfoPo.mixOper;
                $("#mixBusiness").val(mixOper);//混业经营
                var actAuth = data.tBapMecRiskInfoPo.actAuth;
                $("#accountPrivilege").val(actAuth);//账户授权
                var missData = data.tBapMecRiskInfoPo.missData;
                $("#dataMiss").val(missData);//资料缺失
                var mobPos = data.tBapMecRiskInfoPo.mobPos;
                $("#movePoss").val(mobPos);//移动POS
                var highRisk = data.tBapMecRiskInfoPo.highRisk;
                $("#highRiskBusiness").val(highRisk);//高风险行业
                 getCurrentRateAgreement(data.tBapMecIfPo.inMno,data.tBapMecIfPo.agrno,data.tBapMecIfPo.mecBusiType)
                checkHighOrImmediate(data.tBapMecIfPo.mno);
                setTimeout(function () {
                    getIcsMessage("red",parseInt($("#operateNum").val())+1,"商户变更","Alt");
                },700);


            },
            error:function(xhr, status){
                alert("查询内部异常....。");
                //console.error("查询内部异常");
            }
        })
    }


    /**
     * add by lcf 获取当前生效费率产品信息
     * @param inMno 内部商编
     * @param agreementNo 协议编号
     * @param mercPreferenceType 商户类别
     * 限制修改逻辑：
     * 1、修改商户输入商编，点击查询时，会调计费平台，计费会告诉他这个商户不允许预设费率，将“点击预设费率几个字隐藏”
     * 2、同时在费率那块的页面展示中增加提示：该商户为打包秒到商户，不允许预设费率（这个提示由计费系统給，具体以计费返回参数为准）
     */
    function getCurrentRateAgreement(inMno,agreementNo,mercPreferenceType) {
        $.ajax({
            url: '/merchantIncomeModify/getMecAgreementByMerc',
            data:{
                inMno:inMno,
                agreementNo:agreementNo,
                mecBusiType:mercPreferenceType
            },
            async : true,
            cache: true,
            success : function(resultJson) {
                console.log("--------------查询费率信息-----------------------");
                console.log(resultJson);
                resultJson = eval('('+resultJson+')');
                if(resultJson.resCode == 'CFS0000'){
                    if(resultJson.data != undefined){
                        resultJson.data.justView = true;
                        resultJson.data.preset = false;
                        var template = $('#template').val();
                        $('#rateInfomationID').val(JSON.stringify(resultJson));
                        //设置点击预设计费方式显示内容、状态
                        initRateMessage(resultJson)

                        // {url : '/js/ejs/goods.ejs'}
                        var innerHtml = new EJS({
                            url : '/assets/merchant/ejs/goods.txt'
                            //url : '<%= request.getContextPath()%>/js/ejs/goods.txt'
                        }).render(resultJson.data);
                        $('#newMccInfoDiv').html(innerHtml);
                    }
                }else{
                    OKDialog(resultJson.resMsg);
                }

            }
        });
    }

    function mtchange(){
        var merchantType = $('#merchantType').find('option:selected').val();
        var mt1 = $('#branchDiv');//分店设置DIV
        var mt2 = $('#subjectionDiv');//隶属信息DIV
        var mt3 = $('#showZD');//总店信息按钮
        switch (merchantType) {
            case "3":
            case "5":
                //显示分店与隶属信息
                mt1.removeClass("hidden");
                mt2.removeClass("hidden");
                mt3.removeClass("hidden");
                break;
            default:
                mt1.addClass("hidden");
                mt2.addClass("hidden");
                mt3.addClass("hidden");

                //清空隶属商户、编码信息
                $('#subjectionMerchantCode').val("");
                $('#subjectionMerchantName').val("");
                //恢复默认状态-分店设置选择项
                $('#branchShopSet1').is(':checked')?"":$('#branchShopSet1').trigger('click');
                $('#branchShopSet2').is(':checked')?"":$('#branchShopSet2').trigger('click');
                $('#branchShopSet3').is(':checked')?$('#branchShopSet3').trigger('click'):"";

        }
        if((merchantType=='3' || merchantType=='5')) {
        }else{
            //清空结算信息并设置可编辑状态
            // clearSettleInfo("toPrivate");
            // clearSettleInfo("toPublic");
        }


        //====================重新加载数据(去除4省等信息)=========================
        //装机地址数据
        startPCA("provincespan", "cityspan", "areaspan", "bindAddressProvince", "bindAddressCity", "bindAddressArea", "bindAddrProvinceHidden", "bindAddrCityHidden", "bindAddrAreaHidden");
        //注册地址数据
        startPCA("r_provincespan", "r_cityspan", "r_areaspan", "registAddressProvince", "registAddressCity", "registAddressArea", "registAddrProvinceHidden", "registAddrCityHidden", "registAddrAreaHidden");
    }






    //****************省、市、区*******************************************
    //移除4省份
    function removeProvince(elementID) {
        //[730-黑龙江省]、[647-吉林省]、[512-辽宁省]、[1050-浙江省]
        $("#" + elementID + " option").each(function (index, item) {
            if ($("#" + elementID + " option[value='730']").length == 1) {
                $("#" + elementID + " option[value='730']").remove();
            }
            if ($("#" + elementID + " option[value='647']").length == 1) {
                $("#" + elementID + " option[value='647']").remove();
            }
            if ($("#" + elementID + " option[value='512']").length == 1) {
                $("#" + elementID + " option[value='512']").remove();
            }
            if ($("#" + elementID + " option[value='1050']").length == 1) {
                $("#" + elementID + " option[value='1050']").remove();
            }
        });
    }

    //[提交]form前的验证
    $('#commitBtn').click(function(){
        var currentTime = new Date().getTime();
        if ( currentTime - loadTime < 6000 ) {
            return false;
        }
        loadTime = currentTime;
        var flag = true;
        var cardNo = $('#settleManidNumber').val();
        var reg = /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/g;
        if (cardNo.length == 0 ) {
            console.log("没有数据不发起请求.");
            OKDialog("结算人身份证号不能为空.");
            return false ;
        } else if (!reg.test(cardNo)) {
            console.log("请输入15或18位身份证号.");
            OKDialog("请输入15或18位身份证号.");
            return false;
        } else {
            //if(cardNo != oldMap['settleManidNumber']) {
                $.ajax({
                    url: "/merchantIncome/blacklist",
                    data: {'cardNo': cardNo},
                    type: "POST",
                    dataType: "json",
                    async: false,
                    success: function (json) {
                        console.log(json);
                        if (json.result == "1") {
                            var returnObj = eval("(" + json.returnMsg + ")")
                            if (returnObj.bFlag == true) {
                                OKDialogCallBack("结算身份证号存在风险，禁止进件！", 'settleManidNumber');
                                flag = false;
                            }
                        } else {
                            console.log("结算人身份证号:" + cardNo + " 正常.")
                        }
                    },
                    error: function (xhr, status) {
                        flag = false;
                    }
                });
            //}
        }

        if(!flag){
            return false;
        }

        $("#tipsInfo").val($("#newShowChangeMessage").html());
        var validateFileSize = uploadFileSize();

        if(validateFileSize == false){
            return false;
        }
        //---------TODO 验证---------
        var rateInfomation= $("#rateInfomationID").val();
        //TODO 若点击了预设费率则对预设费率进行验证并赋值
        if(!$('.preRateInfomationCom').is(':hidden')){

            var preBusinessClassify = $("#preBusinessClassify").val();
            if(preBusinessClassify == ""){
                OKDialog('尚未选中预设行业大类,请先选择预设行业大类再进行此操作');
                return false;
            }
            var preRateInfomation = checkAndMake();
            //add by lcf，如果未选择计费方式，返回值为null，给出提示，并不做下一步动作
            if(preRateInfomation == null){
                OKDialog('尚未选中计费方式,请先选择计费方式再进行此操作');
                return false;
            }
            else{
                //若选择了计费方式，判断验证是否通过
                if(preRateInfomation == undefined || preRateInfomation == false){
                    OKDialog("预设费率信息填写不完整!");
                    return false;
                }
                //验证通过，获取计费信息，封顶信息赋值给隐藏标签用于数据库保存
                $("#preRateInfomationId").val(JSON.stringify(preRateInfomation));
                // if(isCapped()){
                //     $("#isCap1").val("1");
                //     //如果封顶，设置封顶值
                //     $('#capAmt1').val(getCappedValue());
                // }else{
                //     $("#isCap1").val("0");
                //     $('#capAmt1').val("");
                // }
            }
        }
        //资质信息-->商户性质设置,TODO 待确认是否设置

        //POS列表信息Json数据封装 POS通讯方式-trmCommMod1    POS型号-trmMod1   POS数量(台)-trmQuantity1   POS终端租赁费(元/台)-trmRentalFee1    是否带密码键盘-isHavePinPad1
        var jsonArray=[];
        var posObj1={};
        posObj1.trmCommMod=$('#trmCommMod1').val();
        posObj1.trmMod=$('#trmMod1').val();
        posObj1.trmQuantity=$('#trmQuantity1').val();
        posObj1.trmRentalFee=$('#trmRentalFee1').val();
        posObj1.isHavePinPad=$("#isHavePinPad1").prop('checked')?"1":"0";
        posObj1.rmk=$('#posRemark').val();
        jsonArray.push(posObj1);
        var posObj2={};
        posObj2.trmCommMod=$('#trmCommMod2').val();
        posObj2.trmMod=$('#trmMod2').val();
        posObj2.trmQuantity=$('#trmQuantity2').val();
        posObj2.trmRentalFee=$('#trmRentalFee2').val();
        posObj2.isHavePinPad=$("#isHavePinPad2").prop('checked')?"1":"0";
        jsonArray.push(posObj2);
        var posObj3={};
        posObj3.trmCommMod=$('#trmCommMod3').val();
        posObj3.trmMod=$('#trmMod3').val();
        posObj3.trmQuantity=$('#trmQuantity3').val();
        posObj3.trmRentalFee=$('#trmRentalFee3').val();
        posObj3.isHavePinPad=$("#isHavePinPad3").prop('checked')?"1":"0";
        jsonArray.push(posObj3);
        var posObj4={};
        posObj4.trmCommMod=$('#trmCommMod4').val();
        posObj4.trmMod=$('#trmMod4').val();
        posObj4.trmQuantity=$('#trmQuantity4').val();
        posObj4.trmRentalFee=$('#trmRentalFee4').val();
        posObj4.isHavePinPad=$("#isHavePinPad4").prop('checked')?"1":"0";
        jsonArray.push(posObj4);

        console.log("---------------POS信息列表------------------------")
        console.log(jsonArray);

        var posJsonMsg=JSON.stringify(jsonArray);

        console.log(posJsonMsg);
        $('#posInfoJson').val(posJsonMsg);//保存到隐藏域
        console.log("---------------End------------------------")
        if(!$('.preRateInfomationCom').is(':hidden')){
            $('#preRateInfo').hide();
        }
        console.info(!$('#scaffold-update-merchantSmallAndMicroModify').valid())
        //JQueryValidation校验
        if (!$('#scaffold-update-merchantSmallAndMicroModify').valid()) {
            if(!$('.preRateInfomationCom').is(':hidden')){
                $('#preRateInfo').show();
            }
            return false;
        }
        if(!$('.preRateInfomationCom').is(':hidden')){
            $('#preRateInfo').show();
        }
        if(ifEmpty($('#bindAddressProvince').val())
            ||ifEmpty($('#bindAddressCity').val())
            ||ifEmpty($('#bindAddressArea').val())
            ||ifEmpty($('#bindAddressStreet').val())){
            OKDialog("装机地址信息填写不完整.");
            return false;
        }


        function ifEmpty(str){
            var flag =  false;
            if(str == undefined || str == null || $.trim(str)=="" ){
                flag = true;
            }
            return flag;
        }


        enableControl('cardStartTime');
        enableControl('cardEndTime');


        /**  重复次数校验2,提交的时候校验重复次数  */
        flag = true;
        //判断重复次数校验的商户类型(0=[普通商户、1+N总店、1+N分店]  1=[连锁总店、连锁分店])
        var repeatType = '0';
        var v = $('#merchantType').val();
        if (v == '2' || v == '3') {
            //连锁总店/连锁分店
            repeatType = '1';
        }

        //商户等级类型
        var mecNormalLevel = judgeLevelForValidate($('#mecNormalLevel').val());

        //>>>3.结算人身份证号,重复次数校验
        var findVal = $('#settleManidNumber').val();
        if (findVal.length > 0  && ifCheckRepeat('settleManidNumber',findVal,mecNormalLevel)) {
            $.ajax({
                url: '/merchantIncome/settleCardNoRepeat',
                data: {merchantType: repeatType, cardNo: findVal,mecNormalLevel:mecNormalLevel},
                type: "POST",
                dataType: "json",
                async: false,
                success: function (json) {
                    if (json.code == "1") {
                        console.log("结算人身份证号Yes")
                    } else {
                        OKDialogCallBack("结算人身份证的重复次数超出系统限制，请联系相关人员！", 'settleManidNumber');
                        flag = false;
                    }
                },
                error: function (xhr, status) {
                    console.log("--------------结算人身份证重复次数校验,异常.--------------------")
                    flag = false;
                }
            });
        }
        if(!flag){
            return false;
        }

        //>>>>>6.个体结算账号重复次数校验
        findVal = $('#toPrivateSettleAccountNo').val();
        if (findVal.length > 0  && ifCheckRepeat('toPrivateSettleAccountNo',findVal,mecNormalLevel)) {
            $.ajax({
                url: '/merchantIncome/settleAccountNoRepeat',
                data: {merchantType: repeatType, accoutNo: findVal,mecNormalLevel:mecNormalLevel},
                type: "POST",
                dataType: "json",
                async: false,
                success: function (json) {
                    if (json.code == "1") {
                        console.log("结算账号Yes")
                    } else {
                        OKDialogCallBack("结算账号的重复次数超出系统限制，请联系相关人员！", 'toPrivateSettleAccountNo');
                        flag = false;
                    }
                },
                error: function (xhr, status) {
                    console.log("--------------结算账号-重复次数校验,异常.--------------------")
                    flag =false;
                }
            });
        }
        if(!flag){
            return false;
        }

       //验证必填图片
        var imgFlag=editCheckImage();
        if(!imgFlag){
            return false;
        }
        var cls = $(this).children("i").attr("class");
       if (flag) {
            //修改时先保存操作的图片历史记录
            if (cls == "fa fa-update") {
                try {
                    saveHistoryImg();
                } catch (err) {
                    //flag=false;
                    console.error("上传图片失败");
                }

            }
        }
        return true;

    });

    //移除福建省的，除厦门外的其他市
    function removeCity(elementID) {
        $("#" + elementID + " option").each(function (index, item) {
            var fval = $(item).val();
            if ('1321' == fval || '' == fval) {
                //不移除"厦门市"
            } else {
                $("#" + elementID + " option[value='" + fval + "']").remove();
            }
        });
    }

    //****************省、市、区*******************************************

    //装机地址数据
    startPCA("provincespan","cityspan",      "areaspan",  "bindAddressProvince",  "bindAddressCity", "bindAddressArea",   "bindAddrProvinceHidden", "bindAddrCityHidden",  "bindAddrAreaHidden");

    //注册地址数据
    startPCA("r_provincespan","r_cityspan","r_areaspan",  "registAddressProvince","registAddressCity","registAddressArea", "registAddrProvinceHidden","registAddrCityHidden","registAddrAreaHidden");

    /**
     * 加载省、市、区 数据并支持回显数据
     * @param provincespan 省份显示位置的div的ID
     * @param cityspan 市显示位置的div的ID
     * @param areaspan 区显示位置的div的ID
     *
     * @param name_province_val 省份的name属性
     * @param name_city_val 市的name属性
     * @param name_area_val 区的name属性
     *
     * @param provinceHidden 省的隐藏域ID
     * @param cityHidden 市的隐藏域ID
     * @param areaHidden 区的隐藏域ID
     */
    function startPCA(provincespan,cityspan,areaspan,name_province_val,name_city_val,name_area_val,provinceHidden,cityHidden,areaHidden){
        $.ajax({
            url: '/common/findProvince',
            data: {nameParam:""+name_province_val+"",q_province:$('[name='+provinceHidden+']').val()},
            async:false,
        }).done(function(data) {
            $("#"+provincespan+"").html(data);
            $("#"+name_province_val+"").select2();

            //商户类型不是"连锁分店"则需要删除4省
            if ($('#merchantType').val() != '3') {
                removeProvince(name_province_val);
            }
        }).fail(function (e, data)   {
            console.log("error:findProvince");
        }).always(function() {
            //console.log("complete:findProvince");
        });

        var cityHidden = $('[name='+cityHidden+']').val();
        var areaHidden = $('[name='+areaHidden+']').val();
        if(cityHidden){
            getCity($('[name='+provinceHidden+']').val(),cityHidden,cityspan,name_city_val);
            // if(areaHidden){
            getArea(cityHidden,areaHidden,areaspan,name_area_val);
            // }
        }

        $("#"+provincespan+"").on('change',function () {
            var province = $("#"+name_province_val+"").val();
            $('#'+provinceHidden+'').val(province);
            if(!province){
                return false;
            }
            //初始化市、区下拉框
            initCityArea(cityspan,areaspan);
            getCity(province,'',cityspan,name_city_val);
            $("#scaffold-update-merchantSmallAndMicroModify").validate().element("#" + name_province_val + "");
            getShowMessage($("#"+name_province_val+""),"2","red",$("#tipsOperateNum").val(),"Alt");
            //getTipsMessage(cssColor,count,taskName);
        });

        $("#"+cityspan+"").on('change',function () {
            var city = $("#"+name_city_val+"").val();
            $('#'+cityHidden+'').val(city);
            if(!city){
                return false;
            }
            //初始化市、区下拉框
            initCityArea('',areaspan);
            getArea(city,'',areaspan,name_area_val);
            $("#scaffold-update-merchantSmallAndMicroModify").validate().element("#" + name_city_val + "");
            getShowMessage($("#"+name_city_val+""),"2","red",$("#tipsOperateNum").val(),"Alt");
        });

        $("#"+areaspan+"").on('change',function () {
            var area = $("#"+name_area_val+"").val();
            $('#'+areaHidden+'').val(area);
            $("#scaffold-update-merchantSmallAndMicroModify").validate().element("#" + name_area_val + "");

            getShowMessage($("#"+name_area_val+""),"2","red",$("#tipsOperateNum").val(),"Alt");
        });

        //窗口加载时，就初始化市、区下拉框
        initCityArea(cityspan,areaspan);
    }


    /**
     *重复校验规则
     * 1.商户等级不为空且符合以下规则进行校验
     * 2.商户等级无论是否变化，该项修改，必须进行校验
     * 3.等级提升，所有项，必须校验
     * 4.商户等级降低，只需按规则2校验
     */
    function ifCheckRepeat(id,findVal,mecNormalLevel){
        var ifCheckRepeat = false;
        if(oldMap[id] != findVal){
            ifCheckRepeat = true;
        }
        return ifCheckRepeat;
    }



    ////窗口加载时，就初始化市、区下拉框
    function initCityArea(cityspan,areaspan){
        if(cityspan!=''){
            $("#"+cityspan+"").html("<select class='form-control select2'><option>请选择</option></select>");
        }
        if(areaspan!=''){
            $("#"+areaspan+"").html("<select class='form-control select2'><option>请选择</option></select>");
        }
    }

    function getCity(province, q_city, showDivID, name_val) {
        $.ajax({
            url: '/common/findCity',
            data: {nameParam: "" + name_val + "", province: province, q_city: q_city},
        }).done(function (data) {
            $("#" + showDivID + "").html(data);
            $("#" + name_val + "").select2();
            if ('1305' == province) {
                //除“厦门市”其余全部删除
                if ($('#merchantType').val() != '3') {
                    removeCity(name_val);
                }
            }
        }).fail(function (e, data) {
            console.log("error");
        }).always(function () {
            //console.log("complete");
        });
    }
    function getArea(city,q_area,showDivID,name_val) {
        $.ajax({
            url: '/common/findArea',
            data: {nameParam:""+name_val+"",city:city,q_area:q_area},
        }).done(function(data) {
            $("#"+showDivID+"").html(data);
            $("#"+name_val+"").select2();
        }).fail(function (e, data)   {
            console.log("error");
        }).always(function() {
            //console.log("complete");
        });
    }



    /**
     * 营业执照是否长期有效按钮事件
     */
    function clicklicenseEff(){
        if($('#licenseAlwaysEnabled').prop('checked')){
            disableControl('licenseStartTime');
            disableControl('licenseEndTime');
            $('#licenseStartTime').val('1900-01-01');
            $('#licenseEndTime').val('2099-12-31');
        }else{
            enableControl('licenseStartTime');
            enableControl('licenseEndTime');
        }
    }

    /**
     * 法人证件号是否长期有效按钮事件
     */
    function clicklegalCredentials(){
        if($('#cardAlwaysEnabled').prop('checked')){
            disableControl('cardStartTime');
            disableControl('cardEndTime');
            $('#cardStartTime').val('1900-01-01');
            $('#cardEndTime').val('2099-12-31');
        }else{
            enableControl('cardStartTime');
            enableControl('cardEndTime');
        }
    }


    /**
     * 设置表单控件不可编辑
     * @param name
     */
    function disableControl(name){
        $('#'+name).attr('disabled','disabled');
    }
    /**
     * 设置表单控件可编辑
     * @param name
     */
    function enableControl(name){
        $('#'+name).removeAttr('disabled');
    }
    /**
     * 设置表单控件只读
     * @param name
     */
    function readonlyControl(name){
        $('#'+name).attr('readonly','readonly');
    }
    /**
     * 设置表单控件可编辑
     * @param name
     */
    function removeReadonlyControl(name){
        $('#'+name).removeAttr('readonly');
    }

    //自定义分类-标签check处理
    function labelCheckFun(obj){
        var ifcheck=$(obj).is(':checked');
        var oldDataV=$('#customClassify').val();
        var oldDataT=$('#customClassifyText').val();
        var v=$(obj).attr('data-my-val');
        var t=$(obj).attr('data-my-text');
        if(ifcheck){
            var array=oldDataV.split(',');
            if(array.length>=15){
                OKDialog('最多只能选择15个标签');
                return false;
            }
            var rv=oldDataV==''?v:oldDataV+','+v;
            var rt=oldDataT==''?t:oldDataT+','+t;
            $('#customClassify').val(rv);
            $('#customClassifyText').val(rt);
        }else{
            var arrayV=oldDataV.split(',');
            var arrayT=oldDataT.split(',');
            arrayV.splice($.inArray(v,arrayV),1);
            arrayT.splice($.inArray(t,arrayT),1);

            $('#customClassify').val(arrayV.join(','));
            $('#customClassifyText').val(arrayT.join(','));
        }
    }


    /**
     * 根据checkbox显示与隐藏指定的元素
     * @param elementID为checkbox的ID
     * @param 可变参数arguments:要显示与隐藏的Element的ID
     */
    function ifChecked(elementID){

        //如果没有checkbox的ID，直接退出
        if(elementID.length==0)
            return false;

        //当前checkbox的选择状态
        var hasChk=$('#'+elementID+'').is(':checked');

        //遍历可变参数arguments控制显示与隐藏子元素
        for (var i = 1; i  <= arguments.length; i++) {
            var element = arguments[i];
            var cdiv=$('#'+element+'');
            if(hasChk){
                cdiv.removeClass("hidden");
            }else{
                cdiv.addClass("hidden");
            }
        }
    }

    //计费接口调用，展示预设计费方式
    function renderx() {

        var rateInfo = $("#preRateInfomationId").val();
        if(null == rateInfo || "" == rateInfo || rateInfo==undefined){
            rateInfo = "";
        }
        $.ajax({
            url: '/merchantIncome/getMecAgreement',   //jingxl--->调用计费接口获取页面及js
            data:{
                rateInfo:rateInfo,
                mecTypeValue:$("#merchantClassify").val()
            },
            async : true,
            cache: true,
            type:"POST",
            // dataType:"json",
            success : function(json) {
                console.log("*************调用成功*****************")
                //console.log(json)
                var resultJson=json.msg;
                console.log("++++++++++++++++++"+resultJson);
                resultJson = eval('('+resultJson+')');
                if(resultJson.resCode == 'CFS0000'){
                    resultJson.data.justView = false;
                    resultJson.data.preset = true;
                    if(resultJson.data.effDt == undefined){
                        resultJson.data.effDt = '';
                    }
                    var template = $('#template').val();
                    var innerHtml = new EJS({
                        //text : template,
                        url : '/assets/merchant/ejs/goods.txt'
                    }).render(resultJson.data);
                    // $('#preGoodsData').val(JSON.stringify(resultJson));
                    $('#preMccInfoDiv').html(innerHtml);
                    if(rateInfo != '' && rateInfo != null){
                        $('#presetRateLink').click();
                    }
                }else{
                    OKDialog(resultJson.resMsg);
                }

            },
            error:function(xhr, status){
                console.log("--------------调用出错!!!--------------------")
                console.log(xhr)
                console.log(status)
            }
        });
    }


    /**
     * 用于提交后台验证不通过时回填pos列表信息
     */
    function backfillPosInfo(){
        var posInfoMsg =  $('#posInfoJson').val();//获取隐藏域信息
        if(posInfoMsg != ""){
            var jsonArray=eval(posInfoMsg);
            for(var i = 1 ;i <= jsonArray.length;i++){
                $('#trmCommMod'+i).val(eval(jsonArray[i-1]).trmCommMod);
                $('#trmMod'+i).val(jsonArray[i-1].trmMod);
                fillPosModelByCommMode('trmCommMod'+i,'trmMod'+i,jsonArray[i-1].trmMod)
                $('#trmQuantity'+i).val(jsonArray[i-1].trmQuantity);
                $('#trmRentalFee'+i).val(jsonArray[i-1].trmRentalFee);
                if(jsonArray[i-1].isHavePinPad==1){
                    $("#isHavePinPad"+i).prop('checked',true);
                }

            }
        }
    }



    /**
     * alert提示信息封装
     * @param msg 要提示的信息内容
     */
    function OKDialog(msg) {
        bootbox.dialog({
            message: msg,
            closeButton: true,
            title:"提示",
            buttons: {
                success: {
                    label: "确定",
                    className: "blue"
                }
            }
        });
    }
    //带有回到函数清空的提示
    function OKDialogCallBack(msg,optionId) {
        bootbox.dialog({
            message: msg,
            closeButton: true,
            title:"提示",
            buttons: {
                success: {
                    label: "确定",
                    className: "blue",
                    callback: function() {
                        $('#'+optionId+'').val("");
                    }
                }
            }
        });
    }


    /**
     * 回显费率信息
     */

    var rateInfo = $("#rateInfomationID").val();
    if(rateInfo != '' && rateInfo != undefined){
        var resultJson=rateInfo;
        resultJson = eval('('+resultJson+')');
        console.log("++++++++++++++++++"+resultJson);
        resultJson.data.justView = true;
        resultJson.data.preset = false;
        resultJson.data.effDt = '';
        var template = $('#template').val();
        var innerHtml = new EJS({
            //text : template,
            url : '/assets/merchant/ejs/goods.txt'
        }).render(resultJson.data);
        //设置点击预设计费方式显示内容、状态
        initRateMessage(resultJson);
        // $('#preGoodsData').val(JSON.stringify(resultJson));
        $('#newMccInfoDiv').html(innerHtml);
    }
    //*********End*********************************************************
    $("#toPrivateSettleAccountNo").on('blur', function () {
        regBankCardIsCorrect(this);
    });
    function regBankCardIsCorrect(bankCardField) {
        var bankno = $(bankCardField).val();
        var lastNum = bankno.substr(bankno.length - 1, 1);//取出最后一位（与luhm进行比较）

        var first15Num = bankno.substr(0, bankno.length - 1);//前15或18位
        var newArr = new Array();
        for (var i = first15Num.length - 1; i > -1; i--) {    //前15或18位倒序存进数组
            newArr.push(first15Num.substr(i, 1));
        }
        var arrJiShu = new Array();  //奇数位*2的积 <9
        var arrJiShu2 = new Array(); //奇数位*2的积 >9

        var arrOuShu = new Array();  //偶数位数组
        for (var j = 0; j < newArr.length; j++) {
            if ((j + 1) % 2 == 1) {//奇数位
                if (parseInt(newArr[j]) * 2 < 9)
                    arrJiShu.push(parseInt(newArr[j]) * 2);
                else
                    arrJiShu2.push(parseInt(newArr[j]) * 2);
            }
            else //偶数位
                arrOuShu.push(newArr[j]);
        }

        var jishu_child1 = new Array();//奇数位*2 >9 的分割之后的数组个位数
        var jishu_child2 = new Array();//奇数位*2 >9 的分割之后的数组十位数
        for (var h = 0; h < arrJiShu2.length; h++) {
            jishu_child1.push(parseInt(arrJiShu2[h]) % 10);
            jishu_child2.push(parseInt(arrJiShu2[h]) / 10);
        }

        var sumJiShu = 0; //奇数位*2 < 9 的数组之和
        var sumOuShu = 0; //偶数位数组之和
        var sumJiShuChild1 = 0; //奇数位*2 >9 的分割之后的数组个位数之和
        var sumJiShuChild2 = 0; //奇数位*2 >9 的分割之后的数组十位数之和
        var sumTotal = 0;
        for (var m = 0; m < arrJiShu.length; m++) {
            sumJiShu = sumJiShu + parseInt(arrJiShu[m]);
        }

        for (var n = 0; n < arrOuShu.length; n++) {
            sumOuShu = sumOuShu + parseInt(arrOuShu[n]);
        }

        for (var p = 0; p < jishu_child1.length; p++) {
            sumJiShuChild1 = sumJiShuChild1 + parseInt(jishu_child1[p]);
            sumJiShuChild2 = sumJiShuChild2 + parseInt(jishu_child2[p]);
        }
        //计算总和
        sumTotal = parseInt(sumJiShu) + parseInt(sumOuShu) + parseInt(sumJiShuChild1) + parseInt(sumJiShuChild2);

        //计算Luhm值
        var k = parseInt(sumTotal) % 10 == 0 ? 10 : parseInt(sumTotal) % 10;
        var luhm = 10 - k;
        if (lastNum != luhm) {
            OKDialog('您输入的卡号有误，请再次确认是否正确！');
        }
    }


    /**  个体  联行号信息-下拉框改变    */
    $('#toPrivateOpenbankInfomation').change(function(){
        var selectObj = $("#toPrivateOpenbankInfomation").select2("data");
        if(selectObj==''){
            $('#toPrivateCnapsCode').val('');
        }
        $('#toPrivateBankName').val(selectObj[0].bankName);//设置个体的银行名称隐藏域
        $('#toPrivateCnapsCode').val(selectObj[0].linkBankNo);//设置联行行号
    });



}else {
    alert("新增商户页面错误：JQuery文件还没有被加载...");
}

/**
 * 点击预设费率相关逻辑
 */
function presetFeeRate(){
    if($('.preRateInfomationCom').is(':hidden')){
        //调用费率信息接口
        if($("#pageType").val() == undefined || $("#pageType").val()!='auditModify'){
            renderx();
        }
        $('.preRateInfomationCom').removeClass("hide");
        $('#presetRateLink').html('取消预设计费方式');
    }else{
        $('#presetRateLink').html('点击预设计费方式');
        $('.preRateInfomationCom').addClass("hide");
        $("#preRateInfomationId").val("");
        destroyTips();
        $('.preRateInfomationId').val("");
        $('#preBusinessClassify').val("").change();
        $('#preBusinessClassify').trigger("chosen:updated");
        if($('#functionAcceptanceSettle2').prop('checked')){
            var classify=$('#businessClassify').find('option:selected').val();
            switch(classify){
                case "1":
                case "2":
                    //do nothing
                    break;
                default:
                    OKDialog("预授权商户必须为一般类或者餐娱类！将关闭预授权");
                    $('#functionAcceptanceSettle2').prop('checked',false);
            }
        }

    }
}

/**
 *根据名称获取省市区
 */
function getCodeByAreaName(code,name){
    var returnCode = '';
    $.ajax({
        type:'POST',
        url:'/common/getCodeByAreaName',
        data:{code:code,name:name},
        async:false,
        success:function(data){
            returnCode = data;
        }
    });
    return returnCode;
};


function isNotEmpty(string) {
    if(string != null && string != undefined && string != ""){
        return true;
    }else{
        return false;
    }
}


/**
 * add by lcf 检查是否为秒到与即日付高额度商户，增加结算人等限制
 * @param mercId
 */
function checkHighOrImmediate(mercId){
    $.ajax({
        url: '/merchantIncomeModify/checkHighOrImmediate?mno='+mercId,
        cache: false,
        async:false,
        dataType:"json",
        success: function(data) {
            if(data == 1){
                var merchantType = $("#merchantType").val();
                //重设商户类型
                if(merchantType == '1')
                    $("#merchantType").html("<option value='1'>普通商户</option>");
                else if(merchantType == '2')
                    $("#merchantType").html("<option value='2'>连锁总店</option>");
                else if(merchantType == '3')
                    $("#merchantType").html("<option value='3'>连锁分店</option>");
                else if(merchantType == '4')
                    $("#merchantType").html("<option value='4'>1+N总店</option>");
                else if(merchantType == '5')
                    $("#merchantType").html("<option value='5'>1+N分店</option>");
                $("#merchantType").val(merchantType);
                $("#merchantType").trigger("chosen:updated");
                // //重设商户结算类型
                var settleAccountType1 = $("#settleAccountType1").val();
                //$("#toPrivateAccountName").attr('readonly','readonly');
                $("#operateSettleCard").hide();
                //1为对公，2为对私
                //结算账户类型为对公：结算账户名不许修改。
                //结算账户类型为对私：结算人姓名，身份证号码均不许修改，卡号和结算银行名称可以修改（卡号目前在系统没有校验直接可以修改）。
                if(settleAccountType1 == '1'){
                    $("#settleAccountType1").html("<option value='1'>对公</option>")
                }else{
                    //$("#settleManidNumber").attr('readonly','readonly');
                    $("#settleAccountType1").html("<option value='2'>对私</option>")
                }
                // $("#firstStmActTyp").val(firstStmActTyp);
                // $("#firstStmActTyp").trigger("chosen:updated");
                //如果有结算卡二信息
                var settleAccountType2 = $("#settleAccountType2").val();
                if(settleAccountType2 != undefined && settleAccountType2 != ""){
                    $("#toPublicAccountName").attr('readonly','readonly');
                    //1为对公，2为对私
                    //结算账户类型为对公：结算账户名不许修改。
                    //结算账户类型为对私：结算人姓名，身份证号码均不许修改，卡号和结算银行名称可以修改（卡号目前在系统没有校验直接可以修改）。
                    if(settleAccountType2 == '1'){
                        $("#settleAccountType2").html("<option value='1'>对公</option>")
                    }else{
                        //$("#settleManidNumber2").attr('readonly','readonly');
                        $("#settleAccountType2").html("<option value='2'>对私</option>")
                    }
                    // $("#secondStmActTyp").val(secondStmActTyp);
                    // $("#secondStmActTyp").trigger("chosen:updated");
                }
            }
        }
    });
}



/**
 * 填充POS型号下拉框，注意：option的value和html为同样的值
 * @param provName
 * @param provValue
 */
function fillPosModelByCommMode(commModeId,posModelId,posModelValue) {
    var commMode = $("#" + commModeId).val();
    //先清空
    $("#" + posModelId).html('');
    if (commMode != '') {
        $.ajax({
            url: '/merchantIncomeModify/getPosModelByPosCommMode',
            data: {
                commMode: commMode
            },
            async: false,
            cache: true,
            success: function (posModelList) {
                if (posModelList != null && posModelList != undefined) {
                    var options = "";
                    for (var i = 0; i < posModelList.length; i++) {
                        if (posModelValue != '') {
                            if (posModelList[i] == posModelValue) {
                                options += "<option selected='selected' value=\"" + posModelList[i] + "\">" + posModelList[i] + "</option>";
                            } else {
                                options += "<option value=\"" + posModelList[i] + "\">" + posModelList[i] + "</option>";
                            }
                        } else {
                            options += "<option value=\"" + posModelList[i] + "\">" + posModelList[i] + "</option>";
                        }
                    }
                    $("#" + posModelId).html(options);
                }
            }
        });
    } else {
        $("#" + posModelId).html('');
    }
    $("#" + posModelId).trigger("chosen:updated");
    var index = commModeId.substr(commModeId.length - 1);
    $("#" + posModelId).trigger('change');
}



//验证必填图片
function editCheckImage(){

    if($("#settlePersonIdcardPositive_red").is(':visible') == true){
        var settlePersonIdcardPositiveBase64Img= $("#settlePersonIdcardPositiveBase64Img").children("img").attr("src");
        if(!settlePersonIdcardPositiveBase64Img){
            OKDialog("请上传结算人身份证正面!");
            return false;
        }
    }
    if($("#settlePersonIdcardOpposite_red").is(':visible') == true){
        var settlePersonIdcardOppositeBase64Img= $("#settlePersonIdcardOppositeBase64Img").children("img").attr("src");
        if(!settlePersonIdcardOppositeBase64Img){
            OKDialog("请上传结算人身份证反面!");
            return false;
        }
    }
    if($("#bankCardPositivePic_red").is(':visible') == true){
        var bankCardPositivePicBase64Img= $("#bankCardPositivePicBase64Img").children("img").attr("src");
        if(!bankCardPositivePicBase64Img){
            OKDialog("请上传银行卡正面!");
            return false;
        }
    }
    if($("#handIdcardPic_red").is(':visible') == true){
        var handIdcardPicBase64Img= $("#handIdcardPicBase64Img").children("img").attr("src");
        if(!handIdcardPicBase64Img){
            OKDialog("请上传手持身份证照片!");
            return false;
        }
    }

    return true;
}


//设置点击预设计费方式显示内容、状态
function initRateMessage(resultJson){
    if(resultJson.forbidPreset!=null&&resultJson.forbidPreset!=undefined&&resultJson.forbidPreset == 1){
        $('#presetRateLink').hide();
        $('#rateMessageId').html(resultJson.data.viewMsg);
        $('#rateMessageId').show();
    }else{
        $('#presetRateLink').show();
        $('#rateMessageId').hide();
    }

}



function validateBankInfo() {
    var validateFlag = true;
    var idsBankArray = ["toPrivateAccountName","toPrivateSettleAccountNo","toPrivateCnapsCode","toPrivateOpenbankInfomation"];
    var idsNameAndNoArray = ["legalPersonName","settleManidNumber"];
    for (var i = 0; i  < idsBankArray.length; i++) {
        var idVal = $("#"+idsBankArray[i]+"").val();
        if(idVal != oldMap[idsBankArray[i]]){
            showBankInfoPhoto();
            $("#bankCardPositivePic_red").show();//银行卡正面
            $("#bankCardPositivePic_red").parent().css("color","red");
            validateFlag = false;
            break;
        }
        if(i== idsBankArray.length-1){
            hideBankInfoPhoto();
            $("#bankCardPositivePic_red").hide();
            $("#bankCardPositivePic_red").parent().removeAttr("style");
        }

    }

    if(validateFlag){
        for (var j = 0; j  < idsNameAndNoArray.length; j++) {
            var idVal2 = $("#"+idsNameAndNoArray[j]+"").val();
            if(idVal2 != oldMap[idsNameAndNoArray[j]]){
                showBankInfoPhoto();
                break;
            }
            if(j== idsBankArray.length-1){
                hideBankInfoPhoto();
            }
        }
    }

}



function showBankInfoPhoto(){
    $("#settlePersonIdcardPositive_red").show();//结算人身份证正
    $("#settlePersonIdcardPositive_red").parent().css("color","red");
    $("#settlePersonIdcardOpposite_red").show();//结算人身份证反面
    $("#settlePersonIdcardOpposite_red").parent().css("color","red");
    $("#handIdcardPic_red").show();//手持身份证照片
    $("#handIdcardPic_red").parent().css("color","red");
}

function hideBankInfoPhoto(){
    $("#settlePersonIdcardPositive_red").hide();
    $("#settlePersonIdcardPositive_red").parent().removeAttr("style");
    $("#settlePersonIdcardOpposite_red").hide();
    $("#settlePersonIdcardOpposite_red").parent().removeAttr("style");
    $("#handIdcardPic_red").hide();
    $("#handIdcardPic_red").parent().removeAttr("style");
}

function settleCardBindOnKeyUp(){
    $("#toPrivateSettleAccountNo,#settleManidNumber").keyup(function(){
        this.value=this.value.replace(/\s/g,'');
    });
}


/**
 * select2(下拉搜索框) 设置值
 * @param elementID为元素的ID
 * @param textVal为option的显示文本
 * @param idVal为option的key值
 */
function setSelect2Value(elementID,textVal,idVal){
    $("#"+elementID+"").append(new Option(textVal, idVal, false, true));
}


function initOldMap(){
    var merchantCode = $("#merchantCode").val();
    $.ajax({
        url:"/totalShop/findMerchantInfoWithoutCheck",
        data:{merchantCode:merchantCode},
        type:"POST",
        dataType:"json",
        success:function(json){
            var data = json.retMercIfPo;
            oldMap['mecNormalLevel'] = data.tBapMecIfPo.mecNormalLevel;
            oldMap['registName']=data.tBapMecIfPo.cprRegNmCn;
            oldMap['registCode']=data.tBapMecIfDetailPo.operLicNo;
            var stmBanks = data.stmBnks;
            var defaultSettleCardIndex = 0;
            for(var i=0;i<stmBanks.length;i++){
                var stmBank = stmBanks[i];
                if(stmBank.stmMetNo != undefined && stmBank.stmMetNo == '01'){
                    defaultSettleCardIndex = i;
                }
            }
            oldMap['settleManidNumber']=stmBanks[defaultSettleCardIndex].idCardNo
            oldMap['toPrivateSettleAccountNo']=stmBanks[defaultSettleCardIndex].actNo
            if(stmBanks.length >= 2) {
                var secondSettleCardIndex = 0;
                if(defaultSettleCardIndex == 0)
                    secondSettleCardIndex = 1;

                oldMap['toPublicAccountName'] = stmBanks[secondSettleCardIndex].actNm
                oldMap['toPublicSettleAccountNo'] = stmBanks[secondSettleCardIndex].actNo
                oldMap['settleManidNumber2']=stmBanks[defaultSettleCardIndex].idCardNo

            }
        }
    })

}

function initOldMapValidate(){
    oldMap['toPrivateAccountName']=$("#toPrivateAccountName").val();
    oldMap['toPrivateSettleAccountNo']=$("#toPrivateSettleAccountNo").val();
    oldMap['toPrivateCnapsCode']=$("#toPrivateCnapsCode").val();
    oldMap['toPrivateOpenbankInfomation']=$("#toPrivateOpenbankInfomation").val();
    oldMap['legalPersonName']=$("#legalPersonName").val();
    oldMap['settleManidNumber']=$("#settleManidNumber").val();
}







