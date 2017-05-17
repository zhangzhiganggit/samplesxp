function resetMecForm(){
   	 $(':input','#searchForm')  
   	 .not(':button, :submit, :reset, :hidden')  
   	 .val('')  
   	 .removeAttr('checked')  
   	 .removeAttr('selected'); 
   	 $("#orgNo").val('');
	 $("#orgNo").trigger("chosen:updated");
	 $("#excepTyp").val('');
	 $("#excepTyp").trigger("chosen:updated");
	 $("#mecNormalLevel").val('');
	 $("#mecNormalLevel").trigger("chosen:updated");
    }

function operationFun(obj, obj1) {
	var h = 320 * 1;
	var w = 800 * 1;
	var url = "";
	if (obj == 'insert') {
		url = "/dRestrictException/dRestrictExceptionAdd.do";
	} else if (obj == 'update') {
		url = "/dRestrictException/dRestrictExceptionAdd.do?uuid=" + obj1;
	} else if (obj == 'batchInsert') {
		url = "/dRestrictException/batchAddView.do";
		h = 500 * 1;
	} else if (obj == 'log') {
		url = "/dRestrictException/seeOperLog.do?uuid=" + obj1;
		w = 1100 * 1;
	}
	$.fancybox.open({
		href : url,
		type : 'iframe',
		padding : 5,
		scrolling : 'no',
		fitToView : true,
		autoWidth : true,
		height : h,
		width : w,
		autoSize : false,
		closeClick : false,
		afterClose : function() {
		}
	});
}


function refreshThisWin(){
	document.getElementById("searchForm").submit();
}

function downLoad(){
	document.getElementById("downLoadForm").submit();
}

function ignoreSpaces(string) {
	var temp = "";
	string = '' + string;
	splitstring = string.split(" ");
	for(i = 0; i < splitstring.length; i++)
		temp += splitstring[i];
		return temp;
} 