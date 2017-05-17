function changeAppraisalTimeStart(){
	var appraisalTimeStart=Number($("#appraisalTimeStart").val().replace(/-/g,''));
	var appraisalTimeEnd=Number($("#appraisalTimeEnd").val().replace(/-/g,''));
	if(appraisalTimeEnd!=0){
		if(appraisalTimeStart>appraisalTimeEnd){
			$("#appraisalTimeEnd").val($("#appraisalTimeStart").val())
		}
	}
}
function changeAppraisalTimeEnd(){
	var appraisalTimeStart=Number($("#appraisalTimeStart").val().replace(/-/g,''));
	var appraisalTimeEnd=Number($("#appraisalTimeEnd").val().replace(/-/g,''));
	if(appraisalTimeStart!=0){
		if(appraisalTimeStart>appraisalTimeEnd){
			$("#appraisalTimeStart").val($("#appraisalTimeEnd").val())
		}
	}
}

function resetMecForm(){
	$(':input','#searchForm')  
  	 .not(':button, :submit, :reset, :hidden')  
  	 .val('')  
  	 .removeAttr('checked')  
  	 .removeAttr('selected'); 
   	$("#branchOrgNo").val('');
   	$("#branchOrgNo").trigger("chosen:updated");
   	$("#topOrgNo").val('');
  	$("#topOrgNo").trigger("chosen:updated");
  	$("#opinionType").val('');
 	$("#opinionType").trigger("chosen:updated");
 	$("#isShow").val('');
	$("#isShow").trigger("chosen:updated");
}

function beforeSubmit(){
	return true;
}

function showDetail(id){
	var url = "/mAppraisal/showDetail.do?id=" + id;
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

function isShow(id,type){
	var branchOrgNo= $("#branchOrgNo").val();
	var topOrgNo = $("#topOrgNo").val();
	var opinionType= $("#opinionType").val();
	var appraisalTimeStart= $("#appraisalTimeStart").val();
	var appraisalTimeEnd= $("#appraisalTimeEnd").val();
	var isShow= $("#isShow").val();
	
	var str;
	if(type=='0'){
		str='确认关闭？'; 
	}else if(type=='1'){
		str='确认展示？'; 
	}
	if(confirm(str)){
		$.ajax({
			cache : true,
			type : "POST",
			url : '/mAppraisal/isShow.do',
			data : {
				id : id,
				isShow : type
			},
			async : false,
			success : function(data) {
				alert(data);
				if(data=='状态变更成功'){
					location.href="/mAppraisal/mAppraisalList.do?entry=1"
					+"&branchOrgNo="+branchOrgNo
					+"&topOrgNo="+topOrgNo
					+"&opinionType="+opinionType
					+"&appraisalTimeStart="+appraisalTimeStart
					+"&appraisalTimeEnd="+appraisalTimeEnd
					+"&isShow="+isShow
					;
				}
			}
		});
	}
}

function closeWin() {
	parent.$.fancybox.close();
}



