<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>
    <%@include file="../layout/common.jsp"%>
    <script src="<%=request.getContextPath() %>/js/common/common.js"></script>
</head>
<body class="no-skin ">
    <div class="main-container" id="main-container">
        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       		 查询条件
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/dRestrictTimesExport/exportList.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="orderNo"  name="orderNo" value="${dRestrictTimesExport.orderNo }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="orgNm" name="orgNm" value="${dRestrictTimesExport.orgNm }" class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >操作日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="startDate" name="startDate" value="${dRestrictTimesExport.startDate }"  onchange="changeStartDate()" class="input-small form-control">
                                                                    <span class="input-group-addon">
                                                                        <i class="fa fa-exchange"></i>
                                                                    </span>
                                                                <input type="text" id="endDate" name="endDate" value="${dRestrictTimesExport.endDate }"  onchange="changeEndDate()" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >字段类型:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           	<select id="exceptTyp" name="exceptTyp" data-placeholder="请选择"  class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
                                                               	<option value="0" <c:if test="${dRestrictTimesExport.exceptTyp=='0' }">selected</c:if>>结算人卡号一</option>
											    				<option value="1" <c:if test="${dRestrictTimesExport.exceptTyp=='1' }">selected</c:if>>结算人户名一</option>
											    				<option value="2" <c:if test="${dRestrictTimesExport.exceptTyp=='2' }">selected</c:if>>结算人证件号一</option>
											    				<option value="3" <c:if test="${dRestrictTimesExport.exceptTyp=='3' }">selected</c:if>>结算人卡号二</option>
											    				<option value="4" <c:if test="${dRestrictTimesExport.exceptTyp=='4' }">selected</c:if>>结算人户名二</option>
											    				<option value="5" <c:if test="${dRestrictTimesExport.exceptTyp=='5' }">selected</c:if>>结算人证件号二</option>
											    				<option value="6" <c:if test="${dRestrictTimesExport.exceptTyp=='6' }">selected</c:if>>注册名称</option>
											    				<option value="7" <c:if test="${dRestrictTimesExport.exceptTyp=='7' }">selected</c:if>>注册登记号</option>
											    				<option value="8" <c:if test="${dRestrictTimesExport.exceptTyp=='8' }">selected</c:if>>法人名称</option>
											    				<option value="9" <c:if test="${dRestrictTimesExport.exceptTyp=='9' }">selected</c:if>>法人证件号</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >重复次数＜＝:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="num" value="${dRestrictTimesExport.num }" id="num" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否例外:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                          <select id="isExcept" name="isExcept" class="chosen-select form-control width-200px">
										    					<option value="" selected>全部</option>
										    					<option value="1" <c:if test="${dRestrictTimesExport.isExcept=='1' }">selected</c:if>>是</option>
										    					<option value="0" <c:if test="${dRestrictTimesExport.isExcept=='0' }">selected</c:if>>否</option>
										    					<option value="2" <c:if test="${dRestrictTimesExport.isExcept=='2' }">selected</c:if>>全量</option>
														</select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单类型:</label>
                                                        <div class="col-sm-6  no-padding"  >
                                                            <select id="orderTyp" name="orderTyp" class="chosen-select form-control width-200px">
									    					<option value="" selected>全部</option>
									    					<option value="SXF01" <c:if test="${dRestrictTimesExport.orderTyp=='SXF01' }">selected</c:if>>进件</option>
									    					<option value="SXF02" <c:if test="${dRestrictTimesExport.orderTyp=='SXF02' }">selected</c:if>>修改</option>
														</select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                                                                                                             检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button" onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                                                                                                              清空检索条件
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="uploadExcel()">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                                                                                                              导出                                                                                                                                  
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
                                                <th style="text-align: center;width: 8%"> 工单编号 </th>
                                                <th style="text-align: center;width: 8%">归属分公司</th>
                                                <th style="text-align: center;width: 6%">注册名称</br>重复次数</th>
                                                <th style="text-align: center;width: 7%">注册登记号</br>重复次数</th>
                                                <th style="text-align: center;width: 6%">法人名称</br>重复次数</th>
                                                <th style="text-align: center;width: 7%">法人登记号</br>重复次数</th>
                                                <th style="text-align: center;width: 8%">对私结算户名</br>重复次数</th>
                                                <th style="text-align: center;width: 8%">对私结算卡号</br>重复次数</th>
                                                <th style="text-align: center;width: 9%">对私结算证件号</br>重复次数</th>
                                                <th style="text-align: center;width: 8%">对公结算户名</br>重复次数</th>
                                                <th style="text-align: center;width: 9%">对公结算证件号</br>重复次数</th>
                                                <th style="text-align: center;width: 5%">操作人</th>
                                                <th style="text-align: center;width: 7%">操作时间</th>
                                                <th style="text-align: center;width: 7%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                           <c:forEach items="${resultList}" var="de"  varStatus="status">
													<tr>
														<td style="text-align: center;">${de.orderNo }</td>
														<td style="text-align: left;">${de.orgNm }</td>
														<td style="text-align: left;">${de.regNmNum }</td>
														<td style="text-align: left;">${de.regNoNum }</td>
														<td style="text-align: center;">${de.legalPersonNum}</td>
														<td style="text-align: center;">${de.legalIdcardNum}</td>
														<td style="text-align: center;">${de.actNmNum1}</td>
														<td style="text-align: center;">${de.actNoNum1 }</td>
														<td style="text-align: center;">${de.idCardNum1 }</td>
														<td style="text-align: center;">${de.actNmNum2 }</td>
														<td style="text-align: center;">${de.actNoNum2 }</td>
														<td style="text-align: center;">${de.operNo }</td>
														<td style="text-align: center;">${de.operDatetime }</td>
														<td   style="text-align: center;">
										                     <div class="   action-buttons">
										                         <a href="#" onclick="mecIfdetailShow('${de.uuid}')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa  blue bigger-130"><font size="2">详情</font></i>
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
								<%@include file="../layout/pagination.jsp" %>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">
       var proValue = $("#prov").val();
       fillProvSelect('mecProvCd',proValue);
       var cityValue = $("#city").val();
       fillCitySelect('mecProvCd','mecCityCd',cityValue);
     
     </script>
    
    <script type="text/javascript">
    function changeStartDate(){
    	var startDate=Number($("#startDate").val().replace(/-/g,''));
    	var endDate=Number($("#endDate").val().replace(/-/g,''));
    	if(endDate!=0){
    		if(startDate>endDate){
    			$("#endDate").val($("#startDate").val());
    		}
    	}
    }
    function changeEndDate(){
    	var startDate=Number($("#startDate").val().replace(/-/g,''));
    	var endDate=Number($("#endDate").val().replace(/-/g,''));
    	if(startDate!=0){
    		if(startDate>endDate){
    			$("#startDate").val($("#endDate").val());
    		}
    	}
    }
    
    
    function uploadExcel(){
		$("#searchForm").attr("action","<%=request.getContextPath()%>/dRestrictTimesExport/uploadExcel.do");
		document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","<%=request.getContextPath()%>/dRestrictTimesExport/exportList.do");
	}
    
    function mecIfdetailShow(id){
		$.fancybox.open({
			href : '<%=request.getContextPath() %>/dRestrictTimesExport/exportDetail.do?uuid='+id,
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
    
    
                                                                                                                                                                                                                                                                                                                                             
    
        
        jQuery(function($) {
        	$('.chosen-select').chosen({});

      
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
    
   function resetMecForm(){
    	 $(':input','#searchForm')  
    	 .not(':button, :submit, :reset, :hidden')  
    	 .val('')  
    	 .removeAttr('checked')  
    	 .removeAttr('selected'); 
    	 $("#exceptTyp").val('');
 		 $("#exceptTyp").trigger("chosen:updated");
 		 $("#orderTyp").val('');
		 $("#orderTyp").trigger("chosen:updated");
		 $("#isExcept").val('');
 		 $("#isExcept").trigger("chosen:updated");
     }
</script>
</body>
</html>











