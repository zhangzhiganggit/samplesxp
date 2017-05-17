

    jQuery(function($) {
    	
    	$('.chosen-select').chosen({});
    	var proValue = $("#prov").val();
        fillProvSelect('mecProvCd',proValue);
        var cityValue = $("#city").val();
        fillCitySelect('mecProvCd','mecCityCd',cityValue); 
        
		$('#task-tab .dropdown-hover').on('mouseenter', function(e) {
              var offset = $(this).offset();

              var $w = $(window)
              if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                  $(this).addClass('dropup');
              else $(this).removeClass('dropup');
          });
		
		
		$("#ckAll").click(function(){
			
			$("input[name='selectedMno']").prop("checked",this.checked);
			
		});
		
		$("input[name='selectedMno']").click(function(){
			
			var items = $("input[name='selectedMno']");
			$("#ckAll").prop( "checked", items.length == items.filter(":checked").length ? true : false);
			
		});
		
		
		$('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        })
//show datepicker when clicking on the icon
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
//or change it into a date range picker
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
		
		
        
     })






    

// 数组去重方法，测试通过
Array.prototype.distinct = function() {
	var res = [];
	var json = {};
	for (var index = 0; index < this.length; ++index) {
		if (!json[this[index]]) {
			res.push(this[index]);
			json[this[index]] = 1;
		}
	}
	return res;
}
	
    
    

    function mecIfPosdetailShow(mno) {
    	
	$.fancybox.open({
		href : $("#contextPath").val() + '/mecIf/mecIfPosFuc?mno=' + mno,
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

	
	
	
	