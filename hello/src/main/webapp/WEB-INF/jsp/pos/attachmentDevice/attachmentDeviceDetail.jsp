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

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        设备数据明细信息
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="">
                                                <div class=" col-xs-12 no-padding">

                                                    <div class="tabbable">
                                                        <ul id="myTab4" class="nav nav-tabs padding-12 tab-color-blue background-blue">
                                                            <li class="active">
                                                                <a href="#home4" data-toggle="tab" aria-expanded="true">设备信息</a>
                                                            </li>
                                                            <c:if test="${mf.goodsId == '001' }">
	                                                            <li>
	                                                                <a href="#home5" data-toggle="tab" aria-expanded="false">pos附加信息表</a>
	                                                            </li>
                                                            </c:if>
                                                            <c:if test="${mf.goodsId == '012' }">
	                                                            <li>
	                                                                <a href="#home6" data-toggle="tab" aria-expanded="false">SIM卡附加信息表 </a>
	                                                            </li>
                                                            </c:if>
                                                        </ul>

                                                        <div class="tab-content ">
                                                            <div class="tab-pane active no-padding" id="home4">
                                                                <div class="col-sm-12">
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备编码:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.deviceId }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备序列号:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.factSn }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备型号:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.modName }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商品类型:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.goodsName }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >终端号:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.posNum }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.mercId }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户名称:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.mercName }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >厂商简称:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.factShortNm }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备状态:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.statusStr }</label>
                                                                        </div>
                                                                    </div>
                                                                  <c:if test="${mf.goodsId=='001' }">
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >非接功能:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.noncontact==1?'支持':'不支持'}</label>
                                                                        </div>
                                                                    </div>
                                                                  </c:if>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >新旧程度:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.statusIIStr }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属机构:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.orgName }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否携机入网:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.mercOwnStr }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >持有人:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.deviceOwnStr }</label>
                                                                        </div>
                                                                    </div>
																	<div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >运营经理:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.operMgrName }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备归属机构:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.orgName }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >创建人:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.createUser }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >创建日期:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${mf.createTime}" type="date" pattern="yyyy-MM-dd"/></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >修改人:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.modifyUser }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >修改日期:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${mf.modifyTime}" type="date" pattern="yyyy-MM-dd"/></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >绑定设备号(附件):</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.bindDeviceId }</label>
                                                                        </div>
                                                                    </div>
                                                                   <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >安装人:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.installName }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >安装地址:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.address }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >安装日期:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${mf.installDate}" type="date" pattern="yyyy-MM-dd" /></label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >领用人:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.receName }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >领用日期:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${mf.receDate}" type="date" pattern="yyyy-MM-dd " /></label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >入库人:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.returnName }</label>
                                                                        </div>
                                                                    </div>
  																	<div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >入库日期:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${mf.storageDate}" type="date" pattern="yyyy-MM-dd" /></label>
                                                                        </div>
                                                                    </div>
                                                                      <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >回库日期:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${mf.returnDate }" type="date" pattern="yyyy-MM-dd" /></label>
                                                                        </div>
                                                                    </div>
                                                                      <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >退货人:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.returnGoodsName }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >退货日期:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${mf.returnGoodsDate }" type="date" pattern="yyyy-MM-dd" /></label>
                                                                        </div>
                                                                    </div>
													                                                                    
														          </div>
                                                             
                                                            </div>
                                                            <c:if test="${mf.goodsId == '001' }">
															<div class="tab-pane" id="home5">
                                                                 <div class="col-sm-12">
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易状态:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.tradeStatusStr }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签到日期:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${mf.signDate}" type="date" pattern="yyyy-MM-dd" /></label>
                                                                        </div>
                                                                    </div>
                                                                   <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >软件版本:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.systemVer }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >会员模式:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.memberModel }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备类型:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.trmTypeStr }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >押金:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.dpsAmt }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >参数模式:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.connMod }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >允许的币种:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.perCcyStr }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >权限认证:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.prvFlgStr }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >银联标准地区码:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.rardCd }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联机退货标志:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.rfdFlgStr }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >C端访问增值服务方式:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.offFlgStr }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >通讯方式:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    <c:if test="${mf.connTy eq -1 }">全部</c:if>
																					<c:if test="${mf.connTy eq 0 }">GPRS</c:if>
																					<c:if test="${mf.connTy eq 1 }">拨号</c:if>
																					<c:if test="${mf.connTy eq 2 }">以太网</c:if>
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >位置服务区识别码:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.lai }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >小区基站编码:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.cid }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经度:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.longitude }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >纬度:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.latitude }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >公网MAC地址:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.macAddr }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >公网IP地址:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.ipAddr }</label>
                                                                        </div>
                                                                    </div>
                                                                   
                                                                 </div>
                                                            </div>
                                                            </c:if>
                                                            <c:if test="${mf.goodsId == '012' }">
                                                            <div class="tab-pane" id="home6">
                                                                 <div class="col-sm-12">
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >开卡时间:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${mf.openDate}" type="date" pattern="yyyy-MM-dd" /></label>
                                                                        </div>
                                                                    </div>
                                                                   <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >运营商所在地:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.operSeat }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >电话号码:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.telNum }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >流量(单位:兆):</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.flow }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >IMSI 号:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.imsi }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >付费时间(单位：月):</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.userMonth }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >购买时间:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${mf.buyDate}" type="date" pattern="yyyy-MM-dd" /></label>
                                                                        </div>
                                                                    </div>
                                                                      <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >付费方式:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.simTypeStr }</label>
                                                                        </div>
                                                                    </div>
                                                                      <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >超流量计费:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.euFee }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >通讯方式:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mf.commTypeCStr }</label>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                 </div>
                                                            </div>
                                                            </c:if>
                                                        </div>
                                                    </div>    


                                                </div>



                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">

                                                    <button class="btn  btn-sm" type="button" onclick="javascript:closewin();">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
                                                        关闭
                                                    </button>
                                                </div>


                                            </form>
                                        </div>
                                    </div>
                                </div>
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

