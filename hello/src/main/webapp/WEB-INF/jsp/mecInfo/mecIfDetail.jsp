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
                                        商户基本信息展示
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="">
                                            	<input type="hidden" id="inMno" value="${inMno }">
                                            	<input type="hidden" name="goodsData" id="goodsData" value=""/>
                                            	<input type="hidden" value="${minf.mecBusiType }" id="mecBusiType">
                                                <div class=" col-xs-12 no-padding">

                                                    <div class="tabbable">
                                                        <ul id="myTab4" class="nav nav-tabs padding-12 tab-color-blue background-blue">
                                                            <li class="active">
                                                                <a href="#home4" data-toggle="tab" aria-expanded="true">基本信息</a>
                                                            </li>

                                                            <li class="">
                                                                <a href="#profile4" data-toggle="tab" aria-expanded="false">资质信息</a>
                                                            </li>

                                                            <li>
                                                                <a href="#dropdown14" data-toggle="tab">结算信息</a>
                                                            </li>

                                                            <li>
                                                                <a href="#dropdown15" data-toggle="tab">费用信息</a>
                                                            </li>
                                                            <c:if test="${pbCheck == false }">	
                                                            <li>
                                                                <a href="#dropdown16" data-toggle="tab">功能开通</a>
                                                            </li>
															</c:if>
                                                            <li>
                                                                <a href="#dropdown17" data-toggle="tab">POS信息</a>
                                                            </li>
                                                           <c:if test="${minf.mecTyp == '02'}">
                                                            <li>
                                                                <a href="#dropdown18" data-toggle="tab">手刷商户信息</a>
                                                            </li> 
                                                            </c:if>
                                                           <!--  <li>
                                                                <a href="#dropdown18" data-toggle="tab">测试</a>
                                                            </li> -->
                                                        </ul>

                                                        <div class="tab-content ">
                                                            <div class="tab-pane active no-padding" id="home4">
                                                                <div class="col-sm-12">
                                                                    <div class="form-group form-group-sm width-300px">
                                                                    	<input type="hidden" id="agreementNo" value="${mstl.agrNo }">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >协议编号:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mstl.agrNo }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户类型:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.mercModStr }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联系人:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mstl.cttPsnCnm }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >特殊商户:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    <c:if test="${minf.isXw eq '00'}">普通商户</c:if><c:if test="${minf.isXw eq '01'}">小微商户</c:if><c:if test="${minf.isXw eq '02'}">差错商户</c:if>
                                                                                    </label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联系人电话:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mstl.mblTel }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经营名称:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.cprOperNmCn }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户客服电话:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.csTelNo }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签购单名称:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.mecDisNm }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户客服手机:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.mercOprMbl }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经营地址:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="${minf.busAddr }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.busAddr }</label>
                                                                        </div>
                                                                    </div>
                                                                    <c:if test="${pbCheck==false }">
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户扩展类型:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.mercSrcStr }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户扩展员:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.cusMgrNm }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经度:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${locMapLong }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >纬度:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${locMapLat }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >拓展员编号:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.cusMgr }</label>
                                                                        </div>
                                                                    </div>
                                                                    </c:if>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >实际经营范围:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.nmgtScp }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >行业大类:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.mercTrdDesc }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px" style="display: none">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >费率:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mfee.rat1 }%</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >营业时间:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.busStrHourStr }至${minf.busEndHourStr }</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >营业用地面积:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.busArea }(平米)</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px" style="display: none;">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否封顶:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mfee.mercFeecapFlg }</label>
                                                                        </div>
                                                                    </div>
																	<div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户类别:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><c:if test="${minf.mecBusiType == 01}">标准商户</c:if>
                                                                                    <c:if test="${minf.mecBusiType == 02}">优惠商户</c:if>
                                                                                    <c:if test="${minf.mecBusiType == 03}">减免商户</c:if>
                                                                                    <c:if test="${minf.mecBusiType == 04}">特殊优惠类</c:if>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                    <c:if test="${mfee.mercFeecapFlg eq '封顶' }">
																	<div class="form-group form-group-sm width-300px" style="display: none;">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >封顶金额:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mfee.mfa }</label>
                                                                        </div>
                                                                    </div>
																	</c:if>
																	<c:if test="${pbCheck ==false }">
													                <div id="newMccInfoDiv" class="col-sm-12" style="margin-left: -25px"></div>
													                </c:if>
														          </div>
                                                                <div class="col-sm-12 no-padding">
                                                                    <table class="table table-striped table-bordered table-hover dataTable   DTTT_selectable">
                                                                        <thead class="thin-border-bottom">
                                                                        <tr>
                                                                        
                                                                        <th align="center">POS通讯方式</th>
							                                           <th align="center">POS型号</th>
							                                          <th align="center">POS数量(台)</th>
						                                             	<th align="center">POS终端租赁费(元/台)</th>
							                                          <th align="center">是否带密码键盘</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody>
													                       <c:forEach items="${madi }" var="madi">
																			<c:if test="${madi.mercPos1 > 0 }">
																					<tr >
																						<td style="border:1px solid  #969696;">
																							<c:if test="${madi.posMesMod1 eq '01' }">GPRS</c:if>
																							<c:if test="${madi.posMesMod1 eq '00' }">拨号</c:if>
																	                        <c:if test="${madi.posMesMod1 eq '02' }">以太网</c:if>
																	                        <c:if test="${madi.posMesMod1 eq '03' }">TD-LTE</c:if>
																	                        <c:if test="${madi.posMesMod1 eq '04' }">CDMA</c:if>
																	                        <c:if test="${madi.posMesMod1 eq '05' }">CDMA2000</c:if>
																	                        <c:if test="${madi.posMesMod1 eq '06' }">WCDMA</c:if>
																	                        <c:if test="${madi.posMesMod1 eq '07' }">TD_SCDMA</c:if>
																	                        <c:if test="${madi.posMesMod1 eq '08' }">WIFI</c:if>
																	                        <c:if test="${madi.posMesMod1 eq '09' }">FDD-LTE</c:if>
																						</td>
																						<td style="border:1px solid  #969696;">
																							${madi.modNm1 }
																						</td>
																						<td style="border:1px solid  #969696;">${madi.mercPos1 }</td>
																						<td style="border:1px solid  #969696;">${madi.posFee1 }</td>
																						<td style="border:1px solid  #969696;"><c:if test="${madi.posPswFlg1 eq '00'}">否</c:if><c:if test="${madi.posPswFlg1 eq '01'}">是</c:if></td>
																					</tr>
																				</c:if>
																			</c:forEach>
													
													                  </tbody></table>
                                                                </div>
                                                            </div>


                                                            <div class="tab-pane" id="profile4">
                                                                <div class="col-sm-12">
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册名称:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.cprRegNmCn }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户性质:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.mercTypStr }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册地址:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.regAddr }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册登记号:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.regId }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >营业执照期限:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    <c:if test="${minf.busExpFlg eq '00' }">${minf.busStrDt }至${minf.busExpDt }</c:if><c:if test="${minf.busExpFlg eq '01' }">长期有效</c:if> 
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法定代表姓名:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.crpNm }</label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法人证件类型:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    
                                                                                    <c:if test="${minf.crpIdTyp eq '00' }">身份证</c:if>
																					<c:if test="${minf.crpIdTyp eq '03' }">军人证</c:if>
																					<c:if test="${minf.crpIdTyp eq '04' }">警察证</c:if>
																					<c:if test="${minf.crpIdTyp eq '05' }">港澳居民往来内地通行证</c:if>
																					<c:if test="${minf.crpIdTyp eq '06' }">台湾居民来往大陆通行证</c:if>
																					<c:if test="${minf.crpIdTyp eq '07' }">护照</c:if>
																					<c:if test="${minf.crpIdTyp eq '99' }">其他</c:if>
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法人证件号码:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${minf.crpIdNo }</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法人证件期限:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    <c:if test="${mfee.crpidExpFlg eq '01' }">长期有效</c:if><c:if test="${mfee.crpidExpFlg eq '00' }">${mfee.crpidStrDt}至${mfee.crpidExpDt}</c:if>
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                     <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >税务登记号:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    ${minf.taxRegNo }
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                
                                                                </div>
                                               
                                                            </div>

                                                            <div class="tab-pane" id="dropdown14">
                                                                 <div class="col-sm-12">
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >可隔日对账:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    <c:if test="${minf.sattleFlag eq '0'}">不允许</c:if><c:if test="${minf.sattleFlag eq '1'}">允许</c:if>
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                    <c:if test="${pbCheck==false }">
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算天数:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    <c:if test="${mstl.stlTrfDays eq '1'}">T+1</c:if><c:if test="${mstl.stlTrfDays eq '3'}">T+3</c:if>
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                    </c:if>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >起始金额(元):</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    ${mstl.stlBegAmt }
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                 </div>
                                                            </div>
                                                            
                                                            
                                                            <div class="tab-pane" id="dropdown15">
                                                                 <div class="col-sm-12">
                                                                 <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否收取维护费:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    <c:if test="${mfee.maintChargeFlg eq '01' }">收取</c:if><c:if test="${mfee.maintChargeFlg eq '00' }">不收</c:if>
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                    <c:if test="${mfee.maintChargeFlg eq '01' }">
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收取金额:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                   ${minf.mtfee }
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                    </c:if>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >押金:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                   ${minf.mercDpsAmt }
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                 </div>
                                                            </div>
                                                            <c:if test="${pbCheck==false }">
                                                                <div class="tab-pane" id="dropdown16">
                                                                 <div class="col-sm-12">
