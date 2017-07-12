/**
 *  修改提示
 */
var icsMessage=new Array();
var uptMessage=new Array();
var idText=new Array();
/* 商户基本信息 */
idText["merchantCode"]="商户编号";
idText["merchantType"]="商户类型";
idText["specialMerchant"]="特殊商户";
idText["branchShopSet1"]="独立结算";
idText["branchShopSet2"]="会员共享";
idText["branchShopSet3"]="允许查账";
idText["subjectionMerchantCode"]="隶属商户编号";
idText["subjectionMerchantName"]="隶属商户名称";
idText["businessName"]="经营名称";
idText["receiptsName"]="商户名称";
idText["businessScope"]="经营范围";
idText["mainManageBusiness"]="主营业务";

idText["bindAddressProvince"]="装机地址-省";
idText["bindAddressCity"]="装机地址-市";
idText["bindAddressArea"]="装机地址-区";
idText["registAddressProvince"]="注册地址-省";
idText["registAddressCity"]="注册地址-市";
idText["registAddressArea"]="注册地址-区";

idText["bindAddressStreet"]="营业地址街道";
idText["businessStartTime"]="营业开始时间";
idText["businessEndTime"]="营业结束时间";
idText["siteArea"]="营业用地面积";
idText["linkmanName"]="商户负责人姓名";
idText["linkmanMobileNo"]="联系人手机号";
idText["serviceTel"]="商户客服电话";
idText["managerPhone"]="商户管理员手机号";
idText["expandType"]="拓展类型";
idText["merchantClassify"]="商户类别";
idText["orgInput"]="归属机构";
idText["orgInputId"]="归属机构编号";
idText["salesmanName"]="业务员名称";
idText["salesmanCode"]="业务员编号";
idText["businessClassify"]="行业大类";
idText["bankTeamwork"]="银行合作";
idText["customClassifyText"]="自定义分类";
idText["customClassify"]="自定义分类code";
idText["customerManagerBank"]="所在银行";
idText["customerManager"]="客户经理";
idText["bankTeamworkSignText"]="银行合作标识";
idText["bankTeamworkSign"]="银行合作标识code";

idText["preBusinessClassify"]="预设行业大类";

idText["functionAcceptanceSettle1"]="功能受理-一般刷卡";
idText["functionAcceptanceSettle2"]="功能受理-预授权";
idText["functionAcceptanceSettle3"]="功能受理-在线退货";
idText["mecNormalLevel"]="商户等级";



/* POS信息 */
idText["trmQuantity1"]="POS1数量(台)";
idText["trmRentalFee1"]="POS1终端租赁费(元/台)";
idText["trmQuantity2"]="POS2数量(台)";
idText["trmRentalFee2"]="POS2终端租赁费(元/台)";
idText["trmQuantity3"]="POS3数量(台)";
idText["trmRentalFee3"]="POS3终端租赁费(元/台)";
idText["trmQuantity4"]="POS4数量(台)";
idText["trmRentalFee4"]="POS4终端租赁费(元/台)";
idText["trmCommMod1"]="POS1通讯方式";
idText["trmMod1"]="POS1型号";
idText["trmCommMod2"]="POS2通讯方式";
idText["trmMod2"]="POS2型号";
idText["trmCommMod3"]="POS3通讯方式";
idText["trmMod3"]="POS型号3";
idText["trmCommMod4"]="POS4通讯方式";
idText["trmMod4"]="POS4型号";
idText["isHavePinPad1"]="是否密码键盘1";
idText["isHavePinPad2"]="是否密码键盘2";
idText["isHavePinPad3"]="是否密码键盘3";
idText["isHavePinPad4"]="是否密码键盘4";
idText["posType"]="POS信息修改";
idText["posComment"]="POS信息备注";
idText["areaCode"]="拨号主叫号码区号";
idText["callNo"]="拨号主叫号码";

/*资质信息*/
idText["registName"]="注册名称"
idText["registAddressStreet"]="注册地址街道"
idText["registCode"]="注册登记号";
idText["merchantNature"]="商户性质";
idText["licenseAlwaysEnabled"]="执照有效期长期有效否";
idText["licenseStartTime"]="营业执照有效开始日期";
idText["licenseEndTime"]="营业执照有效结束日期";
idText["legalPersonLicenseType"]="法人证件类型";
idText["cardAlwaysEnabled"]="法人证件长期有效否";
idText["legalPersonCode"]="法人证件号码";
idText["legalPersonName"]="商户负责人姓名";
idText["cardStartTime"]="法人证件有效开始日期";
idText["cardEndTime"]="法人证件有效结束日期";
idText["taxRegistLicense"]="税务登记号";
idText["orgCode"]="机构代码证";

/*结算信息*/
idText["settleDayCount"]="结算天数";
idText["startSettleMoney"]="起始结算金额";
idText["stmTyp"]="结算类型";
idText["merchantDayChangeTime"]="商户日切时间";
idText["ifSuiYiTongSettle"]="开通随意通结算功能";
idText["ifNonworkdaySettle"]="开通非工作日结算功能";
idText["ifIntradaySettle"]="开通即日付结算功能";
idText["intradayPayCounterFee"]="即日付手续费";
idText["suiYiTongQuota"]="随意通结算限额";
idText["automaticSettleTime"]="随意通自动结算时间";

