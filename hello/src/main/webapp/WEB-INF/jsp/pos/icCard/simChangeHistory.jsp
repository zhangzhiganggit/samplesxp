<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                                        SIM卡管理-操作记录
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" method="post" action="/SimCard/history">
                                            <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="total" value="${pageInfo.getTotal()}" >
												<input type="hidden" name="factSn" value="${factSn}" >
												<input type="hidden" name="factId" value="${factId}" >
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-800px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >卡号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${factSn }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${factSn }</label>
                                                        </div>
                                                    </div>

                                                    

                                                </div>
                                                
                                                <div class="col-sm-12">
                                                    <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                                        <thead class="thin-border-bottom">
                                                        <tr>
                                                            <th width="8%">修改类型</th>
                                                            <th width="15%">操作前</th>
                                                            <th width="15%">操作后</th>
                                                            <th width="8%">操作人</th>
                                                            <th width="15%">操作日期</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${list}" var="item">
	                                                        <tr>
		                                                        <td align="center">${item.modifyName}</td>
		                                                        <td align="center">${item.sval}</td>
		                                                        <td align="center">${item.oval}</td>
		                                                        <td align="center">${item.modifyUser}</td>
	                                                            <td align="center">${item.modifyTime }</td>
	                                                            
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
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->

    <%@include file="../../layout/common.alljs.jsp"%>
</body>
</html>











