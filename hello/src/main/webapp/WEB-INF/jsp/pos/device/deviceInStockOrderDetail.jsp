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
                                       设备入库单明细
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
                                                           <!--  <li class="">
                                                                <a href="#profile4" data-toggle="tab" aria-expanded="false">POS附加信息</a>
                                                            </li> -->
                                                        </ul>
                                                        <div class="tab-content ">
                                                            <div class="tab-pane active no-padding" id="home4">
                                                                <div class="col-sm-12">
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >入库单:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${deviceInStockOrder.id}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >入库机构:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${deviceInStockOrder.org_name}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >状态:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                   <c:choose>
																						<c:when test="${deviceInStockOrder.status=='0'}">
																							草稿
																						</c:when>
																						<c:when test="${deviceInStockOrder.status=='1'}">
																							审核
																						</c:when>
																						<c:when test="${deviceInStockOrder.status=='2'}">
																							收货
																						</c:when>
																					  </c:choose>
																					</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >物品名称:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    <c:if test="${deviceInStockOrder.goods_id == '001' }">pos终端</c:if>
																					<c:if test="${deviceInStockOrder.goods_id == '011' }">密码键盘</c:if>
																					<c:if test="${deviceInStockOrder.goods_id == '013' }">RF读卡器</c:if>
																					<c:if test="${deviceInStockOrder.goods_id == '014' }">手写板</c:if>
                                                                                    </label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >厂商简称:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${deviceInStockOrder.fact_name}</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >型号名称:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${deviceInStockOrder.mod_name}</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >起始设备号:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${deviceInStockOrder.sn_prefix}${deviceInStockOrder.sn_begin}${deviceInStockOrder.sn_suffix}</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >终止设备号:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${deviceInStockOrder.sn_prefix}${deviceInStockOrder.sn_end}${deviceInStockOrder.sn_suffix}</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >入库人:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    ${deviceInStockOrder.create_user}
                                                                                    </label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >审核人:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    ${deviceInStockOrder.auditor_id}
                                                                                    </label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >审核时间:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                    <fmt:formatDate value="${deviceInStockOrder.auditor_date}" type="date" pattern="yyyy-MM-dd HH:mm:ss" />
                                                                                    </label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >修改人:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${deviceInStockOrder.modify_user}</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >建立时间:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${deviceInStockOrder.create_time}" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >建立人:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                                                   ${deviceInStockOrder.create_user}
                                                                                    </label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >修改时间:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${deviceInStockOrder.modify_time}" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >设备归属机构:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${deviceInStockOrder.org_name}</label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >是否携机入网:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
																					 <c:choose>
																								<c:when test="${deviceInStockOrder.merc_own==0}">
																									不携机入网
																								</c:when>
																								<c:when test="${deviceInStockOrder.merc_own==1}">
																									携机入网
																								</c:when>
																							  </c:choose>
																					</label>
                                                                        </div>
                                                                    </div>
<%-- 																<c:if test="${deviceInStockOrder.goods_id == '001' }"> --%>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >终端支持非接:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
																				<c:choose>
																								<c:when test="${deviceInStockOrder.noncontact==0}">
																									不支持
																								</c:when>
																								<c:when test="${deviceInStockOrder.noncontact==1}">
																									支持
																								</c:when>
																							  </c:choose>
																				</label>
                                                                        </div>
                                                                    </div>
<%-- 																</c:if> --%>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >修改版本:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${deviceInStockOrder.version}</label>
                                                                        </div>
                                                                    </div>
																<c:if test="${deviceInStockOrder.goods_id == '012' }">
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >SIM_开卡时间:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${deviceInStockOrder.open_date}" type="date" pattern="yyyy-MM-dd"/></label>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >SIM_运营商所在地:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${deviceInStockOrder.oper_seat}</label>
                                                                        </div>
                                                                    </div>
																	<div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left" >SIM_起始电话号码:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${deviceInStockOrder.tel_start}</label>
                                                                        </div>
                                                                    </div>
													                <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >SIM_流量(单位:兆):</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${deviceInStockOrder.flow}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >SIM_付费方式(单位：月):</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${deviceInStockOrder.flow}</label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >SIM_购买时间:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${deviceInStockOrder.buy_date}" type="date" pattern="yyyy-MM-dd HH:mm:ss" /></label>
                                                                        </div>
                                                                    </div>
                                                                  </c:if>
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-170px no-padding-left"  >注释:</label>
                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><c:out value="${deviceInStockOrder.remark}" escapeXml="true" />
                                                                                    </label>
                                                                        </div>
                                                                    </div>
                                                                                                                 
														        </div>
                                                            </div>
                                                        </div>
                                                    </div>    
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
