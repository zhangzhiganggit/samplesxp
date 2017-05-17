<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<%@include file="../layout/common.jsp"%>
<script src="${ctx }/js/fileUp/fileUpload.js"></script>
</head>
<body class="no-skin " >
	<div class="main-container" id="main-container">
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 商户即日付查询条件
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
											<form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/nowPayManage/mercNowPayManage" method="post" id="searchForm">
												<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}"> 
												<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}">
												<input type="hidden" name="branch_org_no" value="${branch_org_no}">
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mno" value="${mecIfJrf.mno }"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" id="mno">
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户名称:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="cpr_reg_nm_cn" value="${mecIfJrf.cpr_reg_nm_cn }"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" id="cpr_reg_nm_cn">
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">即日付状态
															<span style="color:red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="stl_sts"
																id="stl_sts"
																class="chosen-select form-control width-200px">
																<option value="">全部</option>
																<option value="未开通"<c:if test="${mecIfJrf.stl_sts=='未开通' }">selected</c:if>>未开通</option>
																<option value="01"<c:if test="${mecIfJrf.stl_sts=='01' }">selected</c:if>>开通</option>
																<option value="00"<c:if test="${mecIfJrf.stl_sts=='00' }">selected</c:if>>关闭</option>
																<option value="02"<c:if test="${mecIfJrf.stl_sts=='02' }">selected</c:if>>暂停</option>
															</select>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">开通日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" name="dt_cte_start" value= "${mecIfJrf.dt_cte_start }"
																	id="dt_cte_start" class="input-small form-control" onchange="changeDateStart()">
																<span class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" name="dt_cte_end" value= "${mecIfJrf.dt_cte_end }"
																	id="dt_cte_end" class="input-small form-control" onchange="changeDateEnd()">
															</div>
														</div>
													</div>
												</div>
												<button class="btn btn-normal btn-sm" type="submit">
													<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button" onclick="resetAll()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
												</button>
												<button class="btn btn-primary btn-sm" type="button" onclick="uploadExcel()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                    导出检索结果
                                                </button>
                                                <button class="btn btn-primary btn-sm" type="button" onclick="downLoadTemplate()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                    下载模板
                                                </button>
												<button class="btn btn-danger btn-sm" type="button" onclick="operation('','all')">
													<span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
													批量导入开通
												</button>
												<button class="btn btn-danger btn-sm" type="button" onclick="openImportJRFFLPage()">
                                                    <span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
                                                                                                        批量修改费率
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="openImportJRFEDPage()">
                                                    <span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
                                                                                                        批量修改额度
                                                </button>
											</form>
										</div>
									</div>
								</div>
							</div>

							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 商户即日付查询结果
									</h5>
								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 9%">商户编号</th>
													<th style="text-align: center; width: 14%">商户名称</th>
													<th style="text-align: center; width: 10%">直属代理</th>
													<th style="text-align: center; width: 10%">归属一代</th>
													
													<th style="text-align: center; width: 9%">所属分公司</th>
													<th style="text-align: center; width: 7%">即日付状态</th>
													<th style="text-align: center; width: 7%">即日付额度</th>
													<th style="text-align: center; width: 7%">即日付费率</th>
													<th style="text-align: center; width: 7%">开通日期</th>
													<th style="text-align: center; width: 7%">进件日期</th>
													<th style="text-align: center; ">操作记录</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${mecIfJrfList }" var="mecIfJrf">
													<tr>
														<td style="text-align: center;">${mecIfJrf.mno }</th>
														<td style="text-align: left;">${mecIfJrf.cpr_reg_nm_cn }</td>
														<td style="text-align: left;"><c:if test="${mecIfJrf.mec_source=='02' }">${mecIfJrf.org_nm }</c:if></th>
														<td style="text-align: left;"><c:if test="${mecIfJrf.mec_source=='02' }">${mecIfJrf.top_agent_org_no }</c:if></td>
														<td style="text-align: left;">${mecIfJrf.branch_org_no }</td>
														<td style="text-align: center;">${mecIfJrf.stl_sts_str }</td>
														<td style="text-align: right;" <c:if test="${mecIfJrf.stl_sts_str eq '暂停' || mecIfJrf.stl_sts_str eq '开通'}">class='numberPointFormatForText'</c:if>>
															<c:if test="${mecIfJrf.stl_sts_str eq '暂停' || mecIfJrf.stl_sts_str eq '开通'}">
																${mecIfJrf.remain_amt}
															</c:if>
														</td>
														<td style="text-align: center;">
															<c:if test="${mecIfJrf.stl_sts_str eq '暂停' || mecIfJrf.stl_sts_str eq '开通'}">
																${mecIfJrf.rat1 }
															</c:if>
														</td>
														<td style="text-align: center;">${mecIfJrf.dt_cte }</td>
														<td style="text-align: center;">${mecIfJrf.jinjianDt }</td>
														<td style="text-align: left;">
															<div class="action-buttons">															
																<c:if test="${mecIfJrf.canChangeState}">
																	<c:if test="${mecIfJrf.stl_sts_str!='暂停' }">
																		<a href="#" onclick="operation('${mecIfJrf.mno}','one')" class="blue fancybox-manual-b"> 
																			<i class="ace-icon fa fa-gear blue bigger-130">
																				<font size="2">操作</font>
																			</i>
																		</a>
																	</c:if>
																</c:if>
																<a href="#" onclick="operationRecord('${mecIfJrf.mno}','${mecIfJrf.cpr_reg_nm_cn}')" class="blue fancybox-manual-b"> 
																	<i class="ace-icon fa fa-search-plus blue bigger-130">
																		<font size="2">操作记录</font>
																	</i>
																</a>
																<c:if test="${mecIfJrf.canChangeState}">
																	<c:if test="${mecIfJrf.stl_sts_str eq '暂停' || mecIfJrf.stl_sts_str eq '开通'}">
																	
																		<a href="#" onclick="openEditJRFView('${mecIfJrf.mno}','${mecIfJrf.cpr_reg_nm_cn }','${mecIfJrf.rat1 }')" class="blue fancybox-manual-b"> 
																			<i class="ace-icon fa fa-gear blue bigger-130">
																				<font size="2">修改费率</font>
																			</i>
																		</a>
																	</c:if>
																</c:if>
																<a href="#" onclick="editFLRecord('${mecIfJrf.mno}','${mecIfJrf.cpr_reg_nm_cn}')" class="blue fancybox-manual-b"> 
																	<i class="ace-icon fa fa-search-plus blue bigger-130">
																		<font size="2">查看费率记录</font>
																	</i>
																</a>
																<c:if test="${mecIfJrf.canChangeState}">
																	<c:if test="${mecIfJrf.stl_sts_str eq '开通'}">
																		<a href="#" onclick="openEditEDView('${mecIfJrf.inMno}','${mecIfJrf.cpr_reg_nm_cn }','${mecIfJrf.remain_amt}','${mecIfJrf.mno}')" class="blue fancybox-manual-b"> 
																			<i class="ace-icon fa fa-gear blue bigger-130">
																				<font size="2">修改额度</font>
																			</i>
																		</a>
																	</c:if>
																</c:if>
																<a href="#" onclick="editEDRecord('${mecIfJrf.inMno}','${mecIfJrf.cpr_reg_nm_cn}')" class="blue fancybox-manual-b"> 
																	<i class="ace-icon fa fa-search-plus blue bigger-130">
																		<font size="2">查看额度记录</font>
																	</i>
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
								<%@include file="../layout/pagination.jsp"%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript">
		$('.chosen-select').chosen({});
		$('.input-daterange').datepicker({
			autoclose:true
		});
		
		function operation(mno,entry){
			var listMno=$("#mno").val();
			var listCpr_reg_nm_cn=$("#cpr_reg_nm_cn").val();
			var listStl_sts=$("#stl_sts").val();
			var listDt_cte_start=$("#dt_cte_start").val();
			var listDt_cte_end=$("#dt_cte_end").val();
			
			$.fancybox.open({
				href : '<%=request.getContextPath()%>/nowPayManage/operation?mno='+mno+'&entry='+entry
						+"&listMno="+listMno
						+"&listCpr_reg_nm_cn="+listCpr_reg_nm_cn
						+"&listStl_sts="+listStl_sts
						+"&listDt_cte_start="+listDt_cte_start
						+"&listDt_cte_end="+listDt_cte_end,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 800,
	        height: 600,
	        autoSize: false,
	        closeClick: false,
	        closeBtn:false
			});
		}
		
		function operationRecord(mno,cpr_reg_nm_cn){
			$.fancybox.open({
				href : '<%=request.getContextPath()%>/nowPayManage/operationRecord?mno='+mno+'&cpr_reg_nm_cn='+cpr_reg_nm_cn,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 1200,
	        height: 600,
	        autoSize: false,
	        closeClick: false,
			});
		}
		
		function resetAll(){
			$(':input','#searchForm')  
         	 .not(':button, :submit, :reset, :hidden')  
         	 .removeAttr('checked')  
         	 .removeAttr('selected'); 
         	$("#mno").val('');
      	 	$("#mno").trigger("chosen:updated");
      	 	$("#cpr_reg_nm_cn").val("");
      	 	$('#cpr_reg_nm_cn').trigger("chosen:updated");
      	 	$("#stl_sts").val("");
     	 	$('#stl_sts').trigger("chosen:updated");
     	 	$("#dt_cte_start").val("");
     	 	$('#dt_cte_start').trigger("chosen:updated");
     	 	$("#dt_cte_end").val("");
     	 	$('#dt_cte_end').trigger("chosen:updated"); 
		}
		function uploadExcel(){
			$("#searchForm").attr("action","<%=request.getContextPath()%>/nowPayManage/uploadExcel");
			document.getElementById("searchForm").submit();
			$("#searchForm").attr("action","<%=request.getContextPath() %>/nowPayManage/mercNowPayManage");
		}
		function exportDown(){
			location.href='<%=request.getContextPath()%>/nowPayManage/excelDown'
		}
		
		function changeDateStart(){
			var dt_cte_start=Number($("#dt_cte_start").val().replace(/-/g,''));
			var dt_cte_end=Number($("#dt_cte_end").val().replace(/-/g,''));
			if(dt_cte_end!=0){
				if(dt_cte_start>dt_cte_end){
					$("#dt_cte_end").val($("#dt_cte_start").val())
				}
			}
		}
		function changeDateEnd(){
			var dt_cte_start=Number($("#dt_cte_start").val().replace(/-/g,''));
			var dt_cte_end=Number($("#dt_cte_end").val().replace(/-/g,''));
			if(dt_cte_start!=0){
				if(dt_cte_start>dt_cte_end){
					$("#dt_cte_start").val($("#dt_cte_end").val())
				}
			}
		}
		<!-- 打开修改即日付费率界面 -->
		function openEditJRFView(mno,cprRegNmCn,jrffl) {
	    	
			var listMno=$("#mno").val();
			var listCpr_reg_nm_cn=$("#cpr_reg_nm_cn").val();
			var listStl_sts=$("#stl_sts").val();
			var listDt_cte_start=$("#dt_cte_start").val();
			var listDt_cte_end=$("#dt_cte_end").val();
			
	    	$.fancybox.open({
				href : '<%=request.getContextPath() %>/nowPayManage/openEditJRFflView?mno='+mno+'&cprRegNmCn='+cprRegNmCn
						+'&jrrffl='+jrffl,
				type: 'iframe',
		        padding: 5,
		        scrolling: 'no',
		        fitToView: true,
		        width: 800,
		        height: 300,
		        autoSize: false,
		        closeClick: false
			});
	    }
		
		 /**
	     *	打开下载模板界面，选择下载开通模板或者修改即日付费率模板
	     */
	    function downLoadTemplate() {
	    	$.fancybox.open({
				href : '<%=request.getContextPath() %>/nowPayManage/downLoadTemplate',
				type: 'iframe',
		        padding: 5,
		        scrolling: 'no',
		        fitToView: true,
		        width: 800,
		        height: 300,
		        autoSize: false,
		        closeClick: false
			});
	    }
		 
	    <!-- 打开导入即日付费率界面 -->
	    function openImportJRFFLPage(){
	    	$.fancybox.open({
	    		href : '<%=request.getContextPath() %>/nowPayManage/toImportJRFFLView',
				type: 'iframe',
		        padding: 5,
		        scrolling: 'no',
		        fitToView: true,
		        width: 800,
		        height: 900,
		        autoSize: false,
		        closeClick: false,
		        afterClose:function(){
					window.location.reload();
				}
	        });
	    }
	    
	    <!-- 查看即日付费率修改记录 -->
	    function editFLRecord(mno,cprRegNmCn) {
	    	$.fancybox.open({
	    		href : '<%=request.getContextPath() %>/nowPayManage/lookOverJRFFLEditHis?mno='+mno ,
				type: 'iframe',
		        padding: 5,
		        scrolling: 'no',
		        fitToView: true,
		        width: 1000,
		        height: 500,
		        autoSize: false,
		        closeClick: false
	        });
	    }
	    <!-- 打开即日付额度修改界面 -->
	    function openEditEDView(inMno,cprRegNmCn,jrfed,mno) {
	    	var flag='';
            $.ajax({
            	type: "POST",
            	url: "/nowPayManage/valiDayPayLimit",
            	data: "bizCode=19",
                success: function(data){
    	            flag=data.msgCode;
    	            if(flag=='00'){
    	            	$.fancybox.open({
    	        			href : '<%=request.getContextPath() %>/nowPayManage/openEditJRFEDView?inMno='+inMno+'&cprRegNmCn='+cprRegNmCn+'&jrfed='+jrfed+'&mno='+mno,
    	        			type: 'iframe',
    	        	        padding: 5,
    	        	        scrolling: 'no',
    	        	        fitToView: true,
    	        	        width: 800,
    	        	        height: 300,
    	        	        autoSize: false,
    	        	        closeClick: false
    	        		});
    				}else{
                    	alert("系统已暂停受理即日付调额申请");
                    }
                }
    		});
        }
        
        <!-- 打开导入即日付额度界面 -->
        function openImportJRFEDPage(){
        	var flag='';
            $.ajax({
            	type: "POST",
            	url: "/nowPayManage/valiDayPayLimit",
            	data: "bizCode=19",
                success: function(data){
    	            flag=data.msgCode;
    	            if(flag=='00'){
    	            	$.fancybox.open({
    	            		href : '<%=request.getContextPath() %>/nowPayManage/toImportJRFEDView',
    	        			type: 'iframe',
    	        	        padding: 5,
    	        	        scrolling: 'no',
    	        	        fitToView: true,
    	        	        width: 800,
    	        	        height: 500,
    	        	        autoSize: false,
    	        	        closeClick: false,
    	        	        afterClose:function(){
    	        	        	window.location.reload();
    	        			}
    	                });
    				}else{
                    	alert("系统已暂停受理即日付调额申请");
                    }
                }
    		});
        	
        }
        <!-- 查看即日付额度修改记录 -->
	    function editEDRecord(inMno,cprRegNmCn,mno) {
	    	$.fancybox.open({
	    		href : '<%=request.getContextPath() %>/nowPayManage/lookOverJRFEDEditHis?inMno='+inMno+'&cprRegNmCn='+cprRegNmCn+'&mno='+mno ,
				type: 'iframe',
		        padding: 5,
		        scrolling: 'no',
		        fitToView: true,
		        width: 1000,
		        height: 500,
		        autoSize: false,
		        closeClick: false
	        });
	    }
	</script>
</body>
</html>