<!--                                                                  <div class="form-group form-group-sm width-300px"> -->
<!--                                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >高汇通储值卡:</label> -->

<!--                                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                                             <label class="form-control input-small width-200px   view-control  " -->
<!--                                                                                    data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover" -->
<!--                                                                                     > -->
<%--                                                                                     ${minf.acqTypGao } --%>
<!--                                                                                     </label> -->
<!--                                                                         </div> -->
<!--                                                                     </div> -->
<!--                                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >北京中行外卡:</label> -->

<!--                                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                                             <label class="form-control input-small width-200px   view-control  " -->
<!--                                                                                    data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover" -->
<!--                                                                                     > -->
<%--                                                                                   ${minf.mercTxnClsStr } --%>
<!--                                                                                     </label> -->
<!--                                                                         </div> -->
<!--                                                                     </div> -->
                                                                    
<%--                                                                     <c:if test="${minf.mercTxnClsStr eq '已开通' }"> --%>
				
<%-- 																	<c:if test="${minf.mercTxnClsStr1 eq '1111' }"> --%>
<!-- 																	<div class="form-group form-group-sm width-300px"> -->
<!--                                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >一般刷卡</label> -->
<!--                                                                     </div> -->
<%-- 							                                       </c:if> --%>
<%-- 							                                       <c:if test="${minf.mercTxnClsStr2 eq '1111' }"> --%>
<!-- 																	<div class="form-group form-group-sm width-300px"> -->
<!--                                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >预授权</label> -->
<!--                                                                     </div> -->
<%-- 							                                       </c:if> --%>
<%-- 							                                       <c:if test="${minf.mercTxnClsStr3 eq '1' }"> --%>
<!-- 																	<div class="form-group form-group-sm width-300px"> -->
<!--                                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >在线退货</label> -->
<!--                                                                     </div> -->
<%-- 							                                       </c:if> --%>
<%-- 					                                               </c:if> --%>
                                                                    
                                                                    
<!--                                                                     <div class="form-group form-group-sm width-300px"> -->
<!--                                                                         <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >北京交行外卡:</label> -->

