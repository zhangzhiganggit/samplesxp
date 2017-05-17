<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
     <%@include file="../common/taglib.jsp"%>
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/orgTradeSum/orgProfit.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                            	<input type="hidden" id="lastMonth" name="lastMonth"  value="${lastMonth}">
                                            	<!-- <input type="hidden" id="flag" name="flag" > -->
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="orgNo" name="orgNo" value="${dsm.orgNo }" class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="orgNm" name="orgNm" value="${dsm.orgNm }" class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >发布状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="profitSts" name="profitSts" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
                                                                <option value="2" <c:if test="${dsm.profitSts==2 }">selected</c:if>>已发布</option>
                                                                <option value="1" <c:if test="${dsm.profitSts==1 }">selected</c:if>>未发布</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="branchOrgNm" id="branchOrgNm" value="${dsm.branchOrgNm }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >月份<font color="red">*</font>:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px ">
                                                                            <input type="text" id="profitMonth" name="profitMonth" value="${dsm.profitMonth}"
                                                                            id="beginDt" class="input-small form-control date-picker" onchange="revalidateFieldByFieldName('searchForm','profitMonth')">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                                                                                                                                                         检索
                                                </button>
                                                 <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa da-search-minus icon-on-right bigger-110"></span>
                                                    清空检索条件
                                                </button> 
                                                 <c:if  test="${loginUserPermission.SMSA_PROFIT_041!=null}"> 
                                                <button id="exp" class="btn btn-primary btn-sm" type="button" onclick="uploadExcelAgentProfit()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                  导出                                                                                                                                  
                                                </button>
                                                </c:if>
                                                <c:if  test="${loginUserPermission.SMSA_PROFIT_043!=null}">
                                                <button class="btn btn-primary btn-sm" type="button"  onclick="downLoadView()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                 导入模板下载
                                                </button> 
                                                </c:if>
                                                <c:if  test="${loginUserPermission.SMSA_PROFIT_040!=null}">   
                                                <button class="btn btn-danger btn-sm" type="button"  onclick="importView()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-up icon-on-right bigger-110"></span>
                                                 其它款项金额导入
                                                </button> 
                                                </c:if>
                                                 <c:if  test="${loginUserPermission.SMSA_PROFIT_027!=null}">   
                                                <button class="btn btn-info btn-sm" type="button"  onclick="batchEdit()">
                                                    <span class="ace-icon fa  icon-on-right bigger-110"></span>
                                                 批量发布
                                                </button>
                                                </c:if> 
                                                <c:if  test="${loginUserPermission.SMSA_PROFIT_027!=null}">
                                                <button id="exp" class="btn btn-danger btn-sm" type="button" onclick="openAllOperForm('openAllOperForm')">
                                                    <span class="ace-icon fa  icon-on-right bigger-110"></span>
                                                                                                                                                                                       发布操作                                                                                                                                  
                                                </button>
                                                </c:if>
                                                <c:if  test="${loginUserPermission.SMSA_PROFIT_027!=null}">
                                                <button id="exp" class="btn btn-danger btn-sm" type="button" onclick="openAllOperForm('toAgentProfitRevoke')">
                                                    <span class="ace-icon fa  icon-on-right bigger-110"></span>
                                                                                                                                                                                       撤回操作                                                                                                                                  
                                                </button>
                                                </c:if>
                                                <c:if  test="${flag eq 'Y'}">
                                                <button class="btn btn-primary btn-sm" type="button"  onclick="downLoadData()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                   调整模板下载
                                                </button> 
                                                <button id="exp" class="btn btn-danger btn-sm" type="button" onclick="changeData()">
                                                    <span class="ace-icon fa  icon-on-right bigger-110"></span>
                                                                                                                                                                                       手续费分润及比例调整                                                                                                                               
                                                </button>
                                                </c:if>
                                            </form>
                                            <form  action="<%=request.getContextPath()%>/orgTradeSum/downExcel" id="downLoadForm" method="post">
                                            </form>
                                            <form  action="<%=request.getContextPath()%>/profitImport/downExcel" id="downChangeData" method="post">
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
                                                 <th style="text-align: center;width: 5%">
                                                     <input type="checkbox" class="ace "  id="ckAll" name="ckAll">
                                                     <span class="lbl middle">全选</span>
                                                 </th>
                                                <th style="text-align: center;width: 5%">月份</th>
                                                <th style="text-align: center;width: 6%">代理商编号</th>
                                                <th style="text-align: center;width: 10%">代理商名称</th>
                                                <th style="text-align: center;width: 7%">所属分公司</th>
                                                <th style="text-align: center;width: 7%">手续费分润</th>
                                                <th style="text-align: center;width: 7%">产品分润</th>
                                                <th style="text-align: center;width: 7%">损失应扣</th>
                                                <th style="text-align: center;width: 6%">损失实扣</th>
                                                <th style="text-align: center;width: 6%">总部调整</th>
                                                <th style="text-align: center;width: 6%">城市调整</th>
                                                <th style="text-align: center;width: 6%">合计</th>
                                                <th  style="text-align: center;" width="5%">状态</th>
                                                <th  style="text-align: center;" width="8%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                           <c:forEach items="${profitList}" var="de"  varStatus="status">
													<tr class="trRow">
													 <td class="" style="text-align: center;">
													 <c:if test="${de.profitSts eq '1' }"> 
                                                        <input type="checkbox" class="ace abc" id="sub" name="sub">
                                                        <span class="lbl middle"></span>
                                                     </c:if> 
                                                    </td>
                                                       <td class="uuid" style="display: none;">${de.uuid}</td>
                                                        <td class="profitMonth" style="display: none;">${year}${month}</td>
														<td  style="text-align: center;">${year}-${month}</td>
														<td class="orgNo" style="text-align: conter;">${de.orgNo }</td>
														<td  style="text-align: left;">${de.orgNm }</td>
														<td style="text-align: left;">${de.branchOrgNm }</td>
														<td style="text-align: right;">${de.profitAmountMonthDesc }</td>
														<td style="text-align: right;">
														     <a href="#" onclick="seeOtherAmount('${de.orgNo }','${year}','${month}','1')" >
										                          <c:if test="${de.productAmountDesc != null && de.productAmountDesc != ''}">${de.productAmountDesc }</c:if>
										                          <c:if test="${de.productAmountDesc == null || de.productAmountDesc == ''}">0.00</c:if>
										                     </a>
														</td>
														<td style="text-align: right;">
														     <a href="#" onclick="seeOtherAmount('${de.orgNo }','${year}','${month}','6')" >
										                          ${de.lossRealDesc }
										                     </a>
														</td>
														<td style="text-align: right;"> 
															<a href="#" onclick="seeOtherAmount('${de.orgNo }','${year}','${month}','7')" >
																${de.lossActDesc }
															</a>
														</td>
														<td style="text-align: right;">
														     <a href="#" onclick="seeOtherAmount('${de.orgNo }','${year}','${month}','3')" >
										                         <c:if test="${de.carryAmountDesc != null && de.carryAmountDesc != ''}">${de.carryAmountDesc }</c:if>
                                                                  <c:if test="${de.carryAmountDesc == null || de.carryAmountDesc == ''}">0.00</c:if>
										                     </a>
														</td>
														<td style="text-align: right;">
														     <a href="#" onclick="seeOtherAmount('${de.orgNo }','${year}','${month}','5')" >
										                         <c:if test="${de.adjustAmountDesc != null && de.adjustAmountDesc != ''}">${de.adjustAmountDesc }</c:if>
                                                                  <c:if test="${de.adjustAmountDesc == null || de.adjustAmountDesc == ''}">0.00</c:if>
										                     </a>
														</td>
														<td style="text-align: right;">
														 ${de.profitAmountEndDesc }
														</td>
														<td style="text-align: right;">
														<c:if test="${de.profitSts eq '1' }"><font color="red">未发布</font></c:if>
														<c:if test="${de.profitSts eq '2' }">已发布</c:if>
														</td>
														 <td style="text-align: center;">
										                     <div class="   action-buttons">
										                          <c:if  test="${loginUserPermission.SMSA_PROFIT_027!=null && de.profitSts eq '1'}">   
										                         <a href="#" onclick="openToAgent('${de.orgNo }','${year}','${month}','${de.uuid}')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa  blue bigger-130"><font size="2">发布</font></i>
										                         </a>
										                         </c:if>
										                         <a href="#" onclick="seeAllOtherAmount('${de.orgNo }','${year}','${month}')" class="blue fancybox-manual-b">
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
    <%@include file="../layout/common.alljs.jsp"%>
    <script type="text/javascript">
    
    function downLoadView(){
   		document.getElementById("downLoadForm").submit();
    }
    function downLoadData(){
   		document.getElementById("downChangeData").submit();
    }
    
    function typeDetailShow(destDt,orgNo){
  	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/profitLoss/lossDetail.do?destDt='+destDt+'&orgNo='+orgNo,
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
    
    
    function seeOtherAmount(orgNo,year,month,hisType){
    	$.fancybox.open({
    		href : '<%=request.getContextPath()%>/profitImport/showOneOrgView.do?orgNo='+orgNo+'&year='+year+'&month='+month+'&hisType='+hisType,
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 800,
	        height: 500,
	        autoSize: true,
	        closeClick: false,
	        afterClose:function(){
			}
        });
    };
    
    function seeAllOtherAmount(orgNo,year,month){
    	$.fancybox.open({
    		href : '<%=request.getContextPath()%>/profitImport/showOneOrgDetailView.do?orgNo='+orgNo+'&year='+year+'&month='+month,
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 800,
	        height: 500,
	        autoSize: false,
	        closeClick: false,
	        afterClose:function(){
			}
        });
    };
    
    
    function importView(){
    	$.fancybox.open({
    		href : '<%=request.getContextPath()%>/profitImport/showImportView.do',
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 800,
	        height: 500,
	        autoSize: false,
	        closeClick: false,
	        afterClose:function(){
	        	window.location.href='<%=request.getContextPath()%>/orgTradeSum/orgProfit.do';
			}
        });
    };
    
    
    function uploadExcelAgentProfit(){
    	var profitMonth = $("#profitMonth").val();
    	if(profitMonth=='' || profitMonth==null){
    		alert("请选择月份");
    		return;
    	}
		$("#searchForm").attr("action","<%=request.getContextPath()%>/profitExport/AgentProfitExcelDown.do");
		document.getElementById("exp").disabled=true;
		document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","<%=request.getContextPath()%>/orgTradeSum/orgProfit.do");
	}
    
    
       function batchEdit(){
    	  var dateArray = [];
    	  $(".abc:checked").each(function(){
      		var parent = $(this).parents(".trRow");
    				dateArray.push(
    						new myObject(parent.find(".orgNo").text(),parent.find(".uuid").text(),
      	    				parent.find(".profitMonth").text())); 
    		});
    	  
    	  if(dateArray.length == 0){
      		alert("请选中要发布的机构！");
      		return;
          }
    	  var res = confirm("确定要发布吗?");
    	  if(res){
    		  var jsonStr = JSON.stringify(dateArray);
        	  $.ajax({
    			   type: "POST",
    			   url: "<%=request.getContextPath() %>/orgTradeSum/openToAgent.do",
    		       data : {jsonStr:jsonStr,flg:2},
    			   success: function(data){
    				   alert(data.msg);
    				   window.location.href='<%=request.getContextPath() %>/orgTradeSum/orgProfit.do?orgNo='+$("#orgNo").val()+'&profitMonth='+$("#profitMonth").val()+'&orgNm='+$("#orgNm").val()+'&branchOrgNm='+$("#branchOrgNm").val();
    			   }
    			});
    	  }
    	  
    	  
      }
      
      function myObject(orgNo,uuid,profitMonth){ 
    	  	this.orgNo = orgNo; 
    	  	this.uuid = uuid;
    	  	this.profitMonth = profitMonth; 
    	 	return this;
      }
    
      function openToAgent(orgNo,year,month,uuid){
    	  var res = confirm("确定要发布吗?");
    	  if(res){
    		  $.ajax({
   			   type: "POST",
   			   url: "<%=request.getContextPath() %>/orgTradeSum/openToAgent.do",
   		       data : {orgNo:orgNo,year:year,month:month,uuid:uuid,flg:1},
   			   success: function(data){
   				   alert(data.msg);
   				   window.location.href='<%=request.getContextPath() %>/orgTradeSum/orgProfit.do?orgNo='+$("#orgNo").val()+'&profitMonth='+$("#profitMonth").val()+'&orgNm='+$("#orgNm").val()+'&branchOrgNm='+$("#branchOrgNm").val();
   			   }
   			});
    	  }
      }
    
      function editDetailShow(orgNo,orgNm,year,month){
    	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/orgTradeSum/otherAmountView.do?orgNo='+orgNo+'&orgNm='+orgNm+'&year='+year+'&month='+month,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 800,
	        height: 800,
	        autoSize: false,
	        closeClick: false,
				afterClose:function(){
					 window.location.href='<%=request.getContextPath() %>/orgTradeSum/orgProfit.do?orgNo='+$("#orgNo").val()+'&profitMonth='+$("#profitMonth").val()+'&orgNm='+$("#orgNm").val()+'&branchOrgNm='+$("#branchOrgNm").val();
				}
			});
    	  
      }
    
    
      function openAllOperForm( operService ){
          $.fancybox.open({
              href : '<%=request.getContextPath()%>/orgTradeSum/' + operService,
              type: 'iframe',
              padding: 5,
              scrolling: 'no',
              fitToView: true,
              width: 1024,
              height: 400,
              autoSize: true,
              closeClick: false,
              afterClose:function(){
                  window.location.href='<%=request.getContextPath()%>/orgTradeSum/orgProfit.do';
              }
          });
      };
      function changeData(){
      	$.fancybox.open({
      		href : '<%=request.getContextPath()%>/profitImport/changeData',
  			type: 'iframe',
  	        padding: 5,
  	        scrolling: 'no',
  	        fitToView: true,
  	        width: 800,
  	        height: 500,
  	        autoSize: false,
  	        closeClick: false,
  	        afterClose:function(){
  	        	window.location.href='<%=request.getContextPath()%>/orgTradeSum/orgProfit.do';
  			}
          });
      }; 
        
        //show the dropdowns on top or bottom depending on window height and menu position
        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
            var offset = $(this).offset();

            var $w = $(window)
            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                $(this).addClass('dropup');
            else $(this).removeClass('dropup');
        });

     function resetMecForm(){
    	 var datetime=new Date();
 	     var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() ) : datetime.getMonth() ;
    	 $(':input','#searchForm')  
    	 .not(':button, :submit, :reset, :hidden')  
    	 .val('')  
    	 .removeAttr('checked')  
    	 .removeAttr('selected'); 
    	 $("#profitSts").val('');
 		 $("#profitSts").trigger("chosen:updated");
 		 $("#mecProvCd").val('');
		 $("#mecProvCd").trigger("chosen:updated");
		 $("#mecCityCd").val('');
 		 $("#mecCityCd").trigger("chosen:updated");
 		var lastMonth = $("#lastMonth").val();
   	 $("#profitMonth").val(lastMonth);
   	 $("#profitMonth").trigger("chosen:updated");
     }
      
      $(function(){
    	  $('.chosen-select').chosen({});
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
              	
              	profitMonth : {
  					validators : {
  						
  						notEmpty: {}

  					}
  				}
  	            
              }
          });
          $("#ckAll").click(function() {
              $("input[name='sub']").prop("checked", this.checked);
            });
            
            $("input[name='sub']").click(function() {
                  var $subs = $("input[name='sub']");
                  $("#ckAll").prop("checked" , $subs.length == $subs.filter(":checked").length ? true :false);
            });
      });
      
</script>
</body>
</html>











