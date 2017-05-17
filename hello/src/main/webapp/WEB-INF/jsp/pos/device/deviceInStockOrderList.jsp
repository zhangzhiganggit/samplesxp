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
                                        	终端附件入库单列表(不含sim卡)
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/device/deviceInStockOrder/list" id="searchForm" method="POST">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
                                                <div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >入库单号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="device_id" id="device_id" value="${deviceInStockOrder.device_id}" class="form-control input-small width-200px"  >  
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >入库单生成人:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="create_user" id="create_user" value="${deviceInStockOrder.create_user}"  class="form-control input-small width-200px"  >  
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >携机入网:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <select data-placeholder="请选择" id="merc_own" name="merc_own" 
                                                              class="chosen-select form-control width-200px" >
                                                              <option value="">全部</option>
																			<option value="1" <c:if test="${1==deviceInStockOrder.merc_own}"> selected </c:if>>是</option>
																			<option value="0" <c:if test="${0==deviceInStockOrder.merc_own}"> selected </c:if>>否</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >物品名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="goods_id" name="goods_id" 
                                                              class="chosen-select form-control width-200px" >
                                                               <option value="">全部</option>
																	<c:if test="${!empty subsectionList}">
																		<c:forEach items="${subsectionList}" var="item">
																			<option value="${item.value}" <c:if test="${item.value==deviceInStockOrder.goods_id}"> selected </c:if>>${item.label}</option>
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
																		<option code="${item.code}" value="${item.id}" <c:if test="${item.id==deviceInStockOrder.fact_id}"> selected </c:if>>${item.short_name}</option>
																	</c:forEach>
																</c:if>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >型号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="mod_id" name="mod_id" 
                                                              class="chosen-select form-control width-200px" >
                                                               <option value="">全部</option>
																<c:if test="${!empty modelList }">
																	<c:forEach items="${modelList}" var="item">
																		<option code="${item.id}" value="${item.id}" <c:if test="${item.id==deviceInStockOrder.mod_id}"> selected </c:if>>${item.mod_name}</option>
																	</c:forEach>
																</c:if>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >分公司:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="org" name="org" <c:if test="${current_org_id != '0010000000'}">readOnly</c:if>
                                                              class="chosen-select form-control width-200px" >
                                                               	<c:choose>
																	<c:when test="${current_org_id eq '0010000000'}">
																		<option value="">全部</option>
																		<c:forEach items="${orgList}" var="item">
																			<option code="${item.orgUuid}" value="${item.orgUuid}" <c:if test="${item.orgUuid eq conditions.org_id}"> selected </c:if>>${item.orgNm}</option>
																		</c:forEach>
																	</c:when>
																	<c:otherwise >
																		<c:forEach items="${orgList}" var="item">
																			<c:if test="${item.orgUuid==current_org_id}">
																				<option code="${item.orgUuid}" value="${item.orgUuid}" <c:if test="${item.orgUuid==current_org_id}"> selected </c:if>>${item.orgNm}</option>
																			</c:if>
																		</c:forEach>
																	</c:otherwise>
																</c:choose>
                                                            </select>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">入库日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="begin_time" id="begin_time"  class="input-small form-control" value="${deviceInStockOrder.begin_time}">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="end_time"  id="end_time" class="input-small form-control" value="${deviceInStockOrder.end_time}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                      <!-- 完毕 -->
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
                                                    清空检索条件
                                                </button> 
                                                <button class="btn btn-danger btn-sm" type="button" onclick="javaScript:openIframe('','3')">
                                                    <span class="ace-icon fa fa-list icon-on-right bigger-110"></span>
                                                   添加入库单
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
                                                                                        终端附件入库查询结果
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                            	<th style="text-align:center;width:8%">入库单号</th>
                                                <th style="text-align:center;width:8%">物品名称</th>
                                                <th style="text-align:center;width:10%">厂商简称</th>
                                                <th style="text-align:center;width:8%">型号 </th>
                                                <th style="text-align:center;width:7%">状态</th>
                                                <th style="text-align:center;width:5%">前缀</th>
                                                <th style="text-align:center;width:9%">起序列号 </th>
                                                <th style="text-align:center;width:9%">终序列号</th>
                                                <th style="text-align:center;width:5%">后缀</th>
                                                <th style="text-align:center;width:7%">数量（台）</th>
                                                <th style="text-align:center;width:8%">入库日期</th>
                                                <th style="text-align:center;width:6%">所属机构</th>
                                                <th style="text-align:center;width:10%">操作</th>
                                            </tr>
                                            </thead>
                                            <c:if test="${!empty deviceInStockOrderList}">
                                            <tbody>
                                            <c:forEach items="${deviceInStockOrderList}" var="deviceInStockOrder"  varStatus="status">
												<tr>
													<!-- <td style="border:1px solid  #969696;">${status.index+1 }</td> -->
													<td style="text-align:center;">${deviceInStockOrder.id}</td>
													<td style="text-align:center;">
														<c:if test="${deviceInStockOrder.goods_id == '001' }">pos终端</c:if>
														<c:if test="${deviceInStockOrder.goods_id == '011' }">密码键盘</c:if>
														<c:if test="${deviceInStockOrder.goods_id == '013' }">RF读卡器</c:if>
														<c:if test="${deviceInStockOrder.goods_id == '014' }">手写板</c:if>
														<c:if test="${deviceInStockOrder.goods_id == '100' }">手刷设备</c:if>
														<c:if test="${deviceInStockOrder.goods_id == '200' }">收款卡</c:if>
													</td>
													<td style="text-align:left;">${deviceInStockOrder.fact_name }</td>
													<td style="text-align:left;">${deviceInStockOrder.mod_name}</td>
													<td style="text-align:center;">
														<c:if test="${deviceInStockOrder.status == '0' }">草稿</c:if>
														<c:if test="${deviceInStockOrder.status == '1' }">入库</c:if>
														<c:if test="${deviceInStockOrder.status == '2' }">入库</c:if>
													</td>
													<td style="text-align:left;">
														${deviceInStockOrder.sn_prefix}
													</td>
													<td style="text-align:right;">${deviceInStockOrder.sn_begin}</td>
													<td style="text-align:right;">${deviceInStockOrder.sn_end}</td>
													<td style="text-align:left;">
														${deviceInStockOrder.sn_suffix}
													</td>
													<td style="text-align:right;">
														${deviceInStockOrder.quantity}
													</td>
													<td style="text-align:center;">${deviceInStockOrder.receiptTime }</td>
													<td style="text-align:left;">${deviceInStockOrder.org_name }</td>
													<td style="text-align:left;">
									                     <div class="action-buttons">
									                         <a href="javaScript:openIframe('${deviceInStockOrder.id}','1')" class="blue">
									                             	 查看详情
									                         </a>
									                         <c:if test="${deviceInStockOrder.status == '0'}">
										                         <a href="javaScript:openIframe('${deviceInStockOrder.id}','2')" class="blue">
										                             	 修改
										                         </a>
										                         <a onclick="if(confirm('确定删除吗?')==false)return false;" href="javaScript:remove('${deviceInStockOrder.id}')" class="blue">
										                             	 删除 
										                         </a>
										                         <a id="audit${deviceInStockOrder.id }" href="javaScript:audit('${deviceInStockOrder.id}')" class="blue">
										                             	入库
										                         </a>
									                         </c:if>
									                     </div>
									                 </td>
												</tr>
											</c:forEach> 
                                            </tbody>
											</c:if>
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

		<div class="modal" id="mymodal" data-backdrop="static">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
						<h4 class="modal-title">处理中...... 请勿刷新或关闭！</h4>
					</div>
					<div class="modal-body" style="text-align: center;" >
						<i class="fa fa-cog fa-spin fa-5x fa-fw "></i>
						<span class="sr-only">Loading...</span>
					</div>
					</div>
				</div>
			</div>
		</div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%@include file="../../layout/common.js.jsp"%>
         <script type="text/javascript" src="<%=request.getContextPath() %>/js/common/common.js"></script>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    
		function uploadExcel(){
			$("#searchForm").attr("action","<%=request.getContextPath()%>/device/sKeyImport/uploadExcel.do");
			document.getElementById("searchForm").submit();
			$("#searchForm").attr("action","<%=request.getContextPath()%>/device/sKeyImport/list");
		}

		$('.chosen-select').chosen({}); 
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
        })
