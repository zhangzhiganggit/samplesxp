<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.jsp"%>
</head>

<body class="no-skin ">
    

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/js/mercIncome/tipsModify.js"></script>
        <div class="main-content ">
            <div class="main-content-inner ">

                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       工单委托
                                    </h5>
                                </div>
                                <form class="form-inline form-horizontal" action="#" id="searchForm" method="post"  enctype="multipart/form-data">
                        		<input type="hidden" name="taskId" id="taskId" value="${taskEntrustInfo.taskId}"/>
                        		<input type="hidden" name="procDefKey" id="procDefKey" value="${taskEntrustInfo.procDefId}"/>
                        		<input type="hidden" name="returnUrl" id="returnUrl" value="${taskEntrustInfo.returnUrl}"/>
                        		
                        		<div class=" col-sm-12" style="top: 5px;">
                        		  <div class="form-group form-group-sm width-100">
                                      <label  class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"  style="top: 15px;"><font color="red">*</font>委托原因:</label>
                                      <div class="col-sm-8 no-padding ">
                                            <textarea name="taskEntrustInfo.delegateReason" id="delegateReason" style="height:80px"  class="form-control limited input-small width-100"></textarea>
                                      </div>
                                  </div>
                                 <div class="form-group form-group-sm width-100" >
                                    <label class="col-sm-12 control-label widget-color-normal5 width-100px no-padding-left"style="top: 5px;" ><font color="red">*</font>接收人:</label>
	                                      <div class="col-sm-8 no-padding " style="top: 5px;">
	                                     <select data-placeholder="请选择" name="taskEntrustInfo.receivedPerson" id="receivedPerson" class="chosen-select form-control width-200px">
	                                            <option value="">请选择</option>
	                                            <c:forEach var="employee" items="${employeeList}">
	                                            	<option value="${employee.empNo }">${employee.loginId}&nbsp;&nbsp;${employee.empNm}</option>
	                                            </c:forEach>
	                                     </select>
	                                     </div>
                                   </div>
                               </div> 
			                        <div class="form-actions center widget-color-normal5" style="clear:both;">
		                                <button class="btn btn-danger btn-sm" type="button" onclick="chooseOthers();">
		                                    <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
		                                    委托
		                                </button>
		                            </div>
                            </form>
                    	</div>
                            
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>

        </div><!-- /.main-content -->


    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">
        $('.chosen-select').chosen({search_contains: true});
        
        function chooseOthers() {
        	var receivedPerson = $("#receivedPerson").val();
        	var delegateReason = $("#delegateReason").val();
        	var taskId = $("#taskId").val();
        	var returnUrl = $("#returnUrl").val();
        	var procDefKey= $("#procDefKey").val();
        	var orderNo= $("#orderNo").val();
        	//校验 委托原因与接收人的信息
        	if(''==delegateReason || null == delegateReason){
        		alert("请填写委托原因");
        		return;
        	}else{
        		if(delegateReason.length>40){
        			alert("所填写的委托原因长度不能大于40个汉字，请重现填写");
            		return;
        		}
        	}
        	if(''==receivedPerson || null==receivedPerson){
        		alert("请选择接收人");
        		return;
        	}
        	var url="<%=request.getContextPath()%>/taskEntrust/batchEntrustTask2.do";
    		if(confirm("确认要委托？")){
    	    	$.ajax({
    	    		type:'post',
    	    		url:url,
    	    		data:{
    	    			empNo:receivedPerson,
    	    			delegateReason:delegateReason,
    	    			taskId:taskId,
    	    			procDefKey:procDefKey,
    	    			orderNo:orderNo
    	    		},
    	    		async:false,
    	    		success:function(data){
    					alert(data)
    					if(data=='工单委托成功!'){
    						if(''==returnUrl || returnUrl==null){
    							//parent.$.fancybox.close(); 
    							window.parent.document.location.reload(true);
    						}else{
    							//parent.$.fancybox.close(); 
    							//window.location.href=returnUrl
    							window.parent.location.href=returnUrl
    						}
    					}
    	    		},
    	    		error:function(){
    	    			alert('数据提交失败');
    	    		}
    	    	});
        	}
    	}
	</script>
</body>
</html>











