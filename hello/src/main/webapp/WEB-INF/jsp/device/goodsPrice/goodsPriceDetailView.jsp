<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
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
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">

                <form action="/goodsPriceManage/editGoodsPrice" id="editGoodsPriceForm" class="form-inline form-horizontal" method="post" enctype="multipart/form-data">
                <input type="hidden" name="modelId" value="${model.modId}">
                <input type="hidden" name="priceId"  value="${goodsPrice.priceId}">
                <!-- 满赠信息 -->
                <input type="hidden" name="freeLimitNum" id="freeLimitNum" value="${goodsPrice.freeLimitNum}">
                <input type="hidden" name="freeGiftsQuantity" id="freeGiftsQuantity" value="${goodsPrice.freeGiftsQuantity}">
                <input type="hidden" name="freeGiftsModelId" id="freeGiftsModelId" value="${goodsPrice.freeGiftsModelId}">
                 <input type="hidden"  id="freeModelId" value="${freeModel.modId}">
                 <input type="hidden" id="freeModelGoodsType" value="${freeModel.goodsType}">
                 <input type="hidden" id="freeModelGoodsId" value="${freeModel.goodsId}">
                 <input type="hidden"  id="freeModelFactory" value="${freeModel.factId}">
                  <input type="hidden"  id="freeModelGoodsName" value="${freeModel.goodsName}">
                <c:if test="${goodsPrice.priceStatus== null || goodsPrice.priceStatus== null}">
                   <input type="hidden" name="priceStatus" id="freeGiftsModelId" value="02">
                </c:if>
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									 <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
										设备基本信息
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">物品类型:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="goodsType"
																<c:if test="${model.goodsType==0}">value="终端设备"</c:if>
																<c:if test="${model.goodsType==1}">value="附件设备"</c:if>
																<c:if test="${model.goodsType==2}">value="配件设备"</c:if>
																<c:if test="${model.goodsType==3}">value="耗材"</c:if>
																id="goodsType"
																class="form-control input-small width-200px "
																data-placement="bottom" readonly="readonly">
														</div>
													</div>

													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">物品名称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" 
																value="${model.goodsName}" name="modName"
																id="modName"
																class="form-control input-small width-200px "
																data-placement="bottom"  readonly="readonly">
														</div>
													</div>
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">厂商简称:</label>
														<div class="col-sm-8  no-padding">
															<input type="text"
																class="form-control input-small width-200px "
																value="${model.factoryName}" name="factoryName"
																id="factoryName" data-placement="bottom"readonly="readonly">
														</div>
													</div>
													</div>
													<div class=" col-xs-12">
													<div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">型号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" 
																value="${model.subModelName}"
																class="form-control input-small width-200px "
																data-placement="bottom" readonly="readonly">
														</div>
													</div>

													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">状态:</label>

														<div class="col-sm-8  no-padding">
														
															<input type="text"  name="status"
																<c:if test="${goodsPrice.priceStatus=='01'}"> value="销售"</c:if>
																<c:if test="${goodsPrice.priceStatus ne'01'}"> value="停售"</c:if>
																class="form-control input-small width-200px "
																data-placement="bottom" readonly="readonly">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">非接:</label>

														<div class="col-sm-8  no-padding">
														
															<input type="text"  name="ifNonContact"
																<c:if test="${model.ifNonContact=='1'}"> value="支持"</c:if>
																<c:if test="${model.ifNonContact ne'1'}"> value="不支持"</c:if>
																class="form-control input-small width-200px "
																data-placement="bottom" readonly="readonly">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">扫描:</label>

														<div class="col-sm-8  no-padding">
														
															<input type="text"  name="scan"
																<c:if test="${model.scan=='0'}"> value="不支持"</c:if>
																<c:if test="${model.scan ne'0'}"> value="支持"</c:if>
																class="form-control input-small width-200px "
																data-placement="bottom" readonly="readonly">
														</div>
													</div>
													
												</div>
												<div class="row"></div>
