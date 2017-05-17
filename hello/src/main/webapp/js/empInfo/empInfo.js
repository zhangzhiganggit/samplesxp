function changeRegisterDtStart(){
	var registerDtStart=Number($("#registerDtStart").val().replace(/-/g,''));
	var registerDtEnd=Number($("#registerDtEnd").val().replace(/-/g,''));
	if(registerDtEnd != 0){
		if(registerDtStart>registerDtEnd){
			$("#registerDtEnd").val($("#registerDtStart").val());
		}
	}
}
function changeRegisterDtEnd(){
	var registerDtStart=Number($("#registerDtStart").val().replace(/-/g,''));
	var registerDtEnd=Number($("#registerDtEnd").val().replace(/-/g,''));
	if(registerDtStart != 0){
		if(registerDtStart>registerDtEnd){
			$("#registerDtStart").val($("#registerDtEnd").val());
		}
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
  	 $("#empSource").val('');
   	 $("#empSource").trigger("chosen:updated");
  	 $("#roleUuid").val('');
   	 $("#roleUuid").trigger("chosen:updated");
   	 $("#agentBranchOrgUuid").val('');
   	 $("#agentBranchOrgUuid").trigger("chosen:updated");
   	 $("#registerDtStart").val(getFormatDateBefore(3));
   	 $("#registerDtEnd").val(getFormatDate());
}
function beforeSubmit(){
	var registerDtStart= $("#registerDtStart").val();
	var registerDtEnd= $("#registerDtEnd").val();
	if(registerDtStart== null || registerDtStart==''
			||registerDtEnd== null ||registerDtEnd== ''){
		alert("提交日期段不能为空");	
		return false;
	}
	if(DateDiff(registerDtStart, registerDtEnd)>92){
		alert("提交日期不能超过三个月");	
		return false;
	}
	var empNm= $("#empNm").val();
	var recommendEmpNm = $("#recommendEmpNm").val();
	
	var reg = /^[A-Za-z0-9\u4e00-\u9fa5·]*$/;
	var result = reg.test(empNm);
	if (empNm != null && empNm != '' && !result ) {
		alert("业务员姓名不能包含“·”以外的特殊符号");
		return false;
	}
	result = reg.test(recommendEmpNm);
	if (recommendEmpNm != null && recommendEmpNm != '' && !result ) {
		alert("推荐人姓名不能包含“·”以外的特殊符号");
		return false;
	}
}
function showEmpInfoDetail(empUuid){
	$.fancybox.open({
		href : "/empInfo/showEmpInfoDetail.do?empUuid=" + empUuid,
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

function DateDiff(sDate1, sDate2) {  //sDate1和sDate2是yyyy-MM-dd格式
	var aDate, oDate1, oDate2, iDays;
	aDate = sDate1.split("-");
	oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);  //转换为yyyy-MM-dd格式
	aDate = sDate2.split("-");
	oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
	iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24); //把相差的毫秒数转换为天数
	return iDays;  //返回相差天数
}

function getLen(obj){
	var char = obj.replace(/[^\x00-\xff]/g, '**');
    return char.length;
}