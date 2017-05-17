/*商户基本信息页面*/
var icsMessage=new Array();
var uptMessage=new Array();
var idText=new Array();
idText["urbanAndRural"]="商户优惠类型县乡";
idText["threeRural"]="商户优惠类型三农";
idText["isStars"]="是否星级商户";
//风险控制信息
idText["keywords"]="关键字";
idText["descBiz"]="商户经营概述";
idText["descLoanBiz"]="本贷本经营概述";
idText["mccCdSelect"]="商户行业编号（MCC）";
idText["prepareMccSelect"]="预设商户行业编号(MCC)";
idText["mercLevelSelect"]="商户级别";
idText["noBranchSelect"]="无分公司";
idText["mixedOperationSelect"]="混业经营";
idText["acountAuthSelect"]="账户授权";
idText["lackOfInformationSelect"]="资料缺失";
idText["highRiskIndustrySelect"]="高风险行业";
idText["mobilPosSelect"]="移动POS";
idText["isReSignMerc"]="普通重签商户";
idText["isExceptionMerc"]="例外商户";
idText["mercFnm"]="经营名称";

function getTipsMessage(cssColor,count,taskName){
	var messageShow="";
	if($("#isSaved").val()=="1"){
		messageShow=$("#tipsInfo").val();
	}else{
		messageShow=$("#tipsInfo").val()+"<p><b>"+taskName+"</b><b>第<font color=\""+cssColor+"\">"+count+"</font>次修改</span></b></p>";
	}
	if($("#newShowChangeMessage").has("li").length){
		 $("#showChangeMessage").html(messageShow);
	}else{
		 $("#showChangeMessage").html($("#tipsInfo").val());
	}
}

function getIcsMessage(cssColor,count,taskName,flag){
	var textInputIdArray = ['keywords','descBiz','mercFnm'];
	for(var i=0;i<textInputIdArray.length;i++){
		icsMessage[textInputIdArray[i]]=$('#'+textInputIdArray[i]).val();
		$('#'+textInputIdArray[i]).blur(function(){
			getShowMessage(this,"1",cssColor,count,flag);
			getTipsMessage(cssColor,count,taskName);
		});
	}
	var selectInputIdArray = ['mccCdSelect','prepareMccSelect','mercLevelSelect','noBranchSelect','mixedOperationSelect',
	                          'acountAuthSelect','acountAuthSelect','lackOfInformationSelect','highRiskIndustrySelect',
	                          'mobilPosSelect'];
	for(var i=0;i<selectInputIdArray.length;i++){
		if(selectInputIdArray[i] == 'mccCdSelect')
			icsMessage[selectInputIdArray[i]]=$("option:selected",$('#'+selectInputIdArray[i])).val();
		else
			icsMessage[selectInputIdArray[i]]=$("option:selected",$('#'+selectInputIdArray[i])).text();
		$('#'+selectInputIdArray[i]).bind('change',function(){
			getShowMessage(this,"2",cssColor,count,flag);
			getTipsMessage(cssColor,count,taskName);
		});
	}
	
	var checkboxInputIdArray = ['isReSignMerc','isExceptionMerc','isStars'];
	for(var i=0;i<checkboxInputIdArray.length;i++){
		if($('#'+checkboxInputIdArray[i]).prop("checked")==true){
			icsMessage[checkboxInputIdArray[i]]="选中";
		}else{
			icsMessage[checkboxInputIdArray[i]]="不选中";
		}
		$('#'+checkboxInputIdArray[i]).change(function(){
			getShowMessage(this,"3",cssColor,count,flag);
			getTipsMessage(cssColor,count,taskName);
		});
	}
}

