//打开委托页面
function toEntrustTask(taskId,procDefKey,returnUrl,orderNo){
	var href='';
	if(procDefKey=='mercIncome' || procDefKey=='mercInfoUpdate'){
		href = '/taskEntrust/entrustTaskEdit2.do?procDefKey='+procDefKey+'&taskId='+taskId+'&returnUrl='+encodeURIComponent(returnUrl)+'&orderNo='+orderNo;
	}else{
		href = '/taskEntrust/entrustTaskEdit.do?procDefKey='+procDefKey+'&taskId='+taskId+'&returnUrl='+encodeURIComponent(returnUrl)+'&orderNo='+orderNo;
	}
	var width = $(window).width() * 0.9;
	var height = $(window).height() * 0.9;
	$.fancybox.open({
		href : href,
		type: 'iframe',
        padding: 5,
        scrolling: 'no',
        fitToView: true,
        width: width,
        height: height,
        autoSize: false,
        closeClick: false,
        afterClose:function(){
			//history.go(0);
		}
	});
}

//function fill
//清空检索条件功能
function resetMecForm(){
	 var pbCheck=$("#pbCheck").val();
	 $(':input','#searchForm')  
	 .not(':button, :submit, :reset, :hidden')  
	 .val('')  
	 .removeAttr('checked')  
	 .removeAttr('selected'); 
	 
	 $("#procDefId option:first").prop("selected", 'selected');
	 $("#procDefId").trigger("chosen:updated");
	 $("#taskSts").val('1');
	 $("#taskSts").trigger("chosen:updated");
	 $("#branchOrgUuid").val('');
	 $("#branchOrgUuid").trigger("chosen:updated");
	 $("#starterAttrOrgNo").val('');
	 $("#starterAttrOrgNo").trigger("chosen:updated");
	 $("#agentLevel").val('');
	 $("#agentLevel").trigger("chosen:updated");
	 $("#jinjianTyp").val('');
	 $("#jinjianTyp").trigger("chosen:updated");
	 $("#dataSource").val('');
	 $("#dataSource").trigger("chosen:updated");
	 $("#agentRegionProv").val('');
	 $("#agentRegionProv").trigger("chosen:updated");
	 $("#agentRegionProv").trigger("change");
	 $("#jinjianTyp").val('').trigger("chosen:updated").trigger("change");
	 $("#dataSource").val('').trigger("chosen:updated").trigger("change");
	 $("#pbCheck").val(pbCheck);
	 if(pbCheck=='true'){
		 $("#dataSource").val('3');
		 $("#jinjianTyp").val('1');
	 }

}