idText["automaticSettleTime9"]="随意通自动结算时间(9时)";
idText["automaticSettleTime10"]="随意通自动结算时间(10时)";
idText["automaticSettleTime11"]="随意通自动结算时间(11时)";
idText["automaticSettleTime12"]="随意通自动结算时间(12时)";
idText["automaticSettleTime13"]="随意通自动结算时间(13时)";
idText["automaticSettleTime14"]="随意通自动结算时间(14时)";
idText["automaticSettleTime15"]="随意通自动结算时间(15时)";
idText["automaticSettleTime16"]="随意通自动结算时间(16时)";
idText["automaticSettleTime17"]="随意通自动结算时间(17时)";
idText["automaticSettleTime20"]="随意通自动结算时间(20时)";
idText["ifNextSettle"]="是否允许隔日对账";
idText["isForcedStm"]="是否强制结算";
idText["suiYiTongCountrFee"]="随意通手续费";
idText["zftFlg"]="开通朝付通结算功能";
//结算卡1
idText["settleAccountType1"]="结算账户类型1";
idText["firstStmBankName"]="结算银行名称";
idText["firstProvName"]="结算银行卡一所在省";
idText["firstCityName"]="结算银行卡一所在市";
idText["toPrivateOpenbankInfomation"]="结算银行卡一银行详细信息";
idText["toPrivateCnapsCode"]="结算卡一联行行号";
idText["toPrivateAccountName"]="结算卡一账户名";
idText["toPrivateSettleAccountNo"]="结算卡一账号";
idText["toPrivateSettleAccountNoTwo"]="确认结算卡一账号";
idText["settleManidNumber"]="结算账户一身份证号码";

idText["accountLegalPersonName"]="账户法人姓名";

//结算卡2
idText["settleAccountType2"]="结算账户类型2";
idText["secondStmBankName"]="结算银行名称";
idText["secondProvName"]="结算银行卡二所在省";
idText["secondCityName"]="结算银行卡二所在市";
idText["toPublicOpenbankInfomation"]="结算银行卡二银行详细信息";
idText["toPublicCnapsCode"]="结算卡二联行行号";
idText["toPublicAccountName"]="结算卡二账户名";
idText["toPublicSettleAccountNo"]="结算卡二账号";
idText["toPublicSettleAccountNoTwo"]="确认结算卡二账号";
idText["settleManidNumber2"]="结算账户二身份证号码";
idText["isRs"]="备案商户";
/*费用信息*/
idText["collectAmount"]="维护通收取金额";
idText["ifWeiHuTong"]="维护通";
idText["isMaintenanceFeeCurrent"]="终端安装当月是否收取维护费";
idText["isDeposit"]="是否收取押金";
idText["comments"]="其他说明事项";
idText["chargingMod"]="收取模式";
idText["chargingWay"]="收取方式";
idText["freeCycle"]="免收周期";
idText["maintenanceFeeAmt"]="预收维护费金额";
idText["freeStartingPoint"]="维护费免收起点";
idText["minEffectiveTrans"]="最低交易有效笔数";
idText["feeAmtEnDial"]="以太网/拨号-POS单台维护费金额";
idText["freeCountsEnDial"]="以太网/拨号-POS免收台数";
idText["feeAmtGprs"]="GPRS-POS单台维护费金额";
idText["freeCountsGprs"]="GPRS-POS免收台数";
idText["deposit"]="押金金额";
idText["ifMaintainFeeOfPos"]="是否收取POS维护费";
idText["ifMaintainFeeOfPos2"]="日累计扣费";
idText["ifMaintainFeeOfPos3"]="日非累计扣费";
idText["maintainFeeOfPos"]="POS维护费收取金额";
/*功能开通*/
idText["ifOutBCMCard"]="交行外卡";
idText["ifPrepaidCard"]="开通高汇通储值卡";
idText["functionAcceptancePrepaidCard1"]="高汇通储值卡-一般刷卡";
idText["functionAcceptancePrepaidCard2"]="高汇通储值卡-预授权";
idText["functionAcceptancePrepaidCard3"]="高汇通储值卡-在线退货";
idText["isCapH"]="高汇通封顶";
idText["foreignCcyCardTyp1"]="开通北京中行外卡";
idText["functionAcce4"]="北京中行外卡-一般刷卡";
idText["functionAcce5"]="北京中行外卡-预授权";
idText["functionAcce6"]="北京中行外卡-在线退货";
idText["foreignCcyCardTyp2"]="开通北京交行外卡";
idText["gaoHuiTongMerchantCode"]="高汇通商编";
idText["feeRate"]="高汇通费率";
idText["capAmtH"]="高汇通封顶";
idText["feeRateVisa1"]="北京中行外卡费率";
idText["feeRatemaster1"]="中行外卡Master";
idText["feeRateAmericanExpress1"]="中行外卡AmericanExpress";
idText["feeRateDiners1"]="中行外卡Diners";
idText["feeRateJcb1"]="中行外卡JCB";
idText["wildFeeEffDt1"]="预设费率生效日期";
idText["rateVisa"]="交行外卡Visa费率";
idText["rateMaster"]="交行外卡Master";
idText["rateAmericanExpress"]="交行外卡AmericanExpress";
idText["rateDiners"]="交行外卡Diners";
idText["rateJCB"]="交行外卡JCB";
idText["rateVISADCC"]="交行外卡VISA_DCC";
idText["rateMCDCC"]="交行外卡MC_DCC";

idText["posRemark"]="POS备注";
idText["allowCreditCard"]="是否允许信用卡";

function getTipsMessage(cssColor,count,taskName){
    var messageShow="";
    console.log("------change1----------------"+$("#showChangeMessage").html()+$("#newShowChangeMessage").html());
    $("#tipsInfo").val($("#showChangeMessage").html()+$("#newShowChangeMessage").html());
    /*    if($("#isSaved").val()=="1"){
     messageShow=$("#tipsInfo").val();
     console.log("------change1----------------"+$("#tipsInfo").val());
     }else{
     //messageShow=$("#tipsInfo").val()+"<p><b>"+taskName+"</b><b>第<font color=\""+cssColor+"\">"+count+"</font>次修改</span></b></p>";
     messageShow=$("#tipsInfo").val();
     console.log("------change2----------------"+$("#tipsInfo").val());
     }
     if($("#newShowChangeMessage").has("li").length){
     $("#showChangeMessage").html(messageShow);
     $("#tipsInfo").val(messageShow)
     console.log("------change3----------------"+messageShow);
     }else{
     $("#showChangeMessage").html($("#tipsInfo").val());
     console.log("------change4----------------"+$("#tipsInfo").val());
     }*/
}

