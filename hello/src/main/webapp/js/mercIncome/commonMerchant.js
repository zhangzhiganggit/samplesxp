jQuery(function($) {
	$('#mercFunction2').click(function(){
		if($('#tZeroStmt').prop('checked') || $('#offdayStmt').prop('checked')){
			if($('#mercFunction2').prop('checked'))
				alert("开通随意通结算或非工作日结算后不可开通预授权！");
			$('#mercFunction2').attr('checked',false);
		}
	});
	$('#functionAcce2').click(function(){
		if($('#tZeroStmt').prop('checked') || $('#offdayStmt').prop('checked')){
			if($('#functionAcce2').prop('checked'))
				alert("开通随意通结算或非工作日结算后不可开通预授权！");
			$('#functionAcce2').attr('checked',false);
		}
	});
	$('#functionAcce5').click(function(){
		if($('#tZeroStmt').prop('checked') || $('#offdayStmt').prop('checked')){
			if($('#functionAcce5').prop('checked'))
				alert("开通随意通结算或非工作日结算后不可开通预授权！");
			$('#functionAcce5').attr('checked',false);
		}
	});
	$('#tZeroStmt').click(function(){
		if($('#tZeroStmt').prop('checked')){
			if($('#mercFunction2').prop('checked')){
				alert("开通预授权后不允许开通随意通结算！");
				$('#tZeroStmt').attr('checked',false);
			}else  if($('#functionAcce2').prop('checked') || $('#functionAcce5').prop('checked')){
				alert("开通预付卡/外卡预授权后不允许开通随意通结算！");
				$('#tZeroStmt').attr('checked',false);
			}else{
				//TODO 相关验证
				$('#stmQuotaInfo').show();
			}
		}else{
			$('#stmQuotaInfo').hide();
			$("#stmQuota").val('');
		}
	});
	$('#offdayStmt').click(function(){
		if($('#offdayStmt').prop('checked')){
			if($('#mercFunction2').prop('checked')){
				alert("开通预授权后不允许开通非工作日结算！");
				$('#offdayStmt').attr('checked',false);
			}else  if($('#functionAcce2').prop('checked') || $('#functionAcce5').prop('checked')){
				alert("开通预付卡/外卡预授权后不允许开通非工作日结算！");
				$('#offdayStmt').attr('checked',false);
			}
		}
	});
	$('#licenseEffFlg').click(function(){
		clicklicenseEff();
	});
	$('#legalCredentialsFlg').click(function(){
		clicklegalCredentials();
	});
	$('#independentModel').click(function(){
		clickIndependentModel();
	});
	
});
/**
 * 清空结算信息
 */
function clearStmtInfo(){
   var ids = ['firstSettleCardInfo','secondSettleCardInfo','operation5','operation6','operation7'];
   for(var i=0;i<ids.length;i++){
	   $("#"+ids[i]).find("input").each(function(){
		   $(this).val('');
	   });
	   $("#"+ids[i]).find("select").each(function(){
		   $(this).val('');
	   });
   }
}
/**
 * 隐藏结算信息
 * @param type
 */
function hideStmtInfo(type){
   var ids = ['settleSecond1','settleSecond','operation5','operation6','operation7']; 
   for(var i=0;i<ids.length;i++){
	   $("#"+ids[i]).hide();
   }
   if(type == '1'){
	   //backDataToInput函数调用此方法时不触发分店结算账号的相关事件，不统计到修改提示中
   }else{
		$("tr[id^='settle']").each(function(){
			$(this).children().find("input").each(function(){
				$(this).trigger('blur');
			});
			$(this).children().find("select").each(function(){
			    $(this).trigger('change');
			});
		});
   }
}
/**
 * 获取银行名称
 * @param type 标识填充到Label或input
 * @param bankName
 * @param bankCd
 */
