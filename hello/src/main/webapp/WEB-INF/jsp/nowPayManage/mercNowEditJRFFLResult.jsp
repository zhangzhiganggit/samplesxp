<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.css.jsp"%>
    <%@include file="../layout/common.js.jsp"%>
</head>

<body class="no-skin " >
    <!-- 导入即日付费率结果 -->

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
                                       即日付费率批量修改结果
                                    </h5>

                                </div>
                                <div class="widget-body">
                                
                                
                                <div class="widget-box widget-color-normal2" style="opacity: 1; height:35px;font-size:14px;line-height:30px;">&nbsp;&nbsp;
                                	${resultInfo }
                                	<div class="pull-right">
                                		<button id="exportBtn" class="btn btn-primary btn-sm " type="button" onclick="downLoadResult()">
														<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
														导出
													</button><div class="pull-right" style="width:5px;"></div></div>
                                </div>
                                
                                  <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecIfDayPay/importJRFFLExcel" id="resultForm" method="post">
                                  <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                  <input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                  <input type="hidden" name="mno" value="${mf.mno}" >
                                  <input type="hidden" name="inMno" value="${mf.inMno}" >
                                  <input type="hidden" name="stlTyp" value="02" >
                                  
                                  <input type="hidden" id="resultPageNum" name="resultPageNum" value="${resultPageNum }" >
                                  <input type="hidden" id="resultPageSize" name="resultPageSize" value="${resultPageSize }" >
                                  <input type="hidden" id="resultPageCount" name="resultPageCount" value="${resultPageCount }" >
                                  
                                  </form>
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable" id="bankLinkTable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 10%">序号</th>
                                                <th style="text-align: center;width: 15%">商户编号</th>
                                                <th style="text-align: center;width: 15%">修改后费率</th>
                                                <th style="text-align: center;width: 15%">操作结果</th>
                                                <th style="text-align: center;">原因</th>
                                            <!--    <th style="text-align: center;width: 20%">商户名称</th> --> 
                                             <!--     <th style="text-align: center;width: 12%">修改前费率</th> --> 
                                              <!--    <th style="text-align: center;width: 12%">修改后费率</th> -->
                                              <!--    <th style="text-align: center;width: 11%">操作员</th> -->
                                              <!--    <th style="text-align: center;width: 20%">操作时间</th> -->
                                            </tr>
                                            </thead>
                                              <tbody>
                                            	<c:forEach var="tl" items="${errDatas}" varStatus="status">
                                            		<tr>
                                            		    <td style="text-align: center;">${status.index+1 }</td> 
		                                                <td style="text-align: center;">${tl.mno }</td>
		                                                <td style="text-align: center;">${tl.jrffl }</td>
		                                                <td style="text-align: center;">${tl.status }</td>
		                                                <td style="text-align: left;">${tl.reason}</td>
	                                                </tr>
	                                               
	                                                
                                            	</c:forEach>
                                            </tbody>
                                        </table>

                                    </div>
							
                                </div>
                                
                            </div>
                          
                        </div>
                       <div class="row no-margin">
							<!-- 分页导航 -->
							
								<div class="col-sm-5 hidden-480 left no-padding">
									<c:choose>
										<c:when test="${resultTotalCount == 0}">
											<div class="inline">
											记录数：0
											</div>
										</c:when>
										<c:otherwise>
											<div class="inline">
											记录数：${resultPageBegin }-${resultPageend } of ${resultTotalCount } 共：${resultPageCount }页。每页显示：
											</div>
											<div class="inline">
												<select id="_pSize" class=" form-control " style="width:70px ;height:25px" onchange="onChange4PageSize()">
													<option value="20" <c:if test="${resultPageSize == 20}">selected="selected"</c:if>>20</option>
													<option value="50" <c:if test="${resultPageSize == 50}">selected="selected"</c:if>>50</option>
													<option value="100" <c:if test="${resultPageSize == 100}">selected="selected"</c:if>>100</option>
												</select>
											</div>
										</c:otherwise>
									</c:choose>
									</div>
								<div class="col-sm-6 pull-right no-padding">
									<div id="pagination" class="dataTables_paginate paging_simple_numbers clearfix pull-right">
										<nobr>
											<ul class="pagination no-padding">
												<li class="prev "><a href="#" onclick="pageA(-1)"> 上一页</a></li>
												<li class="next "><a href="#" onclick="pageA(1) ;return false ;">下一页</a></li>
											</ul>
											<div class="input-group pull-right col-sm-2">
												<input id="pageto" type="number" min="1" class="form-control p" style="height:31px;width:50px">
													<a href="$" class="input-group-addon" onclick="page($('#pageto').val());return false;">跳转</a></div></nobr></div>
								</div>
							</div>
							<form  action="<%=request.getContextPath()%>/nowPayManage/downLoadJRFFLResult" id="downLoadResultForm" method="post">
                                            </form>
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
    
    function pageA(toAdd) {
    	var currentPage = $("#resultPageNum").val();
    	if(parseInt(currentPage) + toAdd >= 1) {
    		page(parseInt(currentPage) + toAdd);
    	}
    }
    
    function page(tonum) {
    	if(typeof(tonum) == "undefined" || tonum=="") {
    		alert("跳转页不能为空");
    		return;
    	}
    	var currentPage = $("#resultPageNum").val();
    	var pageCount = $("#resultPageCount").val();
    	if(tonum == currentPage) {
    		return ;
    	} else if(tonum > pageCount) {
    		page(pageCount);
    		return ;
    	}
    	$("#resultPageNum").val(tonum);
    	submitFunc();
    }
    
    function onChange4PageSize() {
    	var pageSize = $("#_pSize").val();
    	$("#resultPageSize").val(pageSize);
    	submitFunc();
    }
    
    function submitFunc() {
    	var resultPageNum =  $("#resultPageNum").val();
    	var resultPageSize = $("#resultPageSize").val();
    	
    	document.getElementById("resultForm").action = "<%=request.getContextPath()%>/nowPayManage/importJRFFLExcel?resultPageNum=" + resultPageNum+"&resultPageSize=" + resultPageSize + "&resultCache=1";
    	document.getElementById("resultForm").submit();
    }
    //下载批量修改结果
    function downLoadResult() {
    	document.getElementById("downLoadResultForm").submit();
    	
    	//设置按钮不可用
    	var btnvar = document.getElementById("exportBtn");
    	btnvar.disabled = 'disabled';
    }
	</script>
</body>
</html>