//show datepicker when clicking on the icon
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
//or change it into a date range picker
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
    })
    
    function formatValue(obj){
        	var value=Number(obj.value.replace(/[^+\d]/g,''));
        	if(value == 0){
        		obj.value = '';
        		return;
        	}
        	obj.value = value;
        	
        }
        function resetMecForm(){
           	 $(':input','#searchForm') 
           	 .not(':button, :submit, :reset, :hidden')
           	 .val('')  
           	 .removeAttr('checked')  
           	 .removeAttr('selected');
           	 $("#merc_own").val('');
        	 $("#merc_own").trigger("chosen:updated");
        	 $("#goods_id").val('');
       		 $("#goods_id").trigger("chosen:updated");
       		 $("#fact_id").val('');
      		 $("#fact_id").trigger("chosen:updated");
      		 $("#mod_id").val('');
      		 $("#mod_id").trigger("chosen:updated");
      		 $("#org").val('');
      		 $("#org").trigger("chosen:updated");
       	}
        
    function openIframe(uuid,flag){
    	var href = '';
    	if(1 == flag){
    		href = '<%=request.getContextPath() %>/device/deviceInStockOrder/Detail?uuid='+uuid;
    	}else if(2 == flag){
    		href = '<%=request.getContextPath() %>/device/deviceInStockOrder/Edit?uuid='+uuid;
    	}else if(3 == flag){
    		href = '<%=request.getContextPath() %>/device/deviceInStockOrder/preAdd';
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
				if(3 == flag|| 2 == flag){
					reloadParent();
				}
			}
		});
    }
    
   
    
  //型号细分类型下拉框变动
	$(document).ready(function() {
		$("#goods_id").change(function() {
			var val = $(this).val();
			var fact_val=$("#fact_id").val();
			 $("#mod_id").empty();
			$.ajax({
				type : "GET",
				url : "${ctx}/device/sKeyImport/getModList?goods_id=" + val+"&fact_id="+fact_val,
				dataType : "json",
				cache : false,
				success : function(data) {
					if(data.length>0){
						var abc='<option value="">请选择</option>';
						for (var i = 0; i < data.length; i++) {
							abc+="<option value='"+data[i].id+"'>" + data[i].mod_name + "</option>";
						} 
						$("#mod_id").html(abc);
						$("#mod_id").trigger("chosen:updated");
					}else{
						$("#mod_id").empty();
						$("#mod_id").append("<option value=''>全部 </option>");
					}
				}
			});
			
		});
				
		//厂商简称下拉框变动
		$("#fact_id").change(function() {								
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
  
  //入库操作
  function audit(uuid){
	  var id = 'audit'+uuid;
	  if(confirm('确定入库吗?')==false){
		  return false;
	  }
	  $("#mymodal").modal("toggle");
		$.ajax({
			type : "GET",
			url : "${ctx}/device/deviceInStockOrder/audit",
			dataType : "json",
			data:{
				"uuid":uuid
	        	},
			cache : false,
			success : function(data) {
				if(data.rn_value=="-1"){
					showExitSn(data.jsonSn);
				}else {
					if(data.rn_value=="-2"){
						alert("此入库单中不是草稿状态，不能继续入库");
					}else if(data.rn_value=="-3"){
						alert("此入库单的条件不足，不能继续入库");
					}else if(data.rn_value=="-6"){
						alert("此入库单中密钥为空，不能继续入库");
					}else if(data.rn_value=="-7"){
						alert("入库失败，请稍后重试");
					}else{
						alert("此条记录被成功审核");
					}
						reloadParent();
				}
			}
		});
  }
  function showExitSn(jsonStr){
  	var href = '<%=request.getContextPath() %>/device/deviceInStockOrder/showExitSn?jsonStr='+jsonStr;
  	$.fancybox.open({
			href : href,
			type: 'iframe',
          padding: 5,
          scrolling: 'no',
          width: $(window).width() * 0.6,
          centerOnScroll:true,
          autoSize: true,
          helpers:{
          	overlay:{
          		closeClick:false
          	}
          },
			afterClose:function(){
				reloadParent();
			}
		});
  }
  //入库操作
  function remove(uuid){
	  $.ajax({
			type : "GET",
			url : "${ctx}/device/deviceInStockOrder/remove",
			dataType : "json",
			data:{
				"uuid":uuid
	        	},
			cache : false,
			success : function(data) {
				if(data.resCode>0){
					alert("此条记录被成功删除");
				}
				reloadParent();
			}
		});
  }
  
  function reloadParent(){
  	document.getElementById("searchForm").submit();
  }
</script>

<script type="text/javascript">
	//型号细分类型下拉框变动
	$(function(){  
	//厂商简称下拉框变动
	$("#fact_id").change(function() {								
		var val = $(this).val();
		$("#mod_id").empty();
 		var goods_val=$("#goods_id").val();
 		$("#mod_id").append("<option value=''> 请选择...  </option>");
		var abc = "<option value=''> 请选择...  </option>";
		$.ajax({
			type : "GET",
			url : "${ctx}/device/sKeyImport/getModList?fact_id="+val+"&goods_id="+goods_val,
			dataType : "json",
			cache : false,
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					abc+="<option value='"+data[i].id+"'>" + data[i].mod_name + "</option>";
				}
				$("#mod_id").html(abc);
				$("#mod_id").trigger("chosen:updated");
			}
		}); 
	});
});
	
</script>
</body>
</html>











