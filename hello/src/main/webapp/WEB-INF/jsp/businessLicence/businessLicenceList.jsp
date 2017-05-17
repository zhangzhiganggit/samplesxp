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
										<i class="ace-icon fa fa-table"></i> 商户认证信息查询条件
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
												action="<%=request.getContextPath() %>/businessLicence/businessLicenceList"
												id="searchForm" method="post">
												<input type="hidden" name="pageNum"
													value="${pageInfo.pageNum }"> <input type="hidden"
													name="pageSize" value="${pageInfo.pageSize }">

												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="mno" id="mno"
																value="${mecBusinessLicence.mno}"
																class="form-control input-small width-200px">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">提交时间:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="startSubmitTime"
																	name="startSubmitTime"
																	value="${mecBusinessLicence.startSubmitTime}"
																	class="input-small form-control"> <span
																	class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" id="endSubmitTime"
																	name="endSubmitTime"
																	value="${mecBusinessLicence.endSubmitTime}"
																	class="input-small form-control">
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属一代名称:</label>

														<div class="col-sm-8  no-padding">
															<select id="orgNo" name="orgNo" data-placeholder="请选择"
																class="chosen-select form-control width-200px">
																<option value="" selected="selected">全部</option>
																<c:forEach items="${orgList1}" var="org">
																	<option value="${org.ORG_UUID }"
																	<c:if test="${mecBusinessLicence.orgNo == org.ORG_UUID }"> selected </c:if>
																	>${org.ORG_NM}</option>
																</c:forEach>
															</select>
														</div>
													</div>
													 <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="branchOrgNo" name="branchOrgNo"   data-placeholder="请选择"  class="chosen-select form-control width-200px">
                                                                <option value="" selected="selected">全部</option>
                                                                <c:forEach items="${orgList }" var="org" >
                                                                	<option value="${org.ORG_UUID}"
                                                                	<c:if test="${mecBusinessLicence.branchOrgNo == org.ORG_UUID }"> selected </c:if>
                                                                	>${org.ORG_NM }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                  
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">审核状态:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" id="sts" name="sts"
																class="chosen-select form-control width-200px">
																<option value="">全部</option>
																<option value="00"
																	<c:if test="${mecBusinessLicence.sts == '00'}">selected="selected"</c:if>>未审核</option>
																<option value="01"
																	<c:if test="${mecBusinessLicence.sts == '01'}">selected="selected"</c:if>>审核通过</option>
																<option value="02"
																	<c:if test="${mecBusinessLicence.sts == '02'}">selected="selected"</c:if>>审核不通过</option>
															</select>

														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">数据来源:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" id="dataSource" name="dataSource"
																class="chosen-select form-control width-200px">
																<option value="">全部</option>
																<option value="00"
																	<c:if test="${mecBusinessLicence.dataSource == '00'}">selected="selected"</c:if>>代理商端</option>
																<option value="01"
																	<c:if test="${mecBusinessLicence.dataSource == '01'}">selected="selected"</c:if>>微信端</option>
																
															</select>

														</div>
													</div>

												</div>
												<button class="btn btn-normal btn-sm" type="submit"
													onclick="return checkForm();" id="searchBtn">
													<span
														class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button"
													onclick="resetMecForm()">
													<span class="ace-icon fa  fa-search-minus bigger-110"></span>
													清空检索条件
												</button>
												 <c:if test="${loginUserPermission.SMS_AUDIT_02!=null}">
												<button class="btn btn-primary btn-sm" type="button" onclick='return exportLicence()'>
                                                	<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                                导出认证信息
                                                </button>
                                                </c:if>
                                                <c:if test="${loginUserPermission.SMS_AUDIT_03!=null}">
                                                <button class="btn btn-primary btn-sm" type="button" onclick='return exportMerc()'>
                                                	<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                                导出报备信息
                                                </button>
                                                </c:if>
											</form>
										</div>
									</div>
								</div>
							</div>
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>商户认证信息查询结果
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 10%">归属分公司</th>
													<th style="text-align: center; width: 10%">所属一代名称</th>
													<th style="text-align: center; width: 10%">商户编号</th>
													<th style="text-align: center; width: 10%">商户注册名称</th>
													<th style="text-align: center; width: 10%">营业执照号码</th>
													<th style="text-align: center; width: 10%">提交时间</th>
													<th style="text-align: center; width: 10%">数据来源</th>
													<th style="text-align: center; width: 10%">审核状态</th>
													<th style="text-align: center; width: 10%">操作</th>
												</tr>
											</thead>

											<tbody>

												<c:forEach items="${businessLicenceList}"
													var="mecBusinessLicence" varStatus="status">
													<tr>
													    <td style="text-align: center">${mecBusinessLicence.branchOrgNm}</td>
													    <td style="text-align: center">${mecBusinessLicence.topAgent}</td>
														<td style="text-align: center">${mecBusinessLicence.mno }</td>
														<td style="text-align: center">${mecBusinessLicence.busName}</td>
														<td style="text-align: center">${mecBusinessLicence.regNum}</td>
														<td style="text-align: center">${mecBusinessLicence.submitTime}</td>
														<td style="text-align: center"><c:if
																test="${mecBusinessLicence.dataSource=='00'}">代理商端</c:if> <c:if
																test="${mecBusinessLicence.dataSource=='01'}">微信端</c:if> 
																</td>
														<td style="text-align: center"><c:if
																test="${mecBusinessLicence.sts=='00'}">未审核</c:if> <c:if
																test="${mecBusinessLicence.sts=='01'}">审核通过</c:if> <c:if
																test="${mecBusinessLicence.sts=='02'}">审核不通过</c:if></td>
														<td style="text-align: center"><a
															href="javaScript:openIframe('${mecBusinessLicence.mno}','1','${mecBusinessLicence.uuid}','${mecBusinessLicence.topAgent}','${mecBusinessLicence.branchOrgNm}')"
															class="blue"> <i
																class="ace-icon fa fa-search-plus  blue bigger-130"><font
																	size="2">查看详情</font></i>
														</a> <c:if test="${mecBusinessLicence.sts=='00'}">
																<a
																	href="javaScript:openIframe('${mecBusinessLicence.mno}','2','${mecBusinessLicence.uuid}','${mecBusinessLicence.topAgent}','${mecBusinessLicence.branchOrgNm}','${mecBusinessLicence.dataSource}')"
																	class="blue"> <i
																	class="ace-icon fa fa-edit  blue bigger-130"><font
																		size="2">审核</font></i>
																</a>
															</c:if></td>
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
	function exportLicence(){
		var mno=$("#mno").val();
		var sts=$("#sts").val();
		if(sts=="00"){
			alert("只能导出审核通过和审核不通过的商户信息！");
			return;
		}
		<%-- location.href='<%=request.getContextPath()%>/businessLicence/exportLicence.do?' --%>
			$('#searchForm').attr('action','/businessLicence/exportLicence.do');
		    document.getElementById("searchForm").submit();
		    $('#searchForm').attr('action',' /businessLicence/businessLicenceList');
		   
	}
	function exportMerc(){
		var mno=$("#mno").val();
		var sts=$("#sts").val();
		if(sts=="00"){
			alert("只能导出审核通过和审核不通过的报备信息！");
			return;
		}
		<%-- location.href='<%=request.getContextPath()%>/businessLicence/exportMerc.do?' --%>
		$('#searchForm').attr('action','/businessLicence/exportMerc.do');
	    document.getElementById("searchForm").submit();
	    $('#searchForm').attr('action',' /businessLicence/businessLicenceList');
	}
	 function openIframe(mno,flag,uuid,topAgent,branchOrgNm,dataSource){
	     
	     	var href = '<%=request.getContextPath() %>/businessLicence/businessLicenceDetail?mno='+mno+'&flag='+flag+'&uuid='+uuid+'&topAgent='+topAgent+'&branchOrgNm='+branchOrgNm+'&dataSource='+dataSource;
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
	</script>
	<script type="text/javascript">
	 //校验表单
    function checkForm(){
        	if(!checkSubmitTime(2)){
        		$("#searchMobBtn").attr("disabled", "disabled");
        		return false;
        	}else{
        		return true;
        	}
    }
    //校验提交时间规则
     function checkSubmitTime(val){
         var startTime=$("#startSubmitTime").val();  
         var start=new Date(startTime.replace("-", "/").replace("-", "/"));  
         var endTime=$("#endSubmitTime").val(); 
         var end=new Date(endTime.replace("-", "/").replace("-", "/"));  
         if(end<start){
        	 if(val == 2){
         	    alert("提交起始时间不能大于提交结束时间!");
        	 }
            return false;  
         }else{
        	 $("#searchMobBtn").removeAttr("disabled");
        	 return true;
         }  
     }
     
    
    </script>
     <script type="text/javascript">
    function resetMecForm(){
   	 $(':input','#searchForm')  
   	 .not(':button, :submit, :reset, :hidden')  
   	 .val('')  
   	 .removeAttr('checked')  
   	 .removeAttr('selected'); 
   	 $("#sts").val('');
	 $("#sts").trigger("chosen:updated");
	 $("#branchOrgNo").val('');
	 $("#branchOrgNo").trigger("chosen:updated");
	 $("#orgNo").val('');
	 $("#orgNo").trigger("chosen:updated");
	 $("#dataSource").val('');
	 $("#dataSource").trigger("chosen:updated");
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
    
</script>
</body>
</html>
