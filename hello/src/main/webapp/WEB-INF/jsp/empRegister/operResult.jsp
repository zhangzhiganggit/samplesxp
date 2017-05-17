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
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                
                                <c:if test="${result1 == true }">
                                	<div class="widget-header">
	                                    <h5 class="widget-title bigger">
	                                        <i class="ace-icon fa fa-table"></i>
	                                        操作结果
	                                    </h5>
                                	</div>
	                                <div class="widget-body">
	                                	<h3 class="smaller lighter green inline">${message}&nbsp;&nbsp;</h3>
	                                	<label style="font-size: 15px;color: green;"><%-- <a href="${returnUrl}" id="returnLink">&nbsp;&nbsp;点击立即返回</a> --%></label>
	                                </div>
                                </c:if>
                                <c:if test="${result2 == true }">
                                	<div class="widget-header">
	                                    <h5 class="widget-title bigger">
	                                        <i class="ace-icon fa fa-table"></i>
	              	操作失败
	                                    </h5>
                                	</div>
	                                <div class="widget-body">
										<div class="widget-main no-padding ">
											<table
												class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
												<thead class="thin-border-bottom">
													<tr>
														<th style="text-align: center; width: 40%">业务员编号</th>
														<th style="text-align: center; width: 60%">原因</th>
													</tr>
												</thead>
	
												<tbody>
													<c:forEach items="${reasonList }" var="reason">
														<tr>
															<td style="text-align: center;">${reason.empNo }</th>
															<td style="text-align: center;">${reason.reason }</th>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../layout/common.alljs.jsp"%>
</body>
</html>











