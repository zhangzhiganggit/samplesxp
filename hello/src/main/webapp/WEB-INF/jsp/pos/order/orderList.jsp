<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付</title>

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
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        订单查询条件
                                    </h5>
                                    <span class="widget-toolbar">
                                        <a data-action="collapse" href="#">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>
                                    </span>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">


                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/posOrderAdmin/orderList.do" id="searchForm" method="POST">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
                                                <div class=" col-xs-12">

													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >订单编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="goodsOrderId" id="goodsOrderId" value="${goodsOrder.goodsOrderId }" class="form-control input-small width-200px" onkeyup="this.value=this.value.replace(/[^+\d]/g,'')" >
                                                        </div>
                                                    </div>

													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >订单金额:</label>

                                                        <div class="col-sm-8  no-padding"  >

                                                            <input style="text-align: right" type="text" id="begAmount1" name="begAmount" value="${goodsOrder.begAmount}" class="form-control input-small width-48" data-placement="bottom" title=""  onkeyup="formatValue(this)" maxlength="9">
                                                            <input style="text-align: right" type="text" id="endAmount1" name="endAmount" value="${goodsOrder.endAmount}" class="form-control input-small width-40" data-placement="bottom" title=""  onkeyup="formatValue(this)" maxlength="9">

                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">创建时间:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="begInputDate" class="input-small form-control" value="${goodsOrder.begInputDate}">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" name="endInputDate" class="input-small form-control" value="${goodsOrder.endInputDate}">
                                                            </div>
                                                        </div>
                                                    </div>


                                                    
													&nbsp;
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >订单状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="orderStatus" name="orderStatus" 
                                                              class="chosen-select form-control width-200px" >
                                                                <option value="0">全部</option>
                                                                <option value="22" <c:if test="${goodsOrder.orderStatus == 22}">selected = "selected"</c:if>>已付款</option>
                                                                <option value="32" <c:if test="${goodsOrder.orderStatus == 32}">selected = "selected"</c:if>>部分订货</option>
                                                                <option value="31" <c:if test="${goodsOrder.orderStatus == 31}">selected = "selected"</c:if>>全部订货</option>
                                                                <option value="41" <c:if test="${goodsOrder.orderStatus == 41}">selected = "selected"</c:if>>部分发货</option>
                                                                <option value="42" <c:if test="${goodsOrder.orderStatus == 42}">selected = "selected"</c:if>>全部发货</option>
                                                                <option value="9" <c:if test="${goodsOrder.orderStatus == 9}">selected = "selected"</c:if>>强制完成</option>
                                                                <option value="63" <c:if test="${goodsOrder.orderStatus == 63}">selected = "selected"</c:if>>已作废</option>
                                                                <%-- <option value="23" <c:if test="${goodsOrder.orderStatus == 23}">selected = "selected"</c:if>>付款失败</option>
                                                                <option value="10" <c:if test="${goodsOrder.orderStatus == 10}">selected = "selected"</c:if>>订单创建</option>
                                                                <option value="11" <c:if test="${goodsOrder.orderStatus == 11}">selected = "selected"</c:if>>待付款</option>
                                                                <option value="21" <c:if test="${goodsOrder.orderStatus == 21}">selected = "selected"</c:if>>付款待确认</option>
                                                                <option value="90" <c:if test="${goodOrder.orderStatus == 90}">selected = "selected"</c:if>>订单完成</option> --%>
                                                                
                                                                
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <!-- Add by WJ 2015-08-03 增加支付方式 -->
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >支付方式:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="payMod" name="payMod" 
                                                              class="chosen-select form-control width-200px" >
                                                                <option value="0">全部</option>
                                                                <option value="1" <c:if test="${goodsOrder.payMod == 1}">selected = "selected"</c:if>>在线支付</option>
                                                                <option value="2" <c:if test="${goodsOrder.payMod == 2}">selected = "selected"</c:if>>汇款</option>
                                                                <option value="3" <c:if test="${goodsOrder.payMod == 3}">selected = "selected"</c:if>>赊购</option>
                                                                <option value="4" <c:if test="${goodsOrder.payMod == 4}">selected = "selected"</c:if>>赊购-在线支付</option>
                                                                <option value="5" <c:if test="${goodsOrder.payMod == 5}">selected = "selected"</c:if>>赊购-汇款</option>
                                                                <option value="7" <c:if test="${goodsOrder.payMod == 7}">selected = "selected"</c:if>>余额支付</option>
                                                                <option value="8" <c:if test="${goodsOrder.payMod == 8}">selected = "selected"</c:if>>白条-三方</option>
                                                                <option value="9" <c:if test="${goodsOrder.payMod == 9}">selected = "selected"</c:if>>银行卡-三方</option>
                                                                <option value="11" <c:if test="${goodsOrder.payMod == 11}">selected = "selected"</c:if>>欢乐送-三方</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <!-- End by WJ 2015-08-03 -->
                                                    
                                                    <!-- 增加导出状态 -->
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >订单导出状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="expSts" name="expSts" 
                                                              class="chosen-select form-control width-200px" >
                                                                <option value="0">全部</option>
                                                                <option value="2" <c:if test="${goodsOrder.expSts == 2}">selected = "selected"</c:if>>曾导出</option>
                                                                <option value="1" <c:if test="${goodsOrder.expSts == 1}">selected = "selected"</c:if>>未导出</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 增加  机构编号、归属分公司、确认收款日期-->
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgUuid" id="orgUuid" value="${goodsOrder.orgUuid }" class="form-control input-small width-200px" onkeyup="this.value=this.value.replace(/[^+\d]/g,'')" >
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">确认收款日期:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="begPaymentDate" class="input-small form-control" value="${goodsOrder.begPaymentDate}">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" name="endPaymentDate" class="input-small form-control" value="${goodsOrder.endPaymentDate}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<select id="branchAttribution" name="branchAttribution"
																	class="chosen-select form-control width-200px">
																		<option value="">请选择</option>
																		<c:forEach items="${orgList }" var="orgs">
																			<option value="${orgs.orgUuid }"
																				<c:if test="${orgs.orgUuid == goodsOrder.branchAttribution }"> selected </c:if>>${orgs.orgNm}</option>
																		</c:forEach>
																</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgNm" id="orgNm" value="${goodsOrder.orgNm }" class="form-control input-small width-200px" >
                                                        </div>
                                                    </div>
							
                                                    <!-- 完毕 -->

                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="resetSearchForm()">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                    清空检索条件
                                                </button>
												<c:if test="${ show}">
	                                                <button class="btn btn-danger btn-sm" type="button" onclick="uploadExcel()">
	                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
	                                                    导出订单到excel
	                                                </button>
                                                </c:if>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        订单查询结果（发货状态请到详情中查看）
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                            	<th style="text-align:center;width:6%">归属分公司</th>
                                                <th style="text-align:center;width:8%">代理商名称</th>
                                                <th style="text-align:center;width:6%">机构编号</th>
                                                <th style="text-align:center;width:6%">盟友编号</th>
                                                <th style="text-align:center;width:6%">盟友名称</th>
                                                <th style="text-align:center;width:6%">盟主编号</th>
                                                <th style="text-align:center;width:6%">盟主名称</th>
                                                <th style="text-align:center;width:6%">订单编号 </th>
                                                <th style="text-align:center;width:6%">导出状态 </th>
                                                <th style="text-align:center;width:6%">订单金额 </th>
                                                <th style="text-align:center;width:6%">商品数量</th>
                                                <th style="text-align:center;width:6%">订单状态</th>
                                                <th style="text-align:center;width:6%">支付方式</th>
                                                <!--  
                                                <th style="text-align:center;width:8%">汇款金额</th>
                                                -->
                                                <th style="text-align:center;width:6%">确认收款日期</th>
                                                <th style="text-align:center;width:6%">创建日期</th>
                                                <th style="text-align:center;width:6%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach items="${goodsOrderlist}" var="goodsOrder"  varStatus="status">
												<tr>
													<!-- <td style="border:1px solid  #969696;">${status.index+1 }</td> -->
													<td style="text-align:center;">${goodsOrder.branchAttributionNm }</td>
													<td style="text-align:center;">${goodsOrder.orgNm }</td>
													<td style="text-align:center;">${goodsOrder.orgUuid }</td>
													<td style="text-align:center;">${goodsOrder.allyId }</td>
													<td style="text-align:center;">${goodsOrder.allyNm }</td>
													<td style="text-align:center;">${goodsOrder.chiefId }</td>
													<td style="text-align:center;">${goodsOrder.chiefNm }</td>
													<td style="text-align:center;">${goodsOrder.goodsOrderId}</td>
													<td style="text-align:center;">
														<c:if test="${goodsOrder.expSts == 2}">曾导出</c:if>
														<c:if test="${goodsOrder.expSts != 2}">未导出</c:if>
													</td>
													<td style="text-align:right;">${goodsOrder.adjustmentAmount }</td>
													<td style="text-align:right;">${goodsOrder.totalQuantity }</td>
													<td style="text-align:center;">
														<c:if test="${goodsOrder.orderStatus == 22}">已付款</c:if>
														<c:if test="${goodsOrder.orderStatus == 31}">已订货</c:if>
														<c:if test="${goodsOrder.orderStatus == 32}">部分订货</c:if>
														<c:if test="${goodsOrder.orderStatus == 9}">强制完成</c:if>
														<c:if test="${goodsOrder.orderStatus == 63}">已作废</c:if>
														<c:if test="${goodsOrder.orderStatus == 41}">部分发货</c:if>
														<%--<c:if test="${goodsOrder.orderStatus == 10}">订单创建</c:if>
														<c:if test="${goodsOrder.orderStatus == 11}">待付款</c:if>
														<c:if test="${goodsOrder.orderStatus == 21}">付款待确认</c:if>
														<c:if test="${goodsOrder.orderStatus == 23}">付款失败</c:if>
														<c:if test="${order.orderStatus == 90}">订单完成</c:if> --%>
														<c:if test="${goodsOrder.orderStatus == 42}">全部发货</c:if>
														
													</td>
													<!-- Add by WJ 2015-08-03 增加支付方式 -->
													<td style="text-align:center;">
														<c:if test="${goodsOrder.payMod == 1}">在线支付</c:if>
														<c:if test="${goodsOrder.payMod == 2}">汇款</c:if>
														<c:if test="${goodsOrder.payMod == 3}">赊购</c:if>
														<c:if test="${goodsOrder.payMod == 4}">赊购-在线支付</c:if>
														<c:if test="${goodsOrder.payMod == 5}">赊购-汇款</c:if>
														<c:if test="${goodsOrder.payMod == 7}">余额支付</c:if>
														<c:if test="${goodsOrder.payMod == 8}">白条-三方</c:if>
														<c:if test="${goodsOrder.payMod == 9}">银行卡-三方</c:if>
														<c:if test="${goodsOrder.payMod == 11}">欢乐送-三方</c:if>
													</td>
													<!-- End by WJ 2015-08-03 -->
													<!--  
													<td style="text-align:center;">${goodsOrder.paymentAmount }</td>
													-->
													<td style="text-align:center;">${goodsOrder.paymentDate }</td>
													<td style="text-align:center;">${goodsOrder.inputDate }</td>
													
													<td style="text-align:center;">
									                     <div class="   action-buttons">
									                         <a href="javaScript:openIframe('${goodsOrder.goodsOrderId}','1')" class="blue">
									                             	查看详情
									                         </a>
									                     </div>
									                 </td>
												</tr>
											</c:forEach> 
                                            </tbody>
                                        </table>


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

    </div><!-- /.main-container -->

    <%@include file="../../layout/common.js.jsp"%>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    
		function uploadExcel(){
			$("#searchForm").attr("action","<%=request.getContextPath()%>/posOrderAdmin/uploadExcel.do");
			document.getElementById("searchForm").submit();
			$("#searchForm").attr("action","<%=request.getContextPath()%>/posOrderAdmin/orderList.do");
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
    
    function formatValue(obj){
        	var value=Number(obj.value.replace(/[^+\d]/g,''));
        	if(value == 0){
        		obj.value = '';
        		return;
        	}
        	obj.value = value;
        	
        }
    
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
        
    function openIframe(goodsOrderId,flag){
    	var href = '';
    	if(1 == flag){
    		href = '<%=request.getContextPath() %>/posOrderAdmin/queryOrderDetail.do?goodsOrderId='+goodsOrderId;
    	}else if(2 == flag){
    		href = '<%=request.getContextPath() %>/posOrderAdmin/confirmPaymentPage.do?goodsOrderId='+goodsOrderId;
    	}else if(3 == flag){
    		href = '<%=request.getContextPath() %>/posOrderAdmin/orderListForTransferPage.do';
    	}
    	$.fancybox.open({
			href : href,
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
            },
			afterClose:function(){
				if(3 == flag){
					reloadParent();
				}
			}
		});
    }
    
    function reloadParent(){
    	document.getElementById("searchForm").submit();
    }
    function resetSearchForm(){
	   	 $(':input','#searchForm')  
	   	 .not(':button, :submit, :reset, :hidden')  
	   	 .val('')  
	   	 .removeAttr('checked')  
	   	 .removeAttr('selected'); 
		 $("#orderStatus").val('0').trigger("chosen:updated");
		 $("#payMod").val('0').trigger("chosen:updated");
		 $("#branchAttribution").val('0').trigger("chosen:updated");		 
		 $("#expSts").val('0').trigger("chosen:updated");
    }
</script>
</body>
</html>











