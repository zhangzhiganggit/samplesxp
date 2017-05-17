function toThousands(num,isPoint) {
	var w = "";
	if(isPoint){
		w = num.split(".")[1];
		num = num.split(".")[0];
		if(w == undefined){
			w = "00";
		}
		if(w.length == 1){
			w = w+"0";
		}
	}else{
		num = num.split(".")[0];
	}
	num = num.replace(/\D/g,'').replace(/\b(0+)/gi,"");//去掉所有非数字的字符和开始的0
	num = (num || 0).toString(), result = '';
    while (num.length > 3) {
        result = ',' + num.slice(-3) + result;
        num = num.slice(0, num.length - 3);
    }
    if (num) { result = num + result; }
    if(isPoint){
    		result = result +"."+ w;
    		var result = result.substring(0,result.indexOf(".") + 3);
	}
    return result;
}
jQuery(function($) {
	var objValue = "";
	$('.numberFormatForText').each(function(){
		objValue = $(this).text();
		if(objValue != ""){
			if(objValue.substr(0, 1) == '-' ){
				$(this).text("-"+toThousands($(this).text(),false)) ;
			}else{
				$(this).text(toThousands($(this).text(),false)) ;
			}
		}
	});
	$('.numberPointFormatForText').each(function(){
		objValue = $(this).text();
		if(objValue != ""){
			if(objValue.substr(0, 1) == '-' ){
				$(this).text("-"+toThousands($(this).text(),true)) ;
			}else{
				$(this).text(toThousands($(this).text(),true)) ;
			}
		}
	});
	$('.numberFormat').each(function(){
		$(this).keyup(function(event){  
			objValue = $(this).val();
			if(objValue != ""){
				if(objValue.substr(0, 1) == '-' ){
					$(this).val("-"+toThousands(objValue,false)) ;
				}else{
					$(this).val(toThousands(objValue,false)) ;
				}
			}
		}); 
    });
	$('.numberFormat').each(function(){
		objValue = $(this).val();
		if(objValue != ""){
			if(objValue.substr(0, 1) == '-' ){
				$(this).val("-"+toThousands(objValue,false)) ;
			}else{
				$(this).val(toThousands(objValue,false)) ;
			}
		}
	});
	$('.numberPointFormat').each(function(){
		$(this).blur(function(event){
			objValue = $(this).val();
			if(objValue != ""){
				if(objValue.substr(0, 1) == '-' ){
					$(this).val("-"+toThousands(objValue,true)) ;
				}else{
					$(this).val(toThousands(objValue,true)) ;
				}
			}
		});
    });
	$('.numberPointFormat').each(function(){
		objValue = $(this).val();
		if(objValue != ""){
			if(objValue.substr(0, 1) == '-' ){
				$(this).val("-"+toThousands(objValue,true)) ;
			}else{
				$(this).val(toThousands(objValue,true)) ;
			}
		}
	});
	
	$('.hiddenMainInfo').each(function(){
		var child = $(this)[0];
		var span=document.createElement("span"); 
		var font=document.createElement("font");
	    span.innerHTML=child.innerHTML;
	    font.innerHTML=child.innerHTML;
	    if(child.innerHTML.length>7){
	    		font.innerHTML = 	child.innerHTML.replace(/(\d{3})\d{4}(\d{4})/, '$1****$2');
	    		child.innerHTML = "";
	    }
		span.style.display= "none";
	    child.appendChild(span);
	    child.appendChild(font);
	    $(this).click(function(){
	    		$(this).find("span").attr("style","display:inline");
	    		$(this).find("font").attr("style","display:none");
	    });
	});
	$('.hiddenIdCardInfo').each(function(){
		var child = $(this)[0];
		var span=document.createElement("span"); 
		var font=document.createElement("font");
	    span.innerHTML=child.innerHTML;
	    font.innerHTML=child.innerHTML; 
	    if(child.innerHTML.length>4){
	    		font.innerHTML = 	child.innerHTML.replace(/(\d{14})([a-zA-Z0-9]{4})/, '**************$2');
	    		child.innerHTML = "";
	    }
		span.style.display= "none";
	    child.appendChild(span);
	    child.appendChild(font);
	    $(this).click(function(){
	    		$(this).find("span").attr("style","display:inline");
	    		$(this).find("font").attr("style","display:none");
	    });
	});
})

/**
 * 获取当前时间
 * @returns {String}
 */
function getFormatDate(){
	var datetime=new Date();
	var year = datetime.getFullYear();
    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    return year+"-"+month+"-"+date;
}
/**
 * 获取当前时间-beforeMonth个月
 * @returns {String}
 */
function getFormatDateBefore(beforeMonth){
	var beforeMonth = parseInt(beforeMonth);
	var datetime=new Date();
	var year = datetime.getFullYear();
    var month = datetime.getMonth() + 1 -beforeMonth< 10 ? "0" + (datetime.getMonth() + 1 -beforeMonth) : datetime.getMonth() + 1-beforeMonth;
    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    if(month=='02' && parseInt(date)>=29){
    	month= '03'
    	date = '01';
    }else if((month=='04' || month=='06' || month=='09' || month=='11') && parseInt(date)>=30){
    	date = '30';
    }
    return year+"-"+month+"-"+date;
}

