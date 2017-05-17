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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/orgTradeSum/orgList.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属机构编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgNo" id="orgNo" value="${dsm.orgNo }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >交易日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="dateStart" name="dateStart" onchange="revalidateFieldByFieldName('searchForm','dateStart')" value="${dsm.dateStart }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" id="dateEnd" name="dateEnd" onchange="revalidateFieldByFieldName('searchForm','dateEnd')" value="${dsm.dateEnd }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                                                                                                                                                         检索
                                                </button>
                                                 <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
                                                    清空检索条件
                                                </button> 
                                                <c:if  test="${loginUserPermission.SMSA_PROFIT_030!=null}">
                                                 <button id="exp" class="btn btn-primary btn-sm" type="button" onclick="uploadExcelOrg()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                                                                       导出                                                                                                                                  
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
                                        <i class="ace-icon fa fa-table"></i>
                                        	查询结果
                                    </h5>
                                </div>
                   
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 8%">直属机构</th>
                                                <th style="text-align: center;width: 12%">机构名称</th>
                                                <th style="text-align: center;width: 10%">交易日期</th>
                                                <th style="text-align: center;width: 10%">交易金额</br>合计</th>
                                                <th style="text-align: center;width: 10%">非封顶金额</br>合计</th>
                                                <th style="text-align: center;width: 9%">手续费</br>合计</th>
                                                <th style="text-align: center;width: 9%">可分润金额</br>合计</th>
                                                <th style="text-align: center;width: 9%">分润金额</br>合计</th>
                                                <th  style="text-align: center;" width="5%">笔数</th>
                                                <th  style="text-align: center;" width="7%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                           <c:forEach items="${orgList}" var="de"  varStatus="status">
													<tr>
														<td style="text-align: center;">${de.orgNo }</td>
														<td style="text-align: left;">${de.orgNm }</td>
														<td style="text-align: center;">${de.tranDtStr }</td>
														<td style="text-align: right;"class="numberPointFormat"  >${de.tradeSumDesc }</td>
														<td style="text-align: right;"class="numberPointFormat"  >${de.nocapAmountSumDesc }</td>
														<td style="text-align: right;"class="numberPointFormat"  >${de.feeSumDesc }</td>
														<td style="text-align: right;"class="numberPointFormat"  >${de.profitAmountDesc }</td>
														<td style="text-align: right;"class="numberPointFormat"  >${de.profitAmountMonthDesc }</td>
														<td style="text-align: right;"class="numberFormat">${de.tradeCount }</td>
														 <td style="text-align: center;">
										                     <div class="   action-buttons">
										                         <a href="#" onclick="typeDetailShow('${de.orgNo }','${de.tranDtStr }')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa fa-search-plus blue bigger-130"><font size="2">详情</font></i>
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
        </div>
    </div>
	<%@include file="../layout/common.js.jsp"%>
    <script src="<%=request.getContextPath() %>/js/profit/export.js"></script>
    <script type="text/javascript">
    function uploadExcelOrg(){
		$("#searchForm").attr("action","<%=request.getContextPath()%>/profitExport/OrgExcelDown.do");
		if(valiDt()){
			document.getElementById("exp").disabled=true;
			document.getElementById("searchForm").submit();
		}
		$("#searchForm").attr("action","<%=request.getContextPath()%>/orgTradeSum/orgList.do");
		
	}
    
    function typeDetailShowB(id,year,month,mno,mecRegNm,mecOperNm){
  	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/mecTradeSum/mecTypeMonthList.do?inMno='+id+'&year='+year+'&month='+month+'&mno='+mno+'&mecRegNm='+mecRegNm+'&mecOperNm='+mecOperNm,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 1200,
	        height: 800,
	        autoSize: false,
	        closeClick: false,
				afterClose:function(){
				}
			});
  	  
    }
      function typeDetailShow(id,tranDtStr){
    	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/orgTradeSum/orgOneListByorgNo.do?orgNo='+id+'&tranDtStr='+tranDtStr,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 1200,
	        height: 800,
	        autoSize: false,
	        closeClick: false,
				afterClose:function(){
				}
			});
    	  
      }
    
    
    
    
      

      $('.chosen-select').chosen({});
      jQuery(function($) {
    
      $('#searchForm').formValidation({
          message: 'This value is not valid',
          container:'popover',
          feedbackIcons: {
              valid: 'glyphicon glyphicon-ok',
              invalid: 'glyphicon glyphicon-remove',
              validating: 'glyphicon glyphicon-refresh'
          },
          fields: {
          	dateStart: {
                  validators: {
                      notEmpty: {},
                      dateCompare: {
                      	dayLength:31
                      }
                  }
              },
              dateEnd: {
                  validators: {
                      notEmpty: {},
                      dateCompare: {
                      	dayLength:31
                      }
                  }
              }
            
            
          }
      });

        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});



    })
    
    function setCity2(pid){
		$.ajax({
			type:'post',
			url:"<%=request.getContextPath()%>/area/getCityByProvId.do",
			data:'id='+pid,
			async:false,
			success:function(data){
				$("#mecCityCd").chosen("destroy");
				$("#mecCityCd").html(data);
				$("#mecCityCd").chosen({});
				//$("#mecCityCd").attr("class","col-sm-6 width-48  chosen-select width-45  ");
				
			},
			error:function(){
				$.messager.alert('提示信息','数据提交失败');
			}
		});	
	} 
    
     function resetMecForm(){
    	 $(':input','#searchForm')  
    	 .not(':button, :submit, :reset, :hidden')  
    	 .val('')  
    	 .removeAttr('checked')  
    	 .removeAttr('selected'); 
    	 $("#mecSts").val('');
 		 $("#mecSts").trigger("chosen:updated");
 		 $("#mecProvCd").val('');
		 $("#mecProvCd").trigger("chosen:updated");
		 $("#mecCityCd").val('');
 		 $("#mecCityCd").trigger("chosen:updated");
     }
     
     function revalidateFieldByFieldName(formId,fieldName){
      	$("#"+formId).data('formValidation').revalidateField("dateStart");
      	$("#"+formId).data('formValidation').revalidateField("dateEnd");
     }
</script>
</body>
</html>