function getIcsMessage(cssColor,count,taskName,flag){
    icsMessage["businessScope"]= $("#businessScope").val();
    //icsMessage["comments"]= $("#comments").val();
    //$("#comments").blur(function(){
    //    getShowMessage(this,"0",cssColor,count);
    //    getTipsMessage(cssColor,count,taskName);
    //});
    //var stmtCards = ['stmtCard11','stmtCard12','stmtCard13','stmtCard14','stmtCard15','stmtCard21','stmtCard22','stmtCard23','stmtCard24','stmtCard25','stmtCard26'];
    $("input[type='text']").each(function(){
        if($(this).attr("id")!="phoneno")
            icsMessage[$(this).attr("id")]=$(this).val();
        else
            icsMessage[$(this).attr("id")]=$(this).val().replace(/\,/g, "." );
        //封顶金额 TODO 费率部分待查
        if($(this).attr("id")=="capAmt"){
            icsMessage[$(this).attr("id")]=$(this).val().substring(0,9);
        }
        //if($(this).closest("div").attr("id") == "movedivid" || contains(stmtCards,$(this).closest("tr").attr("id"))){
        //    //查询结算银行信息层的表单控件不加入提示信息
        //}else{
        if($(this).attr('id') != undefined && 'wildFeeEffDt1,licenseStartTime,licenseEndTime,cardStartTime,cardEndTime'.indexOf($(this).attr('id')) != -1){
            $(this).change(function(){
                getShowMessage(this,"1",cssColor,count,flag);
                getTipsMessage(cssColor,count,taskName);
            });
        }else{
            $(this).blur(function(){
                getShowMessage(this,"1",cssColor,count,flag);
                getTipsMessage(cssColor,count,taskName);
            });
        }
        //}
    });
    $("input[type='hidden']").each(function(){
        icsMessage[$(this).attr("id")]=$(this).val();
    });
    //解决营业地址不好用
    /*    $("select[name='bindAddressProvince']").change(function(){
     alert("营业地址");
     getTipsMessage(cssColor,count,taskName);
     getShowMessage("#bindAddressProvince","3",cssColor,count,flag);
     icsMessage[$("#bindAddressProvince").attr("id")]=$("#bindAddressProvince").val();

     });*/
    /*    $(".select2-hidden-accessible").each(function(){
     console.log("------select2 change212事件----------------");
     $(this).bind('change',function(){
     console.log("------select2 change事件----------------");
     getShowMessage(this,"2","red",count,flag);
     getTipsMessage("red",count,taskName);
     });
     });*/

    $("select").each(function(){
        console.log("------change5----------------");
        icsMessage[$(this).attr("id")]=$("option:selected",this).text();
        if($(this).closest("div").attr("id") == "movedivid" || $(this).attr("id")=='stmAct2Prop' ){
            //查询结算银行信息层的表单控件不加入提示信息
        }else{
            $("#merchantType").change(function(){
                console.log("------change6----------------");
                if($("#merchantType").val()!="3") {
                    icsMessage[$("#businessScope").attr("id")]=$("#businessScope").val();
                    $("#businessScope").trigger('blur');
                }
                icsMessage[$("#subjectionMerchantCode").attr("id")]=$("#subjectionMerchantCode").val();
                icsMessage[$("#subjectionMerchantName").attr("id")]=$("#subjectionMerchantName").val();
                $("#subjectionMerchantCode").trigger('blur');
                $("#subjectionMerchantName").trigger('blur');
                console.log("------change7----------------");
                getTipsMessage(cssColor,count,taskName);
                getShowMessage("#bindAddressProvince","3",cssColor,count,flag);
            });
            //$("#stmTyp").change(function(){
            //    if($("#stmTyp").val()=="2"){
            //        getShowMessage("#isSattleFlg","3",cssColor,count,flag);
            //        getTipsMessage(cssColor,count,taskName);
            //    }
            //});
            //$("#specialMerchant").change(function(){
            //    if($("#specialMerchant").val()=="1"&&$("#businessClassify").val()=="5"){
            //        icsMessage[$("#capAmt").attr("id")]=$("#capAmt").val();
            //        icsMessage[$("#capAmt1").attr("id")]=$("#capAmt1").val();
            //        icsMessage[$("#minEffectiveTrans").attr("id")]=$("#minEffectiveTrans").val();
            //        icsMessage[$("#freeStartingPoint").attr("id")]=$("#freeStartingPoint").val();
            //        $("#capAmt").trigger('blur');
            //        $("#capAmt1").trigger('blur');
            //        $("#minEffectiveTrans").trigger('blur');
            //        $("#freeStartingPoint").trigger('blur');
            //        getShowMessage("#isCap","3",cssColor,count,flag);
            //        getShowMessage("#isCap1","3",cssColor,count,flag);
            //        getTipsMessage(cssColor,count,taskName);
            //    }
            //});
            //$("#businessClassify").change(function(){
            //    if($("#specialMerchant").val()=="0"){
            //        if($("#businessClassify").val()=="4"||$("#businessClassify").val()=="5"){
            //            getShowMessage("#isCap","3",cssColor,count,flag);
            //            getTipsMessage(cssColor,count,taskName);
            //        }else{
            //            icsMessage[$("#capAmt").attr("id")]=$("#capAmt").val();
            //            $("#capAmt").trigger('blur');
            //            getShowMessage("#isCap","3",cssColor,count,flag);
            //            getTipsMessage(cssColor,count,taskName);
            //        }
            //        icsMessage[$("#minEffectiveTrans").attr("id")]=$("#minEffectiveTrans").val();
            //        icsMessage[$("#freeStartingPoint").attr("id")]=$("#freeStartingPoint").val();
            //        $("#minEffectiveTrans").trigger('blur');
            //        $("#freeStartingPoint").trigger('blur');
            //    }else if($("#specialMerchant").val()=="1"){
            //        if($("#businessClassify").val()=="4"){
            //            getShowMessage("#isCap","3",cssColor,count,flag);
            //            getTipsMessage(cssColor,count,taskName);
            //        }else{
            //            icsMessage[$("#capAmt").attr("id")]=$("#capAmt").val();
            //            $("#capAmt").trigger('blur');
            //            getShowMessage("#isCap","3",cssColor,count,flag);
            //            getTipsMessage(cssColor,count,taskName);
            //        }
            //        icsMessage[$("#minEffectiveTrans").attr("id")]=$("#minEffectiveTrans").val();
            //        icsMessage[$("#freeStartingPoint").attr("id")]=$("#freeStartingPoint").val();
            //        $("#minEffectiveTrans").trigger('blur');
            //        $("#freeStartingPoint").trigger('blur');
            //    }else if($("#specialMerchant").val()=="2"){
            //        if($("#businessClassify").val()=="4"){
            //            getShowMessage("#isCap","3",cssColor,count,flag);
            //            getTipsMessage(cssColor,count,taskName);
            //        }else{
            //            icsMessage[$("#capAmt").attr("id")]=$("#capAmt").val();
            //            $("#capAmt").trigger('blur');
            //            getShowMessage("#isCap","3",cssColor,count,flag);
            //            getTipsMessage(cssColor,count,taskName);
            //        }
            //        icsMessage[$("#minEffectiveTrans").attr("id")]=$("#minEffectiveTrans").val();
            //        icsMessage[$("#freeStartingPoint").attr("id")]=$("#freeStartingPoint").val();
            //        $("#minEffectiveTrans").trigger('blur');
            //        $("#freeStartingPoint").trigger('blur');
            //    }
            //});

            //$("#prepareMcc").change(function(){
            //    if($("#specialMerchant").val()=="0"){
            //        if($("#prepareMcc").val()=="4"||$("#prepareMcc").val()=="5"){
            //            $("#isCap1").trigger('change');
            //            getShowMessage("#isCap1","3",cssColor,count,flag);
            //            getTipsMessage(cssColor,count,taskName);
            //        }else{
            //            icsMessage[$("#capAmt1").attr("id")]=$("#capAmt1").val();
            //            $("#capAmt1").trigger('blur');
            //            $("#isCap1").trigger('change');
            //            getShowMessage("#isCap1","3",cssColor,count,flag);
            //            getTipsMessage(cssColor,count,taskName);
            //        }
            //        icsMessage[$("#minEffectiveTrans").attr("id")]=$("#minEffectiveTrans").val();
            //        icsMessage[$("#freeStartingPoint").attr("id")]=$("#freeStartingPoint").val();
            //        $("#minEffectiveTrans").trigger('blur');
            //        $("#freeStartingPoint").trigger('blur');
            //    }else if($("#specialMerchant").val()=="1"){
            //        if($("#prepareMcc").val()=="4"){
            //            $("#isCap1").trigger('change');
            //            getShowMessage("#isCap1","3",cssColor,count,flag);
            //            getTipsMessage(cssColor,count,taskName);
            //        }else{
            //            $("#isCap1").trigger('change');
            //            icsMessage[$("#capAmt1").attr("id")]=$("#capAmt1").val();
            //            $("#capAmt1").trigger('blur');
            //            getShowMessage("#isCap1","3",cssColor,count,flag);
            //            getTipsMessage(cssColor,count,taskName);
            //        }
            //        icsMessage[$("#minEffectiveTrans").attr("id")]=$("#minEffectiveTrans").val();
            //        icsMessage[$("#freeStartingPoint").attr("id")]=$("#freeStartingPoint").val();
            //        $("#minEffectiveTrans").trigger('blur');
            //        $("#freeStartingPoint").trigger('blur');
            //    }else if($("#specialMerchant").val()=="2"){
            //        if($("#prepareMcc").val()=="4"){
            //            $("#isCap1").trigger('change');
            //            getShowMessage("#isCap1","3",cssColor,count,flag);
            //            getTipsMessage(cssColor,count,taskName);
            //        }else{
            //            icsMessage[$("#capAmt1").attr("id")]=$("#capAmt1").val();
            //            $("#capAmt1").trigger('blur');
            //            $("#isCap1").trigger('change');
            //            getShowMessage("#isCap1","3",cssColor,count,flag);
            //            getTipsMessage(cssColor,count,taskName);
            //        }
            //        icsMessage[$("#minEffectiveTrans").attr("id")]=$("#minEffectiveTrans").val();
            //        icsMessage[$("#freeStartingPoint").attr("id")]=$("#freeStartingPoint").val();
            //        $("#minEffectiveTrans").trigger('blur');
            //        $("#freeStartingPoint").trigger('blur');
            //    }
            //
            //}

            //);
            $(this).bind('change',function(){
                console.log("------select 所有change事件----------------"+$(this).attr("name"));
                if($(this).attr("name")=="bindAddressProvince"){
                    console.log("=========bindAddressProvincebindAddressProvincebindAddressProvince================");
                }

                getShowMessage(this,"2",cssColor,count,flag);
                getTipsMessage(cssColor,count,taskName);
            });
        }
    });
    $("input[type='checkbox']").each(function(){
        if($(this).prop("checked")==true){
            icsMessage[$(this).attr("id")]="选中";
        }else{
            icsMessage[$(this).attr("id")]="不选中";
        }

        $(this).change(function(){
            if($("#isCap").prop("checked")!=true){
                icsMessage[$("#capAmt").attr("id")]=$("#capAmt").val();
                icsMessage[$("#minEffectiveTrans").attr("id")]=$("#minEffectiveTrans").val();
                icsMessage[$("#freeStartingPoint").attr("id")]=$("#freeStartingPoint").val();
                $("#capAmt").trigger('blur');
                $("#minEffectiveTrans").trigger('blur');
                $("#freeStartingPoint").trigger('blur');
            }else{
                icsMessage[$("#minEffectiveTrans").attr("id")]=$("#minEffectiveTrans").val();
                icsMessage[$("#freeStartingPoint").attr("id")]=$("#freeStartingPoint").val();
                $("#minEffectiveTrans").trigger('blur');
                $("#freeStartingPoint").trigger('blur');
            }
            if($("#isCap1").prop("checked")!=true){
                icsMessage[$("#capAmt1").attr("id")]=$("#capAmt1").val();
                icsMessage[$("#minEffectiveTrans").attr("id")]=$("#minEffectiveTrans").val();
                icsMessage[$("#freeStartingPoint").attr("id")]=$("#freeStartingPoint").val();
                $("#capAmt1").trigger('blur');
                $("#minEffectiveTrans").trigger('blur');
                $("#freeStartingPoint").trigger('blur');
            }else{
                icsMessage[$("#minEffectiveTrans").attr("id")]=$("#minEffectiveTrans").val();
                icsMessage[$("#freeStartingPoint").attr("id")]=$("#freeStartingPoint").val();
                $("#minEffectiveTrans").trigger('blur');
                $("#freeStartingPoint").trigger('blur');
            }
            if($("#ifWeiHuTong").prop("checked")!=true){
                icsMessage[$("#collectAmount").attr("id")]=$("#collectAmount").val();
                //icsMessage[$("#freeStartingPoint").attr("id")]=$("#freeStartingPoint").val();
                //icsMessage[$("#minEffectiveTrans").attr("id")]=$("#minEffectiveTrans").val();
                //icsMessage[$("#freeCycle").attr("id")]=$("#freeCycle").children("option:selected").html();
                //icsMessage[$("#chargingMod").attr("id")]=$("#chargingMod").children("option:selected").html();
                //icsMessage[$("#chargingWay").attr("id")]=$("#chargingWay").children("option:selected").html();
                //icsMessage[$("#feeAmtEnDial").attr("id")]=$("#feeAmtEnDial").val();
                //icsMessage[$("#freeCountsEnDial").attr("id")]=$("#freeCountsEnDial").val();
                //icsMessage[$("#feeAmtGprs").attr("id")]=$("#feeAmtGprs").val();
                //icsMessage[$("#freeCountsGprs").attr("id")]=$("#freeCountsGprs").val();
                //icsMessage[$("#comments").attr("id")]=$("#comments").val();
                $("#collectAmount").trigger('blur');
                //$("#freeStartingPoint").trigger('blur');
                //$("#minEffectiveTrans").trigger('blur');
                //$("#feeAmtEnDial").trigger('blur');
                //$("#freeCountsEnDial").trigger('blur');
                //$("#feeAmtGprs").trigger('blur');
                //$("#freeCountsGprs").trigger('blur');
                //$("#comments").trigger('blur');
                //$("#freeCycle").trigger('change');
                //$("#chargingMod").trigger('change');
                //$("#chargingWay").trigger('change');
                getShowMessage("#isMaintenanceFeeCurrent","3",cssColor,count,flag);
            }
            //增加pos维护费
            if($("#ifMaintainFeeOfPos").prop("checked")!=true){
                icsMessage[$("#maintainFeeOfPos").attr("id")]=$("#maintainFeeOfPos").val();
                $("#maintainFeeOfPos").trigger('blur');
                getShowMessage(this,"3",cssColor,count,flag);
            }
            if($("#preCardOutCard").prop("checked")!=true){
                icsMessage[$("#gaoHuiTongMerchantCode").attr("id")]=$("#gaoHuiTongMerchantCode").val();
                //icsMessage[$("#feeRate").attr("id")]=$("#feeRate").val();
                //icsMessage[$("#capAmtH").attr("id")]=$("#capAmtH").val();
                $("#mercCd").trigger('blur');
                //$("#feeRate").trigger('blur');
                //$("#capAmtH").trigger('blur');
                getShowMessage("#functionAcceptancePrepaidCa1","3",cssColor,count,flag);
                getShowMessage("#functionAcceptancePrepaidCa2","3",cssColor,count,flag);
                getShowMessage("#functionAcceptancePrepaidCa3","3",cssColor,count,flag);
                //getShowMessage("#isCapH","3",cssColor,count,flag);
            }
            if($("#foreignCcyCardTyp1").prop("checked")!=true){
                icsMessage[$("#feeRatemaster1").attr("id")]=$("#feeRatemaster1").val();
                icsMessage[$("#feeRateAmericanExpress1").attr("id")]=$("#feeRateAmericanExpress1").val();
                icsMessage[$("#feeRateDiners1").attr("id")]=$("#feeRateDiners1").val();
                icsMessage[$("#feeRateJcb1").attr("id")]=$("#feeRateJcb1").val();
                icsMessage[$("#feeRateVisa1").attr("id")]=$("#feeRateVisa1").val();
                $("#feeRatemaster1").trigger('blur');
                $("#feeRateAmericanExpress1").trigger('blur');
                $("#feeRateDiners1").trigger('blur');
                $("#feeRateJcb1").trigger('blur');
                $("#feeRateVisa1").trigger('blur');
                getShowMessage("#functionAccepted4","3",cssColor,count,flag);
                getShowMessage("#functionAccepted5","3",cssColor,count,flag);
                getShowMessage("#functionAccepted6","3",cssColor,count,flag);
            }
            if($("#foreignCcyCardTyp2").prop("checked")!=true){
                icsMessage[$("#rateMaster").attr("id")]=$("#rateMaster").val();
                icsMessage[$("#rateAmericanExpress").attr("id")]=$("#rateAmericanExpress").val();
                icsMessage[$("#rateDiners").attr("id")]=$("#rateDiners").val();
                icsMessage[$("#rateJCB").attr("id")]=$("#rateJCB").val();
                icsMessage[$("#rateVisa").attr("id")]=$("#rateVisa").val();
                icsMessage[$("#rateVISADCC").attr("id")]=$("#rateVISADCC").val();
                icsMessage[$("#rateMCDCC").attr("id")]=$("#rateMCDCC").val();
                $("#rateMaster").trigger('blur');
                $("#rateAmericanExpress").trigger('blur');
                $("#rateDiners").trigger('blur');
                $("#rateJCB").trigger('blur');
                $("#rateVisa").trigger('blur');
                $("#rateVISADCC").trigger('blur');
                $("#rateMCDCC").trigger('blur');
            }
            if($("#ifSuiYiTongSettle").prop("checked") != true){
                icsMessage[$("#suiYiTongQuota").attr("id")]=$("#suiYiTongQuota").find("option:selected").text();
                $("#suiYiTongQuota").trigger('change');
                $("#suiYiTongCountrFee").val('');
                $("#suiYiTongCountrFee").trigger('blur');
                if($("#automaticSettleTime9").prop("checked")==true){
                    icsMessage[$("#automaticSettleTime9").attr("id")]="选中";
                }else{
                    icsMessage[$("#automaticSettleTime9").attr("id")]="不选中";
                }
                if($("#automaticSettleTime10").prop("checked")==true){
                    icsMessage[$("#automaticSettleTime10").attr("id")]="选中";
                }else{
                    icsMessage[$("#automaticSettleTime10").attr("id")]="不选中";
                }
                if($("#automaticSettleTime11").prop("checked")==true){
                    icsMessage[$("#automaticSettleTime11").attr("id")]="选中";
                }else{
                    icsMessage[$("#automaticSettleTime11").attr("id")]="不选中";
                }
                if($("#automaticSettleTime12").prop("checked")==true){
                    icsMessage[$("#automaticSettleTime12").attr("id")]="选中";
                }else{
                    icsMessage[$("#automaticSettleTime12").attr("id")]="不选中";
                }
                if($("#automaticSettleTime13").prop("checked")==true){
                    icsMessage[$("#automaticSettleTime13").attr("id")]="选中";
                }else{
                    icsMessage[$("#automaticSettleTime13").attr("id")]="不选中";
                }
                if($("#automaticSettleTime14").prop("checked")==true){
                    icsMessage[$("#automaticSettleTime14").attr("id")]="选中";
                }else{
                    icsMessage[$("#automaticSettleTime14").attr("id")]="不选中";
                }
                if($("#automaticSettleTime15").prop("checked")==true){
                    icsMessage[$("#automaticSettleTime15").attr("id")]="选中";
                }else{
                    icsMessage[$("#automaticSettleTime15").attr("id")]="不选中";
                }
                if($("#automaticSettleTime16").prop("checked")==true){
                    icsMessage[$("#automaticSettleTime16").attr("id")]="选中";
                }else{
                    icsMessage[$("#automaticSettleTime16").attr("id")]="不选中";
                }
                if($("#automaticSettleTime17").prop("checked")==true){
                    icsMessage[$("#automaticSettleTime17").attr("id")]="选中";
                }else{
                    icsMessage[$("#automaticSettleTime17").attr("id")]="不选中";
                }
                if($("#automaticSettleTime20").prop("checked")==true){
                    icsMessage[$("#automaticSettleTime20").attr("id")]="选中";
                }else{
                    icsMessage[$("#automaticSettleTime20").attr("id")]="不选中";
                }
                getShowMessage("#automaticSettleTime9","3",cssColor,count,flag);
                getShowMessage("#automaticSettleTime10","3",cssColor,count,flag);
                getShowMessage("#automaticSettleTime11","3",cssColor,count,flag);
                getShowMessage("#automaticSettleTime12","3",cssColor,count,flag);
                getShowMessage("#automaticSettleTime13","3",cssColor,count,flag);
                getShowMessage("#automaticSettleTime14","3",cssColor,count,flag);
                getShowMessage("#automaticSettleTime15","3",cssColor,count,flag);
                getShowMessage("#automaticSettleTime16","3",cssColor,count,flag);
                getShowMessage("#automaticSettleTime17","3",cssColor,count,flag);
                getShowMessage("#automaticSettleTime20","3",cssColor,count,flag);
            }
            getShowMessage(this,"3",cssColor,count,flag);
            getTipsMessage(cssColor,count,taskName);
        });

    });
}

