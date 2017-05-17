<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>
    <%@include file="../../layout/common.jsp"%>
    <%@include file="../../common/taglib.jsp"%>
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
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3"  >
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        携机入网终端批量入库单明细
                                    </h5>
                                </div>
                                <div class="widget-body" >
                                            <div class="widget-main no-padding" >
                                            <div class="widget-main ">
                                            <form class="form-inline form-horizontal"  action="">
                                                <div class="col-xs-12" style="padding-top:2px">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >入库单号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " id="numTotal" style="text-align:right;">${deviceBatch.storageId }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >入库机构:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " id="priceTotal" style="text-align:right;">${deviceBatch.orgNm }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " id="contact" >
                                                            	<c:if test="${deviceBatch.status == 0 }">
                                                            		草稿
                                                            	</c:if>
                                                            	<c:if test="${deviceBatch.status == 1 }">
                                                            		入库
                                                            	</c:if>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >物品名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " id="contactTelNo">
                                                            	${deviceBatch.goodsName }
                                                            </label>
                                                        </div>
                                                    </div>
                                                 </div>
                                                    <div class="col-sm-12" style="padding-top:2px">
	                                                    <div class="form-group form-group-sm width-300px">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >审核人:</label>
	                                                        <div class="col-sm-8  no-padding "  >
	                                                            <label class="form-control input-small width-200px   view-control  " id="address">${deviceBatch.auditorId }</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px ">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >审核时间:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-200px   view-control  " id="remitDate">${deviceBatch.auditorDates}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px ">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >数量:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-200px   view-control  " id="remitDate">${deviceBatch.quantity}</label>
	                                                        </div>
	                                                    </div>
                                                    </div>
                                                    <div class=" col-xs-12">
	                                                    <div class="form-group form-group-sm width-300px ">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >备注:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                        	<label class="form-control input-small width-200px   view-control  " id="remiter" >${deviceBatch.remark}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px ">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >建立人:</label>
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label class="form-control input-small width-200px   view-control  " id="remitCardId">${deviceBatch.createUser}</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-300px ">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >建立时间:</label>
	                                                        <div class="col-sm-8  no-padding "  >
	                                                        	<label class="form-control input-small width-200px   view-control  " >${deviceBatch.createTimes}</label>
	                                                        </div>
	                                                    </div>
                                                 	</div>
                                                 	</form>
                                                 	</div>
                                                </div>
                              <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width: 10%">厂商编码</th>
                                                <th style="text-align:center;width: 10%">厂家简称</th>
                                                <th style="text-align:center;width: 10%">型号</th>
                                                <th style="text-align:center;width: 10%">设备序列号</th>
                                                <th style="text-align:center;width: 10%">是否支持非接</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                             <c:forEach items="${deviceBatchList}" var="deviceBatcha" varStatus="status">
													<tr>
														<td style="text-align:center">${deviceBatcha.factId}</td>
														<td style="text-align:center">${deviceBatcha.factShortName}</td>
														<td style="text-align:center">${deviceBatcha.modNm}</td>
														<td style="text-align:center">${deviceBatcha.factSn}</td>
														<td style="text-align:center" >
															<c:if test="${deviceBatcha.noncontact==1}" >支持</c:if>
									                        <c:if test="${deviceBatcha.noncontact==0}" >不支持</c:if>
														</td>
													</tr>
												</c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn  btn-sm" type="submit"  onclick="closeWin()">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
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
        </div><!-- /.main-content -->
    </div><!-- /.main-container -->
    <%@include file="../../layout/common.js.jsp"%>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    function closeWin(){
    	parent.$.fancybox.close();
    }
</script>
</body>
</html>











