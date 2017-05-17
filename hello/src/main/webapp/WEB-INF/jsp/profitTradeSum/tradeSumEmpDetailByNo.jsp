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
        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                          <div class="widget-container-col ui-sortable"  >
                             <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                      查询结果
                                    </h5>
                                </div>
                                <div class="widget-body">
                                 <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/empTradeSum/empMonthList.do" id="searchForm" method="post">
                                   <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                   <input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                   <input type="hidden" id="orgNo" name="orgNo" value="${dsm.orgNo}" >
                                   <input type="hidden" id="year" name="year" value="${year}" >  
                                   <input type="hidden" id="month" name="month" value="${month}" > 
                                   <input type="hidden" id="flg" name="flg" value="1" > 
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable" id="bankLinkTable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 7%">业务员编号</th>
                                                <th style="text-align: center;width: 12%">业务员名称</th>
                                                <th style="text-align: center;width: 9%">交易金额</br>合计</th>
                                                <th style="text-align: center;width: 9%">非封顶金额</br>合计</th>
                                                <th style="text-align: center;width: 7%">手续费</br>合计</th>
                                                <th style="text-align: center;width: 7%">可分润金额</br>合计</th>
                                                <th style="text-align: center;width: 5%">分润比例</th>
                                                <th style="text-align: center;width: 6%">分润金额</th>
                                                <th  style="text-align: center;" width="4%">笔数</th>
                                                <!-- <th  style="text-align: center;" width="8%">操作</th> -->
                                            </tr>
                                            </thead>
                                              <tbody>
                                            	<c:forEach var="de" items="${empList}" varStatus="status">
                                            		<tr>
														<td style="text-align: center;">${de.empNo }</td>
														<td style="text-align: left;">${de.empNm }</td>
														<td style="text-align: right;"class="numberPointFormat" >${de.tradeSumDesc }</td>
														<td style="text-align: right;"class="numberPointFormat" >${de.nocapAmountSumDesc }</td>
														<td style="text-align: right;"class="numberPointFormat" >${de.feeSumDesc }</td>
														<td style="text-align: right;"class="numberPointFormat" >${de.profitAmountDesc }</td>
														<td style="text-align: right;">${de.levelScaleStr }</td>
														<td style="text-align: right;"class="numberPointFormat" >${de.profitAmountMonthDesc }</td>
														<td style="text-align: right;"class="numberFormat">${de.tradeCount }</td>
														<%--  <td style="text-align: left;">
										                     <div class="   action-buttons">
										                         <a href="#" onclick="typeDetailShow('${de.empNo }','${year}','${month}','${de.empNm }','${de.orgNo }','${de.orgNm }')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa fa-search-plus blue bigger-130"><font size="2">业务员日详情</font></i>
										                         </a>
										                          <a href="#" onclick="typeDetailShowB('${de.empNo }','${year}','${month}')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa fa-search-plus blue bigger-130"><font size="2">商户月详情</font></i>
										                         </a>
										                     </div>
										                 </td> --%>
													</tr>
                                            	</c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                 </form>
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
        </div>
    </div>
                 
        			  <div >	
        			  <center>
                                                    <button class="btn btn-default btn-sm" type="button" onclick="closeThisWin()">
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
                                                                                                       	关闭
                                                                                                       
                                                     </button>
                      	</center>
                       </div>
                  
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">
    function closeThisWin(){
    	parent.$.fancybox.close();
    }
    
   <%--  function typeDetailShow(id,year,month){
  	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/empTradeSum/empList.do?empNo='+id+'&year='+year+'&month='+month+'&flg=1',
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 1200,
	        height: 800,
	        autoSize: false,
	        closeClick: false,
				afterClose:function(){
				}
			});
  	  
    } --%>
    
    <%-- function typeDetailShowB(id,year,month){
    	 var profitMonth = year+'-'+month;
  	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/mecTradeSum/mecMonthList.do?empNo='+id+'&profitMonth='+profitMonth+'&flg=1',
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 1200,
	        height: 800,
	        autoSize: false,
	        closeClick: false,
				afterClose:function(){
				}
			});
  	  
    } --%>
  
  
	</script>
</body>
</html>











