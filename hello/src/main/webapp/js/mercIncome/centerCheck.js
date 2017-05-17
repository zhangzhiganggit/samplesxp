jQuery(function($) {
	//进件流程，如果关键字为空，默认取注册名称为关键字 
	if($('#procDefKey').val() == 'mercIncome' && $('#keywords').val()==''){
		$('#keywords').val($('#mercRegNm').html());
	}
	/**
	 * 进入页面回填数据
	 */
	//协议编号
	var agreementNo = $('#agreementNo').html();
	if(agreementNo!=null && agreementNo!= undefined && agreementNo != '')
		$('#agreementNo').html(agreementNo.replace(/,/g,'-'));
	//商户类型
	var mercTyp = $("#mercTyp").html();
	var mercTypArray = ['普通商户','连锁总店','连锁分店','1+N总店','1+N分店'];
	var mercTypeName = mercTypArray[parseInt(mercTyp)-1];
	$("#mercTyp").html(mercTypeName);
	$("#mercTyp").attr('data-content',mercTypeName);
	if(mercTypeName == '连锁总店' || mercTypeName == '连锁分店' || mercTypeName == '1+N总店' || mercTypeName == '1+N分店'){
		$("#mercTyp").attr("style","color:red;");
		$("#mercTyp").html("<strong>"+mercTypeName+"</strong>");
		
	}
	if(mercTypeName == '连锁分店' || mercTypeName == '1+N分店'){
		var branchSetup = $('#branchSetup').val();
		var branchSet= branchSetup.split(',');
		if(branchSet.length>0){
			for(var i=0;i<branchSet.length;i++){
				if(branchSet[i] == '1')
					$('#independentModel').prop('checked',true);
				else if(branchSet[i] == '2')
					$('#menbersShare').prop('checked',true);
				else if(branchSet[i] == '3')
					$('#allowAudit').prop('checked',true);
			}
		}
		$('#independentModel').click(function(){
			return false;
		});
		$('#menbersShare').click(function(){
			return false;
		});
		$('#allowAudit').click(function(){
			return false;
		});
		$('#branchInfo').show();
	}
	//特殊商户
	var mercCls = $("#mercCls").html();
	var mercClsArray = ['普通商户','小微商户','差错商户'];
	var mercClsName = mercClsArray[parseInt(mercCls)];
	$("#mercCls").html(mercClsName);
	$("#mercCls").attr('data-content',mercClsName);
	//格式化营业地址
	var mercAddr = $('#mercAddr').html();
	var mercAddrs = mercAddr.split('-');
	var newMercAddr = '';
	newMercAddr += getProvNameByProvCd(mercAddrs[0])+'-';
	newMercAddr += getCityNameByCityCd(mercAddrs[1])+'-';
	if(mercAddrs[2] != null && mercAddrs[2] !='')
		newMercAddr += getTownNameByTownCd(mercAddrs[2])+'-';
	newMercAddr += mercAddrs[3];
	//modify by lcf 20160617修改地址中含有-截取错误的bug
	if(mercAddrs.length > 4){
		for(var i = 4;i<mercAddrs.length;i++){
			newMercAddr += "-"+mercAddrs[i];
		}
	}
	$('#mercAddr').html(newMercAddr);
	$('#mercAddr').attr('data-content',newMercAddr);
	//是否允许信用卡
	var isCreditCardFlag = $("#isCreditCardFlag").val();
	if(isCreditCardFlag == '1'){
		$('#isCreditCard').prop('checked',true);
	}
	$('#isCreditCard').click(function(){
		return false;
	});
	//是否县乡优惠
	var mercPreferentialType = $("#mercPreferentialType").val();
	if(mercPreferentialType == '01'){
		$('#urbanAndRural').prop('checked',true);
	}else if(mercPreferentialType == '03'){
		$('#threeRural').prop('checked',true);
	}
	$('#urbanAndRural').click(function(){
		return false;
	});
	$('#threeRural').click(function(){
		return false;
	});
	//是否特优商户
	var specialPreferenceFlag = $("#specialPreferenceFlag").val();
	if(specialPreferenceFlag == '1'){
		$('#specialPreference').prop('checked',true);
	}
	$('#specialPreference').click(function(){
		return false;
	});
	//商户拓展类型
	var mercDevTyp = $("#mercDevTyp").html();
	var mercDevTypArray = ['直营','机构代理','伙伴拓展'];
	var mercDevTypName = mercDevTypArray[parseInt(mercDevTyp)-1];
	$("#mercDevTyp").html(mercDevTypName);
	$("#mercDevTyp").attr('data-content',mercDevTypName);
	//行业大类
	var industryCategories = $("#mcc").html();
	var industryCategoriesArray = ['餐娱类','一般类','民生类','房产汽车类','批发类','公益类'];
	var industryCategoriesName = industryCategoriesArray[parseInt(industryCategories)-1];
	$("#mcc").html(industryCategoriesName);
	$("#mcc").attr('data-content',industryCategoriesName);
	if($('#procDefKey').val() == 'mercInfoUpdate' && $('#feeRate1').html()!=''){
		$('#presetFeeRate').show();
		var presetIndustryCategories = $("#prepareMcc").html();
		var presetIndustryCategoriesName = industryCategoriesArray[parseInt(presetIndustryCategories)-1];
		$("#prepareMcc").html(presetIndustryCategoriesName);
		$("#prepareMcc1").html(presetIndustryCategoriesName);
		$("#prepareMcc").attr('data-content',presetIndustryCategoriesName);
	}
	//是否封顶
	var capAmt = $("#capAmt").html();
	if(capAmt != '0' && capAmt != '9999999.99'){
		$('#isCap').prop('checked',true);
	}
	$('#isCap').click(function(){
		return false;
	});
	if($('#procDefKey').val() == 'mercInfoUpdate' && $('#feeRate1').html()!=''){
		$('#presetFeeRate').show();
		var presetIndustryCategories = $("#prepareMcc").html();
		var presetIndustryCategoriesName = industryCategoriesArray[parseInt(presetIndustryCategories)-1];
		$("#prepareMcc").html(presetIndustryCategoriesName);
		$("#prepareMcc").attr('data-content',presetIndustryCategoriesName);
		//预设费率是否封顶
		var capAmt1 = $("#capAmt1").html();
		if(capAmt1 != '0' && capAmt1 != '9999999.99'){
			$('#isCap1').prop('checked',true);
		}
		$('#isCap1').click(function(){
			return false;
		});
	}
	//功能授理：1.一般刷卡、2.预授权、3.在线退货
	var mercfuns=new Array();
	var mercFunction = $('#mercFunction').html();
	mercfuns=mercFunction.split(',');
	mercFunction = '';
	for(var i=0;i<mercfuns.length;i++){
		if(mercfuns[i]=='1')
			mercFunction+= '一般刷卡、';
		if(mercfuns[i]=='2')
			mercFunction+= '预授权、';
		if(mercfuns[i]=="3")
			mercFunction+= '在线退货、';
	}
	var lastIndex = mercFunction.lastIndexOf('、');
	mercFunction = mercFunction.substr(0,lastIndex)
	$('#mercFunction').html(mercFunction);
	$("#mercFunction").attr('data-content',mercFunction);
	/**
	 * POS信息回填
	 */
	//判断有没有通讯方式为拨号的POS信息
	var haveDialPosFlag = false;
	//POS信息,从第二行开始取，第一行为标题
	var trmCommMods = ['拨号','GPRS','以太网','TD-LTE','CDMA','CDMA2000','WCDMA','TD_SCDMA','WIFI','FDD-LTE'];
	var trList = $("#posInfoTable").find("tr");
    for (var i=1;i<trList.length;i++) {
        var tdArr = trList.eq(i).find("td")
        var  trmCommMod = tdArr.eq(0).html();
        if(trmCommMod != null && trmCommMod !=''){
            tdArr.eq(0).html(trmCommMods[parseInt(trmCommMod)]);
            if(trmCommMod == '0')
            	haveDialPosFlag = true;
        }
    }
    //如果存在拨号类型得POS则加载拨号主叫号码
    if(haveDialPosFlag)
    	$('#callNos').show();
    /**
     * 风险控制信息回填
     */
    //例外商户
    var isExceptionMercFlag = $('#isExceptionMercFlag').val();
    if(isExceptionMercFlag == 1)
    	$('#isExceptionMerc').prop('checked',true);
    if($('#type') != null && $('#type').val() == 'view'){
    	var mercLevel = $("#mercLevel").html();
    	var mercLevelArray = ['','一级','二级','三级','四级','五级'];
    	var mercLevelName = mercLevelArray[parseInt(mercLevel)];
    	$("#mercLevel").html(mercLevelName);
    	$("#mercLevel").attr('data-content',mercLevelName);
    	
    	var noBranch = $("#noBranch").html();
    	var noBranchArray = ['总对总本地','总对总异地','省内有办事处'];
    	var noBranchName = noBranchArray[parseInt(noBranch)-1];
    	$("#noBranch").html(noBranchName);
    	$("#noBranch").attr('data-content',noBranchName);
    	
    	var mixedOperation = $("#mixedOperation").html();
    	var mixedOperationArray = ['正规混业','高低费率同进','模糊混业','非混业'];
    	var mixedOperationName = mixedOperationArray[parseInt(mixedOperation)-1];
    	$("#mixedOperation").html(mixedOperationName);
    	$("#mixedOperation").attr('data-content',mixedOperationName);
    	
    	var acountAuth = $("#acountAuth").html();
    	var acountAuthArray = ['公司核名','个体授权','公对公授权'];
    	var acountAuthName = acountAuthArray[parseInt(acountAuth)-1];
    	$("#acountAuth").html(acountAuthName);
    	$("#acountAuth").attr('data-content',acountAuthName);
    	
    	var lackOfInformation = $("#lackOfInformation").html();
    	var lackOfInformationArray = ['证件补办','照片后补','其他资料缺失','仅核名通知书','核心资料后补','租赁合同进件'];
    	var lackOfInformationName = lackOfInformationArray[parseInt(lackOfInformation)-1];
    	$("#lackOfInformation").html(lackOfInformationName);
    	$("#lackOfInformation").attr('data-content',lackOfInformationName);
    	
    	var mobilPos = $("#mobilPos").html();
    	var mobilPosArray = ['混业低费率','写字楼办公','民生类','封顶商户'];
    	var mobilPosName = mobilPosArray[parseInt(mobilPos)-1];
    	$("#mobilPos").html(mobilPosName);
    	$("#mobilPos").attr('data-content',mobilPosName);
    	
    	var highRiskIndustry = $("#highRiskIndustry").html();
    	var highRiskIndustryArray = ['中介及咨询服务','小型经贸公司','教育培训类公司','直销公司'];
    	var highRiskIndustryName = highRiskIndustryArray[parseInt(highRiskIndustry)-1];
    	$("#highRiskIndustry").html(highRiskIndustryName);
    	$("#highRiskIndustry").attr('data-content',highRiskIndustryName);
    	$('#isExceptionMerc').click(function(){
    		return false;
    	});
    }else{
    	var procDefKey = $('#procDefKey').val();
    	//填充MCC下拉框并设置对应MCC选中
    	if(procDefKey == 'mercIncome')
    		fillMccCdSelect($('#mccCd').val(),'riskControl.mccCd');
    	if($('#procDefKey').val() == 'mercInfoUpdate' && $('#preGoodsInfo').html()!=''){
    		fillMccCdSelect($('#prepareMccCode').val(),'riskControl.prepareMccCode');
    	}
    	//商户级别
        $('#mercLevelSelect').val($('#mercLevel').val());
        $("#mercLevelSelect").trigger("chosen:updated");
        //无分公司
        $('#noBranchSelect').val($('#noBranch').val());
        $("#noBranchSelect").trigger("chosen:updated");
        //混业经营
        $('#mixedOperationSelect').val($('#mixedOperation').val());
        $("#mixedOperationSelect").trigger("chosen:updated");
        //商户级别
        $('#mccCdSelect').val($('#mccCd').val());
        $("#mccCdSelect").trigger("chosen:updated");
        //账户授权
        $('#acountAuthSelect').val($('#acountAuth').val());
        $("#acountAuthSelect").trigger("chosen:updated");
        //资料缺失
        $('#lackOfInformationSelect').val($('#lackOfInformation').val());
        $("#lackOfInformationSelect").trigger("chosen:updated");
        //移动POS
        $('#mobilPosSelect').val($('#mobilPos').val());
        $("#mobilPosSelect").trigger("chosen:updated");
        //高风险行业
        $('#highRiskIndustrySelect').val($('#highRiskIndustry').val());
        $("#highRiskIndustrySelect").trigger("chosen:updated");
        //每日结算限额
        $('#limitmoneySelect').val($('#limitmoney').val());
        $("#limitmoneySelect").trigger("chosen:updated");
        if($('#procDefKey').val() == 'mercIncome'){
        	//关键字
        	var descBiz = $('#descBiz').val();
        	if(descBiz == "")
        		$("#keywords").trigger('change');
            //商户mcc
            $("#mccCdSelect").trigger("chosen:updated");
        }
    }
    
    
    /**
     * 资质信息回填
     */
    //商户性质
	var mercNature = $("#mercNature").html();
	var mercNatureArray = ['个体','公司','个人独资'];
	var mercNatureName = mercNatureArray[parseInt(mercNature)-1];
	$("#mercNature").html(mercNatureName);
	$("#mercNature").attr('data-content',mercNatureName);
	//营业执照是否长期有效
	var licenseEffFlg = $("#licenseEffFlg").val();
	if(licenseEffFlg == '1'){
		$("#licenseEffDate").html('长期有效');
		$("#licenseEffDate").attr('data-content','长期有效');
	}
	//法人证件类型
	var legalCredenTialsType = $("#legalCredentialsType").html();
	var legalCredenTialsTypeArray = ['身份证','军人证','警察证','港澳居民往来内地通行证','台湾居民来往大陆通行证','护照','其他'];
	var legalCredenTialsTypeName = legalCredenTialsTypeArray[parseInt(legalCredenTialsType)-1];
	$("#legalCredentialsType").html(legalCredenTialsTypeName);
	$("#legalCredentialsType").attr('data-content',legalCredenTialsTypeName);
	//营业执照是否长期有效
	var legalCredentialsFlg = $("#legalCredentialsFlg").val();
	if(legalCredentialsFlg == '1'){
		$("#legalCredentialsEffDate").html('长期有效');
		$("#legalCredentialsEffDate").attr('data-content','长期有效');
	}
	//是否允许隔日对账
	var isSattleFlg = $("#isSattleFlg").val();
	if(isSattleFlg == '1'){
		$('#isSattle').prop('checked',true);
	}
	$('#isSattle').click(function(){
		return false;
	});
	//其它消费
	var qrCodeFlag = $('#qrCodeFlag').val();
	if(qrCodeFlag == '1')
		$('#qrCodeFlg').prop('checked',true);
	else
		$('#qrCodeFlg').prop('checked',false);
	$('#qrCodeFlg').click(function(){
		return false;
	});
	//随意通
	var tZeroStmtFlag = $('#tZeroStmtFlag').val();
	if(tZeroStmtFlag == '1'){
		$('#tZeroStmt').prop('checked',true);
		var stmTimeOneFlag = $('#stmTimeOneFlag').val();
		if(stmTimeOneFlag == '1')
			$('#stmTimeOne').prop('checked',true);
		else
			$('#stmTimeOne').prop('checked',false);
		var stmTimeTwoFlag = $('#stmTimeTwoFlag').val();
		if(stmTimeTwoFlag == '1')
			$('#stmTimeTwo').prop('checked',true);
		else
			$('#stmTimeTwo').prop('checked',false);
		var stmTimeThreeFlag = $('#stmTimeThreeFlag').val();
		if(stmTimeThreeFlag == '1')
			$('#stmTimeThree').prop('checked',true);
		else
			$('#stmTimeThree').prop('checked',false);
		var stmTimeFourFlag = $('#stmTimeFourFlag').val();
		if(stmTimeFourFlag == '1')
			$('#stmTimeFour').prop('checked',true);
		else
			$('#stmTimeFour').prop('checked',false);
		var stmTimeFiveFlag = $('#stmTimeFiveFlag').val();
		if(stmTimeFiveFlag == '1')
			$('#stmTimeFive').prop('checked',true);
		else
			$('#stmTimeFive').prop('checked',false);
		var stmTimeSixFlag = $('#stmTimeSixFlag').val();
		if(stmTimeSixFlag == '1')
			$('#stmTimeSix').prop('checked',true);
		else
			$('#stmTimeSix').prop('checked',false);
		var stmTimeSevenFlag = $('#stmTimeSevenFlag').val();
		if(stmTimeSevenFlag == '1')
			$('#stmTimeSeven').prop('checked',true);
		else
			$('#stmTimeSeven').prop('checked',false);
		var stmTimeEightFlag = $('#stmTimeEightFlag').val();
		if(stmTimeEightFlag == '1')
			$('#stmTimeEight').prop('checked',true);
		else
			$('#stmTimeEight').prop('checked',false);
		var stmTimeNineFlag = $('#stmTimeNineFlag').val();
		if(stmTimeNineFlag == '1')
			$('#stmTimeNine').prop('checked',true);
		else
			$('#stmTimeNine').prop('checked',false);
		var stmTimeTenFlag = $('#stmTimeTenFlag').val();
		if(stmTimeTenFlag == '1')
			$('#stmTimeTen').prop('checked',true);
		else
			$('#stmTimeTen').prop('checked',false);
		$('#stmTimeOne').click(function(){
			return false;
		});
		$('#stmTimeTwo').click(function(){
			return false;
		});
		$('#stmTimeThree').click(function(){
			return false;
		});
		$('#stmTimeFour').click(function(){
			return false;
		});
		$('#stmTimeFive').click(function(){
			return false;
		});
		$('#stmTimeSix').click(function(){
			return false;
		});
		$('#stmTimeSeven').click(function(){
			return false;
		});
		$('#stmTimeEight').click(function(){
			return false;
		});
		$('#stmTimeNine').click(function(){
			return false;
		});
		$('#stmTimeTen').click(function(){
			return false;
		});
		
		$('#stmQuotaInfo').show();
	}
	$('#tZeroStmt').click(function(){
		return false;
	});
	//非工作日结算
	var offdayStmtFlag = $('#offdayStmtFlag').val();
	if(offdayStmtFlag == '1'){
		$('#offdayStmt').prop('checked',true);
	}
	$('#offdayStmt').click(function(){
		return false;
	});
	//即日付
	var nowPayFlag = $('#nowPayFlag').val();
	if(nowPayFlag == '1'){
		$('#nowPay').prop('checked',true);
	}
	$('#nowPay').click(function(){
		return false;
	});
	//朝付通
	var zftFlgFlag = $('#zftFlgFlag').val();
	if (zftFlgFlag == '01' || zftFlgFlag == '02') {
		$("#zftFlg").prop('checked', true);
	}
	$('#zftFlg').click(function() {
		return false;
	});
	//结算账户1-结算类型
	var stmActTyp1 = $('#stmActTyp1').html();
	if(stmActTyp1 == '1'){
		$('#stmActTyp1').html('对公');
		$("#stmActTyp1").attr('data-content','对公');
	}else if(stmActTyp1 == '2'){
		$('#stmActTyp1').html('对私');
		$("#stmActTyp1").attr('data-content','对私');
	}
	//结算账户1-结算类型
	var stmActTyp2 = $('#stmActTyp2').html();
	if(stmActTyp2 == '1'){
		$('#stmActTyp2').html('对公');
		$("#stmActTyp2").attr('data-content','对公');
	}else if(stmActTyp2 == '2'){
		$('#stmActTyp2').html('对私');
		$("#stmActTyp2").attr('data-content','对私');
	}
	//结算卡一：填充银行名称到页面
	var stmBankNm1 = $('#stmBankNm1').html();
	getBankNameByBankCd('label','stmBankNm1',stmBankNm1);
	if($('#stmActNm2').html() != ''){
		//结算卡二：填充银行名称到页面
		var stmBankNm2 = $('#stmBankNm2').html();
		getBankNameByBankCd('label','stmBankNm2',stmBankNm2);
	}
	//是否收取维护费
	var isMaintenanceFeeFlag = $('#isMaintenanceFeeFlag').val();
	if(isMaintenanceFeeFlag == '1'){
		$('#isMaintenanceFee').prop('checked',true);
		$('#mainternanceFeeInfo').show();
		//收取模式
		var chargingMod = $("#chargingMod").html();
		var chargingModArray = ['预收','后收'];
		var chargingModName = chargingModArray[parseInt(chargingMod)-1];
		$("#chargingMod").html(chargingModName);
		$("#chargingMod").attr('data-content',chargingModName);
		//收取方式
		var chargingWay = $("#chargingWay").html();
		var chargingWayArray = ['刷卡','汇款','坐扣'];
		var chargingWayName = chargingWayArray[parseInt(chargingWay)-1];
		$("#chargingWay").html(chargingWayName);
		$("#chargingWay").attr('data-content',chargingWayName);
		//终端安装当月是否收取维护费
		var isMaintenanceFeeCurrentFlag = $('#isMaintenanceFeeCurrentFlag').val();
		if(isMaintenanceFeeFlag == '1'){
			$('#isMaintenanceFeeCurrent').prop('checked',true);
		}
		$('#isMaintenanceFeeCurrent').click(function(){
			return false;
		});
	}
	$('#isMaintenanceFee').click(function(){
		return false;
	});
	//是否收取押金
	var isDepositFlag = $('#isDepositFlag').val();
	if(isDepositFlag == '1'){
		$('#isDeposit').prop('checked',true);
	}
	$('#isDeposit').click(function(){
		return false;
	});
	//预付卡是否开通
	var isPrepaidCardFlag = $('#isPrepaidCardFlag').val();
	if(isPrepaidCardFlag == '1'){
		$('#isPrepaidCard').prop('checked',true);
		$('#prepaidCardInfo').show();
		//功能授理：1.一般刷卡、2.预授权、3.在线退货
		var functionAccepted = $('#functionAcceptedForPC').html();
		mercfuns=functionAccepted.split(',');
		functionAccepted = '';
		for(var i=0;i<mercfuns.length;i++){
			if(mercfuns[i]=='1')
				functionAccepted+= '一般刷卡、';
			if(mercfuns[i]=='2')
				functionAccepted+= '预授权、';
			if(mercfuns[i]=="3")
				functionAccepted+= '在线退货、';
		}
		var lastIndex = functionAccepted.lastIndexOf('、');
		functionAccepted = functionAccepted.substr(0,lastIndex)
		$('#functionAcceptedForPC').html(functionAccepted);
		$("#functionAcceptedForPC").attr('data-content',functionAccepted);
	}
	$('#isPrepaidCard').click(function(){
		return false;
	});
	//北京中行外卡是否开通
	var foreignCcyCardTyp1Flag = $('#foreignCcyCardTyp1Flag').val();
	if(foreignCcyCardTyp1Flag == '1'){
		$('#foreignCcyCardTyp1').prop('checked',true);
		$('#foreighCardInfoOfBocInfo').show();
		//功能授理：1.一般刷卡、2.预授权、3.在线退货
		var functionAccepted = $('#functionAcceptedForFC').html();
		mercfuns=functionAccepted.split(',');
		functionAccepted = '';
		for(var i=0;i<mercfuns.length;i++){
			if(mercfuns[i]=='1')
				functionAccepted+= '一般刷卡、';
			if(mercfuns[i]=='2')
				functionAccepted+= '预授权、';
			if(mercfuns[i]=="3")
				functionAccepted+= '在线退货、';
		}
		var lastIndex = functionAccepted.lastIndexOf('、');
		functionAccepted = functionAccepted.substr(0,lastIndex)
		$('#functionAcceptedForFC').html(functionAccepted);
		$("#functionAcceptedForFC").attr('data-content',functionAccepted);
	}
	$('#foreignCcyCardTyp1').click(function(){
		return false;
	});
	//北京交行外卡是否开通
	var bocomFeeRateVisa = $('#bocomFeeRateVisa').html();
	if(bocomFeeRateVisa != ''){
		$('#foreignCcyCardTyp2').prop('checked',true);
		$('#foreighCardInfoOfBocomInfo').show();
	}
	$('#foreignCcyCardTyp2').click(function(){
		return false;
	});
	
    var procDefKey = $("[name='procDefKey']").val();
	if(procDefKey == 'mercInfoUpdate' && $('#type').val() != 'view'){
		//判断
		if(validateInt($("#centerOperateNum").val())==false||$("#centerOperateNum").val()==null||$("#centerOperateNum").val()==""){
			$("#centerOperateNum").val("0");
		}
	    if(validateInt($("#riskOperateNum").val())==false||$("#riskOperateNum").val()==null||$("#riskOperateNum").val()==""){
			$("#riskOperateNum").val("0");
		}
		var taskDefKey = $("[name='taskDefKey']").val();
		if(taskDefKey == 'centerCheck')
			getIcsMessage("green",parseInt($("#centerOperateNum").val())+1,"审单中心","Aud");
		if(taskDefKey == 'headRiskControl')
			getIcsMessage("blue",parseInt($("#riskOperateNum").val())+1,"城市风控","Ris");
		var restrictTimesflg = validateRestrictTimes3();
		$("#restrictTimes").val(restrictTimesflg);
	}
	if ($("[name='taskDefKey']").val() == 'centerCheck' || $("[name='taskDefKey']").val() == 'headRiskControl') {
		var tipHtml = '<div style="color: red;">';
		var actNo1="";
		var actNo2="";
		var actNm1="";
		var actNm2="";
    	if ($("#stmAct1").val() != null && $("#stmAct1").val() != undefined) {
			actNo1 = $("#stmAct1").val().replace(/\s/gi, '');
		}
		if ($("#stmAct2").val() != null && $("#stmAct2").val() != undefined) {
			actNo2 = $("#stmAct2").val().replace(/\s/gi, '');
		}
		if ($("#stmActNm1").val() != null && $("#stmActNm1").val() != undefined) {
			actNm1 = $("#stmActNm1").val().replace(/\s/gi, '');
		}
		if ($("#stmActNm2").html() != null && $("#stmActNm2").html() != undefined) {
			actNm2 = $("#stmActNm2").html().replace(/\s/gi, '');
		}
		
		if($("#idCardNo1").val()!=undefined && $("#idCardNo1").val()!=null){
			idCardNo1 = $("#idCardNo1").val().replace(/\s/gi,'');
		}else{
			idCardNo1 ="";
		}
		var idCardNo2 = "";
		if($("#idCardNo2").attr("data-content")!=undefined && $("#idCardNo2").attr("data-content")!=null){
			idCardNo2 = $("#idCardNo2").attr("data-content").replace(/\s/gi,'');
		}
		if($("#mercRegNm").html()!=null && $("#mercRegNm").html()!=undefined){
			var mercRegNm = encodeURIComponent($("#mercRegNm").html().trim());
		}
		if($("#mercAdminTel").html() != null && $("#mercAdminTel").html() !=undefined){
			var mercAdminTel = $("#mercAdminTel").html().replace(/\s/gi,'');
		}
		if($("#legalNm").val() != null && $("#legalNm").val() !=undefined){
			var legalNm = encodeURIComponent($("#legalNm").val().replace(/\s/gi,''));
		}
		if($("#legalCredentialsNo").val() !=null && $("#legalCredentialsNo").val() !=undefined){
			var legalCredentialsNo = $("#legalCredentialsNo").val().replace(/\s/gi,'');
		}
		if($("#contact").html() !=null && $("#contact").html()!=undefined){
			var contact = encodeURIComponent($("#contact").html().replace(/\s/gi,''));
		}
		if($("#telNo").html() != null && $("#telNo").html()!=undefined){
			var telNo = $("#telNo").html().replace(/\s/gi,'');
		}
		console.log("商户等级："+$("#acMecNormalLevel").val());
		$.ajax({
			url : '/mercValiRepeat/centerValidateRestrictTimes.do',
			async:false,
			cache: false,
			type:'POST',
			data : {
				regNm : mercRegNm.trim(),
				regNo : $("#regNo").html().trim(),
				actNo1 : actNo1,
				actNo2 : actNo2,
				mecAdminTel : mercAdminTel,
				legPerNm : legalNm,
				actNm1 : encodeURIComponent(actNm1),
				actNm2 : encodeURIComponent(actNm2),
				legPerCrdNo : legalCredentialsNo,
				idCardNo1 : idCardNo1,
				idCard2:idCardNo2,
				contNmCn : contact,
				contTelNo : telNo,
				flag1 : $("#stmActTyp1").html(),
				flag2 : $("#stmActTyp2").html(),
				orgNo : $("#orgBranchAttribution").val(),
				mercId: $("#mercId").html(),
				mecNormalLevel: $("#acMecNormalLevel").val()
			},
			success : function(data) {
				if (data != '') {
						//add by hss 2016-04-14 授权次数
						if (data.authNum != '0' && data.authNum != undefined) {
							$("#authorityNum").val(data.authNum);
							tipHtml +='<h7>注册名称授权次数:'
									+ data.authNum
									+ '次；&nbsp;';
						}
						if (data.regNmRepeatNum != '0' && data.regNmRepeatNum != undefined) {
							$("#regNmNum").val(data.regNmRepeatNum);
							tipHtml +='注册名称重复次数:'
									+ data.regNmRepeatNum
									+ '次；&nbsp;';
						}
						if (data.regIdRepeatNum != '0' && data.regIdRepeatNum != undefined) {
							$("#regIdNum").val(data.regIdRepeatNum);
							tipHtml +='注册登记号重复次数:'
									+ data.regIdRepeatNum
									+ '次；&nbsp;';
						}
						if (data.legCrdRepeatNum != '0' && data.legCrdRepeatNum != undefined) {
							tipHtml += '法人证件号码重复次数:'
									+ data.legCrdRepeatNum
									+ '次；&nbsp;';
						}
						if (data.actNo1RepeatNum != '0' && data.actNo1RepeatNum != undefined) {
							$("#actNo1Num").val(data.actNo1RepeatNum);
							tipHtml +='结算卡一账号重复次数:'
									+ data.actNo1RepeatNum
									+ '次；&nbsp;';
						}
						if (data.actNo2RepeatNum != '0' && data.actNo2RepeatNum != undefined) {
							$("#actNo2Num").val(data.actNo2RepeatNum);
							tipHtml +='结算卡二账号重复次数:'
									+ data.actNo2RepeatNum
									+ '次；&nbsp;';
						}
						if (data.legPerNmRepeatNum != '0' && data.legPerNmRepeatNum != undefined) {
							tipHtml +='法人名称重复次数:'
									+ data.legPerNmRepeatNum
									+ '次；&nbsp;';
						}
						/*if (data.actNm1RepeatNum != '0' && data.actNm1RepeatNum != undefined) {
							$("#actNm1Num").val(data.actNm1RepeatNum);
							tipHtml += '结算卡一户名重复次数:'
									+ data.actNm1RepeatNum
									+ '次；&nbsp;';
						}
						if (data.actNm2RepeatNum != '0' && data.actNm2RepeatNum != undefined) {
							$("#actNm2Num").val(data.actNm2RepeatNum);
							tipHtml += '结算卡二户名重复次数:'
									+ data.actNm2RepeatNum
									+ '次；&nbsp;';
						}*/
						if (data.idCardNo1RepeatNum != '0' && data.idCardNo1RepeatNum != undefined) {
							$("#idCardNo1Num").val(data.idCardNo1RepeatNum);
							tipHtml += '结算人卡一证件号重复次数:'
									+ data.idCardNo1RepeatNum
									+ '次；&nbsp;';
						}
						if (data.idCardNo2RepeatNum != '0' && data.idCardNo2RepeatNum != undefined) {
							$("#idCardNo2Num").val(data.idCardNo2RepeatNum);
							tipHtml +=  '结算人卡二证件号重复次数:'
									+ data.idCardNo2RepeatNum
									+ '次；&nbsp;';
						}
						if (data.contNmCnRepeatNum != '0' && data.contNmCnRepeatNum != undefined) {
							tipHtml += '联系人姓名重复次数:'
									+ data.contNmCnRepeatNum
									+ '次；&nbsp;';
						}
						if (data.contTelNoRepeatNum != '0' && data.contTelNoRepeatNum != undefined) {
							tipHtml += '联系人电话重复次数:'
									+ data.contTelNoRepeatNum
									+ '次；</h7><br/>';
						}
						if (data.settleRepeatMec != null && data.settleRepeatMec != undefined) {
							tipHtml += '<br/><h7>结算卡一账号、账户名、身份证号码为重复进件信息，例商编'
									+ data.settleRepeatMec+ '</h7>';
						}
						if (data.intelRepeatMec != null && data.intelRepeatMec != undefined) {
							tipHtml += '<br/><h7>注册名称、注册登记号为重复进件信息，例商编'
									+ data.intelRepeatMec+ '</h7>';
						}
						tipHtml+='</div>';
					$('#repeatCount').html(tipHtml);
				}
			},
			error:function(e){
				alert(e);
		    }
		});
	}

});
//填充MCC下拉框
function fillMccCdSelect(mccCd,mccSelectName){
	//alert(mccCd)
	var industryCategories = $('#mcc').html();
	if($('#procDefKey').val() == 'mercInfoUpdate' && $('#preGoodsInfo').html()!=''){
		industryCategories = $('#prepareMcc').html();
	}
	if(industryCategories!=''){
		$.ajax({
	        url: '/mercIncome/findMccByIndustryCategories.do',
	        data:{
	        	industryCategories:industryCategories
	        },
	        async : false,
	        cache: true,
	        success : function(relationList) {
	       	 	if(relationList != null && relationList !=undefined){
		       		 var options = "<option value=''>请选择</option>";
		             for(var i=0;i<relationList.length;i++){
		            	 if(relationList[i].mcc == mccCd)
		            		 options+="<option value='"+relationList[i].mcc+"' selected='selected'>"+relationList[i].mccIc+"</option>";
		            	 else
		            		 options+="<option value='"+relationList[i].mcc+"'>"+relationList[i].mccIc+"</option>";
		             }
		             $("[name='"+mccSelectName+"']").html(options);
		             $("[name='"+mccSelectName+"']").trigger("chosen:updated");
	       	 	}
	        }
		});
	}	
}
var oldMccCd = $("[name='mccCd']").val();
function refreshDescBiz(inputId,taskDefKey){
	$("#keywords").trigger('blur');
	var mccCd = $("[name='riskControl.mccCd']").val();
	var prepareMccInput = $("[name='riskControl.prepareMccCode']").val();
	if(prepareMccInput != undefined && prepareMccInput !='' && prepareMccInput !=null){
		mccCd = prepareMccInput;
	}
	if(inputId =='mccCd' || inputId=='keywords'){
		if(mccCd!='' && mccCd != null){
			
				var mercFunctionNum = $("#mercFunction").html()
				if(mercFunctionNum == '预授权' || mercFunctionNum.indexOf("预授权") >= 0){//开通预授权
					if(mccCd == '7011' || mccCd == '7512'){
							 RegainsTheButtonState();
					}else{
						alert("预授权商户必须是MCC为7011、7512！");
						 RegainsTheButtonState();
						return;
					}
				}
			$.ajax({
				url : '/mercIncome/findIndustryAbbreviationByMccCd.do?mccCd=' + mccCd,
				cache : false,
				async : false,
				success : function(data) {
					if (data != null && data != '') {
						$("[name='industryAbbreviation']").val($.trim(data));
						$("[name='industryAbbreviation']").val($.trim($("[name='industryAbbreviation']").val()));
					}else{
						alert("该MCC下无对应行业简称，请重新输入！");
						$("[name='industryAbbreviation']").val('');
					}
				}
			});
		}else{
			$("[name='industryAbbreviation']").val('');
		}
	}
	
	var keywords = $("[name='riskControl.keywords']").val();
	var areaInfo = $("[name='areaInfo']").val();
	var bizScope= $("#bizScope").html();
	var industryAbbreviation = $("[name='industryAbbreviation']").val();
	if(taskDefKey== 'centerCheck'){
		$("[name='riskControl.descBiz']").val($.trim(areaInfo+keywords+bizScope+industryAbbreviation));
	}
	$("[name='riskControl.descLoanBiz']").val($.trim(areaInfo+keywords));
	if(taskDefKey == 'centerCheck'){
		$("#mercFnm").val($("#descBiz").val());
	}
	if($("#mccCdSelect").val() !=  $("#mccCd").val() ||  $("#keyw").val() != $("#keywords").val()){
		if($("#mccCdFlg").val() != "0"){
	     	alert("经营概述已变更请修改经营名称！");
		}
	} 
	//变更提示标记
	$("#mccCdFlg").val("1");
	//将$("#descBiz").trigger('blur');与$("#mercFnm").trigger('blur'); 注释掉：OPERATION-7733，输入关键字字段过长时，会弹出多次“经营名称字数不合规”的提示
	$("#descBiz").trigger('blur');
	$("#mercFnm").trigger('blur');
	$("#mercFnm").val($("#descBiz").val());
	checkMercFnmLen();
}

