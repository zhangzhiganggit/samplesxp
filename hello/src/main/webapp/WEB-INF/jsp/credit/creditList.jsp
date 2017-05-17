<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
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
                                        赊购管理
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/credit/creditList.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }"/>
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="oldStrart" id="oldStrart" value="${oldStrart}">
                                            	<input type="hidden" name="oldEnd" id="oldEnd" value="${oldEnd}">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >一级代理:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgNo" id="orgNo" value="${creditInfo.orgNo}" placeholder="机构编号/机构名称" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
														<c:if test="${orgList!=null}"><div class="col-sm-8  no-padding">
															<select id="branchAttribution" name="branchAttribution"
																	class="chosen-select form-control width-200px" data-placeholder="请选择">
																<c:if test="${orgList.size()>1}">
																	<option value="">请选择</option>
																</c:if>
																<c:forEach items="${orgList }" var="orgs">
																	<option value="${orgs.orgUuid }"
																	<c:if test="${orgs.orgUuid == creditInfo.branchAttribution }"> selected </c:if>>${orgs.orgNm}</option>
																</c:forEach>
															</select>
														</div>
														</c:if>
													</div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >赊购额度:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="lowAmount" name="lowAmount" value="${creditInfo.lowAmount }" class="form-control input-small width-100px" data-placement="bottom" title="">-<input type="text" id="highAmount" name="highAmount" value="${creditInfo.highAmount}" class="form-control input-small width-100px" data-placement="bottom" title="" >
                                                        </div>
                                                    </div>
                                                 
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" name="orgStatus" id="orgStatus" class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
											    				<option value="1" <c:if test="${creditInfo.orgStatus=='1'}">selected</c:if>>正常</option>
											    				<option value="2" <c:if test="${creditInfo.orgStatus=='2'}">selected</c:if>>停用</option>
											    				<option value="3" <c:if test="${creditInfo.orgStatus=='3'}">selected</c:if>>信息不全</option>
											    				<option value="9" <c:if test="${creditInfo.orgStatus=='9'}">selected</c:if>>注销</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >赊购使用月份:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" value="${creditInfo.creditStartMonth }" name="creditStartMonth" id="creditStartMonth" class="input-small form-control" readonly>
                                                                     <span class="input-group-addon">
                                                                         <i class="fa fa-exchange"></i>
                                                                     </span>
                                                                <input type="text" value="${creditInfo.creditEndMonth }" name="creditEndMonth" id="creditEndMonth" class="input-small form-control" readonly>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button" onclick="resetSearchForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
                                                    清空检索条件
                                                </button>
                                               <button class="btn btn-danger btn-sm" type="button" onclick="toBatchUpdateCredit()">
                                               <span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
                                                  批量设置/修改赊购额度
                                                </button>
                                                   <button class="btn btn-danger btn-sm" type="button" onclick="toAddCredit()">
                                                   <span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
                                                  设置赊购额度
                                                </button>
                                                <button class="btn btn-primary btn-sm" type="button" onclick="downloadCreditInfo()">
                                                <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                    导出检索结果
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
                                        赊购额度查询结果
                                    </h5>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th width="8%">机构编号</th>
                                                <th width="15%">机构名称</th>
                                                <th width="5%">状态</th>
                                                <th width="8%">归属分公司</th>
                                                <th width="5%">赊购使用月份</th>
                                                <th width="6%">月赊购上限</th>
                                                <th width="6%">已使用赊购额</th>
                                                <th width="8%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach var="credit" items="${creditInfoList}">
                                            		<tr>
		                                                <td>
		                                                ${credit.orgNo }
		                                                </td>
		                                                <td >${credit.orgNm}</td>
		                                                <td align="center">${credit.orgStatus}</td>
		                                                <td>${credit.branchAttribution}</td>
		                                                <td align="center">${credit.creditMonth }</td>
		                                                <td align="right"><fmt:formatNumber type="number" value="${credit.highLimitAmount }" pattern="0.00"/></td>
		                                                <td align="right"><fmt:formatNumber type="number" value="${credit.usedAmount}" pattern="0.00"/></td>
		                                                <td align="">
	                                                        <div class="action-buttons">
	                                                            <a href="###" class="green" onclick="creditDetail('${credit.creditId}','${credit.orgNo}')">查看</a>|<a href="###" class="green" onclick="toUpdateCredit('${credit.creditId}','${credit.orgNm}')">修改赊购额</a>
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
    <!--  <form class="form-inline form-horizontal" action="downloadCreditInfo" id="downloadForm" method="post">
       	<input type="hidden" id="downloadOrgNo" name="orgNo" value="${creditInfo.orgNo}"/>
       	<input type="hidden" id="downloadBranchAttribution" name="branchAttribution" value="${creditInfo.branchAttribution}">
       	<input type="hidden" id="downloadLowAmount"  name="lowAmount" value="${creditInfo.lowAmount}">
       	<input type="hidden" id="downloadHighAmount"  name="highAmount" value="${creditInfo.highAmount}">
       	<input type="hidden" id="downloadOrgStatus"  name="orgStatus" value="${creditInfo.orgStatus}">
       	<input type="hidden" id="downloadCreditStartMonth" name="creditStartMonth" value="${creditInfo.creditStartMonth}">
       	<input type="hidden"id="downloadCreditEndMonth" name="creditEndMonth" value="${creditInfo.creditEndMonth}">
     </form>-->
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/task/task.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/taskEntrust/taskEntrust.js"></script>
    <script type="text/javascript">
        $('.chosen-select').chosen({});
        jQuery(function($) {
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
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
	        $('#searchForm').bootstrapValidator({
	            message: 'This value is not valid',
	            container:'popover',
	            feedbackIcons: {
	                valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
	            },
	            fields: {
	            	lowAmount: {
	                    validators: {
	                    	 regexp: {
	                             regexp: /^(([1-9]+\d*)|([0-9]+\d*\.\d{1,2}))$/,
	                             message:'只能填写大于0的数字，最多保留小数点后两位'
	                         }
	                    }
	                },
	                highAmount: {
	                    validators: {
	                    	 regexp: {
	                             regexp: /^(([1-9]+\d*)|([0-9]+\d*\.\d{1,2}))$/,
	                             message:'只能填写大于0的数字，最多保留小数点后两位'
	                         }
	                    }
	                }
	            }
	        });
    	})
        <!-- 打开单个新增页面 -->
	    function toAddCredit() {
	    	$.fancybox.open({
  				href : '<%=request.getContextPath() %>/credit/toAddCredit.do',
  				type: 'iframe',
  	        padding: 5,
  	        scrolling: 'no',
  	        fitToView: true,
  	        width: 800,
  	        height: 300,
  	        autoSize: false,
  	        closeClick: true,
  				afterClose:function(){
  					
  				}
  			});
        }
	    
	    <!-- 打开批量新增页面 -->
	    function toBatchUpdateCredit() {
	    	$.fancybox.open({
  				href : '<%=request.getContextPath() %>/credit/toBatchUpdateCredit.do',
  				type: 'iframe',
  	        padding: 5,
  	        scrolling: 'no',
  	        fitToView: true,
  	        width: 800,
  	        height: 500,
  	        autoSize: false,
  	        closeClick: true,
  				afterClose:function(){
  					
  				}
  			});
        }
	    $('.input-daterange').datepicker({
        	format: 'yyyy-mm',  
            weekStart: 1,  
            autoclose: true,  
            startView: 3, 
            maxViewMode: 1,
            minViewMode:1,
            forceParse: false,  
            language: 'zh-CN'  
		});
	    function resetSearchForm(){
	    	var oldStrart=$("#oldStrart").val();
	    	var oldEnd=$("#oldEnd").val();
	   	 $(':input','#searchForm')  
	   	 .not(':button, :submit, :reset, :hidden')  
	   	 .val('')  
	   	 .removeAttr('checked')  
	   	 .removeAttr('selected'); 
	   	 
	   	 $("#branchAttribution").val('');
	   	 $("#branchAttribution").trigger("chosen:updated");
	   	 $("#orgStatus").val('');
	   	 $("#orgStatus").trigger("chosen:updated");
	     $("#creditStartMonth").val(oldStrart);
	   	 $("#creditStartMonth").trigger("chosen:updated");
	   	 $("#creditEndMonth").val(oldEnd);
	   	 $("#creditEndMonth").trigger("chosen:updated");
	   	 
	   	 
	   	
	    }
	    
	    <!-- 打开详情页面 -->
	    function creditDetail(creditId,orgNo) {
	    	$.fancybox.open({
  				href : '<%=request.getContextPath() %>/credit/creditDetail.do?creditId=' + creditId + '&orgNo='+ orgNo,
  				type: 'iframe',
  	        padding: 5,
  	        scrolling: 'no',
  	        fitToView: true,
  	        width: 1000,
  	        height: 800,
  	        autoSize: false,
  	        closeClick: true,
  				afterClose:function(){
  					
  				}
  			});
        }
	    <!-- 打开单个编辑页面 -->
	    function toUpdateCredit(creditId,orgNm) {
	    	$.fancybox.open({
  				href : '<%=request.getContextPath() %>/credit/toUpdateCredit.do?creditId=' + creditId + '&orgNm='+ orgNm,
  				type: 'iframe',
  	        padding: 5,
  	        scrolling: 'no',
  	        fitToView: true,
  	        width: 800,
  	        height: 300,
  	        autoSize: false,
  	        closeClick: true,
  				afterClose:function(){
  					
  				}
  			});
        }
	    
	    function downloadCreditInfo(){
	    	$("#searchForm").attr("action","<%=request.getContextPath()%>/credit/downloadCreditInfo");
			document.getElementById("searchForm").submit();
			$("#searchForm").attr("action","<%=request.getContextPath()%>/credit/creditList.do");
	    }

</script>
</body>
</html>