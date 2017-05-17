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
                                        订单详情
                                    </h5>


                                </div>

                                <div class="widget-body" >
                                    <div class="widget-main no-padding ">
                                        <form class="form-inline form-horizontal" action="" id="searchForm">
                                            <div class="widget-main no-padding" >
                                                <div class="col-sm-12 no-padding">
                                                    <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable" >
                                                        <thead class="thin-border-bottom">
                                                        <tr>
                                                            <th style="text-align:center;width:10%">类型 </th>
                                                            <th style="text-align:center;width:20%">厂商 </th>
                                                            <th style="text-align:center;width:20%">型号 </th>
                                                            <th style="text-align:center;width:10%">通讯方式 </th>
                                                            <th style="text-align:center;width:10%">单位 </th>
                                                            <th style="text-align:center;width:10%">价格</th>
                                                            <th style="text-align:center;width:10%">数量</th>
                                                            <th style="text-align:center;width:10%">小计</th>
                                                        </tr>
                                                        </thead>

                                                        <tbody>
                                                            <c:forEach items="${orderList}" var="oL">
																<tr class="tr-row">
																	<td class="goodsName">${oL.goodsName}</td>
																	<td class="factName">${oL.factName}</td>
																	<td class="modName">${oL.modName}</td>
																	<td style="text-align: center">
																	<c:if test="${oL.commType eq '1' }">GPRS</c:if>
																	<c:if test="${oL.commType eq '0' }">拨号</c:if>
																	<c:if test="${oL.commType eq '2' }">以太网</c:if>
																	<c:if test="${oL.commType eq '3' }">TD-LTE</c:if>
																	<c:if test="${oL.commType eq '4' }">CDMA</c:if>
																	<c:if test="${oL.commType eq '5' }">CDMA2000</c:if>
																	<c:if test="${oL.commType eq '6' }">WCDMA</c:if>
																	<c:if test="${oL.commType eq '7' }">TD_SCDMA</c:if>
																	<c:if test="${oL.commType eq '8' }">WIFI</c:if>
																	<c:if test="${oL.commType eq '9' }">FDD-LTE</c:if>
			                                           				<input type="text" id="commType" class="commType" value="${oL.commType}" style="display:none"/>
																	</td>
																	<td class="unit" style="text-align: center">${oL.unit}</td>
																	<td class="price" style="text-align:right;">${oL.unitPrice}</td>
																	<td class="quantity" style="text-align:right;">${oL.quantity}</td>
																	<td class="payableAmount" style="text-align:right;">${oL.paymentAmount}</td>
																</tr>
															</c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                &nbsp;
                                                <div class="col-sm-12" style="padding-top:2px">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >数量总计:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " id="numTotal" style="text-align:right;">${goodsOrder.totalQuantity }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >价格合计:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " id="priceTotal" style="text-align:right;">${goodsOrder.adjustmentAmount }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收货人:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " id="contact" >${goodsOrder.contact }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收货人电话:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " id="contactTelNo">${goodsOrder.contactTelNo }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-60">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收货地址:</label>

                                                        <div class="col-sm-8  no-padding width-80"  >
                                                            <label class="form-control input-small width-90   view-control  " id="address">${goodsOrder.address }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >订单状态:</label>

                                                        <div class="col-sm-8  no-padding"  ><nobr>
                                                            <label class="form-control input-small width-200px   view-control  " id="contactTelNo">
                                                            	<c:if test="${goodsOrder.orderStatus == 10}">订单创建</c:if>
																<c:if test="${goodsOrder.orderStatus == 11}">待付款</c:if>
																<c:if test="${goodsOrder.orderStatus == 21}">付款待确认</c:if>
																<c:if test="${goodsOrder.orderStatus == 22}">已付款</c:if>
																<c:if test="${goodsOrder.orderStatus == 23}">付款失败</c:if>
																<c:if test="${goodsOrder.orderStatus == 31}">已订货</c:if>
																<c:if test="${goodsOrder.orderStatus == 32}">部分订货</c:if>
																<c:if test="${goodsOrder.orderStatus == 41}">部分发货</c:if>
																<c:if test="${goodsOrder.orderStatus == 42}">全部发货</c:if>
																<c:if test="${goodsOrder.orderStatus == 90}">订单完成</c:if>
                                                           </label>
                                                            <c:if test="${loginUserPermission.SMSA_POS_017!=null }">
	                                                    	<c:if test="${null != goodsOrder.fileName && !('' eq goodsOrder.fileName)}">
                                                            	<a href="javaScript:alertImg('${goodsOrder.goodsOrderId}')" class="blue">查看附件</a>
	                                              			</c:if>
	                                              			</c:if>
                                                           </nobr>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >支付方式:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " id="payMod">
                                                            <c:if test="${goodsOrder.payMod==1}">在线支付</c:if><c:if test="${goodsOrder.payMod==2}">汇款</c:if>
                                                            <c:if test="${goodsOrder.payMod==3}">赊购</c:if><c:if test="${goodsOrder.payMod==4}">赊购-在线支付</c:if>
                                                            <c:if test="${goodsOrder.payMod==5}">赊购-汇款</c:if><c:if test="${goodsOrder.payMod==8}">白条-三方</c:if>
                                                            <c:if test="${goodsOrder.payMod==9}">银行卡-三方</c:if><c:if test="${goodsOrder.payMod==11}">欢乐送-三方</c:if>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <!-- 导出状态 -->
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >导出状态:</label>

                                                        <div class="col-sm-8  no-padding"  ><nobr>
                                                            <label class="form-control input-small width-200px   view-control  " id="expSts">
                                                            	<c:if test="${goodsOrder.expSts == 2}">曾导出</c:if>
																<c:if test="${goodsOrder.expSts != 2}">未导出</c:if>
                                                           </label>
                                                           </nobr>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >汇出账号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " id="remitCardId">${goodsOrder.remitCardId}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-60 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >账户名:</label>
                                                        <div class="col-sm-8  no-padding width-80"  >
                                                        	<label class="form-control input-small width-90   view-control  " id="remiter" >${goodsOrder.remiter}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >汇出时间:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  " id="remitDate">${goodsOrder.remitDate}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >备注:</label>

                                                        <div class="col-sm-8  no-padding width-85"  >
                                                        	<label class="form-control input-small width-100   view-control  " >${goodsOrder.memo}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >审核备注:</label>

                                                        <div class="col-sm-8  no-padding width-85"  >
                                                        	<label class="form-control input-small width-100   view-control  " >${goodsOrder.remitRemark}</label>
                                                        </div>
                                                    </div>
                                                <!-- 展示发货信息 -->
                                                 <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width: 10%">划拨单号</th>
                                                <th style="text-align:center;width: 10%">订单号</th>
                                                <th style="text-align:center;width: 10%">厂商</th>
                                                <th style="text-align:center;width: 10%">发货机构</th>
                                                <th style="text-align:center;width: 10%">收货机构</th>
                                                <th style="text-align:center;width: 10%">发出人</th>
                                                <th style="text-align:center;width: 10%">物流公司</th>
                                                <th style="text-align:center;width: 10%">物流单号</th>
                                                <th style="text-align:center;width: 10%">商品数量</th>
                                                <th style="text-align:center;width: 10%">单据状态</th>
                                    <!--             <th style="text-align:center;width: 10%">单据类型</th>
                                                
                                                <th style="text-align:center;width: 10%">发货时间</th>
                                                <th style="text-align:center;width: 10%">收货时间</th>
                                                <th style="text-align:center;width: 10%">操作</th> -->
                                            </tr>
                                            </thead>

                                            <tbody>
                                             <c:forEach items="${transferList}" var="transfer" varStatus="status">
													<tr>
														<td style="text-align:right" >${transfer.goodsTransferId}</td>
														<td style="text-align:right" >${transfer.goodsOrderId}</td>
														<td>${transfer.factShortname}</td>
														<td>${transfer.fromOrgName}</td>
														<td>${transfer.toOrgName}</td>
														<td style="display:none">${transfer.goodsOrderId}</td>
														<td style="display:none">${transfer.totalQuantity}</td>
														<td style="text-align:center">${transfer.sender}</td>
														<td style="text-align:center">${transfer.logisticsCompany}</td>
														<td style="text-align:center">${transfer.logisticsNo}</td>
														<td style="text-align:center">${transfer.totalQuantity}</td>
														<td style="text-align:center" >
															<c:if test="${transfer.transferStatus==10}" >未发货</c:if>
									                        <c:if test="${transfer.transferStatus==20}" >全部发货</c:if>
									                        <c:if test="${transfer.transferStatus==21}" >部分发货</c:if>
									                        <c:if test="${transfer.transferStatus==80}" >确认收货</c:if>
														</td>
												<%-- 		<td style="text-align:center">
															<c:if test="${transfer.transferType==1}">发货单</c:if>
															<c:if test="${transfer.transferType==2}">划拨单</c:if>
														</td>
														<td style="text-align:center" >
															<c:if test="${transfer.transferStatus==10}" >未发货</c:if>
									                        <c:if test="${transfer.transferStatus==20}" >全部发货</c:if>
									                        <c:if test="${transfer.transferStatus==21}" >部分发货</c:if>
									                        <c:if test="${transfer.transferStatus==80}" >确认收货</c:if>
														</td>
														<td style="text-align:center">${transfer.sendDate}</td>
														<td style="text-align:center">${transfer.receiveDate}</td>
														<td>
															<a href="javaScript:openIframe('${transfer.goodsOrderId}','${transfer.goodsTransferId}',1)" class="blue">详情</a>
															<c:if test="${loginUserPermission.SMS_POS_010!= null }">
															<c:if test="${transfer.transferStatus==20}" >
																<a href="javascript:openIframe('${transfer.goodsOrderId}','${transfer.goodsTransferId}',3)" class="blue">确认收货</a>
															</c:if>
															</c:if>
														</td> --%>
													</tr>
												</c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                                <!-- 发货信息展示完毕 -->
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
												
												
												 <c:if  test="${loginUserPermission.SMSA_INVALIDORDER_01!=null }">
												<c:if test="${goodsOrder.orderStatus == 22}">
 											  <button class="btn  btn-sm" type="button"  onclick="invalidOrder('${goodsOrder.goodsOrderId}')">
                                                         <span class="ace-icon fa icon-on-right bigger-110"></span>
                                                         订单作废
                                                     </button>
                                                     </c:if>
                                                     </c:if>
                                                    <button class="btn  btn-sm" type="submit"  onclick="closeWin()">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
                                                        关闭
                                                    </button>
                                                </div>
                                            </div>
                                        </form>

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
    //查看图片
      function alertImg(id){
    	var url = "<%=request.getContextPath()%>/posOrderAdmin/imgPage.do?goodsOrderId="+id;
    	$.fancybox.open({
			href : url,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: $(window).width() * 0.9,
            centerOnScroll:true,
            autoSize: true,
            helpers:{
            	overlay:{
            		closeClick:false
            	}
            }
		});
    }
    
    function closeWin(){
    	parent.$.fancybox.close();
    }

    
    function invalidOrder(id){
     	$.ajax({
 			url : "<%=request.getContextPath()%>/posOrderAdmin/invalidOrder.do",
 		 	data:{
 				goodsOrderId:id,
 			}, 
 			async : false,
 			success : function(data) {
 				location.reload();
 				alert(data);
 			}
    })
 			
    }
        $('.chosen-select').chosen({});
        jQuery(function($) {

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
                        remote: {
                            url: 'remote.php',
                            message: 'Tên tài khoản này đã được đăng ký'
                        },
                        different: {
                            field: 'password',
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
            language: 'zh-CN',
            todayHighlight: true
        })
//show datepicker when clicking on the icon
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
//or change it into a date range picker
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});

//        $('#date-timepicker1').datetimepicker({language: 'zh-CN'}).next().on(ace.click_event, function(){
//            $(this).prev().focus();
//        });


    })
        
</script>
</body>
</html>