//县乡三农优惠
function urbanAndRuralOperate(){
	//01-县乡优惠，02-普通商户，03-三农商户
	if($("#mercPreferentialType").val()=="01"){
		$("#urbanAndRural").prop("checked", true);
		urbanAndRural();
	    $("#feeRateTipInfo").hide();
		$("#capAmtTipInfo").hide();
	}else if($("#mercPreferentialType").val()=="03"){
		$("#threeRural").prop("checked", true);
		threeRural();
	    $("#feeRateTipInfo").hide();
	    $("#capAmtTipInfo").hide();
	}
	$("#urbanAndRural").click(function(){
		if($(this).prop('checked')){
			$("#mercDiscountInfo").show();
			$("#threeRural").prop("checked", false);
			$("#threeRural").trigger('change');
			$("#urbanAndRural").trigger('change');
			$("#mercDiscountInfo").html('');
			urbanAndRural();
			$("#mercPreferentialType").val("01");
		    $("#feeRateTipInfo").hide();
		    $("#capAmtTipInfo").hide();
		}else{
			$("#feeRateTipInfo").show();
			$("#capAmtTipInfo").show();
		    $("#mercDiscountInfo").html('');
		    $("#mercPreferentialType").val("02");
		}
	});
	$("#threeRural").click(function(){
		if($(this).prop('checked')){
			$("#urbanAndRural").prop("checked", false);
			$("#urbanAndRural").trigger('change');
			$("#threeRural").trigger('change');
			$("#mercDiscountInfo").html('');
			threeRural();
			$("#mercPreferentialType").val("03");
		    $("#feeRateTipInfo").hide();
			$("#capAmtTipInfo").hide();
		}else{
			$("#feeRateTipInfo").show();
			$("#capAmtTipInfo").show();
		    $("#mercDiscountInfo").html('');
		    $("#mercPreferentialType").val("02");
		}
	});
	
}
//修改流程县乡三农优惠
function urbanAndRuralOperateUpdateFlow(){
	//01-县乡优惠，02-普通商户，03-三农商户
	if($("#mercPreferentialType").val()=="01"){
		$("#urbanAndRural").prop("checked", true);
		urbanAndRuralUpdateFlow();
//	    $("#prepareFeeRateTip").hide();
//		$("#capAmtTipInfo").hide();
	}else if($("#mercPreferentialType").val()=="03"){
		$("#threeRural").prop("checked", true);
		threeRuralUpdateFlow();
//	    $("#prepareFeeRateTip").hide();
//	    $("#capAmtTipInfo").hide();
	}
	$("#urbanAndRural").click(function(){
		if($(this).is(':checked')){
			$("#mercDiscountInfo").show();
			if(this.id=='urbanAndRural'){
				$("#threeRural").prop("checked", false);
				$("#threeRural").trigger('change');
				$("#urbanAndRural").trigger('change');
				$("#mercDiscountInfo").html('');
				urbanAndRuralUpdateFlow();
				$("#mercPreferentialType").val("01");
			    $("#prepareFeeRateTip").hide();
			    $("#capAmtTipInfo").hide();
			}else{
				$("#urbanAndRural").prop("checked", false);
				$("#threeRural").trigger('change');
				$("#urbanAndRural").trigger('change');
				$("#mercDiscountInfo").html('');
				threeRuralUpdateFlow();
				$("#mercPreferentialType").val("03");
			    $("#prepareFeeRateTip").hide();
				$("#capAmtTipInfo").hide();
			}
		}else{
			$("#prepareFeeRateTip").show();
			$("#capAmtTipInfo").show();
		    $("#mercDiscountInfo").html('');
		    $("#mercPreferentialType").val("02");
		}
	});
}

