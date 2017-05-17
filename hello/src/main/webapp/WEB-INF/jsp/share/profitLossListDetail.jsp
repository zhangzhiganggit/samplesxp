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
                                                 <th style="text-align: center;width: 10%">商户编号</th>
                                                <th style="text-align: center;width: 14%">签购单名称</th>
                                                <th style="text-align: center;width: 8%">直属代理编号 </th>
                                                <th style="text-align: center;width: 14%">直属代理名称</th>
                                                <th style="text-align: center;width: 10%">一级代理编号</th>
                                                <th style="text-align: center;width: 14%">一级代理名称</th>
                                                <th style="text-align: center;width: 10%">损失类型</th>
                                                <th style="text-align: center;width: 10%">损失发生日期</th>
                                                <th style="text-align: center;width: 10%">代理商应扣金额</th>
                                            </tr>
                                            </thead>
                                              <tbody>
                                            	<c:forEach var="de" items="${list}" varStatus="status">
                                            		<tr>
		                                                <td style="text-align: center;">${de.mno }</td>
														<td style="text-align: left;">${de.mecDisNm}</td>
														<td style="text-align: center;">${de.orgNo }</td>
														<td style="text-align: left;">${de.orgNm }</td>
														<td style="text-align: center;">${de.topOrgNo }</td>
														<td style="text-align: left;">${de.topOrgNm }</td>
														<td style="text-align: center;">${de.lossType }</td>
														<td style="text-align: center;">${de.lossHpDt }</td>
														<td style="text-align: right;" class="numberPointFormatForText">${de.agentScDesc }</td>
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
    
    function typeDetailShow(id,tranDtStr){
  	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/mecTradeSum/mecList.do?empNo='+id+'&tranDtStr='+tranDtStr+'&flg=1',
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
  	  
    }
	</script>
</body>
</html>