function getShowMessage(obj,tagType,cssColor,count,flag){
    console.log("------显示变量----------------"+flag);
    if($(obj).attr("id")==undefined){
        return;
    }
    var messageShow="";
    if(tagType=="1"&&checkValidate(icsMessage[$(obj).attr("id")])!=checkValidate($(obj).val())){
        messageShow+="<li id=\"li"+flag+count+$(obj).attr("id")+"\">"+idText[$(obj).attr("id")]+"的值由" +
            "<font color=\""+cssColor+"\" id=\"font"+$(obj).attr("id")+"\">"+icsMessage[$(obj).attr("id")]+"</font>变成<font color=\""+cssColor+"\">" +
            $(obj).val().replace(/\,/g, ".")+"</font><br/></li>";
        $("#li"+flag+count+$(obj).attr("id")).remove();
        $("#newShowChangeMessage").append(messageShow);
    }else if(tagType=="1"&&checkValidate(icsMessage[$(obj).attr("id")])==checkValidate($(obj).val())){
        $("#li"+flag+count+$(obj).attr("id")).remove();
    }else if(tagType=="2"&&icsMessage[$(obj).attr("id")]!=$(obj).find("option:selected").text()){
        if(($("#merchantType").val()!="3"&&$("#merchantType").val()!="5")
            ||(($("#merchantType").val()=="3" ||$("#merchantType").val()=="5") && $('#independentModel').prop('checked'))){
            messageShow+="<li id=\"li"+flag+count+$(obj).attr("id")+"\">"+idText[$(obj).attr("id")]+"的值由" +
                "<font color=\""+cssColor+"\" id=\"font"+$(obj).attr("id")+"\">"+icsMessage[$(obj).attr("id")]+"</font>变成<font color=\""+cssColor+"\">" +
                $(obj).find("option:selected").text()+"</font><br/></li>";
            $("#li"+flag+count+$(obj).attr("id")).remove();
            $("#newShowChangeMessage").append(messageShow);
        }

    }else if(tagType=="2"&&icsMessage[$(obj).attr("id")]==$(obj).find("option:selected").text()){
        $("#li"+flag+count+$(obj).attr("id")).remove();
    }else if(tagType=="3"&&icsMessage[$(obj).attr("id")]=="选中"&&$(obj).prop("checked")!=true){
        if($('#changeTime').val() !='0' && $('#changeTime').val() !='' && $(obj).attr("id")=="isSattleFlg"){
        }else{
            messageShow+="<li id=\"li"+flag+count+$(obj).attr("id")+"\">"+idText[$(obj).attr("id")]+"的值由" +
                "<font color=\""+cssColor+"\" id=\"font"+$(obj).attr("id")+"\">选中</font>变成<font color=\""+cssColor+"\">不选中</font><br/></li>";
            $("#li"+flag+count+$(obj).attr("id")).remove();
            $("#newShowChangeMessage").append(messageShow);
        }
    }else if(tagType=="3"&&icsMessage[$(obj).attr("id")]=="选中"&&$(obj).prop("checked")==true){
        $("#li"+flag+count+$(obj).attr("id")).remove();
    }else if(tagType=="3"&&icsMessage[$(obj).attr("id")]=="不选中"&&$(obj).prop("checked")==true){
        messageShow+="<li id=\"li"+flag+count+$(obj).attr("id")+"\">"+idText[$(obj).attr("id")]+"的值由" +
            "<font color=\""+cssColor+"\" id=\"font"+$(obj).attr("id")+"\">不选中</font>变成<font color=\""+cssColor+"\">选中</font><br/></li>";
        $("#li"+flag+count+$(obj).attr("id")).remove();
        $("#newShowChangeMessage").append(messageShow);
    }else if(tagType=="3"&&icsMessage[$(obj).attr("id")]=="不选中"&&$(obj).prop("checked")!=true){
        $("#li"+flag+count+$(obj).attr("id")).remove();
    }else if(tagType=="0"&&icsMessage[$(obj).attr("id")]!=$(obj).val()){
        messageShow+="<li id=\"li"+flag+count+$(obj).attr("id")+"\">"+idText[$(obj).attr("id")]+"的值由" +
            "<font color=\""+cssColor+"\" id=\"font"+$(obj).attr("id")+"\">"+icsMessage[$(obj).attr("id")]+"</font>变成<font color=\""+cssColor+"\">"+$(obj).val()+"</font><br/></li>";
        $("#li"+flag+count+$(obj).attr("id")).remove();
        $("#newShowChangeMessage").append(messageShow);
    }else if(tagType=="0"&&icsMessage[$(obj).attr("id")]==$(obj).val()){
        $("#li"+flag+count+$(obj).attr("id")).remove();
    }
    $("#newShowChangeMessage").children("li").children("font").each(function(){
        if($(this).html()==""||$(this).html()=="undefined"){
            $(this).html("空");
        }
    });
    console.log("------messageShow----------------"+$("#newShowChangeMessage").val());

    //$("#tipsInfo").val(messageShow)
    uptMessagehide(flag,count);
}

