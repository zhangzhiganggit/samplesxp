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
    

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
        <div class="main-content ">
            <div class="main-content-inner ">

                <div class="page-content ">
                    <div class="row" >
                        <div class="widget-container-col ui-sortable"  >
                            
                             <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       缴费SIM卡明细
                                    </h5>

                                </div>
                                <div class="widget-body">
                                
                                  <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/simCardPayLog/detail.do" id="searchForm" method="post">
                                  <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                  <input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                  <input type="hidden" name="onlinePayNo" value="${onlinePayNo}" >
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable" id="bankLinkTable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 10%">SIM卡号</th>
                                                <th style="text-align: center;width: 5%">卡状态</th>
                                                <th style="text-align: center;width: 15%">商户名称</th>
                                                <th style="text-align: center;width: 9%">商户编号</th>
                                                <th style="text-align: center;width: 10%">POS序列号</th>
                                                <th style="text-align: center;width: 10%">终端号</th>
                                                <th style="text-align: center;width: 10%">是否有效</th>
                                            </tr>
                                            </thead>
                                              <tbody>
                                            	<c:forEach items="${payList}" var="de"  varStatus="status">
                                            		<tr>
                                            		    <td style="text-align: left;">${de.simcardNo }</td> 
                                            		    <td style="text-align: center;">
		                                                   <c:if test="${de.status == '10' }">正常</c:if>
														   <c:if test="${de.status == '11' }">暂停</c:if>
														   <c:if test="${de.status == '12' }">注销</c:if>
		                                                </td>
		                                                <td style="text-align: left;">${de.cprNm }</td>
		                                                <td style="text-align: left;">${de.mno}</td>
		                                                <td style="text-align: left;">${de.factSn}</td>
		                                                <td style="text-align: left;">${de.posNum}</td>
		                                                <td style="text-align: left;">
		                                                	<c:if test="${de.isActive=='1'}">是</c:if>
		                                                	<c:if test="${de.isActive=='0'}">否</c:if>
		                                                </td>
	                                                </tr>
                                            	</c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                  </form>
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
						  <div class="form-actions center widget-color-normal5">.
								<button class="btn btn-default btn-sm" type="button"
										onclick="closeWin()">
									<span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
											关闭
								</button>
						 </div>
                        </div>
                       
                    </div>
                     
                </div>
                    
                     
            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->
              
    <%@include file="../../layout/common.alljs.jsp"%>
    <script type="text/javascript">
    function closeWin(){
    	parent.$.fancybox.close();
    }
	</script>
</body>
</html>











