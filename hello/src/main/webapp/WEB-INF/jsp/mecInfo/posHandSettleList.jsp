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
                                        结算查询条件
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


                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/posHandSettle/list" id="searchForm" method="post" >
                                                <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                            	<input type="hidden" id="lastMonth" name="lastMonth"  value="${lastMonth}">
                                                <div class=" col-xs-12">
                                                <input id="flg" name="flg" value="1" style="display: none">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mno"  name="mno" value="${mobSettleSum.mno }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div id="div_switch_tel" class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left ">手机号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="mecAdminTel" name="mecAdminTel" onkeyup="this.value=this.value.replace(/\D/g,'')"
																value="${mobSettleSum.mecAdminTel }"
																class="form-control input-small width-200px "
																title="不能超过11个字符"
																data-placement="bottom" title="" data-rel="tooltip"
																data-original-title="Hello Tooltip!">
														</div>
													</div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户名称:</label>

                                                       <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="cprRegNmCn" name="cprRegNmCn" value="${mobSettleSum.cprRegNmCn }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div><br>
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
																			<c:if test="${orgs.orgUuid == mobSettleSum.topAgentOrgUuid }"> selected </c:if>>${orgs.orgNm}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算方式:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="payTyp" name="payTyp" class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
                                                                <option value="01" <c:if test="${mobSettleSum.payTyp=='01'}">selected</c:if>>T+N</option>
                                                                <option value="02" <c:if test="${mobSettleSum.payTyp=='02'}">selected</c:if>>T+0</option>
                                                                <option value="07" <c:if test="${mobSettleSum.payTyp=='07'}">selected</c:if>>即刷即到</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                  <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算金额:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text"  class="form-control input-small width-100px " name="amountSumStart"
																size="6" value="${mobSettleSum.amountSumStart }"
																onKeyUp="if(!this.value.match(/^[0-9]?\d*?\.?\d*?$/)||this.value.match(/^0[0-9]\.?\d*?$/)) this.value=this.defaultValue;else this.defaultValue=this.value;" 
																onafterpaste="if(!this.value.match(/^[0-9]?\d*?\.?\d*?$/)||this.value.match(/^0[0-9]\.?\d*?$/)) this.value=this.defaultValue;else this.defaultValue=this.value;"
																 />
																 <input type="text"  class="form-control input-small width-100px "  
																	name="amountSumEnd" size="6" value="${mobSettleSum.amountSumEnd }"
																	onKeyUp="if(!this.value.match(/^[0-9]?\d*?\.?\d*?$/)||this.value.match(/^0[0-9]\.?\d*?$/)) this.value=this.defaultValue;else this.defaultValue=this.value;" 
																	onafterpaste="if(!this.value.match(/^[0-9]?\d*?\.?\d*?$/)||this.value.match(/^0[0-9]\.?\d*?$/)) this.value=this.defaultValue;else this.defaultValue=this.value;"
																	 />

                                                        </div>
                                                    </div><br>                                            
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >月份<font color="red">*</font>:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px ">
                                                                            <input type="text" id="profitMonth" name="profitMonth" value="${mobSettleSum.profitMonth}"
                                                                            id="beginDt" class="input-small form-control date-picker" onchange="revalidateFieldByFieldName('searchForm','profitMonth')">
                                                            </div>
                                                        </div>
                                                    </div>                                                 
                                                </div>

                                                <button class="btn btn-normal btn-sm" id="submitButton" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
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
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
           								结算查询结果 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 					             <c:if test="${showFlg=='show' }"> 
					                                                       结算金额:${sumAmount }元;&nbsp;&nbsp;&nbsp;&nbsp;手续费:${sumFee }元;&nbsp;&nbsp;&nbsp;&nbsp;结算笔数:${countTrade }
  					             </c:if> 
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
												<th align="center">商编</th>
												<th align="center">商户名称</th>
												<th align="center">手机号</th>
												<th align="center">归属一代</th>
												<th align="center">结算金额</th>
												<th align="center">结算笔数</th>
												<th align="center">结算手续费</th>
                                                
                                            </tr>
                                            </thead>
                                            <tbody>
                                           <c:forEach items="${sumList }" var="item" varStatus="status">
												<tr>
														<td style="text-align: center;"> ${item.mno }</td>
														<td style="text-align: center;">${item.cprRegNmCn }</td>
														<td style="text-align: center;" class="hiddenMainInfo">${item.mecAdminTel }</td>
														<td style="text-align: center;">${item.topAgentOrgNm }</td>
														<td style="text-align: right;" >${item.amountSum }</td>
														<td style="text-align: right;" >${item.tradeCount }</td>
														<td style="text-align: center;">${item.feeSum }</td>
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

    <%-- <%@include file="../layout/footer.jsp"%> --%>
    <%@include file="../layout/common.js.jsp"%>
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
            	mecAdminTel : {
					validators : {
						
						regexp: {
	                        regexp: /^1\d{10}$/g,
	                        message:'请输入正确的手机号'
	                    }

					}
				},
			  	 mno: {
                     validators: {
                    	 digits: {},
                         greaterThan: {
                             value: 700000000000000,
                             message : '请输入合法商编'
                         },
                         lessThan: {
                             value: 900000000000000,
                             message : '请输入合法商编'
                         }
                     }
                 },cprRegNmCn: {
                     validators: {
                    	 stringLength: {
                             max: 60,
                             message : '最多可输入30个汉字长度'
                         }
                     }
                 },profitMonth : {
  					validators : {
   						notEmpty: {}

  					}
  				}
  	            
              }
        });
    })
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
    	     $("#profitMonth").val(lastMonth);
    	   	 $("#profitMonth").trigger("chosen:updated");
    	   //移除formValidation校验样式
     		 changeFormValidateStyle('searchForm','cprRegNmCn','NOT_VALIDATED','regRepeatNum');
     		 changeFormValidateStyle('searchForm','mno','NOT_VALIDATED','regRepeatNum');
     		 changeFormValidateStyle('searchForm','mecAdminTel','NOT_VALIDATED','regRepeatNum');
    	     //重置检索按钮
    	     document.getElementById("submitButton").removeAttribute("disabled");

    	}
</script>
</body>
</html>











