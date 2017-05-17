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
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 业务员认证信息查询条件
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
											<form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/salesmanCheck/salesCheckList.do" id="searchForm" method="post">
												<input type="hidden" name="pageNum" value="${pageInfo.pageNum }"> 
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">

												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">直属机构:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="orgNm" id="orgNm" value="${empAuthentication.orgNm}" class="form-control input-small width-200px">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">身份证号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="empIdcard" id="empIdcard" value="${empAuthentication.empIdcard}" class="form-control input-small width-200px">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">审核状态:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" id="authenticationStatus" name="authenticationStatus"
																class="chosen-select form-control width-200px">
																<option value="">全部</option>
																<option value="01" <c:if test="${empAuthentication.authenticationStatus == '01'}">selected="selected"</c:if>>未审核</option>
																<option value="02" <c:if test="${empAuthentication.authenticationStatus == '02'}">selected="selected"</c:if>>审核通过</option>
																<option value="03" <c:if test="${empAuthentication.authenticationStatus == '03'}">selected="selected"</c:if>>审核不通过</option>
															</select>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">提交日期<span style="color: red">*</span>:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" name="authenticationDtStart" value= "${empAuthentication.authenticationDtStart }" id="authenticationDtStart" class="input-small form-control">
																<span class="input-group-addon"><i class="fa fa-exchange"></i></span> 
																<input type="text" name="authenticationDtEnd" value= "${empAuthentication.authenticationDtEnd }" id="authenticationDtEnd" class="input-small form-control">
															</div>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">手机号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="empTel" id="empTel" value="${empAuthentication.empTel}" class="form-control input-small width-200px">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">姓名:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="empName" id="empName" value="${empAuthentication.empName}" class="form-control input-small width-200px">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="branchOrgUuid" id="branchOrgUuid" class="chosen-select form-control width-200px">
																<option value="" >全部</option>
																<c:forEach items="${orgList }" var="org" >
                                                                	<option value="${org.ORG_UUID}"
                                                                	<c:if test="${empAuthentication.branchOrgUuid == org.ORG_UUID }"> selected </c:if>
                                                                	>${org.ORG_NM }</option>
                                                                </c:forEach>
															</select>
														</div>
													</div>
												</div>
												<button class="btn btn-normal btn-sm" type="submit" onclick="return checkForm();" id="searchBtn">
													<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button" onclick="resetMecForm()">
													<span class="ace-icon fa  fa-search-minus bigger-110"></span>
													清空检索条件
												</button>
												<c:if test="${authPermission }">
													<button class="btn btn-primary btn-sm" type="button" onclick="exportDown('1')">
														<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
														导出检索结果
													</button>
													<button class="btn btn-primary btn-sm" type="button" onclick="exportDown('2')">
														<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
														导出检索结果（审单中心）
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
										<i class="ace-icon fa fa-table"></i>业务员认证信息查询结果
									</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
											<thead class="thin-border-bottom">
												<tr>
													<th style="text-align: center; width: 10%">人员编号</th>
													<th style="text-align: center; width: 10%">姓名</th>
													<th style="text-align: center; width: 10%">直属机构</th>
													<th style="text-align: center; width: 10%">手机号码</th>
													<th style="text-align: center; width: 10%">提交时间</th>
													<th style="text-align: center; width: 10%">审核状态</th>
													<c:if test="${authPermission }">
														<th style="text-align: center; width: 10%">操作</th>
													</c:if>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${empAuthList}" var="empAuthentication" varStatus="status">
													<tr>
													    <td style="text-align: center" hidden="hidden">${empAuthentication.empUuid}</td>
													    <td style="text-align: center">${empAuthentication.empNo}</td>
													    <td style="text-align: center">${empAuthentication.empName}</td>
														<td style="text-align: center">${empAuthentication.orgNm}</td>
														<td style="text-align: center" class="hiddenMainInfo">${empAuthentication.empTel}</td>
														<td style="text-align: center"><fmt:formatDate value="${empAuthentication.authenticationDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
														
														<td style="text-align: center">
															<c:if test="${empAuthentication.authenticationStatus=='01'}">未审核</c:if> 
															<c:if test="${empAuthentication.authenticationStatus=='02'}">审核通过</c:if> 
															<c:if test="${empAuthentication.authenticationStatus=='03'}">审核不通过</c:if>
														</td>
														<c:if test="${authPermission }">
															<td style="text-align: center">
																<a href="javaScript:openIframe('${empAuthentication.uuid}','${empAuthentication.empUuid}','1','${empAuthentication.empNo}','${empAuthentication.orgUuid}','${empAuthentication.flowNo}')" class="blue"> 
																	<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看详情</font></i> 
																</a> 
																<c:if test="${empAuthentication.authenticationStatus=='01'}">
																	<a href="javaScript:openIframe('${empAuthentication.uuid}','${empAuthentication.empUuid}','2','${empAuthentication.empNo}','${empAuthentication.orgUuid}','${empAuthentication.flowNo}')" class="blue"> 
																		<i class="ace-icon fa fa-edit  blue bigger-130"><font size="2">审核</font></i>
																	</a>
																</c:if>
																<c:if test="${empAuthentication.authenticationStatus=='02' || empAuthentication.authenticationStatus=='03'}">
																	<a href="javascript:;" onclick="toChangeAuthenticationStatus('${empAuthentication.empNo}','${empAuthentication.empUuid}','${empAuthentication.signPerNo}','${empAuthentication.signPerDt}','${empAuthentication.flowNo}')" class="blue"> 
																		<i class="ace-icon fa fa-edit  blue bigger-130"><font size="2">修改状态</font></i>
																	</a>
																</c:if>
															</td>
														</c:if>
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
	<script type="text/javascript">
		function toChangeAuthenticationStatus(empNo,empUuid,signPerNo,signPerDt,flowNo){
			location.href='<%=request.getContextPath()%>/salesmanCheck/toChangeAuthenticationStatus.do'
			+'?empUuid='+empUuid
			+'&empNo='+empNo
			+'&signPerNo='+signPerNo
			+'&signPerDt='+signPerDt
			+'&flowNo='+flowNo;
		}
	
		function openIframe(uuid,empUuid,flag,empNo,orgUuid,flowNo){
			debugger
		    var href = '<%=request.getContextPath()%>/salesmanCheck/salesCheckDetail'
		     	+'?empUuid='+ empUuid
				+ '&flag=' + flag
				+ '&empNo=' + empNo
				+ '&orgUuid=' + orgUuid
				+ '&flowNo=' + flowNo
		    	+ '&uuid=' + uuid;
				$.fancybox.open({
					href : href,
					type : 'iframe',
					padding : 5,
					scrolling : 'no',
					width : $(window).width() * 0.9,
					centerOnScroll : true,
					autoSize : true,
					helpers : {
						overlay : {
							closeClick : false
						}
					},
					afterClose : function() {
					}
				});
		}
		
		
		function exportDown(type){
			var orgNm= $("#orgNm").val().trim();
			var empIdcard =$("#empIdcard").val().trim();
			var authenticationStatus =$("#authenticationStatus").val();
			var authenticationDtStart = $("#authenticationDtStart").val();
			var authenticationDtEnd = $("#authenticationDtEnd").val();
			var empName= $("#empName").val().trim();
			var empTel= $("#empTel").val().trim();
			var branchOrgUuid= $("#branchOrgUuid").val();
			if(type=='1'){
				location.href='<%=request.getContextPath()%>/salesmanCheck/exportDown1.do'
					+'?orgNm='+orgNm
					+'&empIdcard='+empIdcard
					+'&authenticationStatus='+authenticationStatus
					+'&authenticationDtStart='+authenticationDtStart
					+'&authenticationDtEnd='+authenticationDtEnd
					+'&empTel='+empTel
					+'&empName='+empName
					+'&branchOrgUuid='+branchOrgUuid;
			}else if(type=='2'){
				location.href='<%=request.getContextPath()%>/salesmanCheck/exportDown2.do'
					+'?orgNm='+orgNm
					+'&empIdcard='+empIdcard
					+'&authenticationStatus='+authenticationStatus
					+'&authenticationDtStart='+authenticationDtStart
					+'&authenticationDtEnd='+authenticationDtEnd
					+'&empTel='+empTel
					+'&empName='+empName
					+'&branchOrgUuid='+branchOrgUuid;
			}
		}

		//校验表单
		function checkForm() {
			//检验是否在31天内
			var authenticationDtStart= $("#authenticationDtStart").val();
			var authenticationDtEnd= $("#authenticationDtEnd").val();
			if(authenticationDtStart== null || authenticationDtStart==''
					||authenticationDtEnd== null ||authenticationDtEnd== ''){
				alert("提交日期段不能为空");	
	    		return false;
			}
			if(DateDiff(authenticationDtStart, authenticationDtEnd)>92){
	    		alert("提交日期不能超过三个月");	
	    		return false;
	    	}
			var idCard = $("#empIdcard").val();
			if (idCard == null || idCard == "") {
				return true;
			} else {
				var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
				if (reg.test(idCard) === false) {
					alert("法人证件号码不合法");
					return false;
				}
			}
		}
		 //计算两个日期天数差
		function DateDiff(sDate1, sDate2) {  //sDate1和sDate2是yyyy-MM-dd格式
			var aDate, oDate1, oDate2, iDays;
			aDate = sDate1.split("-");
			oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);  //转换为yyyy-MM-dd格式
			aDate = sDate2.split("-");
			oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
			iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24); //把相差的毫秒数转换为天数
			return iDays;  //返回相差天数
    }
    </script>
    <script type="text/javascript">
	    function resetMecForm(){
		   	 $(':input','#searchForm')  
		   	 .not(':button, :submit, :reset, :hidden')  
		   	 .val('')  
		   	 .removeAttr('checked')  
		   	 .removeAttr('selected'); 
			 $("#authenticationStatus").val('');
			 $("#authenticationStatus").trigger("chosen:updated");
			 $("#branchOrgUuid").val('');
			 $("#branchOrgUuid").trigger("chosen:updated");
			if ($("#authenticationDtStart").val() == null || $("#authenticationDtStart").val() == "") {
		 		$("#authenticationDtStart").val(get3FormatDateBefore());
		 	}
		 	if ($("#authenticationDtEnd").val() == null || $("#authenticationDtEnd").val() == "") {
		 		$("#authenticationDtEnd").val(getFormatDate());
		 	}
		 
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
        
        
        if ($("#authenticationDtStart").val() == null || $("#authenticationDtStart").val() == "") {
    		$("#authenticationDtStart").val(get3FormatDateBefore());
    	}
    	if ($("#authenticationDtEnd").val() == null || $("#authenticationDtEnd").val() == "") {
    		$("#authenticationDtEnd").val(getFormatDate());
    	}
        
    })
    
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
    
        //获取当前月的前三个月
        function get3FormatDateBefore(){
        	var resultDate,year,month,date,hms;   
            var currDate = new Date();  
            year = currDate.getFullYear();  
            month = currDate.getMonth()+1;  
            date = currDate.getDate();  
            hms = currDate.getHours() + ':' + currDate.getMinutes() + ':' + (currDate.getSeconds() < 10 ? '0'+currDate.getSeconds() : currDate.getSeconds());   
            switch(month)  
            {  
                 case 1:  
                 case 2:  
                 case 3:  
                     month += 9;  
                     year--;  
                     break;  
                 default:  
                     month -= 3;  
                     break;  
            }  
             month = (month < 10) ? ('0' + month) : month;  
               
            resultDate = year + '-'+month+'-'+date;  
         return resultDate;  
        }

</script>
</body>
</html>
