<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp"%>
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

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        审单人员管理-维护记录
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" method="post" action="<%=base%>centerCManage/changeHistory.do">
                                            <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="total" value="${pageInfo.getTotal()}" >
												<input type="hidden" name="targetUuid" value="${targetUuid}" >
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-800px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >审单员账号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${loginId}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${loginId}</label>
                                                        </div>
                                                        <button class="btn btn-danger btn-sm" type="button" onclick="window.parent.$.fancybox.close();">
															<span
																class="ace-icon fa  icon-on-right bigger-110"></span>
															返回
														</button>
                                                    </div>

                                                    

                                                </div>
                                                
                                                <div class="col-sm-12">
                                                    <h3 class="header smaller lighter green">修改内容</h3>
                                                    <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                                        <thead class="thin-border-bottom">
                                                        <tr>
                                                            <th width="25%">日期</th>
                                                            <th width="25%">修改人</th>
                                                            <th width="25%">功能入口</th>
                                                            <th width="25%">操作</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${list}" var="his">
	                                                        <tr>
	                                                            <td align="center">${his.updateTimeStr }</td>
	                                                            <td>${his.empNm}</td>
	                                                            <td>${his.fromFunction }</td>
	                                                            <td>
	                                                                <div class="   action-buttons">
	                                                                    <a class="blue" href='<%=base%>centerCManage/changeDetail.do?historyId=${his.historyId }'>查看详情</a>
	                                                                </div>
	                                                            </td>
	                                                        </tr>
                                                        </c:forEach>
                                                       
                                                       

                                                        </tbody>
                                                     </table>

                                                </div>
                                                



                                                <div class="row"></div>
                                                

                                            </form>
                                        </div>
                                    </div>
                                </div>
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
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->



<!-- basic scripts -->

    <%@include file="../layout/common.js.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">

	</script>
</body>
</html>











