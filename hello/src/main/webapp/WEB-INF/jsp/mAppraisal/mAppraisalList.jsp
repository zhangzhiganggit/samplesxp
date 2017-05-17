<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<%@include file="../layout/common.jsp"%>
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
										<i class="ace-icon fa fa-table"></i>系统评价查询条件
									</h5>
									<span class="widget-toolbar"> 
										<a data-action="collapse"href="#"> <i class="ace-icon fa fa-chevron-up"></i></a>
									</span>
								</div>
								<div class="widget-body">
									<div class="widget-main no-padding ">
										<div class="widget-main ">
											<form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mAppraisal/mAppraisalList.do?entry=1"
												id="searchForm" method="post">
												<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
												<div class=" col-xs-12">
													
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属分公司:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="-请选择-" name="branchOrgNo" id="branchOrgNo" onchange="changeBranchOrgNo()" class="chosen-select form-control width-200px">
																<c:if test="${orgUuid==null || orgUuid=='' || orgUuid=='0010000000' }">
																	<option value="" >-请选择-</option>
																</c:if>
																<c:forEach items="${orgList }" var="org" >
                                                                	<option value="${org.ORG_UUID}"
                                                                	<c:if test="${mAppraisal.branchOrgNo == org.ORG_UUID }"> selected </c:if>
                                                                	>${org.ORG_NM }</option>
                                                                </c:forEach>
															</select>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属一代:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="-请选择-" name="topOrgNo" id="topOrgNo" class="chosen-select form-control width-200px">
																<option value="" >-请选择-</option>
															</select>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">评价功能:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="-请选择-" name="opinionType" id="opinionType" class="chosen-select form-control width-200px">
																<option value="" >-请选择-</option>
																<option value="1" <c:if test="${mAppraisal.opinionType == '1'}">selected</c:if>>新增商户</option>
																<option value="2" <c:if test="${mAppraisal.opinionType == '2'}">selected</c:if>>草稿列表</option>
																<option value="3" <c:if test="${mAppraisal.opinionType == '3'}">selected</c:if>>POS商户查询</option>
																<option value="4" <c:if test="${mAppraisal.opinionType == '4'}">selected</c:if>>手刷商户查询</option>
																<option value="5" <c:if test="${mAppraisal.opinionType == '5'}">selected</c:if>>其他消费商户查询</option>
																<option value="6" <c:if test="${mAppraisal.opinionType == '6'}">selected</c:if>>POS商户交易查询</option>
																<option value="7" <c:if test="${mAppraisal.opinionType == '7'}">selected</c:if>>手刷交易查询</option>
																<option value="8" <c:if test="${mAppraisal.opinionType == '8'}">selected</c:if>>其他消费交易查询</option>
																<option value="9" <c:if test="${mAppraisal.opinionType == '9'}">selected</c:if>>POS商户结算查询</option>
																<option value="10" <c:if test="${mAppraisal.opinionType == '10'}">selected</c:if>>手刷结算查询</option>
																<option value="11" <c:if test="${mAppraisal.opinionType == '11'}">selected</c:if>>其他消费结算查询</option>
																<option value="12" <c:if test="${mAppraisal.opinionType == '12'}">selected</c:if>>手刷有效商户查询</option>
																<option value="13" <c:if test="${mAppraisal.opinionType == '13'}">selected</c:if>>商户审核数据管理</option>
																<option value="14" <c:if test="${mAppraisal.opinionType == '14'}">selected</c:if>>商户终端管理</option>
																<option value="15" <c:if test="${mAppraisal.opinionType == '15'}">selected</c:if>>客服协办</option>
																<option value="16" <c:if test="${mAppraisal.opinionType == '16'}">selected</c:if>>商户风控状态管理</option>
																<option value="17" <c:if test="${mAppraisal.opinionType == '17'}">selected</c:if>>调单协查</option>
																<option value="18" <c:if test="${mAppraisal.opinionType == '18'}">selected</c:if>>风控线索提供</option>
																<option value="19" <c:if test="${mAppraisal.opinionType == '19'}">selected</c:if>>追偿查询</option>
																<option value="20" <c:if test="${mAppraisal.opinionType == '20'}">selected</c:if>>合规整改</option>
																<option value="21" <c:if test="${mAppraisal.opinionType == '21'}">selected</c:if>>机具订购</option>
																<option value="22" <c:if test="${mAppraisal.opinionType == '22'}">selected</c:if>>订单查询</option>
																<option value="23" <c:if test="${mAppraisal.opinionType == '23'}">selected</c:if>>库存查询</option>
																<option value="24" <c:if test="${mAppraisal.opinionType == '24'}">selected</c:if>>终端查询</option>
																<option value="25" <c:if test="${mAppraisal.opinionType == '25'}">selected</c:if>>附件查询</option>
																<option value="26" <c:if test="${mAppraisal.opinionType == '26'}">selected</c:if>>IC卡查询</option>
																<option value="27" <c:if test="${mAppraisal.opinionType == '27'}">selected</c:if>>缴费管理</option>
																<option value="28" <c:if test="${mAppraisal.opinionType == '28'}">selected</c:if>>赊购管理</option>
																<option value="29" <c:if test="${mAppraisal.opinionType == '29'}">selected</c:if>>假日付商户管理</option>
																<option value="30" <c:if test="${mAppraisal.opinionType == '30'}">selected</c:if>>即日付商户管理</option>
																<option value="31" <c:if test="${mAppraisal.opinionType == '31'}">selected</c:if>>自动秒到商户查询</option>
																<option value="32" <c:if test="${mAppraisal.opinionType == '32'}">selected</c:if>>维护费商户管理</option>
																<option value="33" <c:if test="${mAppraisal.opinionType == '33'}">selected</c:if>>维护费订单查询</option>
																<option value="34" <c:if test="${mAppraisal.opinionType == '34'}">selected</c:if>>随意通代理商 管理</option>
																<option value="35" <c:if test="${mAppraisal.opinionType == '35'}">selected</c:if>>随意通商户管理</option>
																<option value="36" <c:if test="${mAppraisal.opinionType == '36'}">selected</c:if>>随意通审核数据管理</option>
																<option value="37" <c:if test="${mAppraisal.opinionType == '37'}">selected</c:if>>商户额度使用</option>
																<option value="38" <c:if test="${mAppraisal.opinionType == '38'}">selected</c:if>>分销机构管理</option>
																<option value="39" <c:if test="${mAppraisal.opinionType == '39'}">selected</c:if>>业务员管理</option>
																<option value="40" <c:if test="${mAppraisal.opinionType == '40'}">selected</c:if>>办公人员管理</option>
																<option value="41" <c:if test="${mAppraisal.opinionType == '41'}">selected</c:if>>保证金查询</option>
																<option value="42" <c:if test="${mAppraisal.opinionType == '42'}">selected</c:if>>资料下载</option>
																<option value="43" <c:if test="${mAppraisal.opinionType == '43'}">selected</c:if>>系统评价</option>
																<option value="44" <c:if test="${mAppraisal.opinionType == '44'}">selected</c:if>>意见建议</option>
																<option value="45" <c:if test="${mAppraisal.opinionType == '45'}">selected</c:if>>巡检卡设置</option>
																<option value="46" <c:if test="${mAppraisal.opinionType == '46'}">selected</c:if>>巡检记录</option>
																<option value="47" <c:if test="${mAppraisal.opinionType == '47'}">selected</c:if>>机构信息</option>
																<option value="48" <c:if test="${mAppraisal.opinionType == '48'}">selected</c:if>>个人信息</option>
																<option value="49" <c:if test="${mAppraisal.opinionType == '49'}">selected</c:if>>更换登录账号</option>
																<option value="50" <c:if test="${mAppraisal.opinionType == '50'}">selected</c:if>>业务员实名认证</option>
																<option value="51" <c:if test="${mAppraisal.opinionType == '51'}">selected</c:if>>修改密码</option>
																<option value="52" <c:if test="${mAppraisal.opinionType == '52'}">selected</c:if>>收货地址管理</option>
																<option value="53" <c:if test="${mAppraisal.opinionType == '53'}">selected</c:if>>首页</option>
																<option value="54" <c:if test="${mAppraisal.opinionType == '54'}">selected</c:if>>商户进件</option>
																<option value="55" <c:if test="${mAppraisal.opinionType == '55'}">selected</c:if>>装换撤</option>
																<option value="56" <c:if test="${mAppraisal.opinionType == '56'}">selected</c:if>>商户查询</option>
																<option value="57" <c:if test="${mAppraisal.opinionType == '57'}">selected</c:if>>进度流程查询</option>
																<option value="58" <c:if test="${mAppraisal.opinionType == '58'}">selected</c:if>>订单管理（关闭）</option>
																<option value="59" <c:if test="${mAppraisal.opinionType == '59'}">selected</c:if>>余额支付</option>
															</select>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px ">
														<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">评价日期:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" name="appraisalTimeStart" value="${mAppraisal.appraisalTimeStart }" id="appraisalTimeStart" onchange="changeAppraisalTimeStart()" class="input-small form-control">
																<span class="input-group-addon"><i class="fa fa-exchange"></i></span> 
																<input type="text" name="appraisalTimeEnd" value="${mAppraisal.appraisalTimeEnd }" id="appraisalTimeEnd" onchange="changeAppraisalTimeEnd()" class="input-small form-control">
															</div>
														</div>
													</div>
													
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">状态:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="-请选择-" name="isShow" id="isShow" class="chosen-select form-control width-200px">
																<option value="" >-请选择-</option>
																<option value="0" <c:if test="${mAppraisal.isShow == '0'}">selected</c:if>>未展示</option>
																<option value="1" <c:if test="${mAppraisal.isShow == '1'}">selected</c:if>>已展示</option>
															</select>
														</div>
													</div>
												</div>
												<button class="btn btn-normal btn-sm" type="submit" onclick="return beforeSubmit()">
													<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
												</button>
												<button class="btn btn-info btn-sm" type="button" onclick="resetMecForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
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
										<i class="ace-icon fa fa-table"></i>系统评价列表
									</h5>
								</div>

								 <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
	                                            <tr>
	                                            	<th style="text-align: center; width: 9%">功能菜单</th>
	                                                <th style="text-align: center; width: 7%">评分</th>
	                                                <th style="text-align: center; width: 11%">评价时间</th>
	                                                <th style="text-align: center; width: 13%">评价内容</th>
	                                                <th style="text-align: center; width: 9%">分公司</th>
	                                                <th style="text-align: center; width: 10%">所属一代</th>
	                                                <th style="text-align: center; width: 10%">直属机构</th>
	                                                <th style="text-align: center; width: 7%">登陆账号</th>
	                                                <th style="text-align: center; width: 7%">姓名</th>
	                                                <th style="text-align: center; width: 5%">状态</th>
	                                                <th >操作</th>
	                                            </tr>
                                            </thead>
                                            <tbody>
	                                            <c:forEach items="${mAppraisalList }" var="mAppraisal">
	                                            	<tr >
	                                            		<td style="text-align: left;">${mAppraisal.opinionTypeStr }</td>
														<td style="text-align: center;">
															<label style="color : red;"><c:forEach begin="1" end="${mAppraisal.lever}" step="1">★</c:forEach></label>
														</td>
														<td style="text-align: center;"><fmt:formatDate value="${mAppraisal.appraisalTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
														<td style="text-align: left;">${mAppraisal.opinion}</td>
														<td style="text-align: center;">${mAppraisal.branchOrgNm }</td>
														<td style="text-align: left;">${mAppraisal.topOrgNm }</td>
														<td style="text-align: left;">${mAppraisal.orgNm }</td>
														<td style="text-align: center;">${mAppraisal.loginId }</td>
														<td style="text-align: left;">${mAppraisal.remarkName }</td>
														<td style="text-align: center;">${mAppraisal.isShowStr }</td>
														<td align="left">
															<div class="action-buttons">
																<a href="#" onclick="showDetail('${mAppraisal.id}')" class="blue fancybox-manual-b">
																	<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看详情</font></i>
											                    </a>
											                    <c:if test="${mAppraisal.isShow=='0' }">
												                    <a href="#" onclick="isShow('${mAppraisal.id}','1')" class="blue fancybox-manual-b">
																		<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">展示</font></i>
												                    </a>
											                    </c:if>
											                    <c:if test="${mAppraisal.isShow=='1' or mAppraisal.isShow==null}">
											                    <a href="#" onclick="isShow('${mAppraisal.id}','0')" class="blue fancybox-manual-b">
																	<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">关闭</font></i>
											                    </a>
											                    </c:if>
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
								<label class="dataTables_info " id="dynamic-table_info" role="status" aria-live="polite"></label>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/mAppraisal/mAppraisal.js"></script>
	<script type="text/javascript" src="../../../js/jquery.rotate.min.js"></script>
	<script type="text/javascript">
	 	$('.chosen-select').chosen({});
	 	$('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        })
     	.next().on(ace.click_event, function(){
         $(this).prev().focus();
     	});
     	$('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
     	
     	
     	
	 	$(function(){
	 		changeBranchOrgNo();
	 	});
	 	
	 	function changeBranchOrgNo(){
	 		var topOrgNo= '${mAppraisal.topOrgNo}';
	 		var branchOrgNo= $("#branchOrgNo").val();
	 		var option="<option value=''>-请选择-</option>";
	 		var selected="";
	 		if(branchOrgNo !='' && branchOrgNo !=null){
	 			//通过归属分公司获取一代
	 			$.ajax({
	 				cache : true,
	 				type : "POST",
	 				url : '/mAppraisal/getTopOrg.do',
	 				data : {branchOrgNo : branchOrgNo},
	 				async : false,
	 				success : function(data) {
	 					
	 					if(data.length>0){
	 						for(var i=0;i<data.length;i++){
	 							if(topOrgNo==data[i].orgUuid){
	 								selected="selected";
	 							}
	 							option+="<option value='"+data[i].orgUuid+"' "+selected+">"+data[i].orgNm+"</option>";
	 							selected="";
	 						}
	 						$("#topOrgNo").html(option);
	 						$("#topOrgNo").trigger("chosen:updated");
	 					}
	 				}
	 			});
	 		}
	 	}
	</script>
</body>
</html>