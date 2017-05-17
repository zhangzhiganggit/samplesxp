<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>
    <%@include file="../../layout/common.jsp"%>
</head>

<body class="no-skin ">
    <div class="main-container" id="main-container">
        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
											提示信息
                                    </h5>
                                </div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<c:if test="${entry=='1'}">
												<h4>${msg}</h4>
											</c:if>
											<c:if test="${entry=='2'}">
												<div class="widget-main no-padding ">
													<table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
														<thead class="thin-border-bottom">
															<tr>
																<th style="text-align: center; width: 25%">机构编号</th>
																<th style="text-align: center; width: 25%">机构名称</th>
																<th style="text-align: center; width: 25%">操作结果</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${resultList }" var="result">
																<tr>
																	<td style="text-align: center;">${result.org_uuid}</td>
																	<td style="text-align: center;">${result.org_nm}</td>
																	<td style="text-align: center;">${result.result}</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</c:if>
											<div class="form-actions  widget-color-normal5 center">
												<button class="btn btn-default btn-sm" type="button" onclick="javascript:closewin();">
													<span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
													关闭
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>
    <%@include file="../../layout/common.js.jsp"%>
    <script type="text/javascript">
	    function closewin(){
	    	//parents.$.fancybox.close();
	    	parent.location.reload();
	    }
	</script>
</body>
</html>











