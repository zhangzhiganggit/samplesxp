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

                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        发货单查询条件
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/posTransferAdmin/queryTransferList.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >订单编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="goodsOrderId" id="goodsOrderId" value="${goodsTransfer.goodsOrderId }" class="form-control input-small width-200px"  onkeyup="this.value=this.value.replace(/[^+\d]/g,'')">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >发货单编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="goodsTransferId" id="goodsTransferId" value="${goodsTransfer.goodsTransferId }" class="form-control input-small width-200px"  onkeyup="this.value=this.value.replace(/[^+\d]/g,'')">
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">发货时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="sendDateStart" value="${goodsTransfer.sendDateStart }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" name="sendDateEnd" value="${goodsTransfer.sendDateEnd }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >发货方式:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="全部" id="deliverType" name="deliverType"   class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
                                                                <option value="1" <c:if test="${goodsTransfer.deliverType == 1}">selected="selected"</c:if>>订购发货</option>
                                                                <option value="2" <c:if test="${goodsTransfer.deliverType == 2}">selected="selected"</c:if>>划拨发货</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >发货单状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="transferStatus" name="transferStatus"   class="chosen-select form-control width-200px">
                                                                <option value="0">请选择</option>
                                                                <option value="10" <c:if test="${goodsTransfer.transferStatus == 10}">selected="selected"</c:if>>待发货</option>
                                                                <option value="80" <c:if test="${goodsTransfer.transferStatus == 80}">selected="selected"</c:if>>发货已完成</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">厂商简称:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select data-placeholder="请选择" id="factId" name="factId" class="chosen-select form-control width-200px">
	                                                            <option value="">请选择</option>
										                        <c:forEach items="${factList}" var="fact">
											    					<option value="${fact.factId}"  <c:if test="${fact.factId==goodsTransfer.factId}">selected="selected" </c:if> >${fact.factName }</option>
											    				</c:forEach>
                                                        	</select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="toOrgUuid" id="toOrgUuid" value="${goodsTransfer.toOrgUuid }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="toOrgName" id="toOrgName" value="${goodsTransfer.toOrgName }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收件人名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="contact" id="contact" value="${goodsTransfer.contact }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收件人电话:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="contactTelNo" id="contactTelNo" value="${goodsTransfer.contactTelNo }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                 <button class="btn btn-info btn-sm" type="button" onclick="javaScript:openIframe('','','','4')">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                    根据厂商订货
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="uploadExcel()">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                    导出发货单到excel
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
                                        发货单查询结果
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width: 8%">订单编号</th>
                                                <th style="text-align:center;width: 8%">发货单编号</th>
                                                <th style="text-align:center;width: 10%">厂商简称</th>
                                                <th style="text-align:center;width: 5%">商品<br/>数量</th>
                                                <th style="text-align:center;width: 7%">发货方式</th>
                                                <th style="text-align:center;width: 7%">发货单状态</th>
                                                <th style="text-align:center;width: 7%">订单创建<br />时间</th>
                                                <th style="text-align:center;width: 7%">机构编号</th>
                                                <th style="text-align:center;width: 13%">代理商名称</th>
                                                <th style="text-align:center;width: 10%">收货人</th>
                                                <th style="text-align:center;width: 10%">收货人电话</th>
                                                <th style="text-align:center;width: 10%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach items="${transferList}" var="transfer" varStatus="status">
													<tr>
														<td style="text-align:center">${transfer.goodsOrderId}</td>
														<td style="text-align:center;" >${transfer.goodsTransferId}</td>
														<td style="text-align:center">${transfer.factShortname}</td>
														<td style="text-align:right">${transfer.totalQuantity}</td>
														<td style="text-align:center">${transfer.deliverTypeStr}</td>
														<td style="text-align:center" >
															<c:if test="${transfer.transferStatus==10}" >待发货</c:if>
									                        <c:if test="${transfer.transferStatus==80}" >发货已完成</c:if>
														</td>
														<td style="text-align:right"><fmt:formatDate value="${transfer.createDt}" type="date" pattern="yyyy-MM-dd"/></td>
														<td style="text-align:right">${transfer.toOrgUuid}</td>
														<td>${transfer.toOrgName}</td>
														<td style="text-align:center">${transfer.contact}</td>
														<td style="text-align:right">${transfer.contactTelNo}</td>
														<td>
															<a href="javaScript:openIframe('${transfer.totalQuantity}','${transfer.goodsTransferId}','${transfer.goodsOrderId}','1')" class="blue">查看</a>
															<c:if test="${loginUserPermission.SMSA_POS_008!=null }">
															<c:if test="${transfer.transferStatus==10}" >
																<a href="javaScript:openIframe('${transfer.totalQuantity}','${transfer.goodsTransferId}',${transfer.goodsOrderId},'2')" class="blue">发货</a>
															</c:if>
															</c:if>
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
    
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
        
    function openIframe(totalQuantity,goodsTransferId,goodsOrderId,flag){
    	var href = '';
    	if(1 == flag){
    		href = '<%=request.getContextPath() %>/posTransferAdmin/queryTransferDetail.do?goodsTransferId='+goodsTransferId+'&goodsOrderId='+goodsOrderId+'&flag='+flag;
    	}else if(2 == flag){
    		href = '<%=request.getContextPath() %>/posTransferAdmin/inStorePage.do?goodsTransferId='+goodsTransferId+'&goodsOrderId='+goodsOrderId+'&totalQuantity='+totalQuantity;
    	}else if(4 == flag){
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
				if(1 != flag){
					reloadParent();
				}
			}
		});
    }
    function uploadExcel(){
		$("#searchForm").attr("action","<%=request.getContextPath()%>/posTransferAdmin/uploadExcel.do");
		document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","<%=request.getContextPath() %>/posTransferAdmin/queryTransferList.do");
	}
    
</script>
</body>
</html>