function checkSelect(flag) {
	var type=$("#type").val();
	var mno = $("#mno").val().trim();
	var reg = /^\d{15}$/;
	var result = reg.test(mno);
	if (mno != null && mno != '' && !result ) {
		alert("商户编号为15位数字！");
		return false;
	}
	var userNo= $("#userNo").val().trim();
	var userRes=reg.test(userNo);
	if(userNo !=null && userNo !=''&& !userRes){
		alert("用户编号为15位数字！");
		return false;
	}
	var cprRegNmCn = $("#cprRegNmCn").val().trim();
	if(getLen(cprRegNmCn)>80){
		alert("商户注册名称最长为40位中文字符！");
		return false;
	}
	var idcardNo=$("#idcardNo").val().trim();
	var idReg=/^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
	var idResult=idReg.test(idcardNo);
	
	var tel = $("#tel").val().trim();
	var reg = /^[0-9]*$/;
	var result = reg.test(tel);
	if (tel !=null && tel != '' && !result ) {
		alert("手机号为数字格式！");
		return false;
	}
	
	if (idcardNo !=null && idcardNo != '' && !idResult ) {
		alert("身份证号格式不对！");
		return false;
	}
	
	/*var registNo = $("#registNo").val().trim();
	if(getLen(registNo)>30){
		alert("营业执照注册号最长为30位字节！");
		return false;
	}*/
	
	var registNm = $("#registNm").val().trim();
	if(getLen(registNm)>160){
		alert("营业执照注册名称最长为80位中文字符！");
		return false;
	}
	
	var rootAgentOrgNo = $("#rootAgentOrgNo").val().trim();
	if(getLen(rootAgentOrgNo)>100){
		alert("归属一代最长为50位中文字符！");
		return false;
	}
	
	var agentOrgNo = $("#agentOrgNo").val().trim();
	if(getLen(agentOrgNo)>100){
		alert("直属机构最长为50位中文字符！");
		return false;
	}
	if(flag=='search'){
		//vv商户审核检索
		if(type =='1'){
			$("#submitButton").attr("disabled",　true);
			/*$("#searchForm").submit()*/
			$('#searchForm').attr('action','/vvMecIfCheck/vvMecIfCheckList?entry=1');
			return true;
		}
		if(type=='2'){
			//钱包用户审核检索
			 $('#searchForm').attr('action','/walletUserCheck/walletUserCheckList?entry=1');
			 return true;
			/* document.getElementById("searchForm").submit();
			 $('#searchForm').attr('action','/vvMecIfCheck/vvMecIfCheckList?entry=1');*/
		}
	}
	else{
		return true;
	}
}

function resetMecForm(){
	$(':input','#searchForm')  
  	 .not(':button, :submit, :reset, :hidden')  
  	 .val('')  
  	 .removeAttr('checked')  
  	 .removeAttr('selected'); 
   	 $("#authenticationStatus").val('');
   	 $("#authenticationStatus").trigger("chosen:updated");
   	 $("#branchOrgUuid").val('');
   	 $("#branchOrgUuid").trigger("chosen:updated");
   	 $("#agentBranchOrgUuid").val('');
  	 $("#agentBranchOrgUuid").trigger("chosen:updated");
  	 $("#authenticationType").val('');
  	 $("#authenticationType").trigger("chosen:updated");
  	 $("#accountType").val('');
  	 $("#accountType").trigger("chosen:updated");
  	 $("#mecProvCd").val('');
  	 $("#mecProvCd").trigger("chosen:updated");
  	 $("#mecCityCd").val('');
  	 $("#mecCityCd").trigger("chosen:updated");
  	 $("#sts").val('');
 	 $("#sts").trigger("chosen:updated");
}