//商户类型为县乡时，费率以及封顶金额判断
function urbanAndRural(){
	if($("#mercTrddesc").html()=="1"){
  	if(parseFloat($("#feeRate").html())<0.85){
  		$("#mercDiscountInfo").html('餐娱类最低签约费率低于0.85,请回退发起人做修改！');
  	}
  }else if($("#mercTrddesc").html()=="2"){
  	if(parseFloat($("#feeRate").html())<0.5){
  		$("#mercDiscountInfo").html('一般类最低签约费率低于0.5,请回退发起人做修改！');
  	}
  }else if($("#mercTrddesc").html()=="3"){
  	if(parseFloat($("#feeRate").html())<0.25){
  		$("#mercDiscountInfo").html('民生类最低签约费率低于0.25,请回退发起人做修改！');
  	}
  }else if($("#mercTrddesc").html()=="4"){
  	if(parseFloat($("#feeRate").html())<0.85&&$("#isCapFlag").val() == '1'&&parseFloat($("#capAmt").val())>=30){
  		$("#mercDiscountInfo").html('房产汽车类最低签约费率低于0.85,请回退发起人做修改！');
  	}else if(parseFloat($("#feeRate").html())<0.85&&$("#isCapFlag").val() == '1'&&parseFloat($("#capAmt").val())<30){
  		$("#mercDiscountInfo").html('房产汽车类最低签约费率低于0.85/封顶值低于30,请回退发起人做修改！');
  	}else if(parseFloat($("#feeRate").html())>=0.85&&$("#isCapFlag").val() == '1'&&parseFloat($("#capAmt").val())<30){
  		$("#mercDiscountInfo").html('房产汽车类封顶值低于30,请回退发起人做修改！');
  	}
  }else if($("#mercTrddesc").html()=="5"){
  	if(parseFloat($("#feeRate").html())<0.5&&$("#isCapFlag").val() == '1'&&parseFloat($("#capAmt").val())>=20){
  		$("#mercDiscountInfo").html('批发类最低签约费率低于0.5,请回退发起人做修改！');
  	}else if(parseFloat($("#feeRate").html())<0.5&&$("#isCapFlag").val() == '1'&&parseFloat($("#capAmt").val())<20){
  		$("#mercDiscountInfo").html('批发类最低签约费率低于0.5/封顶值低于20,请回退发起人做修改！');
  	}else if(parseFloat($("#feeRate").html())>=0.5&&$("#isCapFlag").val() == '1'&&parseFloat($("#capAmt").val())<20){
  		$("#mercDiscountInfo").html('批发类封顶值低于20,请回退发起人做修改！');
  	}
  }
}
//商户类型为三农时，费率以及封顶金额判断
function threeRural(){
	if($("#mercTrddesc").html()=="1"){
    	if(parseFloat($("#feeRate").html())<0.85){
    		$("#mercDiscountInfo").html('餐娱类最低签约费率低于0.85,请回退发起人做修改！');
    	}
    }else if($("#mercTrddesc").html()=="2"){
    	if(parseFloat($("#feeRate").html())<0.5){
    		$("#mercDiscountInfo").html('一般类最低签约费率低于0.5,请回退发起人做修改！');
    	}
    }else if($("#mercTrddesc").html()=="3"){
    	if(parseFloat($("#feeRate").html())<0.25){
    		$("#mercDiscountInfo").html('民生类最低签约费率低于0.25,请回退发起人做修改！');
    	}
    }else if($("#mercTrddesc").html()=="4"){
    	if(parseFloat($("#feeRate").html())<0.85&&$("#isCapFlag").val() == '1'&&parseFloat($("#capAmt").val())>=30){
    		$("#mercDiscountInfo").html('房产汽车类最低签约费率低于0.85,请回退发起人做修改！');
    	}else if(parseFloat($("#feeRate").html())<0.85&&$("#isCapFlag").val() == '1'&&parseFloat($("#capAmt").val())<30){
    		$("#mercDiscountInfo").html('房产汽车类最低签约费率低于0.85/封顶值低于30,请回退发起人做修改！');
    	}else if(parseFloat($("#feeRate").html())>=0.85&&$("#isCapFlag").val() == '1'&&parseFloat($("#capAmt").val())<30){
    		$("#mercDiscountInfo").html('房产汽车类封顶值低于30,请回退发起人做修改！');
    	}
    }else if($("#mercTrddesc").html()=="5"){
    	if(parseFloat($("#feeRate").html())<0.3&&$("#isCapFlag").val() == '1'&&parseFloat($("#capAmt").val())>=10){
    		$("#mercDiscountInfo").html('批发类最低签约费率低于0.3,请回退发起人做修改！');
    	}else if(parseFloat($("#feeRate").html())<0.3&&$("#isCapFlag").val() == '1'&&parseFloat($("#capAmt").val())<10){
    		$("#mercDiscountInfo").html('批发类最低签约费率低于0.3/封顶值低于10,请回退发起人做修改！');
    	}else if(parseFloat($("#feeRate").html())>=0.3&&$("#isCapFlag").val() == '1'&&parseFloat($("#capAmt").val())<10){
    		$("#mercDiscountInfo").html('批发类封顶值低于10,请回退发起人做修改！');
    	}
    }
}
//修改流程商户类型为县乡时，费率以及封顶金额判断
function urbanAndRuralUpdateFlow(){
	if($("#feeRate1").val()== undefined||$("#feeRate1").val()==""||$("#feeRate1").val()==null||$("#feeRate1").val()== 'undefined'){
		urbanAndRural();
	}else{
		if($("#prepareMcc").val()=="1"){
	    	if(parseFloat($("#feeRate1").val())<0.85){
	    		$("#mercDiscountInfo").html('餐娱类最低签约费率低于0.85,请回退发起人做修改！');
	    	}
	    }else if($("#prepareMcc").val()=="2"){
	    	if(parseFloat($("#feeRate1").val())<0.5){
	    		$("#mercDiscountInfo").html('一般类最低签约费率低于0.5,请回退发起人做修改！');
	    	}
	    }else if($("#prepareMcc").val()=="3"){
	    	if(parseFloat($("#feeRate1").val())<0.25){
	    		$("#mercDiscountInfo").html('民生类最低签约费率低于0.25,请回退发起人做修改！');
	    	}
	    }else if($("#prepareMcc").val()=="4"){
	    	if(parseFloat($("#feeRate1").val())<0.85&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())>=30){
	    		$("#mercDiscountInfo").html('房产汽车类最低签约费率低于0.85,请回退发起人做修改！');
	    	}else if(parseFloat($("#feeRate1").val())<0.85&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())<30){
	    		$("#mercDiscountInfo").html('房产汽车类最低签约费率低于0.85/封顶值低于30,请回退发起人做修改！');
	    	}else if(parseFloat($("#feeRate1").val())>=0.85&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())<30){
	    		$("#mercDiscountInfo").html('房产汽车类封顶值低于30,请回退发起人做修改！');
	    	}
	    }else if($("#prepareMcc").val()=="5"){
	    	if(parseFloat($("#feeRate1").val())<0.5&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())>=20){
	    		$("#mercDiscountInfo").html('批发类最低签约费率低于0.5,请回退发起人做修改！');
	    	}else if(parseFloat($("#feeRate1").val())<0.5&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())<20){
	    		$("#mercDiscountInfo").html('批发类最低签约费率低于0.5/封顶值低于20,请回退发起人做修改！');
	    	}else if(parseFloat($("#feeRate1").val())>=0.5&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())<20){
	    		$("#mercDiscountInfo").html('批发类封顶值低于20,请回退发起人做修改！');
	    	}
	    }
	}
}
//商户类型为三农时，费率以及封顶金额判断
function threeRuralUpdateFlow(){
	if($("#feeRate1").val()== undefined||$("#feeRate1").val()==""||$("#feeRate1").val()==null||$("#feeRate1").val()== 'undefined'){
		threeRural();
	}else{
		if($("#prepareMcc").val()=="1"){
	    	if(parseFloat($("#feeRate1").val())<0.85){
	    		$("#mercDiscountInfo").html('餐娱类最低签约费率低于0.85,请回退发起人做修改！');
	    	}
	    }else if($("#prepareMcc").val()=="2"){
	    	if(parseFloat($("#feeRate1").val())<0.5){
	    		$("#mercDiscountInfo").html('一般类最低签约费率低于0.5,请回退发起人做修改！');
	    	}
	    }else if($("#prepareMcc").val()=="3"){
	    	if(parseFloat($("#feeRate1").val())<0.25){
	    		$("#mercDiscountInfo").html('民生类最低签约费率低于0.25,请回退发起人做修改！');
	    	}
	    }else if($("#prepareMcc").val()=="4"){
	    	if(parseFloat($("#feeRate1").val())<0.85&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())>=30){
	    		$("#mercDiscountInfo").html('房产汽车类最低签约费率低于0.85,请回退发起人做修改！');
	    	}else if(parseFloat($("#feeRate1").val())<0.85&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())<30){
	    		$("#mercDiscountInfo").html('房产汽车类最低签约费率低于0.85/封顶值低于30,请回退发起人做修改！');
	    	}else if(parseFloat($("#feeRate1").val())>=0.85&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())<30){
	    		$("#mercDiscountInfo").html('房产汽车类封顶值低于30,请回退发起人做修改！');
	    	}
	    }else if($("#prepareMcc").val()=="5"){
	    	if(parseFloat($("#feeRate1").val())<0.3&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())>=10){
	    		$("#mercDiscountInfo").html('批发类最低签约费率低于0.3,请回退发起人做修改！');
	    	}else if(parseFloat($("#feeRate1").val())<0.3&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())<10){
	    		$("#mercDiscountInfo").html('批发类最低签约费率低于0.3/封顶值低于10,请回退发起人做修改！');
	    	}else if(parseFloat($("#feeRate1").val())>=0.3&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())<10){
	    		$("#mercDiscountInfo").html('批发类封顶值低于10,请回退发起人做修改！');
	    	}
	    }
	}
}