function uptMessagehide(flag,count){
    var hideId = ["mercNm","mercSn"];
    for(var i=0;i<hideId.length;i++){
        $("#newShowChangeMessage").children("li").each(function(){
            if($(this).attr("id")==("li"+flag+count+hideId[i])){
                $(this).remove();
            }
        });
    }
}

function validate(obj){
    var flag=false;
    var reg = new RegExp("^[0-9]*$");
    if(reg.test(obj)){
        flag=true;
    }
    return flag;
}

function checkValidate(obj){
    if(obj.length >15){
        return obj;
    }
    var val=obj;
    var reg = new RegExp("^[0-9]+(\.[0-9]+)?$");
    if(reg.test(obj)){
        val=parseFloat(obj);
    }
    return val;
}



function contains(array, obj) {

    var i = array.length;
    if(obj!=undefined && obj!=null){
        while (i--) {
            if (array[i] === obj) {

                return true;

            }

        }

        return false;
    }
}


//从修改提示信息中提取是否包含结算卡账户名
function getStmActNmForTipsInfo(tipsInfo){
    var flag=false;
    var regex1 = new RegExp("结算卡一账户名的值由");
    var regex2 = new RegExp("结算卡二账户名的值由");
    var result1 = tipsInfo.match (regex1);
    var result2 = tipsInfo.match (regex2);
    if(result1!=null||result2!=null){
        flag=true;
    }
    return flag;
}

