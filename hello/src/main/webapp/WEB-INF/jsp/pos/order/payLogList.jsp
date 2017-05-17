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
                                        对账查询条件
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


                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/onlinePayment/onlinePayLogList.do" id="searchForm" method="POST">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
                                                <div class=" col-xs-12">

													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >订单编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="sendOrderId" id="sendOrderId" value="${payLog.sendOrderId }" class="form-control input-small width-200px" onkeyup="this.value=this.value.replace(/[^+\d]/g,'')" >
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">支付日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="payDateStart" id="payDateStart" class="input-small form-control" value="${payLog.payDateStart}">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="payDateEnd" id="payDateEnd" class="input-small form-control" value="${payLog.payDateEnd}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- 增加导出状态 -->
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >会计日期:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="accountDateStart" id="accountDateStart" class="input-small form-control" value="${payLog.accountDateStart}">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="accountDateEnd" id="accountDateEnd" class="input-small form-control" value="${payLog.accountDateEnd}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                     <!-- 增加导出状态 -->
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >金额是否一致:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="accountIsConsistent" name="accountIsConsistent" 
                                                              class="chosen-select form-control width-200px" >
                                                                <option value="2" <c:if test="${payLog.accountIsConsistent == 2}">selected = "selected"</c:if>>全部</option>
                                                                <option value="0" <c:if test="${payLog.accountIsConsistent == 0}">selected = "selected"</c:if>>是</option>
                                                                <option value="1" <c:if test="${payLog.accountIsConsistent == 1}">selected = "selected"</c:if>>否</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="uploadExcel()">
                                                    导出到excel
                                                </button>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        对账查询结果——订单总额：${amountInfo.orderAmount}元，支付总额${amountInfo.onlinePayAmount}元，
                                        应收手续费总额${amountInfo.commissionReceivableAmount}元，实收手续费总额${amountInfo.realChargeAmount}元，应结算总额${amountInfo.settlementAmount}元
                                    </h5>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width:8%">订单编号</th>
                                                <th style="text-align:center;width:8%">订单金额</th>
                                                <th style="text-align:center;width:6%">应收手续费</th>
                                                <th style="text-align:center;width:8%">应结算金额</th>
                                                <th style="text-align:center;width:8%">中移订单金额</th>
                                                <th style="text-align:center;width:6%">中移手续费</th>
                                                <th style="text-align:center;width:8%">订单金额是否一致</th>
                                                <th style="text-align:center;width:8%">支付日期</th>
                                                <th style="text-align:center;width:8%">会记日期</th>
                                                <th style="text-align:center;width:12%">汇款人</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach items="${payLogList}" var="payLog"  varStatus="status">
                                            	<c:if test="${payLog.sendAmount/100 != payLog.returnAmount/100}">
                                            		<tr style="color:red">	
                                            	</c:if>
												<c:if test="${payLog.sendAmount/100 == payLog.returnAmount/100}">
                                            		<tr>	
                                            	</c:if>
													<td style="text-align:center;">${payLog.sendOrderId }</td>
													<td style="text-align:right;"><fmt:formatNumber type="number" value="${payLog.sendAmount/100 }" pattern="0.00" maxFractionDigits="2"/></td>
													<td style="text-align:right;">
														<c:if test="${payLog.sendAmount/100 < 1}">0.00</c:if>
														<c:if test="${payLog.sendAmount/100 >= 1}"><fmt:formatNumber type="number" value="${payLog.sendAmount/100/1000 }" pattern="0.00" maxFractionDigits="2"/></c:if>
													</td>
													<td style="text-align:right;">
														<c:if test="${payLog.sendAmount/100 < 1}"><fmt:formatNumber type="number" value="${payLog.sendAmount/100}" pattern="0.00" maxFractionDigits="2"/></c:if>
														<c:if test="${payLog.sendAmount/100 >= 1}"><fmt:formatNumber type="number" value="${payLog.sendAmount/100 - payLog.sendAmount/100/1000 }" pattern="0.00" maxFractionDigits="2"/></c:if>
													</td>
													<td style="text-align:right;"><fmt:formatNumber type="number" value="${payLog.returnAmount/100}" pattern="0.00" maxFractionDigits="2"/></td>
													<td style="text-align:right;">${payLog.returnFee }</td>
													<c:if test="${payLog.sendAmount == payLog.returnAmount}">
														<td style="text-align:center;">是</td>
													</c:if>
													<c:if test="${payLog.sendAmount != payLog.returnAmount}">
														<td style="text-align:center;">否</td>
													</c:if>
													<td style="text-align:center;">${fn:substring(payLog.returnPayDate, 0, 8)}</td>
													<td style="text-align:center;">${payLog.returnAccountDate }</td>
													<td style="text-align:center;">${payLog.sendPerson}</td>
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
			$("#searchForm").attr("action","<%=request.getContextPath()%>/onlinePayment/exportExcel.do");
			document.getElementById("searchForm").submit();
			$("#searchForm").attr("action","<%=request.getContextPath()%>/onlinePayment/onlinePayLogList.do");
		}

        jQuery(function($) {
        	$('.chosen-select').chosen({});
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