/**
 * 保存风控信息
 */
function saveRm(){
	var keywords = $("#keywords").val();
	var descBiz = $("#descBiz").val();
	if(keywords==undefined  || keywords==null || $.trim(keywords)==''){
		alert("关键字不可为空");
		return;
	}else{
		if(keywords.strLen>40){
			alert("关键字长度不可超过40");
			return;
		}
	}
	if(descBiz==undefined  || descBiz==null || $.trim(descBiz)==''){
		alert("经营概述不可为空");
		return;
	}else{
		if(descBiz.strLen>40 || descBiz.strLen<16){
			alert("经营概述字数要求不合规");
			return;
		}
	}
	if(checkStrLen($("#mercFnm").val())>60){
		alert("经营名称字数要求不合规");
		return;
	}
	//保存修改提示信息
	$("#tipsInfo").val($('#showChangeMessage').html() + $('#newShowChangeMessage').html());
	var s = $("#mercInfoForm").serialize();
	console.log(s);
	$.ajax({
			url:"/mercIncome/saveRiskControl.do",
			async:false,
			cache: false,
			type:"POST",
			data:$("#mercInfoForm").serialize(),
			success:function(data){
				data = eval("(" + data + ")")
				alert(data.message)
			}
	});
}

/**
 * 恢复按钮状态
 */