//分割注册地址并且对相应字段赋值
function regAddrSplit(){
    var regAddr=$("#regAddr").val();
    if(regAddr.indexOf("-")>0&&regAddr.indexOf("|")>0){
        var arr=regAddr.split("|");
        $("#regProvince").val(arr[0]);
        $("#regCity").val(arr[1]);
        $("#regTown").val(arr[2]);
        $("#regCounties").val(arr[3]);
    }else if(regAddr.indexOf("-")>0&&regAddr.indexOf("|")<=0){
        var arr=regAddr.split("-");
        if(arr.length==4){
            $("#regProvince").val(arr[0]);
            $("#regCity").val(arr[1]);
            $("#regTown").val(arr[2]);
            $("#regCounties").val(arr[3]);
        }else if(arr.length==5){
            $("#regProvince").val(arr[0]);
            $("#regCity").val(arr[1]);
            $("#regTown").val(arr[2]);
            $("#regCounties").val(arr[3]+arr[4]);
        }else{
            $("#regCounties").val(regAddr);
        }
    }else if(regAddr.indexOf("-")<=0&&regAddr.indexOf("|")>0){
        var arr=regAddr.split("|");
        $("#regProvince").val(arr[0]);
        $("#regCity").val(arr[1]);
        $("#regTown").val(arr[2]);
        $("#regCounties").val(arr[3]);
    }else{
        $("#regCounties").val(regAddr);
    }
}
//营业地址所在市、注册地址所在市、开户行所在市三者是否一致
function checkCityIsIdentical(){
    //注册地址
    var regCity=trim($("#regCity").val());
    //	营业地址
    var city=trim($("#city").find("option:selected").text());
    //	结算卡银行
    var stmCityN1="";
    var stmCityN2="";
    if($("#merchantTypezs").val()=="3"&&!$("#relflg1").is(":checked")){
        stmCityN1=trim($("#zongdianCityN1").val());
        stmCityN2=trim($("#zongdianCityN2").val());
    }else{
        stmCityN1=trim($("#cityN1").val());
        stmCityN2=trim($("#cityN2").val());
    }
    var cityIsIdentical = '';
    var flag1=false;
    var flag2=false;
    if(regCity!=city||regCity!=stmCityN1||city!=stmCityN1){
        cityIsIdentical += '营业地址、注册地址、开户行一所在市三者不一致！';
        flag1=true;
    }
    if(stmCityN2!=""){
        if(regCity!=city||regCity!=stmCityN2||city!=stmCityN2){
            cityIsIdentical += '营业地址、注册地址、开户行二所在市三者不一致！';
            flag2=true;
        }
    }
    if(flag1||flag2){
        $("#cityIsIdentical").html(cityIsIdentical);
    }
}