function exportDown() {
	var type=$("#type").val();
    if(checkSelect('download')){
	debugger
	if(type=="1"){
		$("#exportButton").attr("disabled",　true);
		location.href = "/vvMecIfCheck/exportDown.do"
			+ "?mno=" + $('#mno').val() 
			+ "&cprRegNmCn=" + $('#cprRegNmCn').val() 
			+ "&tel=" + $('#tel').val() 
			+ "&dtCteStart=" + $('#dtCteStart').val() 
			+ "&dtCteEnd=" + $("#dtCteEnd").val() 
			+ "&authenticationDtStart=" + $("#authenticationDtStart").val()
			+ "&authenticationDtEnd=" + $("#authenticationDtEnd").val()
			+ "&checkDtStart=" + $("#checkDtStart").val()
			+ "&checkDtEnd=" + $("#checkDtEnd").val()
			+ "&authenticationType=" + $("#authenticationType").val()
			+ "&accountType=" + $("#accountType").val()
			+ "&mecProvCd=" + $("#mecProvCd").val()
			+ "&mecCityCd=" + $("#mecCityCd").val()
			+ "&authenticationStatus=" + $("#authenticationStatus").val()
			+ "&registNm=" + $("#registNm").val()
			+ "&agentBranchOrgUuid=" + $("#agentBranchOrgUuid").val()
			+ "&rootAgentOrgNo=" + $("#rootAgentOrgNo").val()
			+ "&agentOrgNo=" + $("#agentOrgNo").val();
		$("#exportButton").removeAttr("disabled");
	}else{
		$("#exportButton").attr("disabled",　true);
		$('#searchForm').attr('action','/walletUserCheck/walletExportDown');
		 document.getElementById("searchForm").submit();
		 $('#searchForm').attr('action','/vvMecIfCheck/vvMecIfCheckList?entry=1');
		 $("#exportButton").removeAttr("disabled");
		
	  }
   }
}

function showDetail(mno,authenticationType) {
	var url = "/vvMecIfCheck/vvMecIfCheckDetail.do?mno=" + mno + "&authenticationType=" + authenticationType;
	$.fancybox.open({
		href : url,
		type : 'iframe',
		padding : 4,
		scrolling : 'no',
		fitToView : true,
		autoWidth : true,
		height : 600,
		width : 1200,
		autoSize : false,
		closeClick : false
	});
}

function walletAuth(userNo,uuid,flag) {
	debugger
	var url = "/walletUserCheck/toWalletCheckAuth?userNo="+ userNo+"&uuid="+uuid+"&flag="+flag;
	$.fancybox.open({
		href : url,
		type : 'iframe',
		padding : 4,
		scrolling : 'no',
		fitToView : true,
		autoWidth : true,
		height : 600,
		width : 1200,
		autoSize : false,
		closeClick : false,
		afterClose : function() {
			checkSelect('search');
		}
	});
}

function walletAuth(userNo,uuid,flag) {
	debugger
	var url = "/walletUserCheck/toWalletCheckAuth?userNo="+ userNo+"&uuid="+uuid+"&flag="+flag;
	$.fancybox.open({
		href : url,
		type : 'iframe',
		padding : 4,
		scrolling : 'no',
		fitToView : true,
		autoWidth : true,
		height : 600,
		width : 1200,
		autoSize : false,
		closeClick : false,
		afterClose : function() {
			checkSelect('search');
		}
	});
}


function showAuth(mno,authenticationType,accountType) {
	var url = "/vvMecIfCheck/toVvMecIfCheckAuth.do?mno=" + mno + "&authenticationType=" + authenticationType+"&accountType="+accountType;
	$.fancybox.open({
		href : url,
		type : 'iframe',
		padding : 4,
		scrolling : 'no',
		fitToView : true,
		autoWidth : true,
		height : 600,
		width : 1200,
		autoSize : false,
		closeClick : false,
		afterClose : function() {
			location.href = "/vvMecIfCheck/vvMecIfCheckList.do"
				+ "?mno=" + $('#mno').val().trim()
				+ "&cprRegNmCn=" + $('#cprRegNmCn').val().trim() 
				+ "&tel=" + $('#tel').val().trim() 
				+ "&dtCteStart=" + $('#dtCteStart').val().trim() 
				+ "&dtCteEnd=" + $("#dtCteEnd").val().trim()
				+ "&authenticationDtStart=" + $("#authenticationDtStart").val().trim()
				+ "&authenticationDtEnd=" + $("#authenticationDtEnd").val().trim()
				+ "&checkDtStart=" + $("#checkDtStart").val()
				+ "&checkDtEnd=" + $("#checkDtEnd").val()
				+ "&authenticationType=" + $("#authenticationType").val().trim()
				+ "&accountType=" + $("#accountType").val()
				+ "&mecProvCd=" + $("#mecProvCd").val()
				+ "&mecCityCd=" + $("#mecCityCd").val()
				+ "&authenticationStatus=" + $("#authenticationStatus").val().trim()
				+ "&registNm=" + $("#registNm").val().trim()
				+ "&agentBranchOrgUuid=" + $("#agentBranchOrgUuid").val().trim()
				+ "&rootAgentOrgNo=" + $("#rootAgentOrgNo").val().trim()
				+ "&agentOrgNo=" + $("#agentOrgNo").val().trim()
				+ "&entry=1";
		}
	});
}