function RegainsTheButtonState(){
	$("#btnSubmit").attr("class","btn btn-danger btn-sm")
	document.getElementById("btnSubmit").disabled = undefined;

	$("#backButton").attr("class","btn  btn-sm")
	document.getElementById("backButton").disabled = undefined;
}

/**
*
* 修改Action地址
* @param condition 条件
*/
function modifyProcessTurnCondition(condition,procDefKey,flowType){
	var orderNo= $("#orderNo").val();
	var ifHadValidate= $("#ifHadValidate").val();
	var taskDefKey = $("[name='taskDefKey']").val();
	if(procDefKey=='mercIncome' && taskDefKey=='centerCheck'){
		if(ifHadValidate != 1){
			alert("未进行二要素或三要素校验，请校验");
			return;
		}
	}else if(procDefKey=='mercInfoUpdate' && taskDefKey=='centerCheck'){
		var showChangeMessage= $("#showChangeMessage").html();
		var checkResult= showChangeMessage.indexOf("结算卡一账户名") != -1 
			|| showChangeMessage.indexOf("结算卡一账号") !=-1 
			|| showChangeMessage.indexOf("结算账户一身份证号码") !=-1
			|| showChangeMessage.indexOf("结算卡二账户名") != -1 
			|| showChangeMessage.indexOf("结算卡二账号") !=-1 
			|| showChangeMessage.indexOf("结算账户二身份证号码") !=-1;
		if(checkResult && ifHadValidate != 1 ){
			alert("未进行二要素或三要素校验，请校验");
			return;
		}
	}
	if(flowType=='MERCHANT_SMALLVTOPOS' && ifHadValidate != 1 ){
		alert('未进行二要素或三要素校验，请校验');
		return;
	}
	
	if(isBackOrder(condition)){
		return;
	}
	//流程定义Key
	var procDefKey = $('#procDefKey').val();
	var checkCard=$("#checkCard").val();
	var flagSt=$("#flagSt").val();
	//判断结算账户名，结算卡号，身份证是否改变
	var taskDefKey = $("[name='taskDefKey']").val();
	
	//BAP接口返回码
	var bapReturnCode = $('#bapReturnCode').val();
	if(condition == 'submit'){
		var isMaintenanceFeeFlag = $("#isMaintenanceFeeFlag").val();
		var hiddenMtfee = $("#hiddenMtfee").val();
		if(isMaintenanceFeeFlag == '1' && hiddenMtfee == ''){
			alert("选择收取维护费未填写维护费金额,请回退发起人做修改！")
			return ;
		}
	}
	var idCardNo1 = $("#idCardNo1").val().trim();//结算人身份证号
	var dataFlag = false;
	if($("[name='taskDefKey']").val() != 'headRiskControl'){
	if(condition == 'submit'){
		$.ajax({
			url :'/mercIncome/checkAge',
			async:false,
			cache: false,
			type:'POST',
			data : {
				idCardNo1: idCardNo1
			},
			success : function(data) {
				if (data == "01") {
					
				}else{
					dataFlag = true;
					alert("结算人年龄不符合要求，禁止通过！");
					return;
				}
			}
		});	
		
	  }
	}
	
	if(dataFlag){
		return;
	}
	
	
	if(condition == 'submit' && !confirm("是否确认下一步")){
		return ;
	}
	
	if(condition == 'back'){
		//若工单为进件且商编已生成，不允许回退工单
		if(procDefKey == 'mercIncome' && (bapReturnCode == 'MEC00000' || bapReturnCode == 'MERC00010')){
			alert('已生成商编不允许回退，若该工单持续无法提交，请联系总部技术！');
			return;
		}
		if(!confirm("是否确认回退")){
			return ;
		}
	}
	document.getElementById("btnSubmit").disabled = true;
	document.getElementById("backButton").disabled = true;
	
	if (condition == 'submit'&& procDefKey!='mercInfoUpdate') {
		var mercFunctionNum = $("#mercFunction").html();
		if(mercFunctionNum == '预授权' || mercFunctionNum.indexOf("预授权") >= 0){//开通预授权
			var mcc = $("[name='riskControl.mccCd']").val();
			if(mcc == '7011' || mcc == '7512'){				
					 RegainsTheButtonState();	
			}else{
				alert("预授权商户必须是MCC为7011、7512！");
				 RegainsTheButtonState();
				return;
			}
		}
	}
	if (condition == 'submit'&& procDefKey=='mercInfoUpdate') {
		var stmActTyp1 = document.getElementById('stmActTyp1').innerHTML;// 结算账户类型
		var stmBankNm1 = document.getElementById('stmBankNm1').innerHTML; // 结算银行名称
		var ZftFlgFlag = document.getElementById('zftFlg');// 朝付通按钮本身
		if (ZftFlgFlag.checked && stmActTyp1 != '对私') {
			if (true/* confirm("结算账户类型的修改将导致普通（或VIP）朝付通产品业务自动关闭，是否确定进行更改？") */) {
				ZftFlgFlag.checked = false;
				closeZFT(orderNo);
			} else {
				RegainsTheButtonState();
				return false;
			}
		}
		if (ZftFlgFlag.checked
				&& !(stmBankNm1 == '中国农业银行' || stmBankNm1 == '中国建设银行'
						|| stmBankNm1 == '中国工商银行' || stmBankNm1 == '中国银行'
						|| stmBankNm1 == '招商银行' || stmBankNm1 == '中国光大银行'
						|| stmBankNm1 == '中国民生银行' || stmBankNm1 == '交通银行'
						|| stmBankNm1 == '兴业银行' || stmBankNm1 == '中信银行'
						|| stmBankNm1 == '中国邮政储蓄银行' || stmBankNm1 == '浙商银行'
						|| stmBankNm1 == '华夏银行' || stmBankNm1 == '广发银行'
						|| stmBankNm1 == '上海浦东发展银行' || stmBankNm1 == '平安银行'
						|| stmBankNm1 == '渤海银行' || stmBankNm1 == '城市商业银行' || stmBankNm1 == '农村商业银行')) {
			if (true/* confirm("结算银行名称的修改将导致普通（或VIP）朝付通产品业务自动关闭，是否确定进行更改？！") */) {
				ZftFlgFlag.checked = false;
				closeZFT(orderNo);
			} else {
				RegainsTheButtonState();
				return false;
			}
		}
	}
	// 进件、信息修改流程判断经营概述、经营名称长度【不要删除 不要覆盖了！！！！】
	// OPERATION-7555 审单中心工作优化中，审单页面经营概述、经营名称字数限制只在操作“下一步”、“保存”时生效，进行委托、回退不做限制。
	//所以删除  进件、信息修改流程判断经营概述、经营名称长度 的检验（submit时有）
	
	//将老的修改信息与新的修改信息拼接在一起
	var tipsInfo = $("#showChangeMessage").html()+$("#newShowChangeMessage").html();
	$("[name='tipsInfo']").val(tipsInfo);
	//如果有新的修改项，将操作次数加1
	if($("#newShowChangeMessage").has("li").length){
		var taskDefKey = $("[name='taskDefKey']").val();
		if(taskDefKey == 'centerCheck'){
			var count=parseInt($("#centerOperateNum").val())+1;
			$("#centerOperateNum").val(count);
		}else{
			var count=parseInt($("#riskOperateNum").val())+1;
			$("#riskOperateNum").val(count);
		}
	}
		
	if(condition == 'submit'){
		var keywords = $("#keywords").val();
		var descBiz = $("#descBiz").val();
		var opinion = $("#opinion").val();
		var mccCdSelect = $("#mccCdSelect").val();
		var procDefKey = $("[name='procDefKey']").val();
		var limitmoneySelect =$("#limitmoneySelect").val();
		var jinjianTyp =$("#jinjianTyp").val();		
		if((limitmoneySelect==undefined || limitmoneySelect==null || limitmoneySelect=='')&&jinjianTyp==2){
			alert("请选择每日结算限额");
			 RegainsTheButtonState();
			return;
		}
		if(keywords==undefined  || keywords==null || $.trim(keywords)==''){
			alert("关键字不可为空");
			 RegainsTheButtonState();
			return;
		}else{
			if(checkStrLen(keywords)>40){
				alert("关键字长度不可超过40");
				 RegainsTheButtonState();
				return;
			}
		}
		if(descBiz==undefined  || descBiz==null || $.trim(descBiz)==''){
			alert("经营概述不可为空");
			RegainsTheButtonState();
			return;
		}else{
			if(checkStrLen(descBiz)>40 || checkStrLen(descBiz)<16){
				alert("经营概述字数要求不合规");
				 RegainsTheButtonState();
				 RegainsTheButtonState();
				 return;
			}
		}
		if($("#mercFnm").val() == null || $("#mercFnm").val()==""){
			alert("经营名称不可为空");
			 RegainsTheButtonState();
			return;
		}else if(checkStrLen($("#mercFnm").val())>60){
			alert("经营名称字数要求不合规");
			RegainsTheButtonState();
			return;
		}
		if(opinion==undefined  || opinion==null || $.trim(opinion)==''){
			/*alert("会签意见不可为空");
			 RegainsTheButtonState();
			return;*/
		}else{
			if(checkStrLen(opinion)>200){
				alert("会签意见长度不可超过200");
				 RegainsTheButtonState();
				return;
			}
		}
		if($('#procDefKey').val() == 'mercIncome'){
			if(mccCdSelect=='' || mccCdSelect==null){
				alert("请选择商户MCC");
				 RegainsTheButtonState();
				return;
			}
		}
		if($('#procDefKey').val() == 'mercInfoUpdate'){
//			var feeRate1 = $('#feeRate1').html();
			var prepareMcc = $('#prepareMcc').html();
			var prepareMccSelect=$("#prepareMccSelect").val();
			if(prepareMcc!='' && prepareMcc!=null){
				if(prepareMccSelect=='' || prepareMccSelect==null || prepareMccSelect==undefined){
					alert("请选择预设MCC");
					 RegainsTheButtonState();
					return;
				}else{
					
					var mercFunctionNum = $("#mercFunction").html();
					if(mercFunctionNum == '预授权' || mercFunctionNum.indexOf("预授权") >= 0){//开通预授权
						if(prepareMccSelect == '7011' || prepareMccSelect == '7512'){			
								 RegainsTheButtonState();
							
						}else{
							alert("预授权商户必须是MCC为7011、7512！");
							 RegainsTheButtonState();
							return;
						}
					}
				}
			}
			
			var repeat =validateRestrictTimes2($("#showChangeMessage").html()+$("#newShowChangeMessage").html(),condition);
		    if(repeat!=''){
		    	alert(repeat);
		    	 RegainsTheButtonState();
				return;
		    }
		}else{
			//如果已经生成商编，不再验证重复次数
			if(procDefKey == 'mercIncome' && bapReturnCode != 'MEC00000' && bapReturnCode != 'MERC00010'){
				var repeat = validateRestrictTimes1();
			    if(repeat!=''){
			    	alert(repeat);
			    	RegainsTheButtonState();
					return;
			    }
			}
		}
		//保存经营名称和星级商户
		if(condition != 'back'){
			if($("#isStars").is(':checked')){
				$("#isStars").val('1');
			}else{
				$("#isStars").val('0');
			}
			$.ajax({
				url :'/mercIncome/saveMercFnm.do',
				async:false,
				cache: false,
				type:'POST',
				data : {
					orderNo: $("#orderNo").val(),
					mercFnm: $("#mercFnm").val(),
					isStars:$("#isStars").val()
				},
				success : function(data) {
					if (data == "01") {
						$("[name='condition']").val('submit');
						$("#mercInfoForm").prop('action','submitNext2.do');
						$("#testSubmit").click();
						return true;
					}else{
						alert("经营名称和星级商户保存失败！");
						RegainsTheButtonState();
						return;
					}
				}
			});	
		}
		//插入重复次数
		saveRepeatedResults();
	}else if(condition == 'back'){
		var opinion = $("#opinion").val();
		$("[name='condition']").val('back');
		$("#mercInfoForm").prop('action','submitNext2.do');
		if(opinion==undefined  || opinion==null || $.trim(opinion)==''){
			alert("会签意见不可为空");
			 RegainsTheButtonState();
			return;
		}else{
			if(checkStrLen(opinion)>200){
				alert("会签意见长度不可超过200");
				 RegainsTheButtonState();
				return;
			}else{
				$("#testSubmit").click();
				return true;
			}
		}
	}
		
	return true;
}
function closeZFT(orderNo){
	$.ajax({
		url : '/mercIncomeEntering/closeZFT.do',
		async:false,
		cache: false,
		type:'POST',
		data : {
			taskCode : orderNo
		}
	});
	
}