// 从修改提示信息中提取是否包含结算卡账户名
function isRestrict(tipsInfo) {
    var flag = false;
    var regex1 = new RegExp("结算卡一账户名的值由");
    var regex2 = new RegExp("结算卡二账户名的值由");
    var regex3 = new RegExp("结算卡一账号的值由");
    var regex4 = new RegExp("结算卡二账号的值由");
    var regex5 = new RegExp("结算账户一身份证号码的值由");
    var regex6 = new RegExp("结算账户二身份证号码的值由");
    var regex7 = new RegExp("注册名称的值由");
    var regex8 = new RegExp("注册登记号的值由");
    var result1 = tipsInfo.match(regex1);
    var result2 = tipsInfo.match(regex2);
    var result3 = tipsInfo.match(regex3);
    var result4 = tipsInfo.match(regex4);
    var result5 = tipsInfo.match(regex5);
    var result6 = tipsInfo.match(regex6);
    var result7 = tipsInfo.match(regex7);
    var result8 = tipsInfo.match(regex8);
    if (result1 != null || result2 != null || result3 != null
        || result4 != null || result5 != null || result6 != null
        || result7 != null || result8 != null) {
        flag = true;
    }
    return flag;
}

/** 去除字符串前后空格 **/
function trim(str) {
    str = str.replace(/^(\s|\u00A0)+/,'');
    for(var i=str.length-1; i>=0; i--){
        if(/\S/.test(str.charAt(i))){
            str = str.substring(0, i+1);
            break;
        }
    }
    return str;
}



