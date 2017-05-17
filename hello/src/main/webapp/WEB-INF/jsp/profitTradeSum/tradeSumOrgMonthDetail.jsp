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
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable" id="bankLinkTable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 8%">直属机构</th>
                                                <th style="text-align: center;width: 12%">机构名称</th>
                                                <th style="text-align: center;width: 10%">交易日期</th>
                                                <th style="text-align: center;width: 10%">交易金额合计</th>
                                                <th style="text-align: center;width: 10%">非封顶金额合计</th>
                                                <th style="text-align: center;width: 10%">手续费合计</th>
                                                <th style="text-align: center;width: 10%">可分润金额合计</th>
                                                <th  style="text-align: center;" width="5%">笔数</th>
                                                <!-- <th  style="text-align: center;" width="5%">操作</th> -->
                                            </tr>
                                            </thead>
                                              <tbody>
                                            	<c:forEach var="de" items="${orgList}" varStatus="status">
                                            		<tr>
														<td style="text-align: center;">${de.orgNo }</td>
														<td style="text-align: left;">${de.orgNm }</td>
														<td style="text-align: center;">${de.tranDtStr }</td>
														<td style="text-align: right;"class="numberPointFormat" >${de.tradeSumDesc }</td>
														<td style="text-align: right;"class="numberPointFormat" >${de.nocapAmountSumDesc }</td>
														<td style="text-align: right;"class="numberPointFormat" >${de.feeSumDesc }</td>
														<td style="text-align: right;"class="numberPointFormat" >${de.profitAmountDesc }</td>
														<td style="text-align: right;"class="numberFormat">${de.tradeCount }</td>
														 <%-- <td style="text-align: center;">
										                     <div class="   action-buttons">
										                         <a href="#" onclick="typeDetailShow('${de.orgNo }','${de.tranDtStr }')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa fa-search-plus blue bigger-130"><font size="2">详情</font></i>
										                         </a>
										                     </div>
										                 </td> --%>
	                                                </tr>
                                            	</c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
                 <center>
        			  <div >	
                                                    <button class="btn btn-default btn-sm" type="button" onclick="closeThisWin()">
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
                                                                                                       	关闭
                                                     </button>
                       </div>
                  </center>
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">
    function closeThisWin(){
    	parent.$.fancybox.close();
    }
    
    <%-- function typeDetailShow(id,tranDtStr){
  	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/orgTradeSum/orgOneListByorgNo.do?orgNo='+id+'&tranDtStr='+tranDtStr,
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