function saveRepeatedResults(){
	var authorityNum=$("#authorityNum").val();
	var orderNo=$("#orderNo").val();
	var regNmNum=$("#regNmNum").val();
	var regIdNum=$("#regIdNum").val();
	var actNo1Num=$("#actNo1Num").val();
	var actNo2Num=$("#actNo2Num").val();
	var actNm1Num=$("#actNm1Num").val();
	var actNm2Num=$("#actNm2Num").val();
	var idCardNo1Num=$("#idCardNo1Num").val();
	var idCardNo2Num=$("#idCardNo2Num").val();
	var procDefKey=$("#procDefKey").val();
	$.ajax({
		url : '/mercValiRepeat/saveRepeatedResults.do',
		async:false,
		cache: false,
		type:'POST',
		data : {
			authorityNum : authorityNum,
			regNmNum : regNmNum,
			regIdNum : regIdNum,
			actNo1Num : actNo1Num,
			actNo2Num : actNo2Num,
			actNm1Num : actNm1Num,
			actNm2Num : actNm2Num,
			idCardNo1Num : idCardNo1Num,
			idCardNo2Num : idCardNo2Num,
			idCardNo1 : idCardNo1,
			procDefKey : procDefKey,
			orderNo : orderNo
		},
		success : function(data) {
			if(data){
				return;
			}
		}
	});
	/*var url="/mercValiRepeat/saveRepeatedResults?authorityNum="+authorityNum+"" +
			"&regNmNum="+regNmNum+"&regIdNum="+regIdNum+"&actNo1Num="+actNo1Num+"&actNo2Num="+actNo2Num+
			"&actNm1Num="+actNm1Num+"&actNm2Num="+actNm2Num+"&idCardNo1Num="+idCardNo1Num+
			"&idCardNo2Num="+idCardNo2Num+"&orderNo="+orderNo;
	window.location.href=url;*/
}



