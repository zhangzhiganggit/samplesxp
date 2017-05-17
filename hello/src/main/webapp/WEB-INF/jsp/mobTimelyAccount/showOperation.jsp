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
 <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/MobAgentTimelyAccount/showLog?orgUuid=${orgUuid}" id="searchForm" method="post" >
                                                <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        	代理商即刷即到操作记录   开通商户总数为:${sumMerc}
                                    </h5>


                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 7%">序号</th>
                                                <th style="text-align: center;width: 15%">机构编号</th>
                                                <th style="text-align: center;width: 20%">操作类型</th>
                                                <th style="text-align: center;width: 10%">操作时间</th>
                                                <th  style="text-align: center;width: 15%">操作员</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                           <c:forEach items="${mogAgentList}" var="de"  varStatus="status">
													<tr>
														<td style="text-align: center;">${status.index+1 }</td>
														<td style="text-align: center;">${de.orgUuid }</td>
														<td style="text-align: center;">
														    <c:if test="${de.operTyp == '1'}">开通</c:if>
														    <c:if test="${de.operTyp == '2'}">关闭</c:if>
														    <c:if test="${de.operTyp == '3'}">暂停拓展</c:if>
														    <c:if test="${de.operTyp == '4'}">恢复拓展</c:if>
														</td>
														<td style="text-align: center;">
														 <fmt:parseDate value="${de.operTime }" pattern="yyyy-MM-dd HH:mm:SS" var="test"/>   
                                                         <fmt:formatDate value="${test}" pattern="yyyy-MM-dd"/> 
														</td>
														<td style="text-align: center;">${de.updateUsr }</td>
													</tr>
												</c:forEach> 
                                         
                                            </tbody>
                                        </table>


                                    </div>

                                </div>
                            </div>
                        </div>
                        </form>
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

      
       

    })
</script>
</body>
</html>