<!-- 											</form> -->
											
										</div>
									</div>
								</div>
							</div>
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>
										设备销售图片
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
												<div class=" col-xs-12">
                                                    <div class="no-padding form-group form-group-sm " id="imageDiv" >  
                   							        	<!-- TODO <img id="" alt="" src="<%=request.getContextPath() %>/img/devicedefault.jpg" width="300px;" height="186px;" onclick="changeImage();">-->
                   						   	<img id="" alt="" src="<%=request.getContextPath() %>/goodsPriceManage/showImage?imageAddr=${goodsPrice.imagePath}" width="300px;" height="186px;" onclick="changeImage();"> 	    
							                        </div>
							                         
                                                </div>
                                               
												<div class="row"></div>
											
										</div>
									</div>
								</div>
							</div>
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>
										价格信息
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">起定量:<span class="red">*</span></label>
														<div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="minOrderQuantity"
																value="${goodsPrice.minOrderQuantity}" id="minOrderQuantity"
																class="form-control input-small width-200px "
																data-placement="bottom" readonly="readonly" >
														</div>
													</div>

													<div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">单位数量:<span class="red">*</span></label>
														<div class="col-sm-8  no-padding">
															<input type="text" 
																value="${goodsPrice.unitQuantity }" name="unitQuantity"
																id="unitQuantity"
																class="form-control input-small width-200px "
																data-placement="bottom" readonly="readonly">
														</div>
													</div>
													</div>

												 <div class=" col-xs-12">
													<div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">价格类型:</label>
														<div class="col-sm-8  no-padding width-100px">
															<c:if test="${goodsPrice.priceType ne'02'}">
																<input type="radio"
																	class=""
																	value="01" name="priceType" 
																	id="priceTypeUnify" data-placement="bottom" title="二选一" onchange="changePriceType();" checked="checked" readonly="readonly">统一 
															</c:if>
															<c:if test="${goodsPrice.priceType=='02'}"> 
																<input type="radio"
																	class=""
																	value="02" name="priceType"
																	id="priceTypeStep" data-placement="bottom" title="二选一" onchange="changePriceType();" checked="checked" readonly="readonly">阶梯
															</c:if>
														</div>
													</div>
												</div>
												<c:if test="${goodsPrice.priceType ne'02'}">
													<div class=" col-xs-12" id="basePriceDiv">
														<div class="form-group form-group-sm  width-300px">
	
															<label
																class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">基础价格(元):<span class="red">*</span></label>
															<div class="col-sm-8  no-padding">
																<input type="text"  
																	value="${goodsPrice.levelOnePrice }" name="levelOnePrice"
																	id="levelOnePrice"
																	class="form-control input-small width-200px"
																	data-placement="bottom" title=""  readonly="readonly">
															</div>
														</div>
													</div>
												</c:if>
												<c:if test="${goodsPrice.priceType=='02'}"> 
												<div class=" col-xs-12" id="priceTitleDiv">
													<div class="form-group form-group-sm  width-200px">
													</div>
													<div class="form-group form-group-sm  width-200px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">订购数量<span class="red">*</span></label>
													</div>
													<div class="form-group form-group-sm  width-200px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">单价<span class="red">*</span></label>
													</div>
												</div>
												<div class=" col-xs-12" id="levelOneDiv">
													<div class="form-group form-group-sm  width-200px">
													</div>
													<div class="form-group form-group-sm  width-200px ">
														<label class="col-sm-4 control-label widget-color-normal5 width-20px " id="levelOneStart">1</label>-<input type="text"  
																value="${goodsPrice.levelOneQuantity}" 
																id="levelOneEnd"
																class="form-control input-small width-100px "
																data-placement="bottom" name="levelOneQuantity" readonly="readonly">
													</div>
													<div class="form-group form-group-sm  no-padding-right" style="width: 130px; ">
													<input type="text" 
																value="${goodsPrice.levelOnePrice}" name="levelOnePrice"
																id="levelOnePrice"
																class="form-control input-small width-100px "
																data-placement="bottom" readonly="readonly">
													</div>
													<div class="form-group form-group-sm  width-50px no-padding-left">
														<label class="col-sm-4 control-label widget-color-normal5 width-20px no-padding-left">元</label>
													
													</div>
												</div>
												<div class=" col-xs-12" id="levelTwoDiv">
													<div class="form-group form-group-sm  width-200px no-padding-right">
													</div>
													<div class="form-group form-group-sm  width-200px" id="levelTwoModifyDiv"  >
														<label class="col-sm-4 control-label widget-color-normal5 width-20px " id="levelTwoStart">
														${goodsPrice.levelOneQuantity+1}</label>-<input type="text"  
														<c:if test="${goodsPrice.levelTwoQuantity == null || goodsPrice.levelTwoQuantity == '' || goodsPrice.levelTwoQuantity == '9999999'}" > value="及以上" readonly="readonly" </c:if>
														<c:if test="${goodsPrice.levelTwoQuantity ne null && goodsPrice.levelTwoQuantity ne '' && goodsPrice.levelTwoQuantity ne '9999999'}" > value="${goodsPrice.levelTwoQuantity}"</c:if>
																 name="levelTwoQuantity"
																id="levelTwoEnd"   
																class="form-control input-small width-100px " 
																data-placement="bottom" readonly="readonly">
													</div>
													<div class="form-group form-group-sm  no-padding-right" style="width: 130px; ">
													<input type="text" 
																value="${goodsPrice.levelTwoPrice}" name="levelTwoPrice"
																id="levelTwoPrice"
																class="form-control input-small width-100px "
																data-placement="bottom" readonly="readonly">
													</div>
													<div class="form-group form-group-sm  width-50px no-padding-left">
													<label class="col-sm-4 control-label widget-color-normal5 width-20px no-padding-left">元</label>
													</div>
												</div>
													<c:if test="${goodsPrice.levelTwoQuantity ne null && goodsPrice.levelTwoQuantity ne ''  && goodsPrice.levelTwoQuantity ne '9999999'}">
													<div class=" col-xs-12" id="levelThreeDiv">
														<div class="form-group form-group-sm  width-200px">
														</div>
														<div class="form-group form-group-sm  width-200px">
															<label class="col-sm-4 control-label widget-color-normal5 width-20px " id="levelThreeStart">
															${goodsPrice.levelTwoQuantity+1}</label>-<input type="text"  
																	value="及以上" 
																	id="levelThreeEnd"
																	class="form-control input-small width-100px "
																	data-placement="bottom" readonly="readonly" >
														</div>
														<div class="form-group form-group-sm  " style="width: 130px; ">
														<input type="text"  
																	value="${goodsPrice.levelThreePrice}" name="levelThreePrice"
																	id="levelThreePrice"
																	class="form-control input-small width-100px "
																	data-placement="bottom" readonly="readonly" >
														</div>
														<div class="form-group form-group-sm  width-50px no-padding-left">
														<label class="col-sm-4 control-label widget-color-normal5 width-20px no-padding-left">元</label>
														</div>
													</div>
													</c:if>
												</c:if>
												<div class="row"></div>
										</div>
									</div>
								</div>
							</div>
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>
										支付方式
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<div class=" col-xs-12">
												<div class="form-group form-group-sm" style="width: 150px;">
													<label
														class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
														<input type="checkbox" id="ifOnlinePay" name="ifOnlinePay" value="1"  onclick="return false;"
														<c:if test="${goodsPrice.ifOnlinePay=='01'}"> checked="checked"</c:if>>
														在线支付</label>
												</div>
												
												<div class="form-group form-group-sm" style="width: 200px;">
														 <label
																class="col-sm-8 control-label widget-color-normal5 width-180px no-padding-right">
																<input type="checkbox" id="ifRemitPay" value="1" name="ifRemitPay"   onclick="return false;"
																<c:if test="${goodsPrice.ifRemitPay=='01'}" > checked="checked"</c:if>>
																汇款</label>
													</div>
											</div>
											<div class="row"></div>
										</div>
									</div>
								</div>
							</div>
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>
										优惠信息
									</h5>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm" style="width: 150px;">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															<input type="checkbox" id="freeGiftsForOne" name="isFreeGiftsForOne" value="1" onclick="return false;" 
															<c:if test="${goodsPrice.isFreeGiftsForOne==1}">checked="checked"</c:if>>
															单笔满赠</label>
													</div>

													<div class="form-group form-group-sm no-padding-left" style="width: 200px;">
														<label
															class="col-sm-4 control-label widget-color-normal5 no-padding-left" style="width: 60px;">满:</label>
														<div class="col-sm-8  no-padding">
															<input type="text"
																class="form-control input-small" style="width: 60px;"
																<c:if test="${goodsPrice.isFreeGiftsForOne==1}"> value="${goodsPrice.freeLimitNum}" </c:if>
																readonly="readonly"
																id="giftOneLimitNum" data-placement="bottom">
														</div>
													</div>
													<div class="form-group form-group-sm" style="width: 150px;">
														<label
															class="col-sm-4 control-label widget-color-normal5 no-padding-left" style="width:30px;">赠:</label>
														<div class="col-sm-8  no-padding">
															<input type="text"
																class="form-control input-small" style="width: 60px;"
																<c:if test="${goodsPrice.isFreeGiftsForOne==1}"> value="${goodsPrice.freeGiftsQuantity}"  </c:if>
																readonly="readonly" 
																id="giftOneQuantity" data-placement="bottom" title="只能填数字">
														</div>
													</div>
													<c:if test="${goodsPrice.isFreeGiftsForOne==1}">
														<div class="form-group form-group-sm no-padding-left" style="width: 300px;" >
															<label
																class="col-sm-4 control-label widget-color-normal5 no-padding-left" style="width: 250px;">赠品为:${freeModel.goodsName}-${freeModel.factoryName}-${freeModel.subModelName}</label>
														</div>
													</c:if>
												</div>
												<div class=" col-xs-12">
													<div class="form-group form-group-sm" style="width: 150px;">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															<input type="checkbox" id="freeGiftsForTotal" name="isFreeGiftsForTotal" value="1" onclick="return false;" 
															<c:if test="${goodsPrice.isFreeGiftsForTotal==1}"> checked="checked"  </c:if> >
															累计满赠</label>
													</div>

													<div class="form-group form-group-sm" style="width: 200px;">
														<label
															class="col-sm-4 control-label widget-color-normal5 no-padding-left" style="width: 60px;">累计满:</label>
														<div class="col-sm-8  no-padding">
															<input type="text"
																class="form-control input-small" style="width: 60px;"
																<c:if test="${goodsPrice.isFreeGiftsForTotal==1}"> value="${goodsPrice.freeLimitNum}"  </c:if>
																readonly="readonly"
																id="giftTotalLimitNum" data-placement="bottom" title="只能填数字">
														</div>
													</div>
													<div class="form-group form-group-sm" style="width: 150px;">
														<label
															class="col-sm-4 control-label widget-color-normal5 no-padding-left" style="width: 30px;">赠:</label>
														<div class="col-sm-8  no-padding">
															<input type="text"
																class="form-control input-small" style="width: 60px;"
																<c:if test="${goodsPrice.isFreeGiftsForTotal==1}"> value="${goodsPrice.freeGiftsQuantity}"    </c:if>
																readonly="readonly"
																id="giftTotalQuantity" data-placement="bottom">
														</div>
													</div>
														<div class="form-group form-group-sm" style="width:300px;">
														<c:if test="${goodsPrice.isFreeGiftsForTotal==1}">
															<label
																class="col-sm-4 control-label widget-color-normal5 no-padding-left" style="width: 250px;">赠品为:${freeModel.goodsName}-${freeModel.factoryName}-${freeModel.subModelName}</label>
														</c:if>
														</div>
													<div class="form-group form-group-sm" style="width: 200px;">
														 <label
																class="col-sm-4 control-label widget-color-normal5 width-200px no-padding-left"><input type="checkbox" id="addUpTop" value="1" name="ifAddUpTop" 
																 <c:if test="${goodsPrice.isFreeGiftsForTotal==1 && goodsPrice.ifAddUpTop==1}" > checked="checked"</c:if> onclick="return false;">累计一代名下</label>
													</div>
												</div>
												<div class=" col-xs-12">
													<div class="form-group form-group-sm" style="width: 150px;">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															<input type="checkbox" id="isDiscount" value="1" name="isDiscount" onclick="return false;"
															<c:if test="${goodsPrice.isDiscount==1}"> checked="checked"</c:if>
															>
															支持折扣</label>
													</div>
													<div class="form-group form-group-sm" style="width:200px;">
														<input type="text"
																class="form-control input-small" style="width:50px;"
																<c:if test="${goodsPrice.isDiscount==1}"> value="${goodsPrice.discountRate}"</c:if> onclick="return false;"
																 name="discountRate" readonly="readonly"
																id="discountRate" data-placement="bottom">折特惠活动
													</div>
												</div>
												<div class=" col-xs-12 ">
													<div class="form-group form-group-sm no-padding-left" style="width: 150px;">
														<label
															class="col-sm-4 control-label widget-color-normal5 no-padding-right" style="width: 100px">
															<input type="checkbox" id="isBounty" value="1" name="isBounty" onclick="return false;"
															<c:if test="${goodsPrice.isBounty==1}"> checked="checked"</c:if>>
															支持奖励金</label>
													</div>
													<div class="form-group form-group-sm" style="width: 150px;">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">
															<input type="checkbox" id="isCreditPay" name="isCreditPay" value="1" onclick="return false;"
															<c:if test="${goodsPrice.isCreditPay==1}"> checked="checked"</c:if>> 
															支持赊购</label>
													</div>
													<div class="form-group form-group-sm" style="width: 150px;">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-right">
															<input type="checkbox" id="ifPartlyOrg" value="1" name="ifPartlyOrg"  onclick="return false;"
															<c:if test="${goodsPrice.ifPartlyOrg=='01'}"> checked="checked"</c:if>
															>
															仅部分代理</label>
													</div>
												</div>
												<div class="row"></div>
												<div class="form-actions center widget-color-normal5">
                                                     <button class="btn btn-default btn-sm" type="button" onclick="gobackPriceList()" id="sub" >
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
                                                      返回
                                                    </button>
                                                </div>
										</div>
									</div>
								</div>
							</div>
						</div>
                    </div>
                </div>
                </form>
            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->
    <%@include file="../../layout/common.js.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/goodsPrice/goodsPriceManage.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/common/imageUtil.js"></script>
    <script type="text/javascript">
        $('.chosen-select').chosen({});
        $('.id-input-file').ace_file_input({
            style:'well',
            btn_choose:'设备销售图片上传',
            btn_change:null,
            allowExt : ['jpg','xls'],
            no_icon:'ace-icon fa fa-cloud-upload',
            droppable:true,
            thumbnail:'fit'//large | fit |small
            //icon_remove:null//set null, to hide remove/reset button
            /**,before_change:function(files, dropped) {
            //Check an example below
            //or examples/file-upload.html
            return true;
            }*/
            /**,before_remove : function() {
            return true;
            }*/
            ,
            preview_error : function(filename, error_code) {
                //name of the file that failed
                //error_code values
                //1 = 'FILE_LOAD_FAILED',
                //2 = 'IMAGE_LOAD_FAILED',
                //3 = 'THUMBNAIL_FAILED'
                //alert(error_code);
            }
        }).on('change', function(){
            //console.log($(this).data('ace_input_files'));
            //console.log($(this).data('ace_input_method'));
        });
        
        
</script>

</body>
</html>