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
	 $("#areaProv").val('');
  	 $("#areaProv").trigger("chosen:updated");
  	 $("#areaCity").val('');
  	 $("#areaCity").trigger("chosen:updated");
  	 $("#areaCoun").val('');
  	 $("#areaCoun").trigger("chosen:updated");
  	 $("#isTransfer").val('');
 	 $("#isTransfer").trigger("chosen:updated");
  	 $("#authenticationStatus").val('');
   	 $("#authenticationStatus").trigger("chosen:updated");
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
}
function checkAll(){
	if($("#allBox").prop("checked")){
		$('input[type=checkbox]').each(function(){
			$(this).prop('checked',true);
		});
	}else{
		$('input[type=checkbox]').each(function(){
			$(this).prop('checked',false);
		});
	}
}
function toTransfer(){
	var uuids= '';
	$('input[type=checkbox]').each(function(){
		if($(this).prop('checked') && $(this).val() != ''){
			uuids += $(this).val()+";";
		}
	});
	if(uuids==''){
		alert('请至少选择一条记录');
		return;
	}
	$.fancybox.open({
		href : "/sspEmpRegister/toTransfer?uuids=" + uuids,
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
function closeWin() {
	parent.$.fancybox.close();
}
function transfer(areaProv){
	var uuids= $("#uuids").val();
	var orgUuid= $("#orgUuid").val();
	var orgNm= $("#orgNm").val();
	if(orgUuid== null || orgUuid==''){
		alert("所属机构不能为空");
		return;
	}
	$.ajax({
		cache : true,
		type : "POST",
		url : '/sspEmpRegister/transfer',
		data : {
			uuids : uuids,
			orgUuid : orgUuid,
			orgNm : orgNm,
			areaProv : areaProv
		},
		async : false,
		success : function(data) {
			alert(data);
			if(data=='划拔成功'){
				parent.location.reload();
			}
		}
	});
}
function showSspEmpRegisterLog(uuid){
	$.fancybox.open({
		href : "/sspEmpRegister/showSspEmpRegisterLog?uuid=" + uuid,
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
function showMbNo(index){
	$("#mbNo"+index).show();
	$("#mbNoStr"+index).hide();
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