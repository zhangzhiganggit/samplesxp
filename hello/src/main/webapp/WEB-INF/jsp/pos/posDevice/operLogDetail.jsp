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
                                       操作记录
                                    </h5>

                                </div>
                                <div class="widget-body">
                                
                                  <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/deviceLimit/Detail.do" id="searchForm" method="post">
                                  <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                  <input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                  
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable" id="bankLinkTable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 10%">厂商简称</th>
                                                <th style="text-align: center;width: 5%">型号</th>
                                                <th style="text-align: center;width: 8%">限制归属</th>
                                                <th style="text-align: center;width: 8%">限制版本号</th>
                                                <th style="text-align: center;width: 9%">限制操作</th>
                                                <th style="text-align: center;width: 10%">生效时间</th>
                                                <th style="text-align: center;width: 10%">入库时间限制</th>
                                                <th style="text-align: center;width: 10%">操作人</th>
                                                <th style="text-align: center;width: 10%">操作时间</th>
                                            </tr>
                                            </thead>
                                              <tbody>
                                            	<c:forEach items="${deLList}" var="de"  varStatus="status">
                                            		<tr>
                                            		    <td style="text-align: center;">${de.factShortname }</td> 
		                                                <td style="text-align: center;">${de.modName }</td>
		                                                <td style="text-align: center;">
		                                                   <a href="<%=request.getContextPath() %>/deviceLimit/limitOwnerDetail?operNo=${de.operNo}" class="blue">查看限制归属</a>
		                                                </td>
		                                                <td style="text-align: center;">
		                                                   <a href="<%=request.getContextPath() %>/deviceLimit/logVersionDetail.do?operNo=${de.operNo}" class="blue">查看版本号</a>
		                                                </td>
		                                                <td style="text-align: center;">
		                                                   <c:if test="${de.tranType == '01' }">入库</c:if>
														   <c:if test="${de.tranType == '11' }">签到</c:if>
														   <c:if test="${de.tranType == '00' }">入库,签到</c:if>
		                                                </td>
		                                                <td style="text-align: center;">${de.beginDate}</td>
		                                                <td style="text-align: center;">${de.storeDate}</td>
		                                                <td style="text-align: center;">${de.empNm}</td>
		                                                <td style="text-align: center;">${de.operTime}</td>
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
                        </div>
                       
                    </div>
                     
                </div>
                    
                     
            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->
              
    <%@include file="../../layout/common.alljs.jsp"%>
    <script type="text/javascript">
    function closeThisWin(){
    	parent.$.fancybox.close();
    }
	</script>
</body>
</html>