function uploadImg(value,args){
	if(args==0){
		location.href = "/vvMecIfCheck/uploadImg.do?uuid="+value+"&args=0";
	}
	if(args==1){
		location.href = "/vvMecIfCheck/uploadImg.do?mno="+value+"&args=1";
	}
}

function checkCommit(checkResult) {
	var authenticationType=$("#authenticationType").val();
	var waitingCheck= !$("#waitingCheck").is(":hidden");
	var failedToPass= !$("#failedToPass").is(":hidden");
	if(authenticationType=='1'){
		if(waitingCheck){
			alert("请进行公安验证");
			return;
		}
		
	}
	var rebutReason = 0;
	$("input[name='suggestion']:checkbox").each(function() {
		if ($(this).prop("checked")) {
			rebutReason += 1;
		}
	})
	if (checkResult == '02') {//审核通过
		if (rebutReason != 0) {
			alert("已选择驳回原因，不能审核通过");
			return;
		}
	}
	if (checkResult == '03') {//审核驳回
		if (rebutReason == 0) {
			alert("未选择驳回原因，不能审核驳回");
			return;
		}
	}
	
	var remarks= $("#remarks").val().trim();
	var applicationNum = $("#applicationNum").val();
	var mno= $("#mno").val();
	var isBlack= $("#isBlack").val();
	/*if (remarks == null || remarks== '' || remarks==undefined) {//审核驳回
		alert("会签意见不能为空");
		return;
	}*/
	if(remarks.length>500){
		alert("会签意见不能超过500字");
		return;
	}
	$("#authenticationStatus").val(checkResult);
	$("#authenticationStatusBack").val(checkResult);
	$.ajax({
		cache : true,
		type : "POST",
		url : '/vvMecIfCheck/vvMecIfCheckAuth.do',
		data : $("#submitForm").serialize(),
		async : false,
		success : function(data) {
			if(data=='操作成功'){
				// 第十次依然不通过
				if(checkResult=='03' && applicationNum>=10){
						// 加入黑名单
						$.ajax({
							cache : true,
							type : "POST",
							url : "/vvMecIfCheck/addBlack.do?",
							data : $("#submitForm").serialize(),
							async : false,
							success : function(data) {
								if(data=='该商户已加入黑名单'){
									alert('操作成功，该商户已加入黑名单');
									window.parent.location.reload();
								}
							}
						});
				}else{
					alert(data);
				}
				window.parent.location.reload();
			}else{
				alert(data);
				if(data=='审核失败，该商户已被他人审核' || data=='审核失败，超过签收时间，请关闭后重新审核'){
					window.parent.location.reload();
				}
			}
		}
	});
}




function changeDtCteStart(){
	var dtCteStart=Number($("#dtCteStart").val().replace(/-/g,''));
	var dtCteEnd=Number($("#dtCteEnd").val().replace(/-/g,''));
	if(dtCteEnd!=0){
		if(dtCteStart>dtCteEnd){
			$("#dtCteEnd").val($("#dtCteStart").val())
		}
	}
}
function changeDtCteEnd(){
	var dtCteStart=Number($("#dtCteStart").val().replace(/-/g,''));
	var dtCteEnd=Number($("#dtCteEnd").val().replace(/-/g,''));
	if(dtCteStart!=0){
		if(dtCteStart>dtCteEnd){
			$("#dtCteStart").val($("#dtCteEnd").val())
		}
	}
}
function changeAuthenticationDtStart(){
	var authenticationDtStart=Number($("#authenticationDtStart").val().replace(/-/g,''));
	var authenticationDtEnd=Number($("#authenticationDtEnd").val().replace(/-/g,''));
	if(authenticationDtEnd!=0){
		if(authenticationDtStart>authenticationDtEnd){
			$("#authenticationDtEnd").val($("#authenticationDtStart").val())
		}
	}
}
function changeAuthenticationDtEnd(){
	var authenticationDtStart=Number($("#authenticationDtStart").val().replace(/-/g,''));
	var authenticationDtEnd=Number($("#authenticationDtEnd").val().replace(/-/g,''));
	if(authenticationDtStart!=0){
		if(authenticationDtStart>authenticationDtEnd){
			$("#authenticationDtStart").val($("#authenticationDtEnd").val())
		}
	}
}


function getLen(obj){
	var char = obj.replace(/[^\x00-\xff]/g, '**');
    return char.length;
}