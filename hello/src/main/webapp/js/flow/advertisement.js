function checkSelect() {

	var cprRegNmCn = $("#adverName").val().trim();
	if(getLen(cprRegNmCn)>32){
		alert("广告名称最长为32位中文字符！");
		$("#adverName").select();
		return false;
	}
	

	return true;
}

function resetMecForm(){
	$(':input','#searchForm')  
  	 .not(':button, :submit, :reset, :hidden')  
  	 .val('')  
  	 .removeAttr('checked')  
  	 .removeAttr('selected'); 
   	 $("#adverName").val('');
	 $("#adverStatus").val('');
   	 $("#adverStatus").trigger("chosen:updated");
   	
}


function advertisementView(uuid) {
	var url = "/flow/advertisementView.do?uuid="+uuid;
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

function advertisementEdit(uuid) {
	location.href = "/flow/advertisementEdit.do?uuid="+uuid;
	
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

function getLen(obj){
	var char = obj.replace(/[^\x00-\xff]/g, '**');
    return char.length;
}