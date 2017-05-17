function changeLaunchDateStart(){
	var launchDateStart=Number($("#launchDateStart").val().replace(/-/g,''));
	var launchDateEnd=Number($("#launchDateEnd").val().replace(/-/g,''));
	if(launchDateEnd!=0){
		if(launchDateStart>launchDateEnd){
			$("#launchDateEnd").val($("#launchDateStart").val())
		}
	}
}
function changeLaunchDateEnd(){
	var launchDateStart=Number($("#launchDateStart").val().replace(/-/g,''));
	var launchDateEnd=Number($("#launchDateEnd").val().replace(/-/g,''));
	if(launchDateStart!=0){
		if(launchDateStart>launchDateEnd){
			$("#dtCteStart").val($("#launchDateEnd").val())
		}
	}
}

function beforeSubmit(){
	var merchantCode = $("#merchantCode").val().trim();
	var strExp= /^\d{15}$/;
	if(merchantCode != null && merchantCode != '' && !strExp.test(merchantCode)){
		alert("商户编号为15位数字");
		return false;
	}
	
	var promoterOrgNm= $("#promoterOrgNm").val().trim();
	if(getLen(promoterOrgNm)>60){
		alert("发起人机构不能超过60个字符");
		return false;
	}
	return true;
	
	
}


function showDetail(flowNo,orderNo) {
	var url = "/autonomouslyRectification/autonomouslyRectificationDetail.do?flowNo=" + flowNo + "&orderNo=" + orderNo;
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
function showAuth(flowNo,orderNo) {
	var url = "/autonomouslyRectification/toAutonomouslyRectificationAuth.do?flowNo=" + flowNo + "&orderNo=" + orderNo;
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
function beforeAuthentication(){
	var i=0
	$("input[name='isAgree']").each(function() {
		if ($(this).prop("checked")) {
			i++;
		}
	});
	if(i==0){
		alert("请选择审核是否通过");
		return;
	}
	var suggestion= $("#suggestion").val().trim();
	if(suggestion==null || suggestion==''){
		alert("请填写具体意见");
		return;
	}
	if(getLen(suggestion)>200){
		alert("具体意见不能超过200个字节");
		return;
	}
	$.ajax({
		cache : true,
		type : "POST",
		url : '/autonomouslyRectification/autonomouslyRectificationAuth.do',
		data : $('#searchForm').serialize(),//  你的formid
		async : false,
		success : function(data) {
			alert(data);
			if(data=='审核成功'){
				parent.location.href="/autonomouslyRectification/autonomouslyRectificationList.do?entry=1";
			}
		}
	});
}
function closeWin() {
	parent.$.fancybox.close();
}

function getLen(obj){
	var char = obj.replace(/[^\x00-\xff]/g, '**');
    return char.length;
}
