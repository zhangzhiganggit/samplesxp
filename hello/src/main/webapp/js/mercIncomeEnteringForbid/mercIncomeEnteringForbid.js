function showDetail(taskCode){
	$.fancybox.open({
		href : '/mercIncomeEnteringForbid/mercIncomeEnteringForbidDetail.do?taskCode='+taskCode,
		type : 'iframe',
		padding : 5,
		scrolling : 'no',
		fitToView : true,
		width : 1200,
		height : 800,
		autoSize : false,
		closeClick : false,
		afterClose : function() {
		}
	});
}