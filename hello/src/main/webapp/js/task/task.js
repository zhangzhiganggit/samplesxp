$(function(){
	$("a[href='collapseOne']").attr("class","accordion-toggle width-80 inline");
	$("a[href='collapseOne']").attr("aria-expanded",true);
	$("#collapseOne").attr("class","panel-collapse collapse in");
	$("#collapseOne").attr("aria-expanded",true);
})


/**
 * 填充省下拉列表
 * @param provName
 * @param provValue
 */
function fillProvSelect(provName,provValue){
	$.ajax({
        url: '/commonUtils/getProv.do',
        async:false,
        cache: true,
        success : function(provList) {
       	 	if(provList != null && provList !=undefined){
	       		 var options = "<option value=''>请选择</option>";
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
function fillCitySelect(provName,cityName,cityValue){
	var provCd = $("[name='"+provName+"']").val();
	if(provCd!=''){
		$.ajax({
	        url: '/commonUtils/getCityByProvCd.do',
	        data : {
				provCd : provCd
	        },
	        async:true,
	        cache: true,
	        success : function(cityList) {
	       	 	if(cityList != null && cityList !=undefined){
		       		 var options = "";
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
function fillStarterAttrOrgSelect(inputName,attrOrgNo){
	$.ajax({
        url: '/commonUtils/getNormalOrgList.do',
        async:true,
        cache: true,
        success : function(orgList) {
       	 	if(orgList != null && orgList !=undefined){
	       		 var options = "<option value=''>请选择</option>";
	             for(var i=0;i<orgList.length;i++){
	            	 if(attrOrgNo != ''){
	            		 if(orgList[i].ORG_UUID == attrOrgNo){
	            			 options+="<option selected='selected' value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
	            		 }else{
	            			 options+="<option value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
	            		 }
	            	 }else{
	            		 options+="<option value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
	            	 }
	             }
	             $("[name='"+inputName+"']").html(options);
	             $("[name='"+inputName+"']").trigger("chosen:updated");
       	 	}
        }
	});
}

function getOwnedOrgList(inputName,attrOrgNo,orgUuid){
	$.ajax({
        url: '/commonUtils/getOwnedOrgList',
        async:true,
        cache: true,
        data:{'orgUuid':orgUuid},
        success : function(orgList) {
       	 	if(orgList != null && orgList !=undefined){ 
	       		 var options = "<option value=''>请选择</option>";
	             for(var i=0;i<orgList.length;i++){
	            	 if(attrOrgNo != ''){
	            		 if(orgList[i].ORG_UUID == attrOrgNo){
	            			 options+="<option selected='selected' value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
	            		 }else{
	            			 options+="<option value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
	            		 }
	            	 }else{
	            		 options+="<option value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
	            	 }
	             }
	             $("[name='"+inputName+"']").html(options);
	             $("[name='"+inputName+"']").trigger("chosen:updated");
       	 	}
        }
	});
}

function getBranchOrgList(){
	var branchOrgUuid = $("#hidenOrgNo").val();
	$.ajax({
        url: '/commonUtils/getBranchOrgList',
        async:true,
        cache: true,
        success : function(orgList) {
       	 	if(orgList != null && orgList !=undefined){
	       		 var options = "<option value=''>请选择</option>";
	             for(var i=0;i<orgList.length;i++){
	            	 if(orgList[i].ORG_UUID == branchOrgUuid){
            			 options+="<option selected='selected' value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
            		 }else{
            			 options+="<option value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
            		 }
            		 //options+="<option value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
	             }
	             $("[name=branchOrgUuid").html(options);
	             $("[name=branchOrgUuid").trigger("chosen:updated");
       	 	}
        }
	});
}

function getBranchOrgOrderByNameList(){
	var branchOrgUuid = $("#hidenOrgNo").val();
	$.ajax({
        url: '/commonUtils/findAllBranchOrg',
        async:true,
        cache: true,
        success : function(orgList) {
       	 	if(orgList != null && orgList !=undefined){
	       		 var options = "<option value=''>请选择</option>";
	             for(var i=0;i<orgList.length;i++){
	            	 if(orgList[i].ORG_UUID == branchOrgUuid){
            			 options+="<option selected='selected' value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
            		 }else{
            			 options+="<option value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
            		 }
            		 //options+="<option value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
	             }
	             $("[name=branchOrgUuid").html(options);
	             $("[name=branchOrgUuid").trigger("chosen:updated");
       	 	}
        }
	});
}

function changeBranchUuid(){
	var branchOrgUuid = $("#hidenOrgNo").val();
	if(branchOrgUuid==null || branchOrgUuid==''||branchOrgUuid==undefined){
		 branchOrgUuid = $("[name=branchOrgUuid]").val();
	}
	var starterAttrOrgNo = $("#hidenAttrOrgNo").val();
	getOwnedOrgList('starterAttrOrgNo',starterAttrOrgNo,branchOrgUuid);
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


//弹出禁审页面
function openForbidAudit(orderNo,isForbid,procDefId) {
	$.fancybox.open({
		href : '/forbidAudit/addView2.do?orderNo='+orderNo+"&isForbid="+isForbid+"&procDefId="+procDefId,
		type : 'iframe',
		padding : 5,
		scrolling : 'no',
		fitToView : true,
		width : 900,
		height : 400,
		autoSize : false,
		closeClick : false,
		afterClose : function() {
			location.reload();
		}
	});
}

//禁审解禁操作记录
function operationRecord(orderNo,attrBution,orgNo,orgNm,isForbid){
	var attrBution1=encodeURI(encodeURI(attrBution));
	var orgNm1=encodeURI(encodeURI(orgNm));
	$.fancybox.open({
		href : '/forbidAudit/operationRecord.do?orderNo='+orderNo
										 +"&attrBution="+attrBution1
										 +"&orgNo="+orgNo
										 +"&orgNm="+orgNm1
										 +"&isForbid="+isForbid,
		type : 'iframe',
		padding : 5,
		scrolling : 'no',
		fitToView : true,
		width : 900,
		height : 400,
		autoSize : false,
		closeClick : false,
		afterClose : function() {
		}
	});
}

//批量禁审
function batchForbidAudit(operatedTyp,orderTyp,uuid,orgNo,orgNm){
	debugger
	var orgNm1=encodeURI(encodeURI(orgNm));
	$.fancybox.open({
		href : '/sspForbidAuditRule/batchSspForbidAuditRule.do'
			+'?operatedTyp='+operatedTyp
			+"&orderTyp="+orderTyp
			+"&uuid="+uuid
			+"&orgNo="+orgNo
			+"&orgNm="+orgNm1,
		type : 'iframe',
		padding : 5,
		scrolling : 'no',
		fitToView : true,
		width : 800,
		height : 400,
		autoSize : false,
		closeClick : false,
		afterClose : function() {
			location.reload();
		}
	});
}



function fillCandidateTask(){
	console.log("fillCandidateTask is call..");
	
	var sendTarget = $(event.target);
	var funcName = sendTarget.attr("onclick");
	/* if(!$("#collapseOne").is(":hidden")){
		return;
	} */
	$('#candidateTask').html('');
	//获取代办任务列表
	$.ajax({
		url: 'task/queryCandidateTaskCountGroupByProcType.do',
      	async:true,
      	cache: false,
      	beforeSend:function(){
      		sendTarget.attr("onclick","");
      	},
      	success : function(data) {
      		sendTarget.attr("onclick",funcName);
      		if(data.indexOf('您无权访问') != -1)
      			return;
      		
     	 	if(data != null && data != undefined && data.length > 0){
     	 		for(var i = 0;i<data.length;i++){
     	 			$('#candidateTask').append("<div class=\"message-item hover\"><div id=\"candidateTaskItemDiv"+i+"\" title=\""+data[i].procDefName+"\" class=\"col-sm-8\">"
     	 					+"<a id=\"candidateTask"+i+"\" href=\"/task/list.do?procDefId="+data[i].procDefId+"&taskSts=1&isFirstLoad=true\">"+data[i].procDefName+"</a>"
     	 				+"</div><span class=\"time\"><a id=\"candidateTaskA"+i+"\" href=\"/task/list.do?procDefId="+data[i].procDefId+"&taskSts=1&isFirstLoad=true\">"+data[i].taskCnt+"</a></span></div>");
     	 		}
     	 		$("#candidateTask a").click(function(){
     	 			var a = this;
	      	      	var b ;
	      	      
	      	      	$($("#mainTab a").each(function(){
	      	          	if($(this).html().indexOf($(a).html()) >=0 ) b = this ;
	      	      	}));
	      	      
	      	      	if(b) {
	      	    		$(b).click();
	      	    	  	return false ;
	      	      	}
	      	      	var aId = $(this).attr('id');
	      	      	var index = aId.substr(aId.strLen()-1);
	      	      	var tabName = $('#'+('candidateTaskItemDiv'+index)+' > a:first-child').html()+'处理';
	      	      	var li = $('<li > <a href="#tab'+$("#mainTab li").length+'" data-toggle="tab" aria-expanded="false">'+
	      	      		tabName+'<i class="ace-icon fa fa-times close " style="cursor:pointer"></i></a></li>');
	      	      	$("#mainTab").append(li);

	      	      	if($("#mainTab").height() != 34 && $("#mainTab").height() != 37){
	      	        	li.remove();
	      	        	return false;
	      	      	}

	      	      	var html = $('<div class="tab-pane  no-padding" id="tab'+($("#mainTab li").length-1) +'"><iframe  class="col-sm-12 no-border no-padding" src=""></iframe> </div>');
	      	      	html.find("iframe").height($(window).height() *0.8);
	      	      	$("#myTabContent").append(html);
	      	      	html.find("iframe").attr("src",this.href);
	      	      	li.find(".close").click(function(){
	      	        	li.remove();
	      	        	html.remove();
	      	        	$($("#mainTab a")[$("#mainTab li").length -1]).click();
	      	    	});
	      	      	$($("#mainTab a")[$("#mainTab li").length -1]).click();
	      	      	return false ;
     	 		});
     	 	}
      	},
      	error: function(XMLHttpRequest, textStatus, errorThrown){
      		sendTarget.attr("onclick",funcName);
      	}
  	});
}
function fillAssigneeTask(){
	console.log("fillAssigneeTask is call..");
	var sendTarget = $(event.target);
	var funcName = sendTarget.attr("onclick");
	
	if($('#assigneeTask a').length > 0){
		return;
	}
	$('#assigneeTask').html('');
	//获取办理中任务列表
	$.ajax({
		url: 'task/queryAssigneeTaskCountGroupByProcType.do',
      	async:true,
      	cache: false,
      	beforeSend:function(){
      		sendTarget.attr("onclick","");
      	},
      	success : function(data) {
      		sendTarget.attr("onclick",funcName);
      		if(data.indexOf('您无权访问') != -1)
      			return;
     	 	if(data != null && data != undefined && data.length > 0){
     	 		for(var i = 0;i<data.length;i++){
     	 			$('#assigneeTask').append("<div class=\"message-item\"><div id=\"assigneeTaskItemDiv"+i+"\" title=\""+data[i].procDefName+"\" class=\"col-sm-8\">"
     	 					+"<a id=\"assigneeTask"+i+"\" href=\"/task/list.do?procDefId="+data[i].procDefId+"&taskSts=2&isFirstLoad=true\">"+data[i].procDefName+"</a>"
     	 				+"</div><span class=\"time\"><a id=\"assigneeTaskA"+i+"\" href=\"/task/list.do?procDefId="+data[i].procDefId+"&taskSts=2&isFirstLoad=true\">"+data[i].taskCnt+"</a></span></div>");
     	 		}
     	 		$("#assigneeTask a").click(function(){
     	 			var a = this;
	      	      	var b ;
	      	      
	      	      	$($("#mainTab a").each(function(){
	      	          	if($(this).html().indexOf($(a).html()) >=0 ) b = this ;
	      	      	}));
	      	      
	      	      	if(b) {
	      	    		$(b).click();
	      	    	  	return false ;
	      	      	}
	      	      	var aId = $(this).attr('id');
	      	      	var index = aId.substr(aId.strLen()-1);
	      	      	var tabName = $('#'+('assigneeTaskItemDiv'+index)+' > a:first-child').html()+'处理';
	      	      	var li = $('<li > <a href="#tab'+$("#mainTab li").length+'" data-toggle="tab" aria-expanded="false">'+
	      	      		tabName+'<i class="ace-icon fa fa-times close " style="cursor:pointer"></i></a></li>');
	      	      	$("#mainTab").append(li);

	      	      	if($("#mainTab").height() != 34 && $("#mainTab").height() != 37){
	      	        	li.remove();
	      	        	return false;
	      	      	}

	      	      	var html = $('<div class="tab-pane  no-padding" id="tab'+($("#mainTab li").length-1) +'"><iframe  class="col-sm-12 no-border no-padding" src=""></iframe> </div>');
	      	      	html.find("iframe").height($(window).height() *0.8);
	      	      	$("#myTabContent").append(html);
	      	      	html.find("iframe").attr("src",this.href);
	      	      	li.find(".close").click(function(){
	      	        	li.remove();
	      	        	html.remove();
	      	        	$($("#mainTab a")[$("#mainTab li").length -1]).click();
	      	    	});
	      	      	$($("#mainTab a")[$("#mainTab li").length -1]).click();
	      	      	return false ;
     	 		});
     	 	}
      	},
      	error: function(XMLHttpRequest, textStatus, errorThrown){
      		sendTarget.attr("onclick",funcName);
      	}
  	});
}
function fillCompleteTask(){
	console.log("fillCompleteTask is call..");
	var sendTarget = $(event.target);
	var funcName = sendTarget.attr("onclick");
	
	if($('#ownCompleteTask a').length > 0){
		return;
	}
	$('#ownCompleteTask').html('');
	//获取已完成任务列表
	$.ajax({
		url: 'task/queryOwnCompleteTaskCountGroupByProcType.do',
      	async:true,
      	cache: false,
      	beforeSend:function(){
      		sendTarget.attr("onclick","");
      	},
      	success : function(data) {
      		sendTarget.attr("onclick",funcName);
      		if(data.indexOf('您无权访问') != -1)
      			return;
     	 	if(data != null && data != undefined && data.length > 0){
     	 		for(var i = 0;i<data.length;i++){
     	 			$('#ownCompleteTask').append("<div class=\"message-item\"><div id=\"ownCompleteTaskItemDiv"+i+"\" title=\""+data[i].procDefName+"\" class=\"col-sm-8\">"
     	 					+"<a id=\"ownCompleteTask"+i+"\" href=\"/task/list.do?procDefId="+data[i].procDefId+"&taskSts=3&isFirstLoad=true\">"+data[i].procDefName+"</a>"
     	 				+"</div><span class=\"time\"><a id=\"ownCompleteTaskA"+i+"\" href=\"/task/list.do?procDefId="+data[i].procDefId+"&taskSts=3&isFirstLoad=true\">"+data[i].taskCnt+"</a></span></div>");
     	 		}
     	 		$("#ownCompleteTask a").click(function(){
     	 			var a = this;
	      	      	var b ;
	      	      
	      	      	$($("#mainTab a").each(function(){
	      	          	if($(this).html().indexOf($(a).html()) >=0 ) b = this ;
	      	      	}));
	      	      
	      	      	if(b) {
	      	    		$(b).click();
	      	    	  	return false ;
	      	      	}
	      	      	var aId = $(this).attr('id');
	      	      	var index = aId.substr(aId.strLen()-1);
	      	      	var tabName = $('#'+('ownCompleteTaskItemDiv'+index)+' > a:first-child').html()+'进度查询';
	      	      	var li = $('<li > <a href="#tab'+$("#mainTab li").length+'" data-toggle="tab" aria-expanded="false">'+
	      	      		tabName+'<i class="ace-icon fa fa-times close " style="cursor:pointer"></i></a></li>');
	      	      	$("#mainTab").append(li);

	      	      	if($("#mainTab").height() != 34 && $("#mainTab").height() != 37){
	      	        	li.remove();
	      	        	return false;
	      	      	}

	      	      	var html = $('<div class="tab-pane  no-padding" id="tab'+($("#mainTab li").length-1) +'"><iframe  class="col-sm-12 no-border no-padding" src=""></iframe> </div>');
	      	      	html.find("iframe").height($(window).height() *0.8);
	      	      	$("#myTabContent").append(html);
	      	      	html.find("iframe").attr("src",this.href);
	      	      	li.find(".close").click(function(){
	      	        	li.remove();
	      	        	html.remove();
	      	        	$($("#mainTab a")[$("#mainTab li").length -1]).click();
	      	    	});
	      	      	$($("#mainTab a")[$("#mainTab li").length -1]).click();
	      	      	return false ;
     	 		});
     	 	}
      	},
      	error: function(XMLHttpRequest, textStatus, errorThrown){
      		sendTarget.attr("onclick",funcName);
      	}
  	});
}
function fillFinishedTask(){
	console.log("fillFinishedTask is call..");
	var sendTarget = $(event.target);
	var funcName = sendTarget.attr("onclick");
	if($('#finishiedCompleteTask a').length > 0){
		return;
	}
	$('#finishiedCompleteTask').html('');
	//获取已结束任务列表
	$.ajax({
		url: 'task/queryfinishedCompleteTaskCountGroupByProcType.do',
      	async:true,
      	cache: false,
      	beforeSend:function(){
      		sendTarget.attr("onclick","");
      	},
      	success : function(data) {
      		sendTarget.attr("onclick",funcName);
      		if(data.indexOf('您无权访问') != -1)
      			return;
     	 	if(data != null && data != undefined && data.length > 0){
     	 		for(var i = 0;i<data.length;i++){
     	 			$('#finishiedCompleteTask').append("<div class=\"message-item\"><div id=\"finishiedCompleteTaskItemDiv"+i+"\" title=\""+data[i].procDefName+"\" class=\"col-sm-8\">"
     	 					+"<a id=\"finishiedCompleteTask"+i+"\" href=\"/task/list.do?procDefId="+data[i].procDefId+"&taskSts=5&isFirstLoad=true\">"+data[i].procDefName+"</a>"
     	 				+"</div><span class=\"time\"><a id=\"finishiedCompleteTaskA"+i+"\" href=\"/task/list.do?procDefId="+data[i].procDefId+"&taskSts=5&isFirstLoad=true\">"+data[i].taskCnt+"</a></span></div>");
     	 		}
     	 		$("#finishiedCompleteTask a").click(function(){
     	 			var a = this;
	      	      	var b ;
	      	      
	      	      	$($("#mainTab a").each(function(){
	      	          	if($(this).html().indexOf($(a).html()) >=0 ) b = this ;
	      	      	}));
	      	      
	      	      	if(b) {
	      	    		$(b).click();
	      	    	  	return false ;
	      	      	}
	      	      	var aId = $(this).attr('id');
	      	      	var index = aId.substr(aId.strLen()-1);
	      	      	var tabName = $('#'+('finishiedCompleteTaskItemDiv'+index)+' > a:first-child').html()+'进度查询';
	      	      	var li = $('<li > <a href="#tab'+$("#mainTab li").length+'" data-toggle="tab" aria-expanded="false">'+
	      	      		tabName+'<i class="ace-icon fa fa-times close " style="cursor:pointer"></i></a></li>');
	      	      	$("#mainTab").append(li);

	      	      	if($("#mainTab").height() != 34 && $("#mainTab").height() != 37){
	      	        	li.remove();
	      	        	return false;
	      	      	}

	      	      	var html = $('<div class="tab-pane  no-padding" id="tab'+($("#mainTab li").length-1) +'"><iframe  class="col-sm-12 no-border no-padding" src=""></iframe> </div>');
	      	      	html.find("iframe").height($(window).height() *0.8);
	      	      	$("#myTabContent").append(html);
	      	      	html.find("iframe").attr("src",this.href);
	      	      	li.find(".close").click(function(){
	      	        	li.remove();
	      	        	html.remove();
	      	        	$($("#mainTab a")[$("#mainTab li").length -1]).click();
	      	    	});
	      	      	$($("#mainTab a")[$("#mainTab li").length -1]).click();
	      	      	return false ;
     	 		});
     	 	}
      	},
      	error: function(XMLHttpRequest, textStatus, errorThrown){
      		sendTarget.attr("onclick",funcName);
      	}
  	});

}
function refreshTask(){
	$("a[href='#collapseOne']").trigger("onclick");
}

 
//禁审规则操作记录
function operationRuleRecord(ruleUuid,attrBution,orgNo,orgNm){
	var attrBution1=encodeURI(encodeURI(attrBution));
	var orgNm1=encodeURI(encodeURI(orgNm));
	$.fancybox.open({
		href : '/sspForbidAuditRule/operationRuleRecord.do?ruleUuid='+ruleUuid
										 +"&attrBution="+attrBution1
										 +"&orgNo="+orgNo
										 +"&orgNm="+orgNm1,
		type : 'iframe',
		padding : 5,
		scrolling : 'no',
		fitToView : true,
		width : 900,
		height : 400,
		autoSize : false,
		closeClick : false,
		afterClose : function() {
		}
	});
}