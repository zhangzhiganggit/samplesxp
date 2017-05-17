function changeStartDate(){
	var startDate=Number($("#startDate").val().replace(/-/g,''));
	var endDate=Number($("#endDate").val().replace(/-/g,''));
	if(endDate!=0){
		if(startDate>endDate){
			$("#endDate").val($("#startDate").val());
		}
	}
}
function changeEndDate(){
	var startDate=Number($("#startDate").val().replace(/-/g,''));
	var endDate=Number($("#endDate").val().replace(/-/g,''));
	if(startDate!=0){
		if(startDate>endDate){
			$("#startDate").val($("#endDate").val());
		}
	}
}

function resetMecForm(){
	$(':input','#searchForm')  
  	 .not(':button, :submit, :reset, :hidden')  
  	 .val('')  
  	 .removeAttr('checked')  
  	 .removeAttr('selected'); 
   	$("#orgNo").val('');
   	$("#orgNo").trigger("chosen:updated");
   	$("#mecNormalLevel").val('');
   	$("#mecNormalLevel").trigger("chosen:updated");
}

function operationFun(obj, obj1) {
	var url = "";
	if (obj == 'insert') {
		url = "/dRestrictTimes/dRestrictTimesAdd.do";
	} else if (obj == 'update') {
		url = "/dRestrictTimes/dRestrictTimesAdd.do?uuid=" + obj1;
	} else if (obj == 'log') {
		url = "/dRestrictTimes/seeOperLog.do?restrictUuid=" + obj1;
		w = 1100 * 1;
	}
	$.fancybox.open({
		href : url,
		type : 'iframe',
		padding : 5,
		scrolling : 'no',
		fitToView : true,
		autoWidth : true,
		height : 320,
		autoSize : false,
		closeClick : false
	});
}


function deleteDept(obj) {
	if (confirm("确认要删除？")) {
		$.ajax({
			type : 'post',
			url : "/dRestrictTimes/restrictDel",
			data : 'deptUuid=' + obj,
			async : false,
			success : function(data) {
				data = eval("(" + data + ")")
				if (data.message == 'ok') {
					alert('删除成功')
					location.reload();
				} else {
					alert(data.message)
				}
			},
			error : function() {
				alert('数据提交失败');
			}
		});
	}
}