function getBankNameByBankCd(type,bankName,bankCd){
	if(bankCd != null && bankCd !=''){
		$.ajax({
	        url: '/commonUtils/getBankNameByBankCd.do',
	        data : {
	        	bnkCd : bankCd
	        },
	        async:true,
	        cache: true,
	        success : function(bankInfo) {
	       	 	if(bankInfo != null && bankInfo !=undefined){
	       	 		if(bankInfo.bnkNm != ''){
	       	 			if(type=='label')
	       	 				$('#'+bankName).html(bankInfo.bnkNm);
	       	 			else
	       	 				$('#'+bankName).val(bankInfo.bnkNm);
	       	 		}
	       	 	}
	        }
		});
	}else{
		if(type=='label')
			$('#'+bankName).html('其他银行');
		else
			$('#'+bankName).val('其他银行');
	}
}
/**
 * 获取结算银行归属省市信息
 * @param type 标识填充到Label或input
 * @param provName
 * @param provCd
 * @param cityName
 * @param cityCd
 */
function getBankAttrProvAndCity(type,provName,provCd,cityName,cityCd){
	if(provCd != '' && cityCd != ''){
		$.ajax({
	        url: '/commonUtils/getBankAttrProvAndCity.do',
	        data : {
	        	provCd : provCd,
	        	cityCd : cityCd,
	        	cdeFlg : 1
	        },
	        async:false,
	        cache: true,
	        success : function(bankCityList) {
	       	 	if(bankCityList != null && bankCityList !=undefined && bankCityList != ''){
	       	 		var bankCity = bankCityList[0];
	       	 		if(bankCity.provNm != ''){
	       	 			if(type=='label'){
	       	 				$('#'+provName).html(bankCity.provNm);
	       	 				$('#'+provName).attr('data-content',bankCity.provNm);
	       	 			}else{
	       	 				$('#'+provName).val(bankCity.provNm);
	       	 			}
		       	 		
	       	 		}
		       	 	if(bankCity.cityNm != ''){
			       	 	if(type=='label'){
				       	 	$('#'+cityName).html(bankCity.cityNm);
			       	 		$('#'+cityName).attr('data-content',bankCity.cityNm);
			       	 	}else{
				       	 	$('#'+cityName).val(bankCity.cityNm);
			       	 	}
		       	 		
	       	 		}
	       	 	}
	        }
		});
	}
}
//填充MCC下拉框
function fillMccCdSelect(){
	var industryCategories = $('#mcc').html();
	if(industryCategories!=''){
		$.ajax({
	        url: '/mercIncome/findMccByIndustryCategories.do',
	        data:{
	        	industryCategories:industryCategories
	        },
	        async : true,
	        cache: true,
	        success : function(relationList) {
	       	 	if(relationList != null && relationList !=undefined){
		       		 var options = "<option value=''></option>";
		             for(var i=0;i<relationList.length;i++){
		            	 options+="<option value=\""+relationList[i].mcc+"\">"+relationList[i].mccIc+"</option>";
		             }
		             $("[name='mccCd']").html(options);
		             $("[name='mccCd']").trigger("chosen:updated");
	       	 	}
	        }
		});
	}	
}
var oldMccCd = $("[name='mccCd']").val();
function refreshDescBiz(inputId,taskDefKey){
	//MCC的change事件触发此函数时才去异步请求
	if(inputId == 'mccCd'){
		var mccCd = $("[name='mccCd']").val();
		if(mccCd!=''){
			if(oldMccCd != mccCd){
				$.ajax({
					url : '/mercIncome/findIndustryAbbreviationByMccCd.do?mccCd=' + mccCd,
					cache : false,
					async : false,
					success : function(data) {
						if (data != null && data != '') {
							$("[name='industryAbbreviation']").val(data);
						}else{
							alert("该MCC下无对应行业简称，请重新输入！");
							$("[name='industryAbbreviation']").val('');
						}
					}
				});
			}			
		}else{
			$("[name='industryAbbreviation']").val('');
		}
		oldMccCd = mccCd;
	}
	var keywords = $("[name='keywords']").val();
	var areaInfo = $("[name='areaInfo']").val();
	var bizScope= $("#bizScope").html();
	var industryAbbreviation = $("[name='industryAbbreviation']").val();
	$("[name='descBiz']").val(areaInfo+keywords+bizScope+industryAbbreviation);
	$("[name='descLoanBiz']").val(areaInfo+keywords);
	$("#mercFnm").val($("#descBiz").val());
}