//判断一个值是否在数组里
function in_array(stringToSearch, arrayToSearch) {
    for (s = 0; s < arrayToSearch.length; s++) {
        thisEntry = arrayToSearch[s].toString();
        if (thisEntry == stringToSearch) {
            return true;
        }
    }
    return false;
}

//修改结算银行名称导致取消朝付通业务
function changeForZftFlg(){
    //alert(icsMessage["firstStmBankCd"]+"//"+icsMessage["firstCityCd"]+"//"+icsMessage["firstProvCd"]+"//"+icsMessage["firstProvName"]+"//"+icsMessage["firstStmBankName"]);
    var bankArra=['102','318','308','305','103','105','104','301', '302','303', '304', '316', '306', '307', '403', '309', '310','313','314'];
    var bankArrb=['102','318','308','305','103','105','104','301', '302','303', '304', '316', '306', '307', '403', '309', '310'];
    if( !in_array($("#firstStmBankCd").val(),bankArra) && $("#zftFlg").val()=="01" ){
        if($("#zftFlg").prop('checked')){
            if(confirm("确认将结算银行名称改为其他银行，将取消普通朝付通业务?"))
            {
                $("#zftFlg").prop('checked',false);
                $("#zftFlg").trigger('change');
            }else{
                $("#zftFlg").prop('checked',true);
                $("#zftFlg").trigger('change');
                $("#firstStmBankName").val(icsMessage["firstStmBankName"]);
                $("#firstStmBankName").trigger('blur');
                $("#firstProvName").val(icsMessage["firstProvName"]);
                $("#firstProvName").trigger('blur');
                $("#firstCityName").val(icsMessage["firstCityName"]);
                $("#firstCityName").trigger('blur');
                $("#firstStmBankDetail").val(icsMessage["firstStmBankDetail"]);
                $("#firstStmBankDetail").trigger('blur');
                $("#firstStmLbankNo").val(icsMessage["firstStmLbankNo"]);
                $("#firstStmLbankNo").trigger('blur');
                $("#firstStmBankCd").val(icsMessage["firstStmBankCd"]);
                $("#firstStmBankCd").trigger('blur');
                $("#firstProvCd").val(icsMessage["firstProvCd"]);
                $("#firstProvCd").trigger('blur');
                $("#firstCityCd").val(icsMessage["firstCityCd"]);
                $("#firstCityCd").trigger('blur');
            }
        }
    }else if( !in_array($("#firstStmBankCd").val(),bankArrb) && $("#zftFlg").val()=="02" ){
        if($("#zftFlg").prop('checked')){
            if(confirm("确认将结算银行名称改为其他银行，将取消VIP普通朝付通业务?"))
            {
                $("#zftFlg").prop('checked',false);
                $("#zftFlg").trigger('change');
            }else{
                $("#zftFlg").prop('checked',true);
                $("#zftFlg").trigger('change');
                $("#firstStmBankName").val(icsMessage["firstStmBankName"]);
                $("#firstStmBankName").trigger('blur');
                $("#firstProvName").val(icsMessage["firstProvName"]);
                $("#firstProvName").trigger('blur');
                $("#firstCityName").val(icsMessage["firstCityName"]);
                $("#firstCityName").trigger('blur');
                $("#firstStmBankDetail").val(icsMessage["firstStmBankDetail"]);
                $("#firstStmBankDetail").trigger('blur');
                $("#firstStmLbankNo").val(icsMessage["firstStmLbankNo"]);
                $("#firstStmLbankNo").trigger('blur');
                $("#firstStmBankCd").val(icsMessage["firstStmBankCd"]);
                $("#firstStmBankCd").trigger('blur');
                $("#firstProvCd").val(icsMessage["firstProvCd"]);
                $("#firstProvCd").trigger('blur');
                $("#firstCityCd").val(icsMessage["firstCityCd"]);
                $("#firstCityCd").trigger('blur');
            }
        }
    }else{
        if($("#zftFlg").val()=="01"||$("#zftFlg").val()=="02"){
            $("#zftFlg").prop('checked',true);
            $("#zftFlg").trigger('change');
        }
    }
}

