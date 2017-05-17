<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付admin</title>

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
                                        	限制归属查询条件
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/deviceLimit/limitOwner" id="searchForm" method="POST">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" id="batNo" name="batNo" value="${owner.batNo }" />
												<input type="hidden" id="isFirst" name="isFirst" value="true" />
												<!-- 返回回填参数 -->
												<input type="hidden" id="factId" name="factId" value="${deviceLimit.factId}" />
												<input type="hidden" id="modId" name="modId" value="${deviceLimit.modId }" />
												<input type="hidden" id="status" name="status" value="${deviceLimit.status }" />
												<input type="hidden" id="operTimeStart" name="operTimeStart" value="${deviceLimit.operTimeStart}" />
												<input type="hidden" id="operTimeEnd" name="operTimeEnd" value="${deviceLimit.operTimeEnd}" />
												
												
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="全部" name="branchUuid" id="branchUuid"
																class="chosen-select form-control width-200px">
																<c:if test="${owner.loginNo=='0010000000'}">
																	<option value="">全部</option>
																</c:if>
																<c:forEach items="${branchOrg }" var="org">
																	<option value="${org.orgUuid }"
																		<c:if test="${owner.branchUuid == org.orgUuid }"> selected="selected" </c:if>>${org.orgNm }</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属机构:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="orgNm" id="orgNm"
																value="${owner.orgNm}"
																class="form-control input-small width-200px" />
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="agentUuid" id="agentUuid"
																value="${owner.agentUuid}"
																class="form-control input-small width-200px" />
														</div>
													</div>
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
                                                    清空检索条件
                                                </button> 
                                                <button class="btn btn-default btn-sm" type="button" onclick="returnOne()">
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
                        	返回
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="clean()">
                                                    <span class="ace-icon fa  icon-on-right bigger-110"></span>
                                                   清空
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="javaScript:limitImport()">
                                                    <span class="ace-icon fa  icon-on-right bigger-110"></span>
                                                   导入
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
                                                                                     限制归属查询结果
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width:10%">序号</th>
                                                <th style="text-align:center;width:8%">归属分公司 </th>
                                                <th style="text-align:center;width:7%">归属机构</th>
                                                <th style="text-align:center;width:8%">添加时间</th>
                                                <th style="text-align:center;width:10%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${limitOwner}" var="de"  varStatus="status">
												<tr>
													<td style="text-align:left;">${status.index + 1}</td>
													<td style="text-align:center;">${de.branchNm}</td>
													<td style="text-align:center;">${de.orgNm}</td>
													<td style="text-align:center;">${de.updateTimeStr }</td>
													<td style="text-align:left;">
							                             <a href="#" onclick="deleteOne('${de.branchUuid}','${de.agentUuid}')" class="blue">删除</a>
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
         <script type="text/javascript" src="<%=request.getContextPath() %>/js/common/common.js"></script>
    <!-- inline scripts related to this page -->
    <script type="text/javascript"> 
		$('.chosen-select').chosen({}); 
        jQuery(function($) {
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
        function resetMecForm(){
           	 $(':input','#searchForm') 
           	 .not(':button, :submit, :reset, :hidden')
           	 .val('')  
           	 .removeAttr('checked')  
           	 .removeAttr('selected');
           	 $("#branchUuid").val('');
   			 $("#branchUuid").trigger("chosen:updated");
   			 $("#orgNm").val('');
   	         $("#orgNm").trigger("chosen:updated");
      		 $("#agentUuid").val('');
      		 $("#agentUuid").trigger("chosen:updated");
       	}
        
  function reloadParent(){
  	document.getElementById("searchForm").submit();
  }
  function returnOne(){
	  	var factId=$("#factId").val();
	  	var modId=$("#modId").val();
	  	var status=$("#status").val();
	  	var operTimeStart=$("#operTimeStart").val();
	  	var operTimeEnd=$("#operTimeEnd").val();
  		var href='<%=request.getContextPath()%>/deviceLimit/list?factId='+factId+'&modId='+modId+'&status='+status+'&operTimeStart='+operTimeStart+'&operTimeEnd='+operTimeEnd;
  		window.location.href=href;
  }
  function changeDateStart(){
		 var operTimeStart=Number($("#operTimeStart").val().replace(/-/g,''));
		 var operTimeEnd=Number($("#operTimeEnd").val().replace(/-/g,''));
		 if(operTimeEnd!=0){
			 if(operTimeStart>operTimeEnd){
				 $("#operTimeEnd").val($("#operTimeStart").val());
			 }
		 }
	 }
	 function changeDateEnd(){
		 var operTimeStart=Number($("#operTimeStart").val().replace(/-/g,''));
		 var operTimeEnd=Number($("#operTimeEnd").val().replace(/-/g,''));
		 if(operTimeStart!=0){
			 if(operTimeStart>operTimeEnd){
				 $("#operTimeStart").val($("#operTimeEnd").val());
			 }
		 }
	 }
	 function clean(){
		 var batNo=$("#batNo").val();
		 var href = "<%=request.getContextPath() %>/deviceLimit/clean?batNo="+batNo;
		 debugger;
	    	if(confirm("确定要删除全部归属限制么？")){
				$.ajax({
					type : "POST",
					url : href,
					async:false,
					success : function(date) {
						if(date == "1"){
							alert("删除成功!");
						}else{
							alert("删除失败!");
						}
					}
				});
				location.reload();
	    	}
	 }
	 function deleteOne(branchUuid,agentUuid){
		 var batNo=$("#batNo").val();
		 var href = "<%=request.getContextPath() %>/deviceLimit/deleteOne?batNo="+batNo+"&branchUuid="+branchUuid+"&agentUuid="+agentUuid;
	    	if(confirm("确定要删除该归属限制么？")){
				$.ajax({
					type : "POST",
					url : href,
					async:false,
					success : function(data) {
						if(data == '1'){
							alert("删除成功!");
						}else{
							alert("删除失败!");
						}
					}
				});
				location.reload();
	    	}
	 }
	 function limitImport(){
		 debugger;
		 var batNo=$("#batNo").val();
		 var href='<%=request.getContextPath() %>/deviceLimit/limitImport?batNo='+batNo;
		 $.fancybox.open({
				href : href,
				type: 'iframe',
	            padding: 5,
	            scrolling: 'no',
	            width: $(window).width() * 0.8,
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
</script>

</body>
</html>











