<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
                                        	密钥预灌装查询条件
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/device/sKeyImport/list" id="searchForm" method="POST">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
                                                <div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >灌装人:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="create_user" id="create_user" class="form-control input-small width-200px"  >  
                                                        </div>
                                                    </div>
													<!-- 增加  机构编号、归属分公司、确认收款日期-->
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="org" name="org" 
                                                              class="chosen-select form-control width-200px" >
                                                               	<c:forEach items="${orgList}" var="orgs">
																	<option value="${orgs.orgUuid }"
																		<c:if test="${orgs.orgUuid == goodsOrder.branchAttribution }"> selected </c:if>>${orgs.orgNm}</option>
																</c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">灌装日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="begin_time" id="begin_time"  class="input-small form-control" value="${goodsOrder.begPaymentDate}">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="end_time"  id="end_time" class="input-small form-control" value="${goodsOrder.endPaymentDate}">
                                                            </div>
                                                        </div>
                                                    </div>
													&nbsp;
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >物品名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="goods_id" name="goods_id" 
                                                              class="chosen-select form-control width-200px" >
																	<c:if test="${!empty subsectionList}">
																		<c:forEach items="${subsectionList}" var="item">
																			<option value="${item.value}" <c:if test="${item.value==param.goods_id}"> selected </c:if>>${item.label}</option>
																		</c:forEach>
																	</c:if>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >厂商简称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <select data-placeholder="请选择" id="fact_id" name="fact_id" 
                                                              class="chosen-select form-control width-200px" >
                                                               <option value="">全部</option>
																<c:if test="${!empty mlist }">
																	<c:forEach items="${mlist}" var="item">
																		<option code="${item.code}" value="${item.id}" <c:if test="${item.id==param.fact_id}"> selected </c:if>>${item.short_name}</option>
																	</c:forEach>
																</c:if>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- End by WJ 2015-08-03 -->
                                                    <!-- 增加导出状态 -->
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >型号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="mod_id" name="mod_id" 
                                                              class="chosen-select form-control width-200px" >
                                                               <option value="">全部</option>
																<c:if test="${!empty modelList }">
																	<c:forEach items="${modelList}" var="item">
																		<option code="${item.id}" value="${item.id}" <c:if test="${item.id==param.mod_id}"> selected </c:if>>${item.mod_name}</option>
																	</c:forEach>
																</c:if>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <!-- 完毕 -->
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button" onclick="javaScript:openIframe('','3')">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                   生成密钥预灌装数据
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
                                       密钥预灌装数据
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                            	<th style="text-align:center;width:8%">灌装人</th>
                                                <th style="text-align:center;width:8%">物品名称</th>
                                                <th style="text-align:center;width:10%">厂商简称</th>
                                                <th style="text-align:center;width:8%">终端型号 </th>
                                                <th style="text-align:center;width:8%">前缀</th>
                                                <th style="text-align:center;width:8%">起序列号 </th>
                                                <th style="text-align:center;width:8%">终序列号</th>
                                                <th style="text-align:center;width:5%">后缀</th>
                                                <th style="text-align:center;width:8%">数量（台）</th>
                                                <th style="text-align:center;width:8%">灌装日期</th>
                                                <th style="text-align:center;width:8%">所属机构</th>
                                                <th style="text-align:center;width:8%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${deviceInStockOrderList}" var="deviceInStockOrder"  varStatus="status">
												<tr>
													<!-- <td style="border:1px solid  #969696;">${status.index+1 }</td> -->
													<td style="text-align:center;">${deviceInStockOrder.create_user}</td>
													<td style="text-align:center;">
														<c:if test="${deviceInStockOrder.goods_id == '001' }">pos终端</c:if>
														<c:if test="${deviceInStockOrder.goods_id == '011' }">密码键盘</c:if>
														<c:if test="${deviceInStockOrder.goods_id == '013' }">RF读卡器</c:if>
														<c:if test="${deviceInStockOrder.goods_id == '014' }">手写板</c:if>
													</td>
													<td style="text-align:center;">${deviceInStockOrder.fact_name }</td>
													<td style="text-align:center;">${deviceInStockOrder.mod_name}</td>
													<td style="text-align:center;">
														${deviceInStockOrder.sn_prefix}
													</td>
													<td style="text-align:right;">${deviceInStockOrder.sn_begin}</td>
													<td style="text-align:right;">${deviceInStockOrder.sn_end}</td>
													<td style="text-align:center;">
														<c:if test="${deviceInStockOrder.sn_suffix}">已付款</c:if>
													</td>
													<td style="text-align:center;">
														${deviceInStockOrder.quantity}
													</td>
													<td style="text-align:center;">${deviceInStockOrder.creatTime }</td>
													<td style="text-align:center;">${deviceInStockOrder.org_name }</td>
													<td style="text-align:center;">
									                     <div class="   action-buttons">
									                         <a href="javaScript:openIframe('${deviceInStockOrder.id}','1')" class="blue">
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
			$("#searchForm").attr("action","<%=request.getContextPath()%>/device/sKeyImport/uploadExcel.do");
			document.getElementById("searchForm").submit();
			$("#searchForm").attr("action","<%=request.getContextPath()%>/device/sKeyImport/list");
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
        
    function openIframe(uuid,flag){
    	var href = '';
    	if(1 == flag){
    		href = '<%=request.getContextPath() %>/device/sKeyImport/Detail?uuid='+uuid;
    	}else if(2 == flag){
    		href = '<%=request.getContextPath() %>/device/sKeyImport/confirmPaymentPage?uuid='+uuid;
    	}else if(3 == flag){
    		href = '<%=request.getContextPath() %>/device/sKeyImport/preAdd';
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
    
  //型号细分类型下拉框变动
	$(document).ready(function() {
		$("#goods_id").change(function() {								

			var val = $(this).val();
			var mobj = $("#mod_id");
			var fact_val=$("#fact_id").val();
					
			mobj.empty();
			mobj.append("<option value=''> 请选择...  </option>");
			$.ajax({
				type : "GET",
				url : "${ctx}/device/sKeyImport/getModList?goods_id=" + val+"&fact_id="+fact_val,
				dataType : "json",
				cache : false,
				success : function(data) {

					for (var i = 0; i < data.length; i++) {
						mobj.append("<option value='"+data[i].id+"'>" + data[i].mod_name + "</option>");
					} 
				}
			});
			
		});
				
		//厂商简称下拉框变动
		$("#fact_id").change(function() {								
		//alert("asdf");
			var val = $(this).val();
			var mobj = $("#mod_id");
			var goods_val=$("#goods_id").val();
			
			mobj.empty();
			mobj.append("<option value=''> 请选择...  </option>");
			$.ajax({
				type : "GET",
				url : "${ctx}/device/sKeyImport/getModList?fact_id=" + val+"&goods_id="+goods_val,
				dataType : "json",
				cache : false,
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						mobj.append("<option value='"+data[i].id+"'>" + data[i].mod_name + "</option>");
					}
				}
			});
		
		});
	});
</script>
</body>
</html>











