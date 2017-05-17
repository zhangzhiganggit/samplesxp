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
                                        详细信息
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" method="post" action="/posSimMapping/detail">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="total" value="${pageInfo.getTotal()}" >
												<input type="hidden" name="factSn" value="${factSn }">
												<input type="hidden" name="bindTime" value="${bindTime}" >
												<input type="hidden" name="factId" value="${factId}" >
												<input type="hidden" name="inMno" value="${inMno }">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-800px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${branchNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${branchNm }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-800px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属一代:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${topAgentOrgNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${topAgentOrgNm }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-800px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属二代:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${secOrgNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${secOrgNm }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-800px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >绑定时间:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${bindTime}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${bindTime} </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-sm-12">
                                                    <h3 class="header smaller lighter green">历史纪录</h3>
                                                    <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                                        <thead class="thin-border-bottom">
                                                        <tr>
                                                            <th width="33%">历史绑定时间</th>
                                                            <th width="33%">IMSI号码</th>
                                                            <th width="34%">IMEI号码</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${list}" var="item">
	                                                        <tr>
	                                                            <td align="center">
	                                                                ${item.bindTime }   
	                                                            </td>
	                                                            <td align="center">${item.imsi}</td>
	                                                            <td  align="center">${item.imei}</td>
	                                                        </tr>
                                                        </c:forEach>
                                                       
                                                        </tbody>
                                                     </table>
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">

                                                    <button class="btn  btn-sm" type="button" onclick="javascript:closewin();">
                                                       <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
                                                                                                                                                            关闭
                                                    </button>
                                                </div>
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
    <script type="text/javascript">
	    function closewin(){
	    	parent.$.fancybox.close();
	    }
    </script>
</body>
</html>











