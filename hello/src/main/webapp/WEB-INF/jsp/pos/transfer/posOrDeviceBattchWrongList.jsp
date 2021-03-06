<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../../layout/common.jsp"%>
     <%@include file="../../common/taglib.jsp"%>
     
     <script src="<%=request.getContextPath() %>/js/common/common.js"></script>
     
</head>

<body class="no-skin ">
    
   <%--  <%@include file="../layout/header.jsp"%> --%>

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
       <%--   <%@include file="../layout/menu.jsp"%>  --%>

        <div class="main-content ">
            <div class="main-content-inner ">

               
                <div class="page-content ">

                    <div class="row" >


                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       		 异常查询条件
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

		
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/posTransferAdmin/queryPosBattchWrongList" id="searchForm" method="post">
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                                <div class=" col-xs-12">
                                                  <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >导入日期:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="dateStart" name="dateStart" onchange="revalidateDate();" value="${obsBattch.import_time }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="dateEnd" name="dateEnd"  onchange="revalidateDate();" value="${obsBattch.end_time }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >异常数据状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="status" name="status" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                               			<option value="" <c:if test="${obsBattch.status==''}"> selected</c:if>>请选择</option>
																		<option value="1" <c:if test="${obsBattch.status=='1'}"> selected</c:if>>发货机构与收货机构相同</option>
																		<option value="2" <c:if test="${obsBattch.status=='2'}"> selected</c:if>>发货机构不存在</option>
																		<option value="3" <c:if test="${obsBattch.status=='3'}"> selected</c:if>>收货机构不存在</option>
																		<option value="4" <c:if test="${obsBattch.status=='4'}"> selected</c:if>>厂商编号不存在</option>
																		<option value="5" <c:if test="${obsBattch.status=='5'}"> selected</c:if>>厂商无设备</option>
																		<option value="6" <c:if test="${obsBattch.status=='6'}"> selected</c:if>>发货机构不存在设备</option>
																		<option value="7" <c:if test="${obsBattch.status=='7'}"> selected</c:if>>设备不是在库状态</option>
																		<option value="8" <c:if test="${obsBattch.status=='8'}"> selected</c:if>>有未走完的划拨单</option>
																		<option value="9" <c:if test="${obsBattch.status=='9'}"> selected</c:if>>导入数据内部有重复</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >批次号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="battch_id"  name="battch_id" value="${obsBattch.battch_id }"  onkeyup="javascript:this.value=this.value.replace(/\s/g,'');"  class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >操作人:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="create_nm" name="create_nm" value="${obsBattch.create_nm }" class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div align="left">
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                                                                                                                                                         检索
                                                </button>
												
                                                 <button class="btn btn-info btn-sm" type="button"  onclick="selectAll()">
                                                    <span class="ace-icon fa  icon-on-right bigger-110"></span>
                                                                                       全选
                                                </button> 
                                                 <button  class="btn btn-normal btn-sm" type="button" onclick="disSelectAll();">
                                                    <span class="ace-icon fa  icon-on-right bigger-110"></span>
                                                                                                                                                                                         反选
                                                </button>
												
                                                 <button class="btn btn-info btn-sm" type="button"  onclick="closeSC()">
                                                    <span class="ace-icon fa fa-trash icon-on-right bigger-110"></span>
                                                    批量删除
                                                </button>
                                                </div> 
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        	异常查询结果
                                    </h5>


                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th align="center" hidden="hidden"><input type="checkbox" id="checkAll" hidden="hidden"> </th>
                                                <th align="center">选择</th>
                                                <th style="text-align: center;width: 10%">  错误编号 </th>
                                                <th style="text-align: center;width: 10%">  批次号</th>
                                                <th style="text-align: center;width: 10%">  导入日期</th>
                                                <th style="text-align: center;width: 10%">  操作人</th>
                                                <th style="text-align: center;width: 10%">  发出机构号</th>
                                                <th style="text-align: center;width: 10%">  收货机构号</th>
                                                <th style="text-align: center;width: 5%">  物品名称</th>
                                                <th style="text-align: center;width: 5%">  厂商编号</th>
                                                <th style="text-align: center;width: 5%">  型号</th>
                                                <th style="text-align: center;width: 10%">  设备序列号</th>
                                                <th style="text-align: center;width: 10%">  数据异常状态</th>
                                                <th  style="text-align: center;">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                           <c:forEach items="${obsBattchList}" var="obsBattchList"  varStatus="status">
													<tr>
													    <th align="center"><input name="subBox" type="checkbox" id="${obsBattchList.id }" value="${obsBattchList.id }"> </th>
														<td style="text-align: center;">${obsBattchList.id }</td>
														<td style="text-align: center;">${obsBattchList.battch_id }</td>
														<td style="text-align: center;">${obsBattchList.import_time }</td>
														<td style="text-align: center;">${obsBattchList.create_nm }</td>
														<td style="text-align: center;">${obsBattchList.s_org_id }</td>
														<td style="text-align: center;">${obsBattchList.d_org_id }</td>
														<td style="text-align: center;">${obsBattchList.device_name }</td>
														<td style="text-align: center;">${obsBattchList.fact_id }</td>
														<td style="text-align: center;">${obsBattchList.mod_name }</td>
														<td style="text-align: center;">${obsBattchList.fact_sn }</td>
														<td style="text-align: center;">
															<c:choose>
														      <c:when test="${obsBattchList.status==1}">发货机构与收货机构相同</c:when>
														      <c:when test="${obsBattchList.status==2}">发货机构不存在</c:when>
														      <c:when test="${obsBattchList.status==3}">收货机构不存在</c:when>
														      <c:when test="${obsBattchList.status==4}">厂商编号不存在</c:when>
														      <c:when test="${obsBattchList.status==5}">厂商无该设备</c:when>
														      <c:when test="${obsBattchList.status==6}">发货机构无该设备</c:when>
														      <c:when test="${obsBattchList.status==7}">设备不是在库状态</c:when>
														      <c:when test="${obsBattchList.status==8}">有未走完的划拨单</c:when>
														      <c:when test="${obsBattchList.status==9}">导入数据内部有重复</c:when>
														   </c:choose>
														</td>
														<td   style="text-align: center;">
										                     <div class="   action-buttons">
										                         <a href="#" onclick="wrongLogDelete('${obsBattchList.id}')" class="blue fancybox-manual-b">
										                             <i>删除</i>
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

    <%-- <%@include file="../layout/footer.jsp"%> --%>
    <%@include file="../../layout/common.js.jsp"%>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    
      function wrongLogDelete(id){
/*     	if(!$("#"+id+"").prop('checked')){
    		alert("请选择一条记录删除！");
    		return;
    	}   */
    	var battchIds = id+",";
    	if(confirm("是否确认删除?")){
    		$.ajax({
    			type:'post',
    			url:"<%=request.getContextPath()%>/posTransferAdmin/batchDelete",
    			data:'ids='+battchIds,
    			async:false,
    			success:function(data){
    				alert(data);
    				location.reload();
    			},
    			error:function(){
    				alert("删除失败！");
    				location.reload();
    			}
    		});	
    	}
    	  
      }
    
      //校验日期合法
      function revalidateDate(){
 /*      	revalidateFieldByFieldName('searchForm','dateStart');
      	revalidateFieldByFieldName('searchForm','dateEnd'); */
      	 var endtime = $('#dateEnd').val();
         var starttime = $('#dateStart').val();
         var start = new Date(starttime.replace("-", "/").replace("-", "/"));
         var end = new Date(endtime.replace("-", "/").replace("-", "/"));
         if (end < start) {
             alert('结束日期不能小于开始日期！');
             $('#dateEnd').val("");
             $('#dateStart').val("");
             return;
         }
         else {
             return true;
         }
      }
    
    
        
        jQuery(function($) {
        	$('.chosen-select').chosen({});
        	 $('#searchForm').formValidation({
                 message: 'This value is not valid',
                 container:'popover',
                 feedbackIcons: {
                     valid: 'glyphicon glyphicon-ok',
                     invalid: 'glyphicon glyphicon-remove',
                     validating: 'glyphicon glyphicon-refresh'
                 },
                 fields: {
                 	
                     dateStart: {
                         validators: {
                             dateCompare: {
                             	dayLength:1460
                             }
                         }
                     },
                     dateEnd: {
                         validators: {
                             dateCompare: {
                             	
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
    //导出excel
    function uploadExcel(){
		$("#searchForm").attr("action","<%=request.getContextPath()%>/posTransferAdmin/uploadTransferWrongListExcel");
		document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","<%=request.getContextPath()%>/posTransferAdmin/queryPosBattchWrongList");
    }
     function selectAll(){
		//全选
        $("#checkAll").prop('checked', true);
        $('input[name="subBox"]').each(function() {
       	 if($("#checkAll").prop('checked')){
       	    $(this).prop('checked', true);
       	 }else{
       		$(this).prop('checked', false);
       	 }
        }); 
     }
     //反选
     function disSelectAll(){
 		//全选
         $("#checkAll").prop('checked', false);
         $('input[name="subBox"]').each(function() {
        	 if($(this).prop('checked')){
        	    $(this).prop('checked', false);
        	 }else{
        		$(this).prop('checked', true);
        	 }
         }); 
      }
     //批量删除
     function closeSC(){
    	 var battchIds = "";
         $('input[name="subBox"]').each(function() {
        	 if($(this).prop('checked')){
        		 battchIds += $(this).val()+",";       		 
        	 }
         });
         if(battchIds == ""){
          	alert("请选择需要删除的数据!");
          	return;
          }
         if(battchIds.length!=0){
        	 if(confirm("是否确认删除?")){
        		 $.ajax({
          			type:'post',
          			url:"<%=request.getContextPath()%>/posTransferAdmin/batchDelete",
          			data:'ids='+battchIds,
          			async:false,
          			success:function(data){
          				alert(data);
          				location.reload();
          			},
          			error:function(){
          				alert("删除失败！");
          				location.reload();
          			}
          		});	
        	 }
        	 
         }else{
        	 alert("请选择删除的数据！");
       		return;   
         }
 		
     }
     //全选
     $(function() {
            $("#checkAll").click(function() {
                 $('input[name="subBox"]').each(function() {
                	 if($("#checkAll").prop('checked')){
                	    $(this).prop('checked', true);
                	 }else{
                		$(this).prop('checked', false);
                	 }
                 }); 
             });
             var $subBox = $("input[name='subBox']");
             $subBox.click(function(){
                 $("#checkAll").prop("checked",$subBox.length == $("input[name='subBox']:checked").length ? true : false);
             });
     });		 
</script>
</body>
</html>











