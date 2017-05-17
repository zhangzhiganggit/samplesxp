<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付</title>
    <%@include file="../../layout/common.jsp"%>
    <%@include file="../../common/taglib.jsp"%>
    <script src="<%=request.getContextPath() %>/js/common/common.js"></script>
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
                                        携机入网查询
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/deviceBatchIntake/deviceBatchList" id="searchForm" method="POST">
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
                                                <div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >入库单号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="storageId" id="storageId" value="${deviceBatch.storageId }" class="form-control input-small width-200px"  >
                                                        </div>
                                                    </div>
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >入库单操作人:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="createUser" id="createUser" value="${deviceBatch.createUser }" class="form-control input-small width-200px"  >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >入库机构名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgNm" id="orgNm" value="${deviceBatch.orgNm }" class="form-control input-small width-200px"  >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >物品名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="goodsId" name="goodsId" 
                                                              class="chosen-select form-control width-200px" >
                                                                <option value="">全部</option>
                                                                <option value="001" <c:if test="${deviceBatch.goodsId == 001}">selected = "selected"</c:if>>POS终端</option>
                                                                <option value="011" <c:if test="${deviceBatch.goodsId == 011}">selected = "selected"</c:if>>密码键盘</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="status" name="status" 
                                                              class="chosen-select form-control width-200px" >
                                                                <option value="">全部</option>
                                                                <option value="0" <c:if test="${deviceBatch.status == 0}">selected = "selected"</c:if>>草稿</option>
                                                                <option value="1" <c:if test="${deviceBatch.status == 1}">selected = "selected"</c:if>>入库</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">创建时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="dateStart" name="startDate" class="input-small form-control" value="${deviceBatch.startDate}">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" id="dateEnd" name="endDate" class="input-small form-control" value="${deviceBatch.endDate}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="btn btn-normal btn-sm" id="subBtn" type="submit">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                    查询
                                                </button>
                                                <a class="btn btn-info btn-sm"  href="<%=request.getContextPath()%>/deviceBatchIntake/downloadExcel">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                    下载导入模板
                                                </a>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="toBatchIntake()" >
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                    批量导入
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
                                            	<th style="text-align:center;width:10%">序号</th>
                                                <th style="text-align:center;width:10%">入库单号</th>
                                                <th style="text-align:center;width:10%">状态</th>
                                                <th style="text-align:center;width:20%">入库机构名称</th>
                                                <th style="text-align:center;width:10%">数量（台） </th>
                                                <th style="text-align:center;width:10%">入库日期</th>
                                                <th style="text-align:center;width:10%">入库操作人</th>
                                                <th style="text-align:center;">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${deviceBatchList}" var="deviceBatch"  varStatus="status">
												<tr>
													<td style="text-align:center;">${status.index +1  }</td>
													<td style="text-align:center;">${deviceBatch.storageId}</td>
													<td style="text-align:center;">
														<c:if test="${deviceBatch.status == 0}">草稿</c:if>
														<c:if test="${deviceBatch.status != 0}">入库</c:if>
													</td>
													<td style="text-align:right;">${deviceBatch.orgNm }</td>
													<td style="text-align:right;">${deviceBatch.quantity }</td>
													<td style="text-align:center;">${deviceBatch.auditorDates }</td>
													<td style="text-align:center;">${deviceBatch.createUser }</td>
													<td style="text-align:center;">
													<div class="   action-buttons">
														<c:if test="${deviceBatch.status == 0 && loginOrg == deviceBatch.createOrgId}">
									                         <a id="intake" href="javaScript:intake('${deviceBatch.storageId}')" class="blue">
									                             	入库
									                         </a>
									                         <a href="javaScript:deleteDevice('${deviceBatch.storageId}')" class="blue">
									                             	删除
									                         </a>
														</c:if>
								                         <a href="javaScript:openIframe('${deviceBatch.storageId}')" class="blue">
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
        </div>
    </div>
    <%@include file="../../layout/common.js.jsp"%>
</body>
<script type="text/javascript">
	jQuery(function($) {
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
	        }).next().on(ace.click_event, function(){
	                $(this).prev().focus();
	            });
		$('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
	});
	function intake(storageId){
		if(!confirm("确定要入库吗？")){
			return ;
		}
		$("#intake").hide();
		$.ajax({
			url:"<%=request.getContextPath()%>/deviceBatchIntake/doDeviceIntake?storageId="+storageId, 
			data:'',
			method:"get",
			success:function(data){
				if(data == 'ok'){
					alert("入库成功");
				}else if(data == 'no'){
					alert("入库失败");
				}else{
					alert(data);
				}
				$("#subBtn").click();
			}
		});
		
	}
	function deleteDevice(storageId){
		if(!confirm("确定删除此记录吗?")){
			return ;
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/deviceBatchIntake/deleteDevice?storageId="+storageId, 
			success:function(data){
				if(data == 'ok'){
					alert("删除成功");
				}else{
					alert("删除失败");
				}
				$("#subBtn").click();
			}
		});
	}
	
	function openIframe(storageId){
		var url = "<%=request.getContextPath()%>/deviceBatchIntake/deviceView?storageId="+storageId;
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
	function toBatchIntake(){
		var url = "<%=request.getContextPath()%>/deviceBatchIntake/toBatchIntake";
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
</script>
</html>