/**
 * 增加重复次数校验信息 
 */
function validateRestrictTimes1(){
	var flag ="";
	var mercTyp="";
	var actNo1="";
	var actNm1="";
	var idCard1="";
	var flag1="";
	var actNo2="";
	var actNm2="";
	var idCard2="";
	var flag2="";
	var regNo="";
	var regNm="";
	var orderNo="";
	var flag3="";
	if($("#mercTyp").html()=="普通商户"||$("#mercTyp").html()=="1+N总店"||$("#mercTyp").html()=="1+N分店"){
		mercTyp="0";
	}else{
		mercTyp="1";
	}
	if ($("#stmActs1").html() != undefined && $("#stmActs1").html() != null ) {
		actNo1 = $("#stmActs1").html().replace(/\s/gi, '');
	}
	if ($("#stmActs2").html() != undefined && $("#stmActs2").html() != null) {
		actNo2 = $("#stmActs2").html().replace(/\s/gi, '');
	}
	if ($("#stmActNm1").val() != undefined && $("#stmActNm1").val() != null) {
		actNm1 = $("#stmActNm1").val().replace(/\s/gi, '');
	}
	if ($("#stmActNm2").html() != undefined && $("#stmActNm2").html() != null) {
		actNm2 = $("#stmActNm2").html().replace(/\s/gi, '');
	}
	if($("#idCardNo1").val()!=null && $("#idCardNo1").val()!=undefined){
		idCard1= $("#idCardNo1").val().replace(/\s/gi,'');
	}
	flag1 = $("#stmActTyp1").html();
	flag2 = $("#stmActTyp2").html();
	regNo=$("#regNo").html().trim();
	regNm=$("#mercRegNm").html().trim();
	orderNo=$("#orderNo").val();//
	if(($('#taskDefKey').val()=='centerCheck'  && !$("#isExceptionMerc").prop('checked')) ||$('#taskDefKey').val()=='stepHeadRiskControl'){
	    flag3="01";
	}else{
		flag3="00";
	}
	if($("#legalNm").html()!=null && $("#legalNm").html()!=undefined){
		var legalNm = encodeURIComponent($("#legalNm").html().replace(/\s/gi,''));
	}
	$.ajax({
		url :'/mercValiRepeat/validateRestrictTimes.do',
		async:false,
		cache: false,
		type:'POST',
		data : {
			mercTyp: mercTyp,
			actNo1:actNo1,
			actNm1:encodeURIComponent(actNm1),
			idCard1:idCard1,
			flag1:flag1,
			actNo2:actNo2,
			actNm2:encodeURIComponent(actNm2),
			idCard2:idCard2,
			flag2:flag2,
			regNo:encodeURIComponent(regNo.trim()),
			regNm:encodeURIComponent(regNm.trim()),
			orderNo:orderNo,
			legPerCrdNo : $("#legalCredentialsNo").html(),
			legPerNm : legalNm,
			flag3:flag3,
			orgNo : $("#orgBranchAttribution").val(),
			mecNormalLevel: $("#acMecNormalLevel").val()
		},
		success : function(data) {
			if (data.resCode == "01") {
				flag =data.resMsg;
			}
		}
	});	
	return flag;
}

function showModifyInfo(msg){
	var changeMessage = msg.split(",");
	var modifymsg = "";
	modifyInfo = "";
	for(var tag in changeMessage) {
			if (changeMessage[tag] != "") {
				modifymsg += '<li>' + changeMessage[tag];
			}
		}
	$('#showChangeMessage').html(modifymsg.replace('<ul>提示</ul>',''));
}
function strlen(str){
	if(str!='' && str!=undefined && str!=null){
		var len = 0;
		for ( var i = 0; i < str.length; i++) {
			var c = str.charCodeAt(i);
			// 单字节加1
			if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
				len++;
			} else {
				len += 2;
			}
		}
		return len;
	}
}

/**
 * 增加重复次数校验信息 
 */
