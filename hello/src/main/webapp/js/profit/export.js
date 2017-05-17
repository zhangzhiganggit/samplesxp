
function valiDt(){
	var dayLength =31*1;
	var endDateValue = $("[name='dateEnd']").val();
	var startDateValue = $("[name='dateStart']").val();
	if(endDateValue==''||startDateValue==''){
		validateFormByFormId("searchForm");
		return false;
	}else{
		var b = endDateValue.split("-");
  	    var c = startDateValue.split("-");
  	    var endTime = new Date(b[0], b[1]-1, b[2], "00", "00", "00");
  	    var startTime=new Date(c[0], c[1]-1, c[2], "00", "00", "00");
  	    var dt = (endTime-startTime)/(1000*60*60*24);
  	    if(dt>(dayLength-1)){
  	    	validateFormByFormId("searchForm");
  			return false;
  	    }
  	    return true;
	}
 }
