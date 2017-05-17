<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
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
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable">
								<div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        	 商户历史记录展示
                                    </h5>
                                </div>
                                  <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
												<th style="text-align: center;width: 8%">任务编号</th>
                                                <th style="text-align: center;width: 8%">商户编号</th>
                                                <th style="text-align: center;width: 7%">归属一代机构</th>
                                                <th style="text-align: center;width: 5%">直属机构</th>
                                                <th style="text-align: center;width: 8%">业务员编号</th>
                                                <th style="text-align: center;width: 8%">原归属一代机构</th>
                                                <th style="text-align: center;width: 7%">原直属机构</th>
                                                <th style="text-align: center;width: 5%">原业务员编号</th>
                                             	<th style="text-align: center;width: 5%">变更时间</th>
                                              
                                            </tr>
                                            </thead>
                                            <tbody>
                                           		<c:forEach items="${changRecordList}" var="record"  varStatus="status">
													<tr>
														<td style="text-align: center;">${record.taskCode }</td>
														<td style="text-align: center;">${record.inMno }</td>
														<td style="text-align: center;">${record.toRootAgentOrgNo }</td>
														<td style="text-align: center;">${record.belongOrgNo }</td>
														<td style="text-align: center;">${record.toEmp }</td>
														<td style="text-align: center;">${record.fromRootAgentOrgNo }</td>
														<td style="text-align: center;">${record.preblongOrgNo }</td>
														<td style="text-align: center;">${record.fromEmp }</td>
														<td style="text-align: center;"><fmt:formatDate value="${record.inputDate}" type="date"/></td>
													</tr>
												</c:forEach> 
                                            </tbody>
                                        </table>
                                        <div class="row"></div>
										<div class="form-actions center widget-color-normal5">
											<button class="btn  btn-sm" type="button"
												onclick="javascript:closewin();">
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
	<a href="#" id="btn-scroll-up"
		class="btn-scroll-up btn btn-sm btn-inverse"> <i
		class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	</a>
	<%@include file="../../layout/common.alljs.jsp"%>
	<script type="text/javascript">
    function closewin(){
    		parent.$.fancybox.close();
    }
</script>
</body>
</html>