<!--                                                                         <div class="col-sm-8  no-padding"  > -->
<!--                                                                             <label class="form-control input-small width-200px   view-control  " -->
<!--                                                                                    data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover" -->
<!--                                                                                     > -->
<%--                                                                                   ${minf.acqTypBcStr } --%>
<!--                                                                                     </label> -->
<!--                                                                         </div> -->
<!--                                                                     </div> -->
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >非工作日结算:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                 ${minf.d1 }
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >开通随意通:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                ${minf.t0 }
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >开通即日付:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                ${minf.TP }
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                 </div>
                                                            </div>
                                                            </c:if>
                                                            <div class="tab-pane" id="dropdown17">
                                                                 <div class="col-sm-12">
                                                                 <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >共申请POS:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    				${posCntCountInt } 台
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >其中无线:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                   ${mercPosCnt2IntG } 台
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >有线:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                   ${mercPosCnt2IntL } 台
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >共绑定POS:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                   ${posListsBindedSize } 台
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >无线:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                   ${posListsBindedCountG } 台
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >有线:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                   ${posListsBindedCountL } 台
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                 </div>
                                                                 
                                                                  <div class="col-sm-12 no-padding">
                                                                    <table class="table table-striped table-bordered table-hover dataTable   DTTT_selectable">
                                                                        <thead class="thin-border-bottom">
                                                                        <tr>
                                                                        
                                                                        <th align="center">机具型号</th>
							                                           <th align="center">终端号</th>
							                                          <th align="center">终端序列号</th>
						                                             	<th align="center">密码键盘型号</th>
							                                          <th align="center">密码键盘序列号</th>
							                                           <th align="center">SIM卡号</th>
                                                                        </tr>
                                                                        </thead>
                                                                        <tbody>
													                       <c:forEach items="${posListsBinded }" var="pos">
																			<tr>
							<td style="border:1px solid  #969696;">${pos.modNm }</td>
							<td style="border:1px solid  #969696;">${pos.trmNo }</td>
							<td style="border:1px solid  #969696;">${pos.trmSn }</td>
							<td style="border:1px solid  #969696;">${pos.modKeyNm }</td>
							<td style="border:1px solid  #969696;">${pos.modKeySeriNo }</td>
							<td style="border:1px solid  #969696;">${pos.simNo }</td>
						</tr>
																			</c:forEach>
													
													                  </tbody></table>
                                                                </div>
                                                            </div>
                                                            
                                                                  <!-- 手刷信息 -->
                                                           <c:if test="${minf.mecTyp == '02'}">
                                                            <div class="tab-pane" id="dropdown18">
                                                                 <div class="col-sm-12">
                                                          
                                                                   <!-- 此处填写验证信息 -->
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >认证信息:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    <c:if test="${minf.mecSsAuthSts == '00'}">未认证</c:if>
                                                                                    <c:if test="${minf.mecSsAuthSts == '01'}">已认证</c:if>
                                                                                    <c:if test="${minf.mecSsAuthSts == '02'}">异常</c:if>
                                                                                    <c:if test="${minf.mecSsAuthSts == '03'}">审核中</c:if>
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                                                                                <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    ${minf.mno }
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                                                                                <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >手机号:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    ${mstl.mblTel }
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                    <!-- 验证不通过隐藏 -->
                                                                    <c:if test="${minf.mecSsAuthSts == '01'}">
                                                                  <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >姓名:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    ${mstl.cttPsnCnm }
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                    </c:if>
                                                                 </div>
                                                            </div>
                                                          </c:if> 
                                                           <!-- 手刷信息 --> 
                                                        </div>
                                                    </div>    


                                                </div>



                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">

                                                    <button class="btn btn-default btn-sm" type="button" onclick="javascript:closewin();">
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
                    </div>
                </div>



            </div>
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->

   <%@include file="../layout/common.alljs.jsp"%>
   <script type="text/javascript" src="<%=request.getContextPath() %>/js/ejs/ejs_production.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/ejs/ejs_fulljslint.js"></script>
    <script type="text/javascript">
    
    jQuery(function($) {
		var inMno = $("#inMno").val();
		var agreementNo = $("#agreementNo").val();
		var mecBusiType = $("#mecBusiType").val();
		getCurrentRateAgreement(inMno,agreementNo,mecBusiType);
	})
	/* 回显费率信息 */
	 function getCurrentRateAgreement(inMno,agreementNo,mecBusiType) {
    		$.ajax({
            url: '/mecIf/getMecAgreementByMerc',
            data:{
            	inMno:inMno,
            	agreementNo:agreementNo,
            	mecBusiType:mecBusiType
            },
            async : true,
            cache: true,
            success : function(resultJson) {
            	 $('#newMccInfo').val(resultJson);
            	resultJson = eval('('+resultJson+')');
            	resultJson.data.justView = true;
               	resultJson.data.preset = false;
            	resultJson.data.effDt = '';
        		var template = $('#template').val();
        		// {url : '/js/ejs/goods.ejs'}
        		var innerHtml = new EJS({
        			// text : template,
        			url : '<%= request.getContextPath()%>/js/ejs/goods.txt'
        		}).render(resultJson.data);
    		    $('#goodsData').val(JSON.stringify(resultJson));
    		 	$('#newMccInfoDiv').html(innerHtml);
            }
    	});
    }
    
    function closewin(){
    	parent.$.fancybox.close();
    }

   
</script>
</body>
</html>











