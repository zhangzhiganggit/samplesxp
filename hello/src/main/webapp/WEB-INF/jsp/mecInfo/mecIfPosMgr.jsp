<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

                    <div class="row" >


                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       		POS信息查询条件
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

		
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecIf/mecIfPosMgrQuery" id="searchForm" method="post">
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                            	<input type="hidden" id="contextPath" name="contextPath" value="<%= request.getContextPath()%>" >
                                            	
                                            	<input type="hidden" id="prov" name="prov" value="${mecIf.mecProvCd}">
                                            	<input type="hidden" id="city" name="city" value="${mecIf.mecCityCd}">
                                            	
                                            	
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mno"  name="mno" value="${mecIf.mno }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户类别:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="mecTyp" name="mecTyp" data-placeholder="POS商户"  class="chosen-select form-control width-200px" disabled="disabled" onchange="switchTelField()">
                                                                <option value="00" <c:if test="${mecIf.mecTyp == '00' }">selected="selected"</c:if> >POS商户</option>
                                                                <option value="02" <c:if test="${mecIf.mecTyp == '02' }">selected="selected"</c:if> >手刷商户</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户注册名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="cprRegNmCn" name="cprRegNmCn" value="${mecIf.cprRegNmCn }" class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    
                                                    <c:if test="${pbCheck==false }">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属地区:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="mecProvCd" name="mecProvCd" data-placeholder="请选择" onchange="fillCitySelect('mecProvCd','mecCityCd','${mecIf.mecCityCd}')"    class="col-sm-8 width-48 chosen-select width-45">
                                                                <option value="">请选择</option>
                                                                <%-- <c:forEach items="${provs }" var="prov">
																		<option value="${prov.areaId }"  <c:if test="${prov.areaId==mecIf.mecProvCd }">selected</c:if>>${prov.areaNm}</option>
																		</c:forEach> --%>
                                                            </select>
                                                            <select id="mecCityCd" name="mecCityCd" data-placeholder="请选择"  class="col-sm-6 width-48  chosen-select width-45  ">
                                                                <option value="">请选择</option>
                                                                
                                                            </select>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >POS功能:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="posAttr" name="posAttr" data-placeholder="请选择"  class="chosen-select form-control width-200px">
                                                                 <option value="">请选择</option>
                                                                <option value="YECX" <c:if test="${mecIf.posAttr=='YECX' }">selected</c:if>>余额查询(银联卡)</option>
                                                                <option value="JYMXDY" <c:if test="${mecIf.posAttr=='JYMXDY' }">selected</c:if>>终端交易明细打印</option>
                                                                <option value="XFCX" <c:if test="${mecIf.posAttr=='XFCX' }">selected</c:if>>消费撤销(银联卡)</option>
                                                                <option value="XJXFJZ" <c:if test="${mecIf.posAttr=='XJXFJZ' }">selected</c:if>>现金消费记账</option>
                                                            </select>
                                                        </div>
                                                    </div>

													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">POS功能状态:</label>

														<div class="col-sm-8  no-padding">
															<select id="posAttrStatus" name="posAttrStatus"
																data-placeholder="请选择"
																class="chosen-select form-control width-200px">
																<option value="">请选择</option>
																<option value="1"
																	<c:if test="${mecIf.posAttrStatus=='1' }">selected</c:if>>开启</option>
																<option value="0"
																	<c:if test="${mecIf.posAttrStatus=='0' }">selected</c:if>>关闭</option>
															</select>
														</div>
													</div>

													<c:if test="${pbCheck==false }">
													<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属机构:</label>

														<div class="col-sm-8  no-padding">
															<select id="orgNo" name="orgNo" data-placeholder="全部"
																class="chosen-select form-control width-200px">
																<option value="">全部</option>
																<c:forEach items="${orgList}" var="org"
																	varStatus="status">
																	<option value="${org.orgUuid}"
																		<c:if test="${org.orgUuid == mecIf.orgNo}">
																     selected
																    </c:if>>${org.orgNm }</option>
																</c:forEach>
															</select>
														</div>
													</div>
													</c:if>