/**
 * 点击是否收取维护费
 * 选中时展开维护费信息
 */
function clickIsMaintenanceFee(){
	if($('#isMaintenanceFee').prop('checked')){
		$('#mainternanceFeeInfo').show();
		$("#chargingWay").val("3");
	}else{
		$('#mainternanceFeeInfo').hide();
		$("#maintenanceFeeAmt").val("");
        $("#feeAmtEnDial").val("");
        $("#freeCountsEnDial").val("");
        $("#feeAmtGprs").val("");
        $("#freeCountsGprs").val("");
        $("#freeStartingPoint").val("");
        $("#comments").val("");
        $("#chargingMod").val("2");
        $("#chargingWay").val("3");
        $("#freeCycle").val("1");
        $("#isMaintenanceFeeCurrent").prop('checked', false);
        $("#isMaintenanceFeeCurrent").trigger('change');
	}
}

/**
 * 修改收取模式触发此函数
 */
function changeChargingMod(){
	if($('#chargingMod').val()==2){
		var options="<option value='1'>刷卡</option><option value='2'>汇款</option><option value='3' selected=selected>坐扣</option>";
		$('#chargingWay').html(options);
	}else if($('#chargingMod').val()==1){
		var options="<option value='1'>刷卡</option><option value='2'>汇款</option>";
		$('#chargingWay').html(options);
	}
}

function clickIndependentModel(){
	if($('#independentModel').prop('checked')){
		$("#allowAudit").show();
		$("#allowAuditLabel").show();
	}else{
		$("#allowAudit").hide();
		$("#allowAuditLabel").hide();
	}
}

/**
 * 点击是否开通预付卡
 * 选中时展开预付卡信息
 */
function clickIsPrepaidCard(){
	if($('#isPrepaidCard').prop('checked')){
		$('#prepaidCardInfo').show();
		$('#mercInfoForm').formValidation('addField', 'prepaidCardFunction', {
			validators: {
                notEmpty: {}
            }
		});
		$('#mercInfoForm').formValidation('addField', 'prepaidCard.mercCd', {
			validators: {
                notEmpty: {},
                digits :{
                	message:'请输入正确商编！'
                },
                stringLength: {
                	min : 15,
                	max : 15,
                	message:'请输入15位商编！'
                }
            }
		});
	}else{
		$('#prepaidCardInfo').hide();
		$('#mercCd').val('');
		$('#functionAcce1').prop("checked",false);
		$('#functionAcce2').prop("checked",false);
		$('#functionAcce3').prop("checked",false);
		$('#mercInfoForm').formValidation('removeField', 'prepaidCardFunction');
		$('#mercInfoForm').formValidation('removeField', 'prepaidCard.mercCd');
	}
}



/**
 * 点击是否开通中行外卡
 * 选中时展开中行外卡信息
 */
function clickForeignCcyCardTyp1(){
	if($('#foreignCcyCardTyp1').prop('checked')){
		$('#foreighCardInfoOfBocInfo').show();
		$('#mercInfoForm').formValidation('addField', 'bocForeighCardFunction', {
			validators: {
                notEmpty: {}
            }
		});
	}else{
		$('#functionAcce4').prop('checked',false);
		$('#functionAcce5').prop('checked',false);
		$('#functionAcce6').prop('checked',false);
		$('#foreighCardInfoOfBocInfo').hide();
		$('#feeRatemaster1').val('');
		$('#feeRateAmericanExpress1').val('');
		$('#feeRateDiners1').val('');
		$('#feeRateJcb1').val('');
		$('#feeRateVisa1').val('');
		$('#mercInfoForm').formValidation('removeField', 'bocForeighCardFunction');
	}
}
/**
 * 点击是否开通交行外卡
 * 选中时展开交行外卡信息
 */