<!-- basic scripts -->

    <%@include file="../../layout/common.js.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">
    
    function closewin(){
    	parent.$.fancybox.close();
    }

    $('.chosen-select').chosen({});
    jQuery(function($) {
        $('[data-rel=popover]').popover({container:'body'});
        $('#searchForm').bootstrapValidator({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                firstName: {
                    validators: {
                        notEmpty: {},
                        stringCase: {
                            'case': 'upper'
                        }
                    }
                },
                lastName: {
                    validators: {
                        notEmpty: {},
                        stringCase: {
                            'case': 'upper'
                        }
                    }
                },
                username: {
                    validators: {
                        notEmpty: {},
                        stringLength: {
                            min: 6,
                            max: 20
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/
                        },
//                        remote: {
//                            url: 'remote.php',
//                            message: 'Tên tài khoản này đã được đăng ký'
//                        },
                        different: {
                            field: 'email',
                            message: 'The username and password cannot be the same as each other'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {},
                        emailAddress: {}
                    }
                },
                password: {
                    validators: {
                        notEmpty: {},
                        identical: {
                            field: 'confirmPassword'
                        },
                        different: {
                            field: 'username',
                            message: 'Mật khẩu và tên đăng nhập phải khác nhau'
                        }
                    }
                },
                confirmPassword: {
                    validators: {
                        notEmpty: {},
                        identical: {
                            field: 'password'
                        },
                        different: {
                            field: 'username',
                            message: 'Mật khẩu và tên đăng nhập phải khác nhau'
                        }
                    }
                },
                age: {
                    validators: {
                        notEmpty: {},
                        digits: {},
                        greaterThan: {
                            value: 18
                        },
                        lessThan: {
                            value: 100
                        }
                    }
                },
                website: {
                    validators: {
                        notEmpty: {},
                        uri: {}
                    }
                },
                phoneNumber: {
                    validators: {
                        notEmpty: {},
                        digits: {},
                        phone: {
                            country: 'US'
                        }
                    }
                },
                gender: {
                    validators: {
                        notEmpty: {}
                    }
                },
                'languages[]': {
                    validators: {
                        notEmpty: {}
                    }
                },
                'programs[]': {
                    validators: {
                        choice: {
                            min: 2,
                            max: 4
                        }
                    }
                }
            }
        });

        $('.easy-pie-chart.percentage').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
            var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
            var size = parseInt($(this).data('size')) || 50;
            $(this).easyPieChart({
                barColor: barColor,
                trackColor: trackColor,
                scaleColor: false,
                lineCap: 'butt',
                lineWidth: parseInt(size/10),
                animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
                size: size
            });
        })

        $('.sparkline').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
            $(this).sparkline('html',
                {
                    tagValuesAttribute:'data-values',
                    type: 'bar',
                    barColor: barColor ,
                    chartRangeMin:$(this).data('min') || 0
                });
        });
        //show the dropdowns on top or bottom depending on window height and menu position
        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
            var offset = $(this).offset();

            var $w = $(window)
            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                $(this).addClass('dropup');
            else $(this).removeClass('dropup');
        });



        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        })
//show datepicker when clicking on the icon
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
//or change it into a date range picker
        $('.input-daterange').datepicker({autoclose:true});
//to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
        $('input[name=date-range-picker]').daterangepicker({
            'applyClass' : 'btn-sm btn-success',
            'cancelClass' : 'btn-sm btn-default',
            locale: {
                applyLabel: 'Apply',
                cancelLabel: 'Cancel'
            }
        })
            .prev().on(ace.click_event, function(){
                $(this).next().focus();
            });
        $('#timepicker1').timepicker({
            minuteStep: 1,
            showSeconds: true,
            showMeridian: false
        }).next().on(ace.click_event, function(){
            $(this).prev().focus();
        });
        $('#date-timepicker1').datetimepicker().next().on(ace.click_event, function(){
            $(this).prev().focus();
        });


        $(".fancybox-manual-b").click(function() {
            $.fancybox.open({
                href : 'detail.html',
                type : 'iframe',
                scrolling:'no',
                scrollOutside:false,
                model :true,
                minWidth:400,
                width:900,
                height:400,
                autoHeight:true,
                autoWidth:true,
                closeBtn:true,
                padding : 5
            });
        });
        //$('#sidebar').addClass('compact');



    })
</script>
</body>
</html>











