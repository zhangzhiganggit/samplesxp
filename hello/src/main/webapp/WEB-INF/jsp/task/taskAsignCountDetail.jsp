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
                                      办理中工单编号
                                    </h5>

                                </div>
                                <div class="widget-body">
                                 <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/taskCount/assignDetail.do" id="searchForm" method="post">
                                   <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                   <input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                   <input type="hidden" id="empNo" name="empNo" value="${dsm.empNo}" >
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable" id="bankLinkTable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;">工单编号</th>
                                            </tr>
                                            </thead>
                                              <tbody>
                                            	<c:forEach var="de" items="${list}" varStatus="status">
                                            		<tr>
														<td style="text-align: center;">${de.businessKey }</td>
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

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->
                 
        			  <div >	
        			  <center>
                                                    <button class="btn btn-danger btn-sm" type="button" onclick="closeThisWin()">
                                                        
                                                                                                       	返回
                                                                                                       
                                                     </button>
                      	</center>
                       </div>
                  
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">
    function closeThisWin(){
    	parent.$.fancybox.close();
    }
    
    function typeDetailShow(id,year,month){
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
  	  
    }
    
    function typeDetailShowB(id,year,month){
  	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/mecTradeSum/mecMonthList.do?empNo='+id+'&year='+year+'&month='+month+'&flg=1',
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