/**
 * 填充省下拉列表
 * @param provName
 * @param provValue
 */
function fillProvSelect(provName,provValue,isContainsEmptyOption){
	$.ajax({
        url: '/commonUtils/getProv.do',
        async:false,
        cache: true,
        success : function(provList) {
       	 	if(provList != null && provList !=undefined){
       	 		var options = '';
       	 		if(isContainsEmptyOption || isContainsEmptyOption == undefined || isContainsEmptyOption == null)
       	 			options = "<option value=''>请选择</option>";
	            for(var i=0;i<provList.length;i++){
	            	if(provValue != ''){
	            		if(provList[i].areaId == provValue){
	            			 options+="<option selected='selected' value=\""+provList[i].areaId+"\">"+provList[i].areaNm+"</option>";
	            		 }else{
	            			 options+="<option value=\""+provList[i].areaId+"\">"+provList[i].areaNm+"</option>";
	            		 }
	            	 }else{
	            		 options+="<option value=\""+provList[i].areaId+"\">"+provList[i].areaNm+"</option>";
	            	 }
	             }
	             $("[name='"+provName+"']").html(options);
	             $("[name='"+provName+"']").trigger("chosen:updated");
       	 	}
        }
	});
}
/**
 * 填充市下拉列表
 * @param provName
 * @param provValue
 */
function fillCitySelect(provName,cityName,cityValue,isContainsEmptyOption){
	var provCd = $("[name='"+provName+"']").val();
	if(provCd!=''){
		$.ajax({
	        url: '/commonUtils/getCityByProvCd.do',
	        data : {
				provCd : provCd
	        },
	        async:false,
	        cache: true,
	        success : function(cityList) {
	       	 	if(cityList != null && cityList !=undefined){
		       	 	var options = '';
		       	 	if(isContainsEmptyOption || isContainsEmptyOption == undefined || isContainsEmptyOption == null)
	       	 			options = "<option value=''>请选择</option>";
		             for(var i=0;i<cityList.length;i++){
		            	 if(cityValue != ''){
		            		 if(cityList[i].areaId == cityValue){
		            			 options+="<option selected='selected' value=\""+cityList[i].areaId+"\">"+cityList[i].areaNm+"</option>";
		            		 }else{
		            			 options+="<option value=\""+cityList[i].areaId+"\">"+cityList[i].areaNm+"</option>";
		            		 }
		            	 }else{
		            		 options+="<option value=\""+cityList[i].areaId+"\">"+cityList[i].areaNm+"</option>";
		            	 }
		             }
		             $("[name='"+cityName+"']").html(options);
		             $("[name='"+cityName+"']").trigger("chosen:updated");
	       	 	}
	        }
		});
	}else{
		$("[name='"+cityName+"']").html('');
		$("[name='"+cityName+"']").trigger("chosen:updated");
	}
}
/**
 * 填充区域下拉列表
 * @param provName
 * @param provValue
 */
function fillAreaSelect(cityName,areaName,areaValue,isContainsEmptyOption){
	var cityCd = $("[name='"+cityName+"']").val();
	if(cityCd!=''){
		$.ajax({
	        url: '/commonUtils/getAreaByCityCd.do',
	        data : {
	        	cityCd : cityCd
	        },
	        async:false,
	        cache: true,
	        success : function(areaList) {
	       	 	if(areaList != null && areaList !=undefined){
		       	 	var options = '';
		       	 	if(isContainsEmptyOption || isContainsEmptyOption == undefined || isContainsEmptyOption == null)
	       	 			options = "<option value=''>请选择</option>";
		             for(var i=0;i<areaList.length;i++){
		            	 if(areaValue != ''){
		            		 if(areaList[i].areaId == areaValue){
		            			 options+="<option selected='selected' value=\""+areaList[i].areaId+"\">"+areaList[i].areaNm+"</option>";
		            		 }else{
		            			 options+="<option value=\""+areaList[i].areaId+"\">"+areaList[i].areaNm+"</option>";
		            		 }
		            	 }else{
		            		 options+="<option value=\""+areaList[i].areaId+"\">"+areaList[i].areaNm+"</option>";
		            	 }
		             }
		             $("[name='"+areaName+"']").html(options);
		             $("[name='"+areaName+"']").trigger("chosen:updated");
	       	 	}
	        }
		});
	}else{
		$("[name='"+areaName+"']").html('');
		$("[name='"+cityName+"']").trigger("chosen:updated");
	}
}
/**
 * 省市区域级联效果
 * @param isGetProv 是否需要获取省信息
 * @param provName 省Name 指定需要填充的省
 * @param cityName 市Name 指定需要填充的市
 * @param areaName 区Name 指定需要填充的区
 * @param provValue 省Value 指定需要选中的省
 * @param cityValue 市Value 指定需要选中的市
 * @param areaValue 区域/县Value 指定需要选中的区
 */
