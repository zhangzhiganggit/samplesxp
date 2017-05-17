<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
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
										<i class="ace-icon fa fa-table"></i> 商户即刷即到查询
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
												action="/MobMecTimelyAccount/list.do?orgProp=2"
												id="searchForm">
												<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="total" value="${pageInfo.getTotal()}" >
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">商户编号:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="mno" value="${mobOrg.mno }"
																class="form-control input-small width-200px"
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																data-placement="bottom" title="" id="mno"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册名称:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="cprRegNmCn" value="${mobOrg.cprRegNmCn }"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" id="cprRegNmCn"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">手机号:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="mobTel"  value="${mobOrg.mobTel }"
																class="form-control input-small width-200px "
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																data-placement="bottom" title="" id="mobTel"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">开通状态:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select class="chosen-select form-control width-200px" id="status"
																	name="status">
																	<option value="" >全部</option>
																	<option value="1"<c:if test="${mobOrg.status=='1'}"> selected="selected" </c:if>>开通</option>
																	<option value="0"<c:if test="${mobOrg.status=='0'}"> selected="selected" </c:if>>关闭</option>
																	
																</select>
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属一代:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="topAgentOrgUuid" name="topAgentOrgUuid" 
																	class="chosen-select form-control width-200px">
																	<option value="">全部</option>
																	<c:forEach items="${orgList }" var="orgs">
																		<option value="${orgs.orgUuid }"
																			<c:if test="${orgs.orgUuid == mobOrg.topAgentOrgUuid }"> selected </c:if>>${orgs.orgNm}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">直属机构:</label>

														<div class="col-sm-8  no-padding">
															<input type="text" name="allowOrgNm" value="${mobOrg.allowOrgNm }"
																class="form-control input-small width-200px"
																data-placement="bottom" title="" id="allowOrgNm"
																data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >创建时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="createTimeStart" id="createTimeStart" value="${mobOrg.createTimeStart }" class="input-small form-control date-picker" onchange="checkCreateTime(1)">
                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="createTimeEnd" id="createTimeEnd" value="${mobOrg.createTimeEnd }" class="input-small form-control date-picker" onchange="checkCreateTime(1)">
                                                            </div>
                                                        </div>
                                                    </div>
													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >开通时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="openTimeStart" id="openTimeStart" value="${mobOrg.openTimeStart }" class="input-small form-control date-picker" onchange="checkOpenTime(1)">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="openTimeEnd" id="openTimeEnd" value="${mobOrg.openTimeEnd }" class="input-small form-control date-picker" onchange="checkOpenTime(1)">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >关闭时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="closeTimeStart" id="closeTimeStart" value="${mobOrg.closeTimeStart  }" class="input-small form-control date-picker" onchange="closeTime(1)">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="closeTimeEnd" id="closeTimeEnd" value="${mobOrg.closeTimeEnd }" class="input-small form-control date-picker" onchange="closeTime(1)">
                                                            </div>
                                                        </div>
                                                    </div>

												</div>

												<button class="btn btn-normal btn-sm" type="submit" onclick="return checkForm();" id="searchMobBtn">
													<span
														class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button"
													onclick="resetMecForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>清空检索条件
												</button>
											</form>
										</div>
									</div>
								</div>
							</div>


							<div class="widget-box widget-color-normal2" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>  商户即刷即到查询结果
									</h5>


								</div>

								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table style="word-break:break-all; word-wrap:break-all; "
											class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th width="10%">商户编号</th>
													<th width="15%">商户注册名称</th>
													<th width="10%">手机号</th>
													<th width="10%">归属一代</th>
													<th width="15%">一代业务状态</th>
													<th width="10%">直属机构</th>
													<th width="10%">商户开通状态</th>
													<th width="10%" >开通时间</th>
													<th width="10%">关闭时间</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${mogMecList }" var="de">
													<tr>
														<td align="center">${de.mno }</td>
														<td align="left">${de.cprRegNmCn }</td>
														<td align="center" class="hiddenMainInfo">${de.mobTel}</td>
														<td align="left">${de.topOrgNm }</td>
														<td align="center">
															<c:if test="${de.topStatus == '1' }">正常</c:if>
															<c:if test="${de.topStatus == '2' }">暂停拓展</c:if>
														</td>
														<td align="center">${de.allowOrgNm }</td>
														<td align="center">
															<c:if test="${de.status == null }">关闭</c:if>
															<c:if test="${de.status == '1' }">开通</c:if>
															<c:if test="${de.status == '0' }">关闭</c:if>
														</td>
														<td align="center">
														 <fmt:parseDate value="${de.openTime }" pattern="yyyyMMdd" var="test"/>   
                                                         <fmt:formatDate value="${test}" pattern="yyyy-MM-dd"/> 
														</td>
														<td align="center">
													     <fmt:parseDate value="${de.closeTime }" pattern="yyyyMMdd" var="test"/>   
                                                         <fmt:formatDate value="${test}" pattern="yyyy-MM-dd"/> 
														</td>
														<td>
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
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->

	<%@include file="../layout/common.alljs.jsp"%>
	<script type="text/javascript">
        $('.chosen-select').chosen({});
        jQuery(function($) {

            $('.date-picker').datepicker({
                autoclose: true,
                language: 'zh-CN',
                todayHighlight: true,
                keyboardNavigation:true,
                clearBtn:true
            }).next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
            $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
   		   $('#searchForm').formValidation({
             message: 'This value is not valid',
             container:'popover',
             feedbackIcons: {
                 valid: 'glyphicon glyphicon-ok',
                 invalid: 'glyphicon glyphicon-remove',
                 validating: 'glyphicon glyphicon-refresh'
             },
             fields: {
             	
            	 mobTel : {
 					validators : {
 						
 						regexp: {
 	                        regexp: /^1\d{10}$/g,
 	                        message:'请输入正确的手机号'
 	                    }

 					}
 				}
             }
         });
    })
   function myResetForm(){
		$("select").val('');
		$("select").trigger("chosen:updated");
	}
	
    
         //提交前校验
     function checkForm(){
    	 var createTimeStart = $("#createTimeStart").val();
    	 var createTimeEnd = $("#createTimeEnd").val();
    	 
    	 if((createTimeStart == null && createTimeEnd == null) || (createTimeStart == "" && createTimeEnd == "")){
    		 alert("创建时间不可为空!");
    		 return false;
    	 }else{
    		 if(!checkCreateTime(2)){
    			 $("#searchMobBtn").attr("disabled", "disabled");
    			 return false;
    		 }
    		 if(!closeTime(2)){
    			 $("#searchMobBtn").attr("disabled", "disabled");
    			 return false;
    		 }
    		 if(!checkOpenTime(2)){
    			 $("#searchMobBtn").attr("disabled", "disabled");
    			 return false;
    		 }
    	 }
    		 return true;
     }
     //重置
     function resetMecForm() {
		var notFilter = ":button, :submit, :reset, :hidden";
		$(':input', '#searchForm').not(':button, :submit, :reset, :hidden')
				.val('').removeAttr('checked').removeAttr('selected');
		myResetForm();
		//创建时间还原
	    var start = new Date();
	        start.setDate(start.getDate()-182);
	    var end = new Date();
	    var sM = start.getMonth()+1;
	    var ssM = "";
	    var ssD = "";
	    if(sM<10){
	    	ssM = "0"+sM;
	    }else{
	    	ssM = sM;
	    }
	    if(start.getDate()<10){
	    	ssD = "0"+start.getDate();
	    }else{
	    	ssD = start.getDate();
	    }
	    var eM = end.getMonth()+1;
	    var eeM = "";
	    var eeD = "";
	    if(eM<10){
	    	eeM = "0"+eM;
	    }else{
	    	eeM = eM;
	    }
	    if(end.getDate()<10){
	    	eeD = "0"+end.getDate();
	    }else{
	    	eeD = end.getDate();
	    }
	    $("#createTimeStart").val(start.getFullYear()+"-"+ssM+"-"+ssD);
   	    $("#createTimeEnd").val(end.getFullYear()+"-"+eeM+"-"+eeD);
	}
	function myResetForm(){
		$("select").val('');
		$("select").trigger("chosen:updated");
	}
     //校验创建时间
     function checkCreateTime(val){
    	 var createTimeStart = $("#createTimeStart").val();
    	 var createTimeEnd = $("#createTimeEnd").val();
    	 //大小规则
         var start=new Date(createTimeStart.replace("-", "/").replace("-", "/"));  
         var end=new Date(createTimeEnd.replace("-", "/").replace("-", "/"));  
         
    	 if(createTimeStart != null && createTimeEnd != null){
	    	 createTimeStart = new Date(createTimeStart.replace(/-/g, "/"));
	    	 createTimeEnd = new Date(createTimeEnd.replace(/-/g, "/"));
	    	 var days =  createTimeEnd.getTime() - createTimeStart.getTime();
	    	 var time = parseInt(days / (1000 * 60 * 60 * 24));
	    	 if(time>182){
	    		 if(val == 2){
    		        alert("创建时间跨度不可大于半年!");
	    		 }
    		     //$("#searchMobBtn").attr("disabled", "disabled");
    		     return false;
	    	 }else if(end<start){
	    		 if(val == 2){
	    		        alert("创建时间开始不能大于创建时间结束!");
		          }
	    		 return false;
	    	 }else{
	    		 $("#searchMobBtn").removeAttr("disabled");
	    		 return true;
	    	 }
    	 }else{
    		 $("#searchMobBtn").removeAttr("disabled");
    		 return true;
    	 }
     }
     //校验开通时间规则
     function checkOpenTime(val){
         var startTime=$("#openTimeStart").val();  
         var start=new Date(startTime.replace("-", "/").replace("-", "/"));  
         var endTime=$("#openTimeEnd").val(); 
         var end=new Date(endTime.replace("-", "/").replace("-", "/"));  
         if(end<start){
        	 if(val == 2){
         	    alert("开通起始时间不能大于起始结束时间!");
        	 }
            return false;  
         }else{
        	 $("#searchMobBtn").removeAttr("disabled");
        	 return true;
         }  
     }
     //校验关闭时间
     function closeTime(val){
         var startTime=$("#closeTimeStart").val();  
         var start=new Date(startTime.replace("-", "/").replace("-", "/"));  
         var endTime=$("#closeTimeEnd").val();    
         var end=new Date(endTime.replace("-", "/").replace("-", "/"));  
         if(end<start){
        	 if(val == 2){
         	   alert("关闭起始时间不能大于关闭结束时间!");
        	 }
        	 return false;
         }else{
        	 $("#searchMobBtn").removeAttr("disabled");
        	 return true;
         }  
     }
</script>
</body>
</html>











