<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

   <%@include file="../../layout/common.css.jsp"%>
</head>

<body class="no-skin ">
    
  <%--   <%@include file="../layout/header.jsp"%> --%>

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
       <%--  <%@include file="../layout/menu.jsp"%> --%>

        <div class="main-content ">
            <div class="main-content-inner ">

               
                <div class="page-content ">

                    <div class="row" >


                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        D+1商户数查询条件
                                    </h5>
                                    <span class="widget-toolbar">
                                        <a data-action="collapse" href="#">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>
                                    </span>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">


                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecIfDayOne/list.do" id="searchForm" method="post" >
                                              <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                            	<input type="hidden" id="showBranch" name="showBranch" value="${showBranch }">
                                                <div class=" col-xs-12">
                                                
                                                    <c:if test="${showBranch=='show' }">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="branchOrgNo" name="branchOrgNo" onchange="fillOrgSelect('branchOrgNo','orgNo','${mr.orgNo}')"  data-placeholder="请选择"  class="chosen-select form-control width-200px">
                                                                <option value="">请选择</option>
                                                                <c:forEach items="${orgListB }" var="org" >
                                                                	<option value="${org.orgUuid }"
                                                                		<c:if test="${mr.branchOrgNo == org.orgUuid }"> selected </c:if>
                                                                	>${org.orgNm }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                   <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属机构:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="orgNo" name="orgNo" data-placeholder="请选择"  class="chosen-select form-control width-200px">
                                                                
                                                            </select>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                     <c:if test="${showBranch=='noShow' }">
                                                        <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属机构:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="orgNo" name="orgNo"   data-placeholder="请选择"  class="chosen-select form-control width-200px">
                                                                <option value="">请选择</option>
                                                                <c:forEach items="${orgList }" var="org" >
                                                                	<option value="${org.orgUuid }"
                                                                		<c:if test="${mr.orgNo == org.orgUuid }"> selected </c:if>
                                                                	>${org.orgNm }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                     </c:if>
                                                    <input type="hidden" id="hiddenOrg" value="${mr.orgNo}">
                                                   </div>

                                                <button class="btn btn-normal btn-sm" type="button" onclick="valiDcount()">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                 <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
                                                </button> 
                                                <button class="btn btn-primary btn-sm" type="button"   onclick="dowmDcount()">
                                                   <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                 导出检索结果
                                                </button>
                                                
                                                  
                                            </form>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        D+1商户数查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 6%">序号</th>
                                                <th style="text-align: center;width: 20%">所属分公司</th>
                                                <th style="text-align: center;width: 25%">归属机构</th>
                                                <th style="text-align: center;width: 15%">商户数量</th>
                                                <th style="text-align: center;width: 15%">开通D+1商户数量</th>
                                                <th style="text-align: center;">D+1开通率</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                           <c:forEach items="${list}" var="de"  varStatus="status">
													<tr>
                                                        <td style="text-align: center;">${status.index+1 }</td>
														<td style="text-align: center;">${de.branchNm }</td>
														<td style="text-align: left;">${de.orgNm }</td>
														<td style="text-align: right;">${de.mecCount }</td>
														<td style="text-align: right;">${de.mecDayOneCount }</td>
														<td style="text-align: right;">${de.mecDayOnePer }%</td>
													</tr>
												</c:forEach> 
                                         
                                            </tbody>
                                         
                                        </table>


                                    </div>

                                </div>
                            </div>
                        </div>
                       <div class="row col-sm-12    ">
							<div class="col-sm-4 hidden-480 left">
								<label class="dataTables_info " id="dynamic-table_info"
									role="status" aria-live="polite"></label>
							</div>

							<div class="col-sm-8 right">
								<%@include file="../../layout/pagination.jsp" %>
							</div>

						</div>
                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%-- <%@include file="../layout/footer.jsp"%> --%>
    <%@include file="../../layout/common.alljs.jsp"%>
    <!-- inline scripts related to this page -->
     <script type="text/javascript">
       var orgNo = $("#hiddenOrg").val();
       var showBranch = $("#showBranch").val();
       if(showBranch=='show'){
    	   fillOrgSelect('branchOrgNo','orgNo',orgNo);
       }
      
       
       function fillOrgSelect(branchOrgNo,orgNo,orgValue,isContainsEmptyOption){
       	var branchOrgNo = $("[name='"+branchOrgNo+"']").val();
       	if(branchOrgNo!=''){
       		$.ajax({
       	        url: '/mecIfDayOne/getOrgByBranchOrgNo.do',
       	        data : {
       	        	branchOrgNo : branchOrgNo
       	        },
       	        async:false,
       	        cache: true,
       	        success : function(orgList) {
       	       	 	if(orgList != null && orgList !=undefined){
       		       	 	var options = '';
       		       	 	if(isContainsEmptyOption || isContainsEmptyOption == undefined || isContainsEmptyOption == null)
       	       	 			options = "<option value=''>请选择</option>";
       		             for(var i=0;i<orgList.length;i++){
       		            	 if(orgValue != ''){
       		            		 if(orgList[i].orgUuid == orgValue){
       		            			 options+="<option selected='selected' value=\""+orgList[i].orgUuid+"\">"+orgList[i].orgNm+"</option>";
       		            		 }else{
       		            			 options+="<option value=\""+orgList[i].orgUuid+"\">"+orgList[i].orgNm+"</option>";
       		            		 }
       		            	 }else{
       		            		 options+="<option value=\""+orgList[i].orgUuid+"\">"+orgList[i].orgNm+"</option>";
       		            	 }
       		             }
       		             $("[name='"+orgNo+"']").html(options);
       		             $("[name='"+orgNo+"']").trigger("chosen:updated");
       	       	 	}
       	        }
       		});
       	}else{
       		$("[name='"+orgNo+"']").html('');
       		$("[name='"+orgNo+"']").trigger("chosen:updated");
       	}
       }
     </script>
    <script type="text/javascript">
    function resetMecForm(){
   	 $(':input','#searchForm')  
   	 .not(':button, :submit, :reset, :hidden')  
   	 .val('')  
   	 .removeAttr('checked')  
   	 .removeAttr('selected'); 
		 $("#orgNo").val('');
		 $("#orgNo").trigger("chosen:updated");		
		 $("#branchOrgNo").val('');
		 $("#branchOrgNo").trigger("chosen:updated");	
    }
  
    function dowmDcount(){
    	var branchOrgNo = $("#branchOrgNo").val();
    	var showBranch = $("#showBranch").val();
    	var orgNo = $("#orgNo").val();
    	if(showBranch=='show' &&(branchOrgNo==''||branchOrgNo==null)){
    		alert("请选择归属分公司");
    		return;
    	}else{
    		 window.location.href='<%=request.getContextPath()%>/mecIfDayOne/downExcelDayOneCount.do?branchOrgNo='+branchOrgNo+'&orgNo='+orgNo;
    	}
	}
    
    function valiDcount(){
    	var branchOrgNo = $("#branchOrgNo").val();
    	var showBranch = $("#showBranch").val();
    	if(showBranch=='show' &&(branchOrgNo==''||branchOrgNo==null)){
    		alert("请选择归属分公司");
    		return;
    	}else{
    		document.getElementById("searchForm").submit();
    	}
    }
        
        $('.chosen-select').chosen({});
        jQuery(function($) {
        	 $('#searchForm').formValidation({
                 message: 'This value is not valid',
                 container:'popover',
                 feedbackIcons: {
                     valid: 'glyphicon glyphicon-ok',
                     invalid: 'glyphicon glyphicon-remove',
                     validating: 'glyphicon glyphicon-refresh'
                 },
                 fields: {
                	 branchOrgNo : {
       					validators : {
       						
       						notEmpty: {}

       					}
       				}
                 }
             });
        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        }).next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});


    })
        
</script>
</body>
</html>











