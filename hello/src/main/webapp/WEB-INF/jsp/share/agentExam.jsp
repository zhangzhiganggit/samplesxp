<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp"%>
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
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        代理商分润考核设置
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/agentExam/examList.do" id="searchForm" method="post">
                                                <input type="hidden" name="currentPage"/>
                                                 <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" > 
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgUuid" value="${orgNo }" class="form-control input-small width-200px" data-placement="bottom" title=""  id="orgUuid" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgNm" value="${orgName }" class="form-control input-small width-200px "  data-placement="bottom" title=""  id="orgNm" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经营城市:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="provCd" name="provCd" data-placeholder="请选择" onchange="fillCitySelect('provCd','cityCdb','')"    class="col-sm-8 width-48 chosen-select width-45">
                                                                <option value="">全国</option>
                                                            </select>
                                                            <select id="cityCdb" name="cityCdb" data-placeholder="请选择"  class="col-sm-6 width-48  chosen-select width-45  ">
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商等级:</label>

                                                        <div class="col-sm-6  no-padding"  >
                                                            <select data-placeholder="请选择" id="agentLever" name="agentLever" class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
                                                                <option value="0" <c:if test="${lever=='0' }" >selected</c:if>>普通</option>
                                                                <option value="1" <c:if test="${lever=='1' }" >selected</c:if>>黑名单</option>
                                                                <option value="2" <c:if test="${lever=='2' }" >selected</c:if>>二星</option>
                                                                <option value="3" <c:if test="${lever=='3' }" >selected</c:if>>三星</option>
                                                                <option value="4" <c:if test="${lever=='4' }" >selected</c:if>>四星</option>
                                                                <option value="5" <c:if test="${lever=='5' }" >selected</c:if>>五星</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
												<input type="hidden" id="city" name="city" value="${city}">
												<input type="hidden" id="prov" name="prov" value="${prov}">
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button"
													onclick="resetMecForm()">
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
                                        <i class="ace-icon fa fa-table"></i>
                                        查询结果
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center; width: 10%;">  机构编号 </th>
                                                <th style="text-align: center;width: 20%;">  机构名称 </th>
                                                <th style="text-align: center;width: 10%;">所属分公司</th>
                                                <th style="text-align: center;width: 12%;">创建时间</th>
                                                <th style="text-align: center;width: 10%;">状态</th>
                                                <th style="text-align: center;width: 10%;">代理商等级</th>
                                                <th style="text-align: center;width: 10%;">考核折扣</th>
                                                <th style="text-align: center;width: 8%;">考核减免</th>
                                                <th style="text-align: center;width: 10%;" >操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                           
                                            <c:forEach items="${agentlist}" var="de"  varStatus="status">
													<tr>
														<td style="text-align: center;">${de.orgUuid }</td>
														<td style="text-align: left;">${de.orgNm }</td>
														<td style="text-align: left;">${de.branchAttributionName }</td>
														<td style="text-align: center;">${de.dateCreatedStr }</td>
														<td style="text-align: center;">${de.orgStsStr }</td>
														<td style="text-align: center;">${de.agentLeverStr }</td>
														<td style="text-align: right;">
														 <c:if test="${de.checkDiscount!=null }">
														  ${de.checkDiscount }%
														 </c:if>
														</td>
														<td style="text-align: right;">${de.checkCut }</td>
														<td   style="text-align: center;">
														 <c:if test="${loginUserPermission.SMSA_PROFIT_011!=null }">
										                     <div class="   action-buttons">
										                         <a href="#" class="blue fancybox-manual-b" onclick="showEditAgentExamView('${de.orgUuid }');">
										                             <i class="ace-icon fa fa-edit blue bigger-130"><font size="2">修改</font></i>
										                         </a>
										                     </div>
										                 </c:if>
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
    </div>
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">
    var proValue = $("#prov").val();
    fillProvSelect('provCd',proValue);
    var cityValue = $("#city").val();
    fillCitySelect('provCd','cityCdb',cityValue);
    
    function showEditAgentExamView(orgNo){
    	$.fancybox.open({
			href : '<%=request.getContextPath() %>/agentExam/showEditView.do?orgUuid='+orgNo,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            fitToView: true,
            width: 1100,
            height: 400,
            autoSize: false,
            closeClick: false,
			afterClose:function(){
				location.href='<%=request.getContextPath()%>/agentExam/examList.do'; 
				
			}
		});
    	
    }
    function resetMecForm(){
    	$(':input','#searchForm')  
      	 .not(':button, :submit, :reset, :hidden')  
      	 .removeAttr('checked')  
      	 .removeAttr('selected'); 
      	$("#orgUuid").val('');
   	 	$("#orgUuid").trigger("chosen:updated");
   	 	$("#orgNm").val("");
   	 	$('#orgNm').trigger("chosen:updated");
   	 	$("#provCd").val("");
  	 	$('#provCd').trigger("chosen:updated");
  	 	$("#cityCdb").val("");
  	 	$('#cityCdb').trigger("chosen:updated");
  	 	$("#agentLever").val("");
  	 	$('#agentLever').trigger("chosen:updated");
	}
    
    



    jQuery(function($) {
    	$('.chosen-select').chosen({});
	})
</script>
</body>
</html>











