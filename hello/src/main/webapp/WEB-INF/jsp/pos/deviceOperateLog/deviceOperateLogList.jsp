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
                                        终端历史数据查询条件
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


                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/deviceOperateLog/deviceOperLogList" id="searchForm" method="POST">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
                                                <div class=" col-xs-12">

													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备序列号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="factSn" id="factSn" value="${dsm.factSn }" class="form-control input-small width-200px"  >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >终端号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="posNum" id="posNum" value="${dsm.posNum }" class="form-control input-small width-200px" >
                                                        </div>
                                                    </div>
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mercId" id="mercId" value="${mno }" class="form-control input-small width-200px" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="dStatus" name="dStatus"  class="chosen-select form-control width-200px" >
                                                                <option value="">全部</option>
                                                               <%--  <option value="0" <c:if test="${dsm.dStatus eq '0'}">selected = "selected"</c:if>>订货</option> --%>
                                                                <option value="1" <c:if test="${dsm.dStatus eq '1'}">selected = "selected"</c:if>>在库</option>
                                                              <%--   <option value="2" <c:if test="${dsm.dStatus eq '2'}">selected = "selected"</c:if>>待领用</option>
                                                                 <option value="8" <c:if test="${dsm.dStatus eq '8'}">selected = "selected"</c:if>>已领用</option> --%>
                                                                <option value="3" <c:if test="${dsm.dStatus eq '3'}">selected = "selected"</c:if>>安装</option>
                                                                <option value="4" <c:if test="${dsm.dStatus eq '4'}">selected = "selected"</c:if>>报修</option>
<%--                                                                  <option value="5" <c:if test="${dsm.dStatus eq '5'}">selected = "selected"</c:if>>处理中</option>
 --%>                                                                <option value="6" <c:if test="${dsm.dStatus eq '6'}">selected = "selected"</c:if>>退货</option>
                                                                <option value="-1" <c:if test="${dsm.dStatus eq '-1'}">selected = "selected"</c:if>>报废</option>
                                                                 <option value="-2" <c:if test="${dsm.dStatus eq '-2'}">selected = "selected"</c:if>>损失</option>
                                                                <option value="-3" <c:if test="${dsm.dStatus eq '-3'}">selected = "selected"</c:if>>出售</option>
                                                                <option value="0" <c:if test="${dsm.dStatus eq '0'}">selected = "selected"</c:if>>划拨</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                   <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备归属机构:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="dOrg" name="dOrg"  class="chosen-select form-control width-200px" >
                                                                <option value="">全部</option>
																	<c:forEach items="${orgList}" var="item">
																		<option value="${item.orgUuid}"
																			<c:if test="${item.orgUuid==dsm.dOrg}"> selected </c:if>>${item.orgNm}</option>
																	</c:forEach>
                                                            </select>

                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >发生时间:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="dateStart" name="dateStart" value="${dsm.dateStart }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="dateEnd" name="dateEnd" value="${dsm.dateEnd }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- 完毕 -->

                                                </div>

                                                <button class="btn btn-normal btn-sm" type="button" onclick="queryDeviceLog()">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button" onclick="resetSearchForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
                                                    清空检索条件
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
                                        查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width:4%">序号</th>
                                            	<th style="text-align:center;width:8%">操作人</th>
                                                <th style="text-align:center;width:12%">发生时间</th>
                                                <th style="text-align:center;width:11%">设备序列号</th>
                                                <th style="text-align:center;width:9%">型号</th>
                                                <th style="text-align:center;width:8%">终端号</th>
                                                <th style="text-align:center;width:8%">设备状态</th>
                                                <th style="text-align:center;width:10%">设备原机构</th>
                                                <th style="text-align:center;width:10%">设备目的机构</th>
                                                <th style="text-align:center;width:12%">操作记录</th>
                                                <th style="text-align:center;">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach items="${list}" var="mf"  varStatus="status">
												<tr>
													<td style="text-align:center;">${status.index+1 }</td>
													<td style="text-align:center;">${mf.createUser }</td>
													<td style="text-align:center;">${mf.creatDt }</td>
													<td style="text-align:left;">${mf.factSn }</td>
													<td style="text-align:left;">${mf.modName}</td>
													<td style="text-align:center;">${mf.posNum }</td>
													<td style="text-align:center;">${mf.statusStrD }</td>
													<td style="text-align:left;">${mf.sOrgNm }</td>
													<td style="text-align:left;">${mf.dOrgNm }</td>
													<td style="text-align:center;">${mf.operType }</td>
													<td style="text-align:center;">
									                     <div class="   action-buttons">
									                         <a href="#" onclick="mfdetailShow('${mf.operId}')" class="blue">
									                             	明细
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
    function queryDeviceLog(){
    	document.getElementById("searchForm").submit();
   		/* if(deviceVali()){
			document.getElementById("searchForm").submit();
		}else{
			alert("请加任一查询条件(设备序列号、终端号、商户编号)");
		} */
    }
    
    function deviceVali(){
  	  var deviceId = $("#deviceId").val().trim();
  	  var posNum = $("#posNum").val().trim();
  	  var mercId=$("#mercId").val().trim();
  	  if((deviceId==null ||deviceId=='') &&(posNum==null ||posNum=='')&&(mercId==null ||mercId=='') ){
  		 return false; 
  	  }
  	  return true;
    }
    
    
    
    function mfdetailShow(id){
  	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/deviceOperateLog/detail?operId='+id,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 900,
	        height: 800,
	        autoSize: false,
	        closeClick: false,
				afterClose:function(){
				}
			});
  	  
    }
    
    function delOneMf(id){
        var conf = confirm("确定删除信息?"); 
    	 if(conf){
    		 $.ajax({
 				    	cache: true,
 				        type: "POST",
 				        url:'<%=request.getContextPath() %>/manufacturer/delOneMf',
 				        data:'factId='+id,
 						async : false,
 						error : function(data) {
 							//data = eval("(" + data + ")")
 							alert(data);
 						},
 						success : function(data) {
 							//data = eval("(" + data + ")")
 							alert(data.msg);
 							if(data.msgCode=='00'){
 								window.location.href='<%=request.getContextPath()%>/manufacturer/manufacturerList' 
 							}
 						}
 					});
    	 } 
    }
    function addOneMf(){
    	window.location.href='<%=request.getContextPath()%>/manufacturer/addOneMfView'
    }
    
    
    function updateOneMf(){
    	window.location.href='<%=request.getContextPath()%>/manufacturer/updateOneMfView'
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
    function resetSearchForm(){
   	 $("#factSn").val('');
   	 $("#factSn").trigger("chosen:updated");
   	 $("#posNum").val('');
   	 $("#posNum").trigger("chosen:updated");
   	 $("#mercId").val('');
   	 $("#mercId").trigger("chosen:updated");
   	 $("#dStatus").val('');
  	 $("#dStatus").trigger("chosen:updated");
   	 $("#dOrg").val('');
   	 $("#dOrg").trigger("chosen:updated");
   	 $("#dateStart").val('');
  	 $("#dateStart").trigger("chosen:updated");
  	 $("#dateEnd").val('');
  	 $("#dateEnd").trigger("chosen:updated");

   }
   
 
</script>
</body>
</html>











