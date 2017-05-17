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
                                        查询出库记录
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


                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/stockManage/stockInList" id="searchForm" method="post" >
                                                <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            		<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                            		<input type="hidden" id="lastMonth" name="lastMonth"  value="${stockInfo.occurTime}">
                                                <div class=" col-xs-12">
                                                		<input id="flg" name="flg" value="1" style="display: none">                                                                                                                                                                    
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >月份:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px ">
                                                                            <input type="text" id="occurTime" name="occurTime" value="${stockInfo.occurTime}"
                                                                            id="beginDt" class="input-small form-control date-picker" onchange="revalidateFieldByFieldName('searchForm','occurTime')">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >盟主编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="chiefId"  name="chiefId" value="${stockList.chiefId }" class="form-control input-small width-200px" onkeyup="this.value=this.value.replace(/\s+/g,'')" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>                                                 
                                                </div>

                                                <button class="btn btn-normal btn-sm" id="submitButton" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-primary btn-sm" type="button" onclick="exportDown()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                    导出
                                                 </button>
                                                <button class="btn btn-info btn-sm" type="button" onclick="resetSearchForm()">
											     														<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
											     														清空检索条件
																								</button>
                                            </form>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                
                                <div class="form-group form-group-sm height-300px">
                                    <c:forEach items="${stockInNum }" var="stockInNum" varStatus="status">
                                        <label   class="col-sm-4 control-label widget-color-normal5 no-padding-left height-300px" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总计：<font> ${pageInfo.getTotal()} 单</font>&nbsp;&nbsp;&nbsp; 出库：<font>${stockInNum.outBrandNum }台</font>&nbsp;&nbsp;&nbsp;入库：${stockInNum.inBrandNum }台</label>
                                    </c:forEach> 
                                </div>
                                

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
																								<th align="center">备注</th>
																								<th align="center">盟主名称</th>
																								<th align="center">盟主编号</th>
																								<th align="center">盟友名称</th>
																								<th align="center">盟友编号</th>
																								<th align="center">物品类型</th>
																								<th align="center">物品名称</th>
																								<th align="center">厂商简称</th>
																								<th align="center">型    号</th>
																								<th align="center">数量</th>
																								<th align="center">出库时间</th>
                                                
                                            </tr>
                                            </thead>
                                            <tbody>
                                           <c:forEach items="${stockInList }" var="stockList" varStatus="status">
												<tr>
														<td style="text-align: center;"> ${stockList.remark }</td>
														<td style="text-align: center;">${stockList.chiefName }</td>
														<td style="text-align: center;">${stockList.chiefId }</td>
														<td style="text-align: center;">${stockList.allyName }</td>
														<td style="text-align: center;" >${stockList.allyId }</td>
														<td style="text-align:center">
    														<c:if test="${stockList.goodsType == '0'}">终端设备</c:if>
                                                            <c:if test="${stockList.goodsType == '1'}">附件设备</c:if>
                                                            <c:if test="${stockList.goodsType == '2'}">配件设备</c:if>
                                                            <c:if test="${stockList.goodsType == '3'}">耗材</c:if>
                                                        </td>
														<td style="text-align: center;">${stockList.goodsName }</td>
														<td style="text-align: center;">${stockList.factShortn }</td>
														<td style="text-align: center;">${stockList.modId}</td>
														<td style="text-align: center;">${stockList.inventory }</td>
														<td style="text-align: center;">${stockList.occurTime }</td>
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
                        <div class="form-actions center widget-color-normal5">
                            <button class="btn btn-danger btn-sm" type="button"  onclick="backLast()">
                                                                                    返回
                            </button>
                        </div>
                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%-- <%@include file="../layout/footer.jsp"%> --%>
    <%@include file="../../layout/common.js.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/common/common.js"></script>
    <script type="text/javascript">
        $('.chosen-select').chosen({});
        jQuery(function($) {
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
            });
        $('#searchForm').formValidation({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	
			  occurTime : {
  					validators : {
   						notEmpty: {}

  					}
  				}
  	            
              }
        });
    })
        function backLast(){
            window.history.go(-1);
        }
    	function resetSearchForm(){
    		var datetime=new Date();
 	        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() ) : datetime.getMonth() ;
    		 $(':input','#searchForm')  
    		 .not(':button, :submit, :reset, :hidden')  
    		 .val('')  
    		 .removeAttr('checked')  
    		 .removeAttr('selected'); 
    		 $("#topAgentOrgUuid").val('');
    	     $("#topAgentOrgUuid").trigger("chosen:updated");
    	     $("#payTyp").val('');
    	     $("#payTyp").trigger("chosen:updated");
    	     var lastMonth = $("#lastMonth").val();
    	     $("#occurTime").val(lastMonth);
    	   	 $("#occurTime").trigger("chosen:updated");
    	   //移除formValidation校验样式
     		 changeFormValidateStyle('searchForm','cprRegNmCn','NOT_VALIDATED','regRepeatNum');
     		 changeFormValidateStyle('searchForm','mno','NOT_VALIDATED','regRepeatNum');
     		 changeFormValidateStyle('searchForm','mecAdminTel','NOT_VALIDATED','regRepeatNum');
    	     //重置检索按钮
    	     document.getElementById("submitButton").removeAttribute("disabled");

    	}
    	   function exportDown(){
            $("#searchForm").attr("action","<%=request.getContextPath()%>/stockManage/uploadExcel");
            document.getElementById("searchForm").submit();
            $("#searchForm").attr("action","<%=request.getContextPath() %>/stockManage/stockInList.do");
        }
</script>
</body>
</html>











