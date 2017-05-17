<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>

<%@include file="../layout/common.css.jsp"%>
</head>

<body class="no-skin ">


	<div class="main-container" id="main-container">
		<script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

		<div class="main-content ">
			<div class="main-content-inner ">

				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 通用规则查询条件
									</h5>
									<span class="widget-toolbar"> <a data-action="collapse"
										href="#"> <i class="ace-icon fa fa-chevron-up"></i>
									</a>
									</span>

								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal"
												action="<%=request.getContextPath() %>/enregisterInfo/enregisterInfoRuleList"
												id="searchForm" method="post">
												<input type="hidden" name="pageNum"
													value="${pageInfo.pageNum }"> <input type="hidden"
													name="pageSize" value="${pageInfo.pageSize }">

												<div class=" col-xs-12">
													
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">使用类型:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" id="useType" name="useType"
																class="chosen-select form-control width-200px">
																<option value="">全部</option>
																<option value="01"
																	<c:if test="${enregisterInfo.useType == '01'}">selected="selected"</c:if>>登记信息规则</option>
																<option value="02"
																	<c:if test="${enregisterInfo.useType == '02'}">selected="selected"</c:if>>业务员审核认证</option>
																<option value="03"
																	<c:if test="${enregisterInfo.useType == '03'}">selected="selected"</c:if>>VV商户审核认证</option>
																<option value="04"
																	<c:if test="${enregisterInfo.useType == '04'}">selected="selected"</c:if>>二代手刷实名认证</option>
																<option value="06"
																	<c:if test="${enregisterInfo.useType == '06'}">selected="selected"</c:if>>MPOS二级认证</option>
																<option value="07"
																	<c:if test="${enregisterInfo.useType == '07'}">selected="selected"</c:if>>MPOS四级认证</option>
																<option value="05"
																	<c:if test="${enregisterInfo.useType == '05'}">selected="selected"</c:if>>大POS自动秒到审核</option>
															</select>

														</div>
													</div>
												</div>
												<button class="btn btn-normal btn-sm" type="submit" id="searchBtn">
													<span
														class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button"
													onclick="resetMecForm()">
													<span class="ace-icon fa  fa-search-minus bigger-110"></span>
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
										<i class="ace-icon fa fa-table"></i>通用规则查询结果
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
												    <th style="text-align: center; width: 10%">使用类型</th>
													<th style="text-align: center; width: 20%">登记项</th>
													<th style="text-align: center; width: 20%">操作人账号</th>
													<th style="text-align: center; width: 20%">操作时间</th>
													<th style="text-align: center;">操作</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${enregisterInfoList }" var="enregisterInfo">
													<tr>
													    <td style="text-align: center;">${enregisterInfo.useTypeStr }</th>
														<td style="text-align: center;">${enregisterInfo.bigItemsStr }</th>
														<td style="text-align: center;">${enregisterInfo.updateEr }</td>
														<td style="text-align: center;"><fmt:formatDate value="${enregisterInfo.updateDt }" pattern="yyyy-MM-dd HH:mm:ss"/></th>
														
														<td style="text-align: center;">
															<div class="action-buttons">
																<a href="#" class="green" id="detail" onclick="showDetail('${enregisterInfo.bigItems}','${enregisterInfo.useType}');"> 
																	<i class="ace-icon fa fa-search-plus blue bigger-130"><font size="2">查看</font></i>
																</a>
                                                        		<a href="#" class="green" id="add" onclick="toAddEnregisterInfoRule('${enregisterInfo.bigItems}','${enregisterInfo.useType}');"> 
																	<i class="ace-icon fa fa-edit  blue bigger-130"><font size="2">添加</font></i>
																</a>
                                                        		<a href="#" class="green" id="update" onclick="toUpdateEnregisterInfoRule('${enregisterInfo.bigItems}','${enregisterInfo.useType}');"> 
																	<i class="ace-icon fa fa-edit blue bigger-130"><font size="2">修改</font></i>
																</a>
	                                                        	<a href="#" class="green" id="updateDetail" onclick="showUpdateDetailAll('${enregisterInfo.bigItems}');"> 
																	<i class="ace-icon fa fa-search-plus blue bigger-130"><font size="2">修改记录</font></i>
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
	<%@include file="../layout/common.alljs.jsp"%>
	<!-- inline scripts related to this page -->
	
	
     <script type="text/javascript">
    function resetMecForm(){
   	 $(':input','#searchForm')  
   	 .not(':button, :submit, :reset, :hidden')  
   	 .val('')  
   	 .removeAttr('checked')  
   	 .removeAttr('selected'); 
   	 $("#useType").val('');
	 $("#useType").trigger("chosen:updated");
    }
        $('.chosen-select').chosen({});
        jQuery(function($) {
        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        }).next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
    })
    
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
        function showDetail(bigItems,useType){
    		$.fancybox.open({
    			href : '<%=request.getContextPath()%>/enregisterInfo/showDetail?bigItems='+bigItems+'&useType='+useType,
    			type: 'iframe',
    	        padding: 5,
    	        scrolling: 'no',
    	        fitToView: true,
    	        width: 1400,
    	        height: 500,
    	        autoSize: false,
    	        closeClick: false,
    	        afterClose:function(){
    			}
    		});
    	}
    	
    	function toAddEnregisterInfoRule(bigItems,useType){
    		debugger
    		
    		$.fancybox.open({
                href : '<%=request.getContextPath()%>/enregisterInfo/toAddEnregisterInfoRule?bigItems='+bigItems+'&useType='+useType,
                type: 'iframe',
    	        padding: 5,
    	        scrolling: 'no',
    	        fitToView: true,
    	        width: 1400,
    	        height: 500,
    	        autoSize: false,
    	        closeClick: false,
    	        afterClose:function(){
    			}
    		});
    	}
    	
    	function toUpdateEnregisterInfoRule(bigItems,useType){
    		$.fancybox.open({
    			href : '<%=request.getContextPath()%>/enregisterInfo/toUpdateEnregisterInfoRule?bigItems='+bigItems+'&useType='+useType,
    			type: 'iframe',
    	        padding: 5,
    	        scrolling: 'no',
    	        fitToView: true,
    	        width: 1400,
    	        height: 500,
    	        autoSize: false,
    	        closeClick: false,
    	        afterClose:function(){
    			}
    		});
    	}
    	
    	function showUpdateDetailAll(bigItems){
    		$.fancybox.open({
    			href : '<%=request.getContextPath()%>/enregisterInfo/showUpdateDetailAll?bigItems='+bigItems,
    			type: 'iframe',
    	        padding: 5,
    	        scrolling: 'no',
    	        fitToView: true,
    	        width: 1400,
    	        height: 500,
    	        autoSize: false,
    	        closeClick: false,
    	        afterClose:function(){
    			}
    		});
    	}
</script>
</body>
</html>
