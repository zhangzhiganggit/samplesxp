<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

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
                                        查询条件
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/recoveryQuery/queryList.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.pageNum }"/>
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }"/>
												<input type="hidden" id="firstLoad" name="firstLoad" value="${firstLoad}"/>
												<input type="hidden" id="isBranch" name="isBranch" value="${isBranch}"/>
												<input type="hidden" id="exportOrgNo" name="exportOrgNo" value="${recoveryQuery.orgNo}"/>
												<input type="hidden" id="exportOrgNm" name="exportOrgNm" value="${recoveryQuery.orgNm}"/>
												<input type="hidden" id="exportBranchNo" name="exportBranchNo" value="${recoveryQuery.branchNo}"/>
												<input type="hidden" id="exportDateMonthStart" name="exportDateMonthStart" value="${recoveryQuery.dateMonthStart}"/>
												<input type="hidden" id="exportDateMonthEnd" name="exportDateMonthEnd" value="${recoveryQuery.dateMonthEnd}"/>
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgNo" id="orgNo" value="${recoveryQuery.orgNo }" class="form-control input-small width-200px">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgNm" id="orgNm" maxlength="30" value="${recoveryQuery.orgNm }" class="form-control input-small width-200px">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        	<c:if  test="${isBranch==true}">
	                                                        	<select id="branchNo" name="branchNo" data-placeholder="请选择" disabled="disabled" class="chosen-select form-control width-200px">
                                                        			<option value="">请选择</option>
	                                                                <c:forEach items="${allBranch}" var="order" >
	                                                                	<option value="${order.ORG_UUID }"
	                                                                		<c:if test="${orgUuid== order.ORG_UUID}"> selected="selected" </c:if>
	                                                                	>${order.ORG_NM }</option>
	                                                                </c:forEach>
	                                                             </select>
                                                             </c:if>
                                                             <c:if test="${isBranch==false}">
                                                             	<select id="branchNo" name="branchNo" data-placeholder="请选择"  class="chosen-select form-control width-200px">
	                                                                <option value="">请选择</option>
	                                                                <c:forEach items="${allBranch}" var="order" >
	                                                                	<option value="${order.ORG_UUID}"
	                                                                		<c:if test="${recoveryQuery.branchNo== order.ORG_UUID}"> selected="selected" </c:if>
	                                                                	>${order.ORG_NM }</option>
	                                                                </c:forEach>
	                                                             </select>
	                                                         </c:if>
                                                        </div>
                                                    </div>
                                                    <!-- 
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mno" id="mno" value="${recoveryQuery.mno }" class="form-control input-small width-200px">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >签购单名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="receiptsName" id="receiptsName" value="${recoveryQuery.receiptsName }" class="form-control input-small width-200px">
                                                        </div>
                                                    </div>
                                                     -->
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >查询月份:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px ">
                                                                     <input type="text" id="dateMonthStart" name="dateMonthStart" value="${recoveryQuery.dateMonthStart}"
                                                                            class="input-small form-control date-picker" onchange="changeDateStart()">
                                                                     <span class="input-group-addon">
                                                                         <i class="fa fa-exchange"></i>
                                                                     </span>
                                                                     <input type="text" id="dateMonthEnd" name="dateMonthEnd" value="${recoveryQuery.dateMonthEnd}"
                                                                            class="input-small form-control date-picker" onchange="changeDateEnd()">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    查询
                                                </button>
                                                 <button class="btn btn-info btn-sm" type="button" onclick="javaScript:resetForm()">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                    重置
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
	                                    <button class="btn btn-normal btn-sm" type="button"  onclick="javaScript:getTotal()">
	                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
	                                                 查看合计
	                                                </button>
	                                    <c:if  test="${loginUserPermission.UNIONPAYRECOVERYQUERY_002!=null && '0010000000'.equals(orgUuid)}">
										<button class="btn btn-info btn-sm" type="button"  onclick="javaScript:importView()">
	                                                    <span class="ace-icon fa fa-arrow-circle-o-up icon-on-right bigger-110"></span>
	                                                 导入
	                                                </button></c:if>
	                                    <c:if  test="${loginUserPermission.UNIONPAYRECOVERYQUERY_004!=null}">
	                                    <button class="btn btn-info btn-sm" type="button"  onclick="javaScript:exportView()">
	                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
	                                                 导出
	                                                </button></c:if>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                    	<div id="total" ></div>
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width: 13%">月份</th>
                                                <th style="text-align:center;width: 15%">机构编号</th>
                                                <th style="text-align:center;width: 15%">机构名称</th>
                                                <th style="text-align:center;width: 10%">归属分公司</th>
                                                <th style="text-align:center;width: 7%">应追偿金额</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach items="${recoveryQueryList}" var="recovery" varStatus="status">
													<tr>
														<td style="text-align:center">${recovery.dateMonth}</td>
														<td style="text-align:center">${recovery.orgNo}</td>
														<td style="text-align:left">${recovery.orgNm}</td>
														<td style="text-align:center">${recovery.branchNm}</td>
														<td style="text-align:right"class="numberPointFormat">${recovery.amount}</td>
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
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    $('.chosen-select').chosen({});
    jQuery(function($) {
    	
    	$("#orgNo").keyup(function () {
            this.value = this.value.replace(/\s/g, '');
        });
    	$("#orgNm").keyup(function () {
            this.value = this.value.replace(/\s/g, '');
        });
    	
    	/*
    	if($("#isBranch").val() == "true"){
    		$("#branchNo").attr("disabled",true)
    	}
    	*/
              	
        $('.date-picker').datepicker({
        	autoclose: true,
            language: 'zh-CN',
            todayHighlight: true,
            keyboardNavigation:true,
            clearBtn:true,
            format:'yyyy-mm',
            startView:'month',
            minView:'month',
            maxViewMode:1,
            minViewMode:1
        }).next().on(ace.click_event, function(){
            $(this).prev().focus();
        });
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});

    })
    
    function resetForm(){
       	$(':input','#searchForm')  
         	 .not(':button, :submit, :reset, :hidden')  
         	 .val('') ;
       	if($("#isBranch").val() != "true"){
       		$('#branchNo').val('');
       		$("#branchNo").trigger("chosen:updated");
       	}
    }
    //校验日期合法
	function changeDateStart(){
 		 var creStartTm=Number($("#dateMonthStart").val().replace(/-/g,''));
 		 var creEndTm=Number($("#dateMonthEnd").val().replace(/-/g,''));
 		 if(creEndTm!=0){
 			 if(creStartTm>creEndTm){
 				 $("#dateMonthEnd").val($("#dateMonthStart").val());
 			 }
 		 }
 	 }
 	 function changeDateEnd(){
 		 var creStartTm=Number($("#dateMonthStart").val().replace(/-/g,''));
 		 var creEndTm=Number($("#dateMonthEnd").val().replace(/-/g,''));
 		 if(creStartTm!=0){
 			 if(creStartTm>creEndTm){
 				 $("#dateMonthStart").val($("#dateMonthEnd").val());
 			 }
 		 }
 	 }

    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
    
    function getTotal(){
    	var orgNo=$("#orgNo").val();
		var orgNm=$("#orgNm").val();
		var branchNo=$("#branchNo").val();
		var dateMonthStart=$("#dateMonthStart").val();
		var dateMonthEnd=$("#dateMonthEnd").val();
		$.ajax({
		    cache: true,
		    type: "GET",
		    url:"/recoveryQuery/getTotal?orgNo="+orgNo+"&orgNm="+orgNm+"&branchNo="+branchNo+"&dateMonthStart="+dateMonthStart+"&dateMonthEnd="+dateMonthEnd,
		    async: false,
		    success: function(data) {
		    	$('#total').empty();
		    	data = eval('('+data+')');
		    	var str = "<label>汇总    总金额:"+data.Total+"</label>"
		    	$('#total').append(str);

		    }
		});
    }
    
    function importView(){
    	$.fancybox.open({
    		href : '<%=request.getContextPath()%>/recoveryQuery/importPage.do',
			type: 'iframe',
	        padding: 5,
	        scrolling: 'auto',
	        fitToView: true,
	        width: 800,
	        height: 500,
	        autoSize: false,
	        closeClick: false,
	        afterClose:function(){
	        	reloadParent();
			}
        });
    };
    
    function exportView(){
		var orgNo=$("#exportOrgNo").val();
		var orgNm=$("#exportOrgNm").val();
		var branchNo=$("#exportBranchNo").val();
		var dateMonthStart=$("#exportDateMonthStart").val();
		var dateMonthEnd=$("#exportDateMonthEnd").val();
		var firstLoad=$("#firstLoad").val();
		
		location.href='<%=request.getContextPath()%>/recoveryQuery/export.do?orgNo='+orgNo+'&orgNm='
				+orgNm+'&branchNo='+branchNo+'&dateMonthStart='+dateMonthStart+'&dateMonthEnd='+dateMonthEnd+'&firstLoad='+firstLoad;	
    }
</script>
</body>
</html>