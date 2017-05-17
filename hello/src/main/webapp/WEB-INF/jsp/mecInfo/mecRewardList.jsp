<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.css.jsp"%>
     
     
</head>

<body class="no-skin ">
    
   <%--  <%@include file="../layout/header.jsp"%> --%>

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
       <%--   <%@include file="../layout/menu.jsp"%>  --%>

        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       		 推荐商户奖励查询条件
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecIf/adminMecRewordList.do?isFirstLoad=false" id="searchForm" method="post">
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                            	<input type="hidden" id="strOrgNo" name="strOrgNo" value="${strOrgNo}">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mno"  name="mno" value="${mecIf.mno }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签购单名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mecDisNm"  name="mecDisNm" value="${mecIf.mecDisNm }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
 													 
                                                  <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>
                                                          <div class="col-sm-8  no-padding"  >
                                                         	<select id="branchOrgNo" name="branchOrgNo"   data-placeholder="全部"  class="chosen-select form-control width-200px"
                                                                <c:if test="${strOrgNo != '0010000000' }">disabled</c:if>>
                                                                <option value="" selected="selected" >全部</option>
                                                                <c:forEach items="${orgAllList }" var="org" >
                                                                	<option value="${org.orgUuid }" 
                                                                	<c:if test="${mecIf.branchOrgNo == org.orgUuid }"> selected </c:if>
                                                                	>${org.orgNm }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                 </div>
                                                 <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属一代:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="topAgentOrgNm"  name="topAgentOrgNm" value="${mecIf.topAgentOrgNm }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                </div>
                                                 
                                                 <br/>
                                                <!--end by hss 2016-04-26  --> 

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
                                                </button>
                                                 <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
                                                </button> 
                                                 <c:if test="${loginUserPermission.SMSA_PRIZE_02!=null }">
                                                <button class="btn btn-primary btn-sm" type="button" onclick='exportPrize()'>
                                                	<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                                导出检索结果
                                                </button>
                                                </c:if>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        	推荐商户奖励查询结果
                                    </h5>


                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 8%">商户编号</th>
                                                <th style="text-align: center;width: 9%">签购单名称</th>
                                                <th style="text-align: center;width: 6%">归属分公司</th>
                                                <th style="text-align: center;width: 8%">所属一代</th>
                                                <th style="text-align: center;width: 8%">所属业务员</th>
                                                <th style="text-align: center;width: 4%">阅读量</th>
                                                <th style="text-align: center;width: 4%">申请量</th>
                                                <th style="text-align: center;width: 4%">进件量</th>
                                                <th style="text-align: center;width: 7%">阅读奖励金额</th>
                                                <th style="text-align: center;width: 9%">阅读奖励已兑现金额</th>
                                                <th style="text-align: center;width: 7%">进件奖励金额</th>
                                                <th style="text-align: center;width: 9%">进件奖励已兑现金额</th>
                                                
                                            </thead>

                                            <tbody>
                                           <c:forEach items="${mecIfList}" var="de"  varStatus="status">
													<tr>
														<!-- <td style="border:1px solid  #969696;">${status.index+1 }</td> -->
														
														<td style="text-align: center;">${de.mno}</td>
														<td style="text-align: center;">${de.mecDisNm }</td>
														<td style="text-align: center;">${de.branchOrgNm }</td>
														<td style="text-align: center;">${de.topAgentOrgNm }</td>
														<td style="text-align: center;">${de.empNm}</td>
														<td style="text-align: center;" >${de.readerAmt}</td>
														<td style="text-align: center;">${de.registSum}</td>
														<td style="text-align: center;">${de.registAmt }</td>
														<td style="text-align: center;"class="numberPointFormatForText">${de.readerPrizeAmt }</td>
														<td style="text-align: center;"class="numberPointFormatForText">${de.readerPrizeUsed}</td>
														<td style="text-align: center;"class="numberPointFormatForText">${de.registPrizeAmt}</td>
														<td style="text-align: center;"class="numberPointFormatForText">${de.registPrizeUsed}</td>
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
								<%@include file="../layout/pagination.jsp" %>
							</div>

						</div>

                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%-- <%@include file="../layout/footer.jsp"%> --%>
    <%@include file="../layout/common.alljs.jsp"%>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
        jQuery(function($) {
        	$('.chosen-select').chosen({});
        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        }).next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
    })
     function resetMecForm(){
        var strOrgNo=$('#strOrgNo').val();
    	 $(':input','#searchForm')  
    	 .not(':button, :submit, :reset, :hidden')  
    	 .val('')  
    	 .removeAttr('checked')  
    	 .removeAttr('selected');
    	 if(strOrgNo =='0010000000'){
			 $("#branchOrgNo").val('').trigger("chosen:updated").trigger("onchange");
	       }
		 $('#searchForm').data('formValidation').resetForm(); 
		
		 }
		 
        function exportPrize(){
    		$('#searchForm').attr('action','/mecIf/exportPrize.do');
    		document.getElementById("searchForm").submit();
    		$('#searchForm').attr('action',' /mecIf/adminMecRewordList.do?isFirstLoad=false');
    		   
    	}   
</script>
</body>
</html>











