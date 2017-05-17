<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        设备明细信息
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="list.html">
                                                <div class=" col-xs-12">
                                               <!-- 明细 START-->
												<table class="table table-striped  table-hover table-condensed"">
														<c:choose>
															<c:when test="${deviceBase.goods_type=='3' or deviceBase.goods_type=='2' or deviceBase.goods_type=='1'}">
																<tr>
																	<th width="80">物品类型：</th>
																	<td>${deviceBase.goods_type_name}</td>
																	<th width="80">物品名称：</th>
																	<td>${deviceBase.goods_name}</td>
																	
																	<th width="80">型号状态：</th>
																	<td>${deviceBase.mod_status_name}</td>
																</tr>
																<tr>
																	<th width="80">厂商简称：</th>
																	<td>${deviceBase.fact_name}</td>
																	<th width="80">型号编号：</th>
																	<td>${deviceBase.modId}</td>
																	<th width="80">型号名称：</th>
																	<td>${deviceBase.modNm}</td>
																</tr>
																<tr>
																	<th width="80">计量单位：</th>
																	<td>${deviceBase.unit}</td>
																	<th width="80">包装数量：</th>
																	<td>${deviceBase.qty}</td>
																	<th width="80">包装单位：</th>
																	<td>${deviceBase.packing_unit}</td>
															    </tr>
															</c:when>
															<c:otherwise>
																<tr>
																	<th width="80">物品类型：</th>
																	<td>${deviceBase.goods_type_name}</td>
																	</td>
																	<th width="80">物品名称：</th>
																	<td>${deviceBase.goods_name}</td>
												
																	<th width="80">型号状态：</th>
																	<td>${deviceBase.mod_status_name}</td>
												
																	<th width="80">厂商简称：</th>
																	<td>${deviceBase.fact_name}</td>
																</tr>
																<tr>
																	<th width="80">型号编号：</th>
																	<td>${deviceBase.modId}</td>
																	<th width="80">型号名称：</th>
																	<td>${deviceBase.modNm}</td>
																	<th width="80">计量单位：</th>
																	<td>${deviceBase.unit}</td>
																	<td></td>
																	<td></td>
																</tr>
															  	<tr>
																	<th width="80">包装数量：</th>
																	<td>${deviceBase.qty}</td>
																	<th width="80">包装单位：</th>
																	<td>${deviceBase.packing_unit}</td>
																	<th width="80">是否电子签名：</th>
																	<td>
																		<c:choose>
																		<c:when test="${devicePos.eSignature==1}">是</c:when>
																		<c:when test="${devicePos.eSignature==0}">否</c:when>
																		</c:choose>
																	</td>
																	<td></td>
																	<td></td>
																	<td></td>
															  	</tr>
																<c:if test="${not empty devicePos}">
																	<div id="posDiv">
																		<tr>
																			<th width="80">打印机类型：</th>
																			<td><c:choose>
																					<c:when test="${devicePos.print_type=='1'}">
																				   	热敏打印
																				  </c:when>
																					<c:when test="${devicePos.print_type=='2'}">							    
																				   	 针式打印
																				  </c:when>
																					<c:when test="${devicePos.print_type=='3'}">							    
																				           无
																				  </c:when>
																				</c:choose></td>
																			<th width="80">打印机速度：</th>
																			<td>${devicePos.print_speed}</td>
																			<th width="80">通讯方式：</th>
																			<td><c:choose>
																					<c:when test="${devicePos.comm_type=='0'}">
																				   	拨号
																				  </c:when>
																					<c:when test="${devicePos.comm_type=='1'}">							    
																				   	 GPRS
																				  </c:when>
																					<c:when test="${devicePos.comm_type=='2'}">							    
																				     TCP/IP
																				  </c:when>
																					<c:when test="${devicePos.comm_type=='4'}">							    
																				     CDMA
																				  </c:when>
																					<c:when test="${devicePos.comm_type=='6'}">							    
																				     WCDMA
																				  </c:when>
																				</c:choose></td>
																			<th width="80">插卡数量：</th>
																			<td>${devicePos.psam_num}</td>
																		</tr>
																		<tr>
																			<th width="80">通过认证：</th>
																			<td>${devicePos.cert_type}</td>
																			<th width="80">保修期：</th>
																			<td>${devicePos.warranty}</td>
																			<th width="80">屏幕分辨率：</th>
																			<td>${devicePos.screen}</td>
																			<th width="80">内存：</th>
																			<td>${devicePos.memory}</td>
																		</tr>
														
																		<tr>
																			<th width="80">密码键盘：</th>
																			<td><c:choose>
																					<c:when test="${devicePos.keyword=='0'}">
																				   	内置
																				  </c:when>
																					<c:when test="${devicePos.keyword=='1'}">							    
																				   	 外挂
																				  </c:when>
																					<c:when test="${devicePos.keyword=='9'}">							    
																				             无
																				  </c:when>
																				</c:choose></td>
																			<th width="80">处理器及主频：</th>
																			<td>${devicePos.cpu}</td>
																			<th width="80">开发平台：</th>
																			<td><c:choose>
																					<c:when test="${devicePos.language=='1'}">
																				   	C
																				  </c:when>
																					<c:when test="${devicePos.language=='2'}">							    
																				   	JAVA
																				  </c:when>
																					<c:when test="${devicePos.language=='3'}">							    
																				            其它
																				  </c:when>
																				</c:choose></td>
																			<th width="80">电压类型：</th>
																			<td><c:choose>
																					<c:when test="${devicePos.woltage_type=='1'}">
																				   	AC
																				  </c:when>
																					<c:when test="${devicePos.woltage_type=='0'}">							    
																				   	DC
																				  </c:when>
																				</c:choose></td>
																		</tr>
																		<tr>
														
																			<th width="80">插卡方式：</th>
																			<td><c:choose>
																					<c:when test="${devicePos.cardreader=='0'}">
																				   	无
																				  </c:when>
																					<c:when test="${devicePos.cardreader=='1'}">
																				   	吞卡
																				  </c:when>
																					<c:when test="${devicePos.cardreader=='2'}">							    
																				   	插卡
																				  </c:when>
																					<c:when test="${devicePos.cardreader=='3'}">							    
																				           刷卡
																				  </c:when>
																				</c:choose></td>
																			<th width="80">体积：</th>
																			<td>${devicePos.mod_volume}</td>
																			<th width="80">重量：</th>
																			<td>${devicePos.weight}</td>
																			<th width="80">工作温度：</th>
																			<td>${devicePos.temperature}</td>
																		</tr>
																		<tr>
																			<th width="80">工作湿度：</th>
																			<td>${devicePos.humidity}</td>
																			<th width="80">指导价格：</th>
																			<td>${devicePos.price}</td>
																			<th width="80"></th>
																			<td></td>
																			<th width="80"></th>
																			<td></td>
																		</tr>
																	</div>
																</c:if>
															</c:otherwise>
														</c:choose>
														<tr >
															<th>厂商型号代码：</th>
															<td colspan="7">${deviceBase.fact_mod}</td>
														</tr>
														<tr >
															<th>规格说明：</th>
															<td colspan="7">${deviceBase.normsDesc}</td>
														</tr>
														<tr >
															<th>备注：</th>
															<td colspan="7">${deviceBase.remark}</td>
														</tr>
														
													</table>
														<c:if test="${not empty deviceMatchingList}">
															<div id="surpportFactortyDiv" style="margin-left:5px;">
																<tr>
																	<th width="80"><label><font style="font-weight:bold;">支持终端 ：</font></label></th>
																	<td colspan="">
																		<c:forEach items="${deviceMatchingList}" var="item">
																			<td>${item.mod_master_name}&nbsp;&nbsp;</td>
																		</c:forEach>
																	</td>
																</tr>
															</div>
														</c:if>
                                               <!-- 明细 END -->    
                                                </div>



                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">

                                                    <button class="btn  btn-sm" type="submit"  onclick="javascript:closeWin();">
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
    
    function closeWin(){
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
                cancelLabel: 'Cancel',
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