function getShowMessage(obj,tagType,cssColor,count,flag){
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
		var text = $(obj).find("option:selected").text();
		if($(obj).attr("id") == 'mccCdSelect')
			text = $(obj).find("option:selected").val();
		messageShow+="<li id=\"li"+flag+count+$(obj).attr("id")+"\">"+idText[$(obj).attr("id")]+"的值由" +
			"<font color=\""+cssColor+"\" id=\"font"+$(obj).attr("id")+"\">"+icsMessage[$(obj).attr("id")]+"</font>变成<font color=\""+cssColor+"\">" +
			text+"</font><br/></li>";
		$("#li"+flag+count+$(obj).attr("id")).remove();
		$("#newShowChangeMessage").append(messageShow);
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
	var val=obj;
    var reg = new RegExp("^[0-9]+(\.[0-9]+)?$");   
    if(reg.test(obj)){  
      val=parseFloat(obj);
    }
    return val;
}


//修改流程县乡三农优惠
function urbanAndRuralOperateUpdateFlow(){
	//01-县乡优惠，02-普通商户，03-三农商户
	if($("#mercPreferentialType").val()=="01"){
		$("#urbanAndRural").attr("checked", true);
		urbanAndRuralUpdateFlow();
	    $("#prepareFeeRateTip").hide();
		$("#capAmtTipInfo").hide();
	}else if($("#mercPreferentialType").val()=="03"){
		$("#threeRural").attr("checked", true);
		threeRuralUpdateFlow();
	    $("#prepareFeeRateTip").hide();
	    $("#capAmtTipInfo").hide();
	}
	$(".urbanAndRural").click(function(){
		if($(this).is(':checked')){
			$("#mercDiscountInfo").show();
			if(this.id=='urbanAndRural'){
				$("#threeRural").attr("checked", false);
				$("#threeRural").trigger('change');
				$("#urbanAndRural").trigger('change');
				$("#mercDiscountInfo").html('');
				urbanAndRuralUpdateFlow();
				$("#mercPreferentialType").val("01");
			    $("#prepareFeeRateTip").hide();
			    $("#capAmtTipInfo").hide();
			}else{
				$("#urbanAndRural").attr("checked", false);
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
	if($("#mercTrddesc").val()=="1"){
    	if(parseFloat($("#feeRat").val())<0.85){
    		$("#mercDiscountInfo").html('县乡餐娱类最低签约费率低于0.85,请回退发起人做修改！');
    	}
    }else if($("#mercTrddesc").val()=="2"){
    	if(parseFloat($("#feeRat").val())<0.5){
    		$("#mercDiscountInfo").html('县乡一般类最低签约费率低于0.5,请回退发起人做修改！');
    	}
    }else if($("#mercTrddesc").val()=="3"){
    	if(parseFloat($("#feeRat").val())<0.38){
    		$("#mercDiscountInfo").html('县乡民生类最低签约费率低于0.38,请回退发起人做修改！');
    	}
    }else if($("#mercTrddesc").val()=="4"){
    	if(parseFloat($("#feeRat").val())<0.85&&$("#isCap").is(":checked")&&parseFloat($("#capAmt").val())>=30){
    		$("#mercDiscountInfo").html('县乡房产汽车类最低签约费率低于0.85,请回退发起人做修改！');
    	}else if(parseFloat($("#feeRat").val())<0.85&&$("#isCap").is(":checked")&&parseFloat($("#capAmt").val())<30){
    		$("#mercDiscountInfo").html('县乡房产汽车类最低签约费率低于0.85/封顶值低于30,请回退发起人做修改！');
    	}else if(parseFloat($("#feeRat").val())>=0.85&&$("#isCap").is(":checked")&&parseFloat($("#capAmt").val())<30){
    		$("#mercDiscountInfo").html('县乡房产汽车类封顶值低于30,请回退发起人做修改！');
    	}
    }else if($("#mercTrddesc").val()=="5"){
    	if(parseFloat($("#feeRat").val())<0.5&&$("#isCap").is(":checked")&&parseFloat($("#capAmt").val())>=15){
    		$("#mercDiscountInfo").html('县乡批发类最低签约费率低于0.5,请回退发起人做修改！');
    	}else if(parseFloat($("#feeRat").val())<0.5&&$("#isCap").is(":checked")&&parseFloat($("#capAmt").val())<15){
    		$("#mercDiscountInfo").html('县乡批发类最低签约费率低于0.5/封顶值低于15,请回退发起人做修改！');
    	}else if(parseFloat($("#feeRat").val())>=0.5&&$("#isCap").is(":checked")&&parseFloat($("#capAmt").val())<15){
    		$("#mercDiscountInfo").html('县乡批发类封顶值低于15,请回退发起人做修改！');
    	}
    }
}

//商户类型为三农时，费率以及封顶金额判断
function threeRural(){
	if($("#mercTrddesc").val()=="1"){
    	if(parseFloat($("#feeRat").val())<0.85){
    		$("#mercDiscountInfo").html('餐娱类最低签约费率低于0.85,请回退发起人做修改！');
    	}
    }else if($("#mercTrddesc").val()=="2"){
    	if(parseFloat($("#feeRat").val())<0.5){
    		$("#mercDiscountInfo").html('一般类最低签约费率低于0.5,请回退发起人做修改！');
    	}
    }else if($("#mercTrddesc").val()=="3"){
    	if(parseFloat($("#feeRat").val())<0.25){
    		$("#mercDiscountInfo").html('民生类最低签约费率低于0.25,请回退发起人做修改！');
    	}
    }else if($("#mercTrddesc").val()=="4"){
    	if(parseFloat($("#feeRat").val())<0.85&&$("#isCap").is(":checked")&&parseFloat($("#capAmt").val())>=30){
    		$("#mercDiscountInfo").html('房产汽车类最低签约费率低于0.85,请回退发起人做修改！');
    	}else if(parseFloat($("#feeRat").val())<0.85&&$("#isCap").is(":checked")&&parseFloat($("#capAmt").val())<30){
    		$("#mercDiscountInfo").html('房产汽车类最低签约费率低于0.85/封顶值低于30,请回退发起人做修改！');
    	}else if(parseFloat($("#feeRat").val())>=0.85&&$("#isCap").is(":checked")&&parseFloat($("#capAmt").val())<30){
    		$("#mercDiscountInfo").html('房产汽车类封顶值低于30,请回退发起人做修改！');
    	}
    }else if($("#mercTrddesc").val()=="5"){
    	if(parseFloat($("#feeRat").val())<0.3&&$("#isCap").is(":checked")&&parseFloat($("#capAmt").val())>=10){
    		$("#mercDiscountInfo").html('批发类最低签约费率低于0.3,请回退发起人做修改！');
    	}else if(parseFloat($("#feeRat").val())<0.3&&$("#isCap").is(":checked")&&parseFloat($("#capAmt").val())<10){
    		$("#mercDiscountInfo").html('批发类最低签约费率低于0.3/封顶值低于10,请回退发起人做修改！');
    	}else if(parseFloat($("#feeRat").val())>=0.3&&$("#isCap").is(":checked")&&parseFloat($("#capAmt").val())<10){
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
	    		$("#mercDiscountInfo").html('县乡餐娱类最低签约费率低于0.85,请回退发起人做修改！');
	    	}
	    }else if($("#prepareMcc").val()=="2"){
	    	if(parseFloat($("#feeRate1").val())<0.5){
	    		$("#mercDiscountInfo").html('县乡一般类最低签约费率低于0.5,请回退发起人做修改！');
	    	}
	    }else if($("#prepareMcc").val()=="3"){
	    	if(parseFloat($("#feeRate1").val())<0.38){
	    		$("#mercDiscountInfo").html('县乡民生类最低签约费率低于0.38,请回退发起人做修改！');
	    	}
	    }else if($("#prepareMcc").val()=="4"){
	    	if(parseFloat($("#feeRate1").val())<0.85&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())>=30){
	    		$("#mercDiscountInfo").html('县乡房产汽车类最低签约费率低于0.85,请回退发起人做修改！');
	    	}else if(parseFloat($("#feeRate1").val())<0.85&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())<30){
	    		$("#mercDiscountInfo").html('县乡房产汽车类最低签约费率低于0.85/封顶值低于30,请回退发起人做修改！');
	    	}else if(parseFloat($("#feeRate1").val())>=0.85&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())<30){
	    		$("#mercDiscountInfo").html('县乡房产汽车类封顶值低于30,请回退发起人做修改！');
	    	}
	    }else if($("#prepareMcc").val()=="5"){
	    	if(parseFloat($("#feeRate1").val())<0.5&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())>=15){
	    		$("#mercDiscountInfo").html('县乡批发类最低签约费率低于0.5,请回退发起人做修改！');
	    	}else if(parseFloat($("#feeRate1").val())<0.5&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())<15){
	    		$("#mercDiscountInfo").html('县乡批发类最低签约费率低于0.5/封顶值低于15,请回退发起人做修改！');
	    	}else if(parseFloat($("#feeRate1").val())>=0.5&&$("#isCap1").is(":checked")&&parseFloat($("#capAmt1").val())<15){
	    		$("#mercDiscountInfo").html('县乡批发类封顶值低于15,请回退发起人做修改！');
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

// 修改提示信息导出
function tipsInfoExport() {
	    var startDate=$("#startDate").val();
	    var endDate=$("#endDate").val();
	    var taskTyp=$("#taskTyp").val();
	    if(startDate!=""&&endDate!=""&&startDate>endDate){
	    	alert("起始时间大于结束时间，请重新选择！");
	    	$("#endDate").val("");
	    }else{
	    	location.href = "/mercIncome/doTipsInfoExport?startDate="
				+ startDate+ "&endDate="+endDate+"&taskTyp="+taskTyp;
	    }	
}

//刷新左侧任务列表
function refreshTaskList(){
	window.parent.parent.frames["leftFrame"].location.reload();
}

//从修改提示信息中提取是否包含注册名称、法人名称、结算卡一账户名
function getStars(tipsInfo){
	var flag=false;
	var regex1 = new RegExp("结算卡一账户名的值由");
	var regex2 = new RegExp("法人姓名的值由");
	var regex3 = new RegExp("注册名称的值由");
	var result1 = tipsInfo.match (regex1);
	var result2 = tipsInfo.match (regex2);
	var result3 = tipsInfo.match (regex3);
	if(result1!=null||result2!=null || result3!=null){
		flag=true;
	} 
	return flag;	
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
	if($("#mercTyp").val()=="3"&&!$("#relflg1").is(":checked")){
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

/**
 * 增加重复次数校验信息 
 */
function validateRestrictTimes(){
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
	if($("#mercTyp").val()=="1"||$("#mercTyp").val()=="4"||$("#mercTyp").val()=="5"){
		mercTyp="0";
	}else{
		mercTyp="1";
	}
	if($("#stmAct1").val()!=""){
		actNo1=$("#stmAct1").val().replace(/\s/gi,'');
		actNm1=encodeURIComponent($("#stmActNm1").val().replace(/\s/gi,''));
		idCard1=$("#idCardNo1").val().replace(/\s/gi,'');
		flag1="2";
	}
	if($("#stmAct2").val()!=""){
		actNo2=$("#stmAct2").val().replace(/\s/gi,'');
		actNm2=encodeURIComponent($("#stmActNm2").val().replace(/\s/gi,''));
		flag2="1";
	}
	regNo=$("#regNo").val().replace(/\s/gi,'').trim();
	regNm=encodeURIComponent($("#mercRegNm").val().replace(/\s/gi,'').trim());
	orderNo=$("#orderNo").val();
	$.ajax({
		url : '/eip-web/oa/restrictTimes/validateRestrictTimes.do',
		data : {
			mercTyp: mercTyp,
			actNo1:actNo1,
			actNm1:actNm1,
			idCard1:idCard1,
			flag1:flag1,
			actNo2:actNo2,
			actNm2:actNm2,
			idCard2:idCard2,
			flag2:flag2,
			regNo:regNo.trim(),
			regNm:regNm.trim(),
			orderNo:orderNo,
			legPerCrdNo : $("#legalCredentialsNo").val(),
			legPerNm : encodeURIComponent($("#legalNm").val().replace(/\s/gi,''))
		},
		cache : false,
		async: false,
		dataType : "json",
		success : function(data) {
			if (data.resCode == "01") {
				flag=data.resMsg;
			}
		}
	});	
	return flag;
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
	if($("#mercTyp").val()=="1"||$("#mercTyp").val()=="4"||$("#mercTyp").val()=="5"){
		mercTyp="0";
	}else{
		mercTyp="1";
	}
	if(($("#mercTyp").val()=="3"||$("#mercTyp").val()=="5")&&!$("#relflg1").is(":checked")){
		actNo1=$("#zongdianStmAct1").val().replace(/\s/gi,'');
		actNo2=$("#zongdianStmAct2").val().replace(/\s/gi,'');
		actNm1=$("#zongdianStmActNm1").val().replace(/\s/gi,'');
		actNm2=$("#zongdianStmActNm2").val().replace(/\s/gi,'');
	}else{
		actNo1=$("#stmAct1").val().replace(/\s/gi,'');
		actNo2=$("#stmAct2").val().replace(/\s/gi,'');
		actNm1=$("#stmActNm1").val().replace(/\s/gi,'');
		actNm2=$("#stmActNm2").val().replace(/\s/gi,'');
	}
	flag1 = $("#stmActTyp1").val();
	flag2 = $("#stmActTyp2").val();
	idCard1 = $("#idCardNo1").val().replace(/\s/gi,'');
	idCard2 = $("#idCardNo2").val().replace(/\s/gi,'');
	regNo=$("#regNo").val().trim();
	regNm=$("#mercRegNm").val().trim();
	orderNo=$("#orderNo").val();
	if($('#stepString').val()=='centerCheck'||$('#stepString').val()=='stepHeadRiskControl'){
		 flag3="01";
	}else{
		flag3="00";
	}
	$.ajax({
		url :'/eip-web/oa/restrictTimes/validateRestrictTimes.do',
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
			legPerCrdNo : $("#legalCredentialsNo").val(),
			legPerNm : encodeURIComponent($("#legalNm").val().replace(/\s/gi,'')),
			flag3:flag3
		},
		cache : false,
		async: false,
		dataType : "json",
		success : function(data) {
			if (data.resCode == "01") {
				flag =data.resMsg;
			}
		}
	});	
	return flag;
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
function trim(str){
    str = str.replace(/^(\s|\u00A0)+/,'');   
    for(var i=str.length-1; i>=0; i--){   
        if(/\S/.test(str.charAt(i))){   
            str = str.substring(0, i+1);   
            break;   
        }   
    }   
    return str;   
} 

/**
 * 增加重复次数校验信息 
 */
function validateRestrictTimes2(tipsInfo){
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
		var result01 = restrictTimes.match(regex01);
		var result02 = restrictTimes.match(regex02);
		var result03 = restrictTimes.match(regex03);
		var result04 = restrictTimes.match(regex04);
		var result05 = restrictTimes.match(regex05);
		var result06 = restrictTimes.match(regex06);
		var result07 = restrictTimes.match(regex07);
		var result08 = restrictTimes.match(regex08);
		if (result01 != null && result1 == null) {
			actNm1 = "";
		}else { 
			if($("#mercTyp").val()=="3"&&!$("#relflg1").is(":checked")){ 
				actNm1=""; 
			}else if($("#mercTyp").val()=="5"&&!$("#relflg1").is(":checked")){
				actNm1=$("#zongdianStmActNm1").val().replace(/\s/gi,'');
			}else{
				actNm1 = $("#stmActNm1").val().replace(/\s/gi, '');
			}	
		}
		if (result02 != null && result2 == null) {
			actNm2 = "";
		}else { 
			if($("#mercTyp").val()=="3"&&!$("#relflg1").is(":checked")){
				actNm2="";
			}else if($("#mercTyp").val()=="5"&&!$("#relflg1").is(":checked")){
				actNm2=$("#zongdianStmActNm2").val().replace(/\s/gi,'');
			}else{
				actNm2 = $("#stmActNm2").val().replace(/\s/gi, '');
			}	
		}
		if (result03 != null && result3 == null) {
			actNo1 = "";
		}else {
			if($("#mercTyp").val()=="3"&&!$("#relflg1").is(":checked")){
				actNo1="";
			}else if($("#mercTyp").val()=="5"&&!$("#relflg1").is(":checked")){
				actNo1=$("#zongdianStmAct1").val().replace(/\s/gi,'');
			}else{
				actNo1 = $("#stmAct1").val().replace(/\s/gi, '');
			}	
		}
		if (result04 != null && result4 == null) {
			actNo2 = "";
		}else {
			if($("#mercTyp").val()=="3"&&!$("#relflg1").is(":checked")){	 
				actNo2="";
			}else if($("#mercTyp").val()=="5"&&!$("#relflg1").is(":checked")){
				actNo2=$("#zongdianStmAct2").val().replace(/\s/gi,'');
			}else{
				actNo2 = $("#stmAct2").val().replace(/\s/gi, '');
			}	
			
		}
		if (result05 != null && result5 == null) {
			idCard1 = "";
		}else {
			idCard1 = $("#idCardNo1").val().replace(/\s/gi, '');
		}
		if (result06 != null && result6 == null) {
			idCard2 = "";
		}else {
			idCard2 = $("#idCardNo2").val().replace(/\s/gi, '');
		}
		if (result07 != null && result7 == null) {
			regNm = "";
		}else {
			regNm = $("#mercRegNm").val().trim();
		}
		if (result08 != null && result8 == null) {
			regNo = "";
		}else {
			regNo = $("#regNo").val().trim();
		}	
	}else{
		if(($("#mercTyp").val()=="3"||$("#mercTyp").val()=="5")&&!$("#relflg1").is(":checked")){
			actNo1=$("#zongdianStmAct1").val().replace(/\s/gi,'');
			actNo2=$("#zongdianStmAct2").val().replace(/\s/gi,'');
			actNm1=$("#zongdianStmActNm1").val().replace(/\s/gi,'');
			actNm2=$("#zongdianStmActNm2").val().replace(/\s/gi,'');
		}else{
			actNo1=$("#stmAct1").val().replace(/\s/gi,'');
			actNo2=$("#stmAct2").val().replace(/\s/gi,'');
			actNm1=$("#stmActNm1").val().replace(/\s/gi,'');
			actNm2=$("#stmActNm2").val().replace(/\s/gi,'');
		}
		idCard1 = $("#idCardNo1").val().replace(/\s/gi,'');
		idCard2 = $("#idCardNo2").val().replace(/\s/gi,'');
		regNo=$("#regNo").val().trim();
		regNm=$("#mercRegNm").val().trim();
	}
	
	if($("#mercTyp").val()=="1"||$("#mercTyp").val()=="4"||$("#mercTyp").val()=="5"){
		mercTyp="0";
	}else{
		mercTyp="1";
	}
	flag1 = $("#stmActTyp1").val();
	flag2 = $("#stmActTyp2").val();
	orderNo=$("#orderNo").val();
	if($('#stepString').val()=='centerCheck'||$('#stepString').val()=='stepHeadRiskControl'){
		 flag3="01";
	}else{
		flag3="00";
	}
	$.ajax({
		url :'/eip-web/oa/restrictTimes/validateRestrictTimes.do',
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
			legPerCrdNo : $("#legalCredentialsNo").val(),
			legPerNm : encodeURIComponent($("#legalNm").val().replace(/\s/gi,'')),
			flag3:flag3
		},
		cache : false,
		async: false,
		dataType : "json",
		success : function(data) {
			if (data.resCode == "01") {
				flag =data.resMsg;
			}
		}
	});	
	return flag;
}

//修改结算银行名称导致取消朝付通业务
function changeForZftFlg(){
	if($("#stmBankNm1").val()=="313"){
		if($("#zftFlg").is(':checked')){
			$.messager.confirm("确认", "确认将结算银行名称为其他银行，将取消朝付通业务?", function(r) {
	    		if (r) {
	    			$("#zftFlg").attr("checked", false);
					$("#zftFlg").trigger('change');
	    		}
			});
		}
	}else{
		if($("#zftFlg").val()=="01"||$("#zftFlg").val()=="02"){
			$("#zftFlg").attr("checked", true);
			$("#zftFlg").trigger('change');
		}
	}
}