function validateRestrictTimes2(tipsInfo,condition){
	var flag ="";
	var mercTyp="";
	var actNo1="";
	var actNm1="";
	var idCard1="";
	var flag1="";
	var actNo2="";
	var actNm2="";
	var idCardNo1="";
	var idCardNo2="";
	var flag2="";
	var regNo="";
	var regNm="";
	var orderNo="";
	var flag3="";
	var restrictTimes=$("#restrictTimes").val();
	if(restrictTimes!=""){
		var regex1 = new RegExp("结算卡一账户名的值由");
		var regex2 = new RegExp("结算卡二账户名的值由");
		var regex3 = new RegExp("结算卡一账号的值由");
		var regex4 = new RegExp("结算卡二账号的值由");
		var regex5 = new RegExp("结算账户一身份证号码的值由");
		var regex6 = new RegExp("结算账户二身份证号码的值由");
		var regex7 = new RegExp("注册名称的值由");
		var regex8 = new RegExp("注册登记号的值由");
		var regex9 = new RegExp("商户等级的值由");

		var regex01 = new RegExp("结算人户名一");
		var regex02 = new RegExp("结算人户名二");
		var regex03 = new RegExp("结算人卡号一");
		var regex04 = new RegExp("结算人卡号二");
		var regex05 = new RegExp("结算人证件号一");
		var regex06 = new RegExp("结算人证件号二");
		var regex07 = new RegExp("注册名称");
		var regex08 = new RegExp("注册登记号");
		var result1 = tipsInfo.match(regex1);
		var result2 = tipsInfo.match(regex2);
		var result3 = tipsInfo.match(regex3);
		var result4 = tipsInfo.match(regex4);
		var result5 = tipsInfo.match(regex5);
		var result6 = tipsInfo.match(regex6);
		var result7 = tipsInfo.match(regex7);
		var result8 = tipsInfo.match(regex8);
		var result9 = tipsInfo.match(regex9);
		
		var result01 = restrictTimes.match(regex01);
		var result02 = restrictTimes.match(regex02);
		var result03 = restrictTimes.match(regex03);
		var result04 = restrictTimes.match(regex04);
		var result05 = restrictTimes.match(regex05);
		var result06 = restrictTimes.match(regex06);
		var result07 = restrictTimes.match(regex07);
		var result08 = restrictTimes.match(regex08);
		if (result01 != null && result1 == null && result9 == null) {
			actNm1 = "";
		}else { 
			if($("#stmActNm1").val()!=undefined && $("#stmActNm1").val()!=null){
				actNm1=$("#stmActNm1").val().replace(/\s/gi,'');
			}
		}
		if (result02 != null && result2 == null && result9 == null) {
			actNm2 = "";
		}else { 
			if($("#stmActNm2").html()!=undefined && $("#stmActNm2").html()!=null){
				actNm2=$("#stmActNm2").html().replace(/\s/gi,'');
			}
		}
		if (result03 != null && result3 == null && result9 == null) {
			actNo1 = "";
		}else {
			if($("#stmActs1").html()!=undefined && $("#stmActs1").html()!=null){
				actNo1=$("#stmActs1").html().replace(/\s/gi,'');
			}
		}
		if (result04 != null && result4 == null && result9 == null) {
			actNo2 = "";
		}else {
			if($("#stmActs2").html()!=undefined && $("#stmActs2").html()!=null){
				actNo2=$("#stmActs2").html().replace(/\s/gi,'');
			}
		}
		if (result05 != null && result5 == null && result9 == null) {
			idCardNo1 = "";
		}else {
			if($("#idCardNo1").val()!=undefined && $("#idCardNo1").val()!=null){
				idCardNo1 = $("#idCardNo1").val().replace(/\s/gi,'');
			}
		}
		if (result06 != null && result6 == null && result9 == null) {
			idCardNo2 = "";
		}else {
			if($("#idCardNo2").val()!=undefined && $("#idCardNo2").val()!=null){
				idCardNo2 = $("#idCardNo2").html().replace(/\s/gi,'');
			}
		}
		if (result07 != null && result7 == null && result9 == null) {
			regNm = "";
		}else {
			regNm = $("#mercRegNm").html().trim();
		}
		if (result08 != null && result8 == null && result9 == null) {
			regNo = "";
		}else {
			regNo = $("#regNo").html().trim();
		}	
	}else{
		if($("#stmActs1").html()!=undefined && $("#stmActs1").html()!=null){
			actNo1=$("#stmActs1").html().replace(/\s/gi,'');
		}
		if($("#stmActs2").html()!=undefined && $("#stmActs2").html()!=null){
			actNo2=$("#stmActs2").html().replace(/\s/gi,'');
		}
		if($("#stmActNm1").html()!=undefined && $("#stmActNm1").html()!=null){
			actNm1=$("#stmActNm1").html().replace(/\s/gi,'');
		}
		if($("#stmActNm2").html()!=undefined && $("#stmActNm2").html()!=null){
			actNm2=$("#stmActNm2").html().replace(/\s/gi,'');
		}
		if($("#legalCredentialsNo").val()!=undefined && $("#legalCredentialsNo").val()!=null){
			idCard1 = $("#legalCredentialsNo").val().replace(/\s/gi,'');
		}
		if($("#idCardNo1").val()!=undefined && $("#idCardNo1").val()!=null){
			idCardNo1 = $("#idCardNo1").val().replace(/\s/gi,'');
		}
		if($("#idCardNo2").val()!=undefined && $("#idCardNo2").val()!=null){
			idCardNo2 = $("#idCardNo2").html().replace(/\s/gi,'');
		}
		regNo=$("#regNo").html().trim();
		regNm=$("#mercRegNm").html().trim();
	}
	
	if($("#mercTyp").html()=="普通商户"||$("#mercTyp").html()=="1+N总店"||$("#mercTyp").html()=="1+N分店"){
		mercTyp="0";
	}else{
		mercTyp="1";
	}
	flag1 = $("#stmActTyp1").html();
	flag2 = $("#stmActTyp2").html();
	orderNo=$("#orderNo").val();
	if($('#taskDefKey').val()=='centerCheck'||$('#taskDefKey').val()=='stepHeadRiskControl'){
		 flag3="01";
	}else{
		flag3="00";
	}
	if($("#legalNm").val()!=null && $("#legalNm").val()!=undefined){
		var legalNm= encodeURIComponent($("#legalNm").val().replace(/\s/gi,''));
	}
	
	var procDefKey = $("#procDefKey").val();
	
	$.ajax({
		url :'/mercValiRepeat/validateRestrictTimes.do',
		async:false,
		cache: false,
		type:'POST',
		data : {
			mercTyp: mercTyp,
			actNo1:actNo1,
			actNm1:encodeURIComponent(actNm1),
			idCard1:idCardNo1,
			idCard2:idCardNo2,
			flag1:flag1,
			actNo2:actNo2,
			actNm2:encodeURIComponent(actNm2),
			flag2:flag2,
			regNo:encodeURIComponent(regNo.trim()),
			regNm:encodeURIComponent(regNm.trim()),
			orderNo:orderNo,
			legPerCrdNo : $("#legalCredentialsNo").val(),
			legPerNm : legalNm,
			flag3:flag3,
			orgNo : $("#orgBranchAttribution").val(),
			tipsInfo : tipsInfo,
			procDefKey : procDefKey,
			condition : condition,
			mecNormalLevel: $("#acMecNormalLevel").val(),
			mercId:$("#mercId").html().trim()
		},
		success : function(data) {
			if (data.resCode == "01") {
				flag =data.resMsg;
			}
		}
	});	
	return flag;
}
/**
 * 增加重复次数校验信息  信息变更查询商户以及回退时用到
 */
function validateRestrictTimes3(){
	var flag ="";
	var mercTyp="";
	var actNo1="";
	var actNm1="";
	var idCard1="";
	var flag1="";
	var actNo2="";
	var actNm2="";
	var idCard2="";
	var flag2="";
	var regNo="";
	var regNm="";
	var orderNo="";
	if($("#mercTyp").html()=="普通商户"||$("#mercTyp").html()=="1+N总店"||$("#mercTyp").html()=="1+N分店"){
		mercTyp="0";
	}else{
		mercTyp="1";
	}
	if(($("#mercTyp").html()=="连锁分店"||$("#mercTyp").html()=="1+N分店")&&!$("#independentModel").is(":checked")){
		if($("#stmActs1").html()!=undefined){
			actNo1=$("#stmActs1").html().replace(/\s/gi,'');
		}
		if($("#stmActs2").html()!=undefined){
			actNo2=$("#stmActs2").html().replace(/\s/gi,'');
		}
		if($("#stmActNm1").html()!=undefined){
			actNo1=$("#stmActNm1").html().replace(/\s/gi,'');
		}
		if($("#stmActNm2").html()!=undefined){
			actNo2=$("#stmActNm2").html().replace(/\s/gi,'');
		}
	}else{
		actNo1=$("#stmActs1").html().replace(/\s/gi,'');
		if($("#stmActs2").html()!=null){
			actNo2=$("#stmActs2").html().replace(/\s/gi,'');
		}
		
		actNm1=$("#stmActNm1").val().replace(/\s/gi,'');
		if($("#stmActNm2").html()!=null){
			actNm2=$("#stmActNm2").html().replace(/\s/gi,'');
		}
	}
	if ($("#stmActs2").html() != undefined && $("#stmActs2").html() != null) {
		actNo2 = $("#stmActs2").html().replace(/\s/gi, '');
	}
	if ($("#stmActNm1").val() != undefined && $("#stmActNm1").val() != null) {
		actNm1 = $("#stmActNm1").val().replace(/\s/gi, '');
	}
	if ($("#stmActNm2").html() != undefined && $("#stmActNm2").html() != null) {
		actNm2 = $("#stmActNm2").html().replace(/\s/gi, '');
	}
	
	flag1 = $("#stmActTyp1").html();
	flag2 = $("#stmActTyp2").html();
	if( $("#legalCredentialsNo").val()!=null &&  $("#legalCredentialsNo").val()!=undefined){
		idCard1 = $("#legalCredentialsNo").val().replace(/\s/gi,'');
	}
	if($("#idCardNo1").val()!=undefined){
		idCardNo1 = $("#idCardNo1").val().replace(/\s/gi,'');
	}else{
		idCardNo1 ="";
	}
	regNo=$("#regNo").html().trim();
	regNm=$("#mercRegNm").html().trim();
	orderNo=$("#orderNo").val();
	if($("#legalNm").val()!=null && $("#legalNm").val()!=undefined){
		var legalNm= encodeURIComponent($("#legalNm").val().replace(/\s/gi,''));
	}
	$.ajax({
		url:'/mercValiRepeat/validateRestrictTimes.do',
		async:false,
		cache: false,
		type:'POST',
		data : {
			mercTyp: mercTyp,
			actNo1:actNo1,
			actNm1:encodeURIComponent(actNm1),
			regNo:encodeURIComponent(regNo.trim()),
			regNm:encodeURIComponent(regNm.trim()),
			idCard1:idCard1,
			flag1:flag1,
			actNo2:actNo2,
			actNm2:encodeURIComponent(actNm2),
			idCardNo1:idCardNo1,
			flag2:flag2,
			orderNo:orderNo,
			legPerNm : legalNm,
			orgNo : $("#orgBranchAttribution").val(),
			mecNormalLevel: $("#acMecNormalLevel").val()
		},
		success : function(data) {
			if (data.resCode == "01") {
				flag =data.resMsg;
			}
		}
	});	
	return flag;
}
//判断字符串长度
function checkStrLen(data){
	if(data!='' && data!=undefined && data!=null){
		var len = 0;
		for ( var i = 0; i < data.length; i++) {
			var c = data.charCodeAt(i);
			// 单字节加1
			if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
				len++;
			} else {
				len += 2;
			}
		}
		return len;
	}else{
		return 0;
	}
}
function checkMercFnmLen(){
	if($("[name='procDefKey']").val() == 'mercInfoUpdate' || $("[name='procDefKey']").val() == 'mercIncome'){
		if(checkStrLen($("#mercFnm").val())>60){
			alert("经营名称字数要求不合规");
			$("#btnSubmit").attr('disabled',true);
		}else{
			$("#btnSubmit").attr('disabled',false);
		}
	}
}