function clickForeignCcyCardTyp2(){
	var bocomFCRateNameArray = ['foreighCardInfoOfBocom.feeRateVisa','foreighCardInfoOfBocom.feeRateMaster',
	                          'foreighCardInfoOfBocom.feeRateAmericanExpress','foreighCardInfoOfBocom.feeRateDiners',
	                          'foreighCardInfoOfBocom.feeRateJcb','foreighCardInfoOfBocom.feeVisaDcc','foreighCardInfoOfBocom.feeMcDcc'];
	if($('#foreignCcyCardTyp2').prop('checked')){
		$('#foreighCardInfoOfBocomInfo').show();
		for(var i=0;i<bocomFCRateNameArray.length;i++){
			$('#mercInfoForm').formValidation('addField', bocomFCRateNameArray[i], {
				validators: {
	                notEmpty: {
	                	message:'不可为空'
	                }
	            }
			});
		}
	}else{
		$('#foreighCardInfoOfBocomInfo').hide();
		$('#feeRatemaster2').val('');
		$('#feeRateAmericanExpress2').val('');
		$('#feeRateDiners2').val('');
		$('#feeRateJcb2').val('');
		$('#feeRateVisa2').val('');
		$('#feeRateVisadcc').val('');
		$('#feeRateMcdcc').val('');
		for(var i=0;i<bocomFCRateNameArray.length;i++){
			$('#mercInfoForm').formValidation('removeField', bocomFCRateNameArray[i]);
		}
	}
}
/**
 * 营业执照是否长期有效按钮事件
 */
function clicklicenseEff(){   
   if($('#licenseEffFlg').prop('checked')){
	   disableControl('licenseEffStartdate');
	   disableControl('licenseEffEnddate');
	   $('#licenseEffStartdate').val('1900-01-01');
	   $('#licenseEffEnddate').val('2099-12-31');
   }else{
	   enableControl('licenseEffStartdate');
	   enableControl('licenseEffEnddate');
   }
}
/**
 * 法人证件号是否长期有效按钮事件
 */
