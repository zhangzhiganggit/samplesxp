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
    <div class="main-container" id="main-container">
        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class="widget-container-col ui-sortable"  >
                             <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       查询结果${tipInfo}
                                    </h5>
                                </div>
                                <div class="widget-body">
                                  <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/checkAgeSet/showOperLog" id="searchForm" method="post">
                                  <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                  <input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                  <input type="hidden" name="uuid" value="${checkAgeSetByOld.uuid}" >
                                  </form>
                                  <c:if test="${flag == '0'}">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable" id="bankLinkTable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 3%">序号</th>
                                                <th style="text-align: center;width: 12%">产品类型</th>
                                                <th style="text-align: center;width: 12%">年龄范围修改前</th>
                                                <th style="text-align: center;width: 12%">年龄范围修改后</th>
                                                <th style="text-align: center;width: 6%">启用状态修改前</th>
                                                <th style="text-align: center;width: 8%">启用状态修改后</th>
                                                <th style="text-align: center;width: 8%">操作人</th>
                                                <th style="text-align: center;width: 20%">操作时间</th>
                                            </tr>
                                            </thead>
                                              <tbody>
                                            	<c:forEach var="tl" items="${checkAgeSetLogs}" varStatus="status">
                                            		<tr>
                                            		    <td style="text-align: center;">${status.index+1 }</td> 
		                                                <td style="text-align: center;">${tl.productName }</td>
		                                                <td style="text-align: center;">${tl.ageSetBefore }</td>
		                                                <td style="text-align: left;">${tl.ageSetAfter}</td>
		                                                <td style="text-align: center;">${tl.isUseBeforeVal}</td>
		                                                <td style="text-align: center;">${tl.isUseAfterVal}</td>
		                                                <td style="text-align: center;">${tl.opeatePersonName}</td>
		                                                <td style="text-align: center;">${tl.opeateDateStr}</td>
	                                                </tr>
                                            	</c:forEach>
                                            </tbody>
                                        </table>


                                    </div>
                                  </c:if>
                                  
                                  <c:if test="${flag == '1'}">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable" id="bankLinkTable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 3%">序号</th>
                                                <th style="text-align: center;width: 12%">产品类型</th>
                                                <th style="text-align: center;width: 30%">例外证件号</th>
                                                <th style="text-align: center;width: 12%">失效时间修改前</th>
                                                <th style="text-align: center;width: 12%">失效时间修改后</th>
                                                <th style="text-align: center;width: 8%">操作人</th>
                                                <th style="text-align: center;width: 20%">操作时间</th>
                                            </tr>
                                            </thead>
                                              <tbody>
                                            	<c:forEach var="tl" items="${checkAgeSetLogs}" varStatus="status">
                                            		<tr>
                                            		    <td style="text-align: center;">${status.index+1 }</td> 
		                                                <td style="text-align: center;">${tl.productName }</td>
		                                                <td style="text-align: center;">${tl.exceptionIdNumber }</td>
		                                                <td style="text-align: center;">${tl.expiryDateBeforeStr }</td>
		                                                <td style="text-align: left;">${tl.expiryDateAfterStr}</td>
		                                                <td style="text-align: center;">${tl.opeatePersonName}</td>
		                                                <td style="text-align: center;">${tl.opeateDateStr}</td>
	                                                </tr>
                                            	</c:forEach>
                                            </tbody>
                                        </table>


                                    </div>
                                  </c:if>
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
                    
                     
            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->
              
    <%@include file="../layout/common.alljs.jsp"%>
    <script type="text/javascript">
    function closeThisWin(){
    	parent.$.fancybox.close();
    }
	</script>
</body>
</html>











