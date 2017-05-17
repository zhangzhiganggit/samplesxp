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
                                  <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/restExcep/seeOperLog" id="searchForm" method="post">
                                  <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                  <input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                  <input type="hidden" name="uuid" value="${mf.uuid}" >
                                  </form>
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable" id="bankLinkTable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 3%">序号</th>
                                                <th style="text-align: center;width: 8%">分公司名称</th>
                                                <th style="text-align: center;width: 8%">例外类型</th>
                                                <th style="text-align: center;width: 12%">例外名称</th>
                                                <th style="text-align: center;width: 4%">是否全量</th>
                                                <th style="text-align: center;width: 8%">原失效时间</th>
                                                <th style="text-align: center;width: 8%">失效时间</th>
                                                <th style="text-align: center;width: 8%">原重复次数</th>
                                                <th style="text-align: center;width: 4%">重复次数</th>
                                                <th style="text-align: center;width: 8%">原商户等级</th>
                                                <th style="text-align: center;width: 8%">商户等级</th>
                                                <th style="text-align: center;width: 6%">操作人</th>
                                                <th style="text-align: center;width: 13%">操作时间</th>
                                            </tr>
                                            </thead>
                                              <tbody>
                                            	<c:forEach var="tl" items="${list}" varStatus="status">
                                            		<tr>
                                            		    <td style="text-align: center;">${status.index+1 }</td> 
		                                                <td style="text-align: center;">${tl.orgNm }</td>
		                                                <td style="text-align: center;">${tl.excepTypStr }</td>
		                                                <td style="text-align: left;">${tl.excepNm}</td>
		                                                <td style="text-align: center;">${tl.isAllStr}</td>
		                                                <td style="text-align: center;">${tl.oldExpiryDateStr}</td>
		                                                <td style="text-align: center;">${tl.expiryDateStr}</td>
		                                                <c:if test="${tl.oldRepeatNum == 'N'}">
			                                                <td style="text-align: center;"></td>
		                                                </c:if>
		                                                <c:if test="${tl.oldRepeatNum != 'N'}">
			                                                <td style="text-align: center;">${tl.oldRepeatNum}</td>
		                                                </c:if>
		                                                <c:if test="${tl.repeatNum == 'N'}">
			                                                <td style="text-align: center;"></td>
		                                                </c:if>
		                                                <c:if test="${tl.repeatNum != 'N'}">
			                                                <td style="text-align: center;">${tl.repeatNum}</td>
		                                                </c:if>
		                                                <td style="text-align: center;">${tl.oldMecNormalLevelStr}</td>
		                                                <td style="text-align: center;">${tl.mecNormalLevelStr}</td>
		                                                <td style="text-align: center;">${tl.operNo}</td>
		                                                <td style="text-align: center;">${tl.operDatetime}</td>
	                                                </tr>
	                                               
	                                                
                                            	</c:forEach>
                                            </tbody>
                                        </table>


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











