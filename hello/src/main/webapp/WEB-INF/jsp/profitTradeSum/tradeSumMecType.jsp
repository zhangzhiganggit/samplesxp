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
                                       按交易类型查询结果
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable" id="bankLinkTable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 12%">商户编号</th>
                                                <th style="text-align: center;width: 12%">签购单名称</th>
                                                <th style="text-align: center;width: 12%">商户经营名称</th>
                                                <th style="text-align: center;width: 9%">交易日期</th>
                                                <th style="text-align: center;width: 10%">交易金额</br>合计</th>
                                                <th style="text-align: center;width: 7%">交易笔数 </th>
                                                <th style="text-align: center;width: 10%">手续费</br>合计</th>
                                                <th style="text-align: center;width: 9%">核算费率</th>
                                                <th style="text-align: center;width: 9%">交易类型</th>
                                                <th style="text-align: center;width: 10%">可分润金额</br>合计</th>
                                            </tr>
                                            </thead>
                                              <tbody>
                                            	<c:forEach var="tl" items="${typeList}" varStatus="status">
                                            		<tr>
		                                                <td style="text-align: center;">${dsm.mno }</td>
		                                                <td style="text-align: left;">${tl.mecDisNm }</td>
		                                                <td style="text-align: left;">${dsm.mecOperNm }</td>
		                                                <td style="text-align: center;">${dsm.tranDtStr}</td>
		                                                <td style="text-align: right;"class="numberPointFormat" >${tl.tradeSumDesc}</td>
		                                                <td style="text-align: right;"class="numberFormat">${tl.tradeCount}</td>
		                                                <td style="text-align: right;"class="numberPointFormat" >${tl.feeSumDesc }</td>
		                                                <td style="text-align: right;"class="numberPointFormat" >${tl.feeRate }%</td>
		                                                <td style="text-align: center;">${tl.feeTypeStr }</td>
		                                                <td style="text-align: right;"class="numberPointFormat" >${tl.profitAmountDesc }</td>
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
                                                                                                       	返回
                                                     </button>
                       </div>
                  </center>
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">
    function closeThisWin(){
    	parent.$.fancybox.close();
    }
	</script>
</body>
</html>











