

    function mecIfPosdetailShow(mno) {
    	
	$.fancybox.open({
		href : $("#contextPath").val() + '/task/mecIfPosFuc?mno=' + mno,
		type : 'iframe',
		padding : 5,
		scrolling : 'no',
		fitToView : true,
		width : 900,
		height : 370,
		autoSize : false,
		closeClick : false,
		afterClose : function() {
		}
	});

}
    

    function mecIfPosOprLogShow(mno) {
	$.fancybox
			.open({
				href : $("#contextPath").val() + '/mecIf/mecIfPosOprLog?mno='
						+ mno,
				type : 'iframe',
				padding : 5,
				scrolling : 'no',
				fitToView : true,
				width : 900,
				height : 400,
				autoSize : true,
				closeClick : false,
				afterClose : function() {
				}
			});

}
	
    
    
    
    
    
    
    
	
	
	function switchFuc(optTyp) {
		
	var flag = false;
	var selectItems = $("input[name='selectedMno']:checkbox:checked");
	var mnoArray = [];
	selectItems.each(function() {
		var datarow = $(this).parents("tr");
		var mno = datarow.find("[name='mno']").text();
		mnoArray.push( '\'' + mno + '\''  );
		flag = true;
	});
	

	mnoArray = mnoArray.distinct();
	if (flag) {
	} else {
		alert("至少要选择一个商户");
		return;
	}

	$.fancybox.open({
		href : $("#contextPath").val() + '/mecIf/mecIfPosOpr?mnos='
				+ mnoArray + "&posAttrStatus=" + optTyp,
		type : 'iframe',
		padding : 5,
		scrolling : 'no',
		fitToView : true,
		width : 900,
		height : 400,
		autoSize : true,
		closeClick : false,
		afterClose : function() {
		}
	});

}//function switchFuc end 
	
	
	

	function switchFucWithExcel(optTyp) {
	$.fancybox.open({
		href : $("#contextPath").val() + '/mecIf/mecIfPosOprWithExcel?'+
		 "posAttrStatus=" + optTyp,
		type : 'iframe',
		padding : 5,
		scrolling : 'no',
		fitToView : true,
		width : 900,
		height : 400,
		autoSize : true,
		closeClick : false,
		afterClose : function() {
		}
	});

}//function switchFucWithExcel end 
	

function downloadTemplate(){
	
	$("#searchForm").attr("action",$("#contextPath").val() +"/mecIf/downloadTemplate");
	document.getElementById("searchForm").submit();
	$("#searchForm").attr("action",$("#contextPath").val() +"/mecIf/mecIfPosMgrQuery");
}

	
	
	
	