<%-- 													<div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >创建时间:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="creStartTm" name="creStartTm" value="${mecIf.creStartTm }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="creEndTm" name="creEndTm" value="${mecIf.creEndTm }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div> --%>


												</div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                                                                                                                                                         检索
                                                </button>
                                                 <button class="btn btn-info btn-sm" type="button" onclick="resetAll()">
												     <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
												清空检索条件
												</button>
                                                 <button  class="btn btn-danger btn-sm" type="button"  onclick="switchFuc('1')">
                                                   <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>  
                                                    开启
                                                </button> 
                                                <button  class="btn btn-default btn-sm"  type="button"  onclick="switchFuc('0')">
                                                    <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
                                                    关闭
                                                </button> 
                                                 <button class="btn btn-primary btn-sm" type="button"  onclick="downloadTemplate()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                    下载模板
                                                </button>
                                                <button  class="btn btn-danger btn-sm" type="button"  onclick="switchFucWithExcel('1')">
                                                    <span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
                                                    批量开启
                                                </button>
                                                <button class="btn btn-default btn-sm" type="button"  onclick="switchFucWithExcel('0')">
                                                    <span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
                                                    批量关闭
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
                                                <!-- <th align="center">序号</th> -->
                                                <th style="text-align: center;width: 6%" >
                                            		<input type="checkbox" class="ace "  id="ckAll" name="ckAll">
			                                       <span class="lbl middle">全选</span>
		                                       </th>
                                                <th style="text-align: center;width: 13%">商户编号</th>
                                                <th style="text-align: center;width: 13%">商户注册名称</th>
                                                <th style="text-align: center;width: 13%">商户经营名称</th>
                                                <th style="text-align: center;width: 6%">联系人</th>
												<c:choose>
													<c:when test="${pbCheck==true }">
<!-- 														<th style="text-align: center;width: 9%">机构名称</th> -->
													</c:when>
													<c:otherwise>
		                                                <th style="text-align: center;width: 9%">所属一代</th>
													</c:otherwise>
												</c:choose>                                   
                                               <c:if test="${pbCheck==false }"> <th  style="text-align: center;width: 9%">所属分公司</th></c:if>
                                                <th  style="text-align: center;width: 9%">操作记录</th>
                                                <th  style="text-align: center;width: 9%">详情</th>
                                            </tr>
                                            </thead>

                                            <tbody>
												<c:forEach items="${mecIfList}" var="item" varStatus="status">
													<tr>
														<!-- <td style="border:1px solid  #969696;">${status.index+1 }</td> -->
														<td class="" style="text-align: center;">
                                                             <input type="checkbox" class="ace abc" value="${item.inMno }" id="selectedMno" name="selectedMno" 
                                                             <c:if test="${currentOrg != '0010000000' and currentOrg != item.agentBranchOrgUuid and currentOrg == item.branchOrgUuid}"> disabled="disabled" </c:if> >
							                                 <span class="lbl middle"></span>
						                                </td>
														
														<td style="text-align: left;" name ="mno">${item.mno }</td>
														<td style="text-align: left;">${item.cprRegNmCn }</td>
														<td style="text-align: left;">${item.cprOperNmCn }</td>
														<td style="text-align: left;">${item.empNm}</td>
													<c:if test="${pbCheck ==false }">	<td style="text-align: left;">${item.orgNm}</td></c:if>
														<c:if test="${pbCheck==false}"><td style="text-align: center;">${item.branchNm}</td></c:if>
														

														<td style="text-align: center;">
															<div class="   action-buttons">
																<a href="#" onclick="mecIfPosOprLogShow('${item.mno}')"> 
																	<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看</font></i>
																</a>
															</div>
														</td>
														
														<td style="text-align: center;">
															<div class="   action-buttons">
																<a href="#" onclick="mecIfPosdetailShow('${item.mno}')"> 
																	<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看详情</font></i>
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
								<%@include file="../layout/pagination.jsp" %>
							</div>

						</div>

                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->
<%@include file="../layout/common.alljs.jsp"%>

<script src="<%=request.getContextPath() %>/js/mecInfo/mecIfPosMgr.js"></script>
<script type="text/javascript">
function resetAll(){
	 var notFilter = ":button, :submit, :reset, :hidden";
	 
	 $(':input','#searchForm')  
	 .not(':button, :submit, :reset, :hidden')  
	 .val('')  
	 .removeAttr('checked')  
	 .removeAttr('selected'); 
	 $("#mecProvCd").val('');
	 $("#mecProvCd").trigger("chosen:updated");
	 $("#mecCityCd").val('');
	 $("#mecCityCd").trigger("chosen:updated");
	 $("#posAttr").val('');
	 $("#posAttr").trigger("chosen:updated");
	 $("#posAttrStatus").val('');
	 $("#posAttrStatus").trigger("chosen:updated");
	 $("#orgNo").val('');
	 $("#orgNo").trigger("chosen:updated");
}
</script>
</body>
</html>