function areaCascade(isGetProv,provName,cityName,areaName,provValue,cityValue,areaValue,isContainsEmptyOption){
	if(isGetProv){
		fillProvSelect(provName,provValue,isContainsEmptyOption);
	}
	if(provName != '' && cityName!=''){
		fillCitySelect(provName,cityName,cityValue,isContainsEmptyOption);
	}
	if(provName != '' && cityName!='' && areaName != ''){
		fillAreaSelect(cityName,areaName,areaValue,isContainsEmptyOption);
	}
}
/**
 * 填充POS型号下拉框，注意：option的value和html为同样的值
 * @param provName
 * @param provValue
 */
function fillPosModelByCommMode(commModeId,posModelId,posModelValue){
	var commMode = $("#"+commModeId).val();
	//先清空
	$("#"+posModelId).html('');
	if(commMode!=''){
		$.ajax({
	        url: '/commonUtils/getPosModelByPosCommMode.do',
	        data : {
	        	commMode : commMode
	        },
	        async:false,
	        cache: true,
	        success : function(posModelList) {
	       	 	if(posModelList != null && posModelList !=undefined){
	       	 		var options = "<option value=''></option>";
		             for(var i=0;i<posModelList.length;i++){
		            	 if(posModelValue != ''){
		            		 if(posModelList[i] == posModelValue){
		            			 options+="<option selected='selected' value=\""+posModelList[i]+"\">"+posModelList[i]+"</option>";
		            		 }else{
		            			 options+="<option value=\""+posModelList[i]+"\">"+posModelList[i]+"</option>";
		            		 }
		            	 }else{
		            		 options+="<option value=\""+posModelList[i]+"\">"+posModelList[i]+"</option>";
		            	 }
		             }
		             $("#"+posModelId).html(options);
		             $("#"+posModelId).trigger("chosen:updated");
	       	 	}
	        }
		});
	}else{
		$("#"+posModelId).html('');
	}
}
/**
 * 根据省编号获取省名称
 * @param provCd
 * @returns {String}
 */
function getProvNameByProvCd(provCd){
	var provName = '';
	$.ajax({
        url: '/commonUtils/getProvNameByProvCd.do',
        data:{
        	provCd:provCd
        },
        async:false,
        cache: true,
        success : function(area) {
       	 	if(area != null && area !=undefined){
       	 		provName = area.areaNm;
       	 	}
        }
	});
	return provName;
}
/**
 * 根据市编号获取市名称
 * @param cityCd
 * @returns {String}
 */
function getCityNameByCityCd(cityCd){
	var cityName = '';
	$.ajax({
        url: '/commonUtils/getCityNameByCityCd.do',
        data:{
        	cityCd:cityCd
        },
        async:false,
        cache: true,
        success : function(area) {
       	 	if(area != null && area !=undefined){
       	 		cityName = area.areaNm;
       	 	}
        }
	});
	return cityName;
}
/**
 * 根据区编号获取市名称
 * @param townCd
 * @returns {String}
 */
function getTownNameByTownCd(townCd){
	var townName = '';
	$.ajax({
        url: '/commonUtils/getTownNameByTownCd.do',
        data:{
        	townCd:townCd
        },
        async:false,
        cache: true,
        success : function(area) {
       	 	if(area != null && area !=undefined){
       	 		townName = area.areaNm;
       	 	}
        }
	});
	return townName;
}
//指定form进行验证
function validateFormByFormId(formId){
	$("#"+formId).data('formValidation').validate();
}
//指定fieldName进行重新验证
function revalidateFieldByFieldName(formId,fieldName){
	$("#"+formId).data('formValidation').revalidateField(fieldName);
}
//为指定form的控件添加非空验证
function setNotEmptyValidate(formId,notEmptyInputName,notEmptyMessage){
	$('#'+formId).formValidation('addField', notEmptyInputName, {
		validators: {
            notEmpty: {
            	message:notEmptyMessage
            }
        }
	});
}
//删除formValidation验证
function removeValidate(formId,notEmptyInputName){
	$('#'+formId).formValidation('removeField', notEmptyInputName);
}

function validateInt(obj){  
	var flag=false;
    var reg = new RegExp("^[0-9]*$");   
    if(reg.test(obj)){  
     flag=true;
    } 
    return flag;
}

function validateFloat(obj){
	var val=obj;
    var reg = new RegExp("^[0-9]+(\.[0-9]+)?$");   
    if(reg.test(obj)){  
      val=parseFloat(obj);
    }
    return val;
}
//设置text为参数的option被选中
function setOptionSelectedByText(selectId,text){
	$('#'+selectId+' option').each(function(){
	    if( $(this).text() == text){
	         $(this).attr('selected','selected');
	     }
	});
}

function goback(procDefId){
	if(procDefId=='mercIncome' || procDefId=='mercInfoUpdate'){
		history.go(-1);
	}else{
		window.location.href = "/task/list.do?";
	}
}

function goback2TaskEndList(procDefId){
	if(procDefId=='mercIncome' || procDefId=='mercInfoUpdate'){
		history.go(-1);
	}else{
		window.location.href = "/task/list.do?";
	}
}