function clicklegalCredentials(){
   if($('#legalCredentialsFlg').prop('checked')){
	   disableControl('legalCredentialsEffStardate');
	   disableControl('legalCredentialsEffEnddate');
	   $('#legalCredentialsEffStardate').val('1900-01-01');
	   $('#legalCredentialsEffEnddate').val('2099-12-31');
   }else{
	   $('#legalCredentialsEffStardate').val('');
	   $('#legalCredentialsEffEnddate').val('');
	   enableControl('legalCredentialsEffStardate');
	   enableControl('legalCredentialsEffEnddate'); 
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
 * 打开新窗口
 */
function openNewWindow(type){
	var href = '';
	var width = 800;
	var height = 620;
	if(type != null && type != ''){
		if(type == 'openFirstSettleBankSearchPage')
			href = '/mercInfoUpdate/openSettleBankSearchPage.do?bankIndex=1&flg=1';
		else if(type == 'openSecondSettleBankSearchPage')
			href = '/mercInfoUpdate/openSettleBankSearchPage.do?bankIndex=2&flg=1';
		else if(type == 'openAffiliatedMerchantSearchPage')
			href = '/mercInfoUpdate/openAffiliatedMerchantSearchPage.do?mercType='+$('#mercTyp').val();
		else if(type == 'openPointChoicePage'){
			var ctxStatic = $('#ctxStatic').val();
			href = ctxStatic+'/baiduMap/baiduMap.jsp';
			width = $(window).width() * 0.9;
			height = $(window).height() * 0.9;
		}
	}
	if(href !=''){
		$.fancybox.open({
			href : href,
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: width,
	        height: height,
	        autoSize: false,
	        closeClick: false
		});
	}
	
}
/**
 *openNewWindow回调方法,回填结算信息
 */
function backDataToSettleBank(bankIndex,lbankNo,lbankName,lbnkProvCd,lbnkProvNm,lbnkCityCd,lbnkCityNm,bnkCd,bnkNm){
	if(bankIndex == '1'){
		$('#firstStmLbankNo').val(lbankNo);//联行行号1
		$('#firstStmBankDetail').val(lbankName);//结算银行详细1
		$('#firstProvCd').val(lbnkProvCd);//结算银行1所在省编号
		$('#firstProvName').val(lbnkProvNm);//结算账户名1
		$('#firstCityCd').val(lbnkCityCd);//结算银行1所在市编号
		$('#firstCityName').val(lbnkCityNm); //结算账号1 
		$('#firstStmBankCd').val(bnkCd);//归属银行编号1
		$('#firstStmBankName').val(bnkNm); //归属银行名称1
	}else{
		$('#secondStmLbankNo').val(lbankNo);//联行行号1
		$('#secondStmBankDetail').val(lbankName);//结算银行详细1
		$('#secondProvCd').val(lbnkProvCd);//结算银行1所在省编号
		$('#secondProvName').val(lbnkProvNm);//结算账户名1
		$('#secondCityCd').val(lbnkCityCd);//结算银行1所在市编号
		$('#secondCityName').val(lbnkCityNm); //结算账号1 
		$('#secondStmBankCd').val(bnkCd);//结算银行1所在市编号
		$('#secondStmBankName').val(bnkName); //结算账号1
	}
}
/**
 * openNewWindow回调方法,回填结算信息
 * @param affiliatedMerchangeSn 隶属商户商编
 * @param affiliatedMerchangeName 隶属商户注册名称
 */
function backAffiliatedMerchantData(affiliatedMerchangeSn,affiliatedMerchangeName){
	$('#parentMercId').val(affiliatedMerchangeSn);
	$('#parentMercNm').val(affiliatedMerchangeName);
	getAndBackData('0',affiliatedMerchangeSn);
}
/**
 * 回填坐标
 */
function backPositionData(longitude,latitude){
	$('#longitude').val(longitude);
	$('#latitude').val(latitude);
}
/**
 * 填充业务员下拉框
 */
function fillBusManSelect(busManNameInputId,busManNoInputId,busManName,busManNo){
	var orgUuid = $("[name='starterAttrOrgNo']").val();
	if(orgUuid!=''){
		$.ajax({
	        url: '/mercIncome/findAllBusMan.do',
	        data : {
	        	orgUuid : orgUuid
	        },
	        async:true,
	        cache: true,
	        success : function(employeeList) {
	       	 	if(employeeList != null && employeeList !=undefined){
	       	 		var busManNoOptions = "";
	       	 		var busManNameOptions = "";
		             for(var i=0;i<employeeList.length;i++){
		            	 if(busManNo != '' || busManName != ''){
		            		 if(employeeList[i].empNo == busManNo){
		            			 busManNoOptions+="<option selected='selected' value=\""+employeeList[i].empNo+"\">"+employeeList[i].empNo+"</option>";
		            			 busManNameOptions+="<option selected='selected' value=\""+employeeList[i].empNm+"\">"+employeeList[i].empNm+"</option>";
		            		 }else{
		            			 busManNoOptions+="<option value=\""+employeeList[i].empNo+"\">"+employeeList[i].empNo+"</option>";
		            			 busManNameOptions+="<option value=\""+employeeList[i].empNm+"\">"+employeeList[i].empNm+"</option>";
		            		 }
		            	 }else{
		            		 busManNoOptions+="<option value=\""+employeeList[i].empNo+"\">"+employeeList[i].empNo+"</option>";
	            			 busManNameOptions+="<option value=\""+employeeList[i].empNm+"\">"+employeeList[i].empNm+"</option>";
		            	 }
		             }
		             $("#"+busManNoInputId).html(busManNoOptions);
		             $("#"+busManNoInputId).trigger("chosen:updated");
		             $("#"+busManNameInputId).html(busManNameOptions);
		             $("#"+busManNameInputId).trigger("chosen:updated");
	       	 	}else{
	       	 		alert('无法获取本机构下业务员信息!');
	       	 	}
	        }
		});
	}else{
		$("#"+posModelId).html('');
	}
}