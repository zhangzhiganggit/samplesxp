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
<c:if test="${pbCheck ==false }">
<body class="no-skin ">
</c:if>
<c:if test="${pbCheck ==true }">
<body class="no-skin " oncopy="alert('本页面内容不允许被复制'); return false;">
</c:if>
    
  <%--   <%@include file="../layout/header.jsp"%> --%>

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
       <%--  <%@include file="../layout/menu.jsp"%> --%>

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


                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecIfSettle/list.do" id="searchForm"  method="post">
                                               <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                            
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mno" name="mno" value="${mecIfSettle.mno }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >发起日期:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="dateStart" name="dateStart"  onchange="revalidateDate();" value="${mecIfSettle.bStrDt }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="dateEnd" name="dateEnd" onchange="revalidateDate();" value="${mecIfSettle.eStrDt }" value="${mecIfSettle.eStrDt }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >完成日期:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="bEdDt" name="bEdDt" value="${mecIfSettle.bEdDt }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="eEdDt" name="eEdDt" value="${mecIfSettle.eEdDt }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    

                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算卡号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="actNo" id="actNo" value="${mecIfSettle.actNo }"   class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >交易状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="setSts" name="setSts" class="chosen-select form-control width-200px">
                                                                <option value="">全部</option> 
                                                                <option value="08"  <c:if test="${mecIfSettle.setSts=='08' }">selected</c:if>>结算成功</option>
                                                                <option value="07"  <c:if test="${mecIfSettle.setSts=='07' }">selected</c:if>>结算失败</option>
                                                                <option value="02"  <c:if test="${mecIfSettle.setSts=='02' }">selected</c:if>>待结算</option>
                                                                <option value="06"  <c:if test="${mecIfSettle.setSts=='06' }">selected</c:if>>结算中</option>
                                                                <option value="03"  <c:if test="${mecIfSettle.setSts=='03' }">selected</c:if>>已撤销</option>
                                                            </select>

                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px " style="display: none">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算方式:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="setMod" name="setMod" class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
                                                                <option value="01" <c:if test="${mecIfSettle.setMod=='01' }">selected</c:if>>自动</option>
                                                                <option value="00" <c:if test="${mecIfSettle.setMod=='00' }">selected</c:if>>手动</option>
                                                                <option value="02" <c:if test="${mecIfSettle.setMod=='02' }">selected</c:if>>独立结算</option>
                                                                <option value="04" <c:if test="${mecIfSettle.setMod=='04' }">selected</c:if>>商户付款</option>
                                                                <option value="05" <c:if test="${mecIfSettle.setMod=='05' }">selected</c:if>>手刷单笔结算</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <!-- 结算产品类型 -->
                                                    <c:if test="${pbCheck==false }">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算产品类型:</label>

                                                        <div class="col-sm-8  no-padding"  ><input type="hidden" value="${mecIfSettle.payTypAdmin }" id="hiPayTyp">
                                                            <select id="payTypAdmin" name="payTypAdmin" class="chosen-select form-control width-200px" multiple="multiple" onchange="validate()">
	                                                                <option value="01" <c:forEach items="${payTyps }" var="payTyp"><c:if test="${payTyp == '01' }">selected</c:if></c:forEach>>T+N结算</option> 
	                                                                <option value="02" <c:forEach items="${payTyps }" var="payTyp"><c:if test="${payTyp == '02' }">selected</c:if></c:forEach>>T+0结算</option>
	                                                                <option value="03" <c:forEach items="${payTyps }" var="payTyp"><c:if test="${payTyp == '03' }">selected</c:if></c:forEach>>非工作日结算</option>
	                                                                <option value="05" <c:forEach items="${payTyps }" var="payTyp"><c:if test="${payTyp == '05' }">selected</c:if></c:forEach>>普通朝付通</option>
	                                                                <option value="06" <c:forEach items="${payTyps }" var="payTyp"><c:if test="${payTyp == '06' }">selected</c:if></c:forEach>>VIP朝付通</option>
	                                                                <option value="07" <c:forEach items="${payTyps }" var="payTyp"><c:if test="${payTyp == '07' }">selected</c:if></c:forEach>>即刷即到</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    </c:if>
                                                     <c:if test="${pbCheck==true }">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >结算产品类型:</label>

                                                        <div class="col-sm-8  no-padding"  ><input type="hidden" value="${mecIfSettle.payTypAdmin }" id="hiPayTyp">
                                                            <select id="payTypAdmin" name="payTypAdmin" class="chosen-select form-control width-200px" multiple="multiple" onchange="validate()">
	                                                                <option value="01" <c:forEach items="${payTyps }" var="payTyp"><c:if test="${payTyp == '01' }">selected</c:if></c:forEach>>T+N结算</option> 
                                                            </select>
                                                        </div>
                                                    </div>
                                                    </c:if>
													<!-- T＋0结算类型 -->
                                                    <div class="form-group form-group-sm width-300px " id="t0Show">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >T＋0结算类型:</label>

                                                        <div class="col-sm-8  no-padding">
                                                        	<input type="hidden" value="${t0Types }" id="hiddenT0">
                                                            <select id="t0Type" name="t0Type" class="chosen-select form-control width-200px" multiple="multiple" >
	                                                                <!-- <option value="" >全部</option> -->
	                                                                <option value="01"  <c:forEach items="${t0Types }" var="t0Type"><c:if test="${t0Type=='01' }">selected</c:if></c:forEach>>随意通</option>
	                                                                <option value="02"  <c:forEach items="${t0Types }" var="t0Type"><c:if test="${t0Type=='02' }">selected</c:if></c:forEach>>即日付</option>
	                                                                <option value="03"  <c:forEach items="${t0Types }" var="t0Type"><c:if test="${t0Type=='03' }">selected</c:if></c:forEach>>闪电到账</option>
	                                                                <option value="05"  <c:forEach items="${t0Types }" var="t0Type"><c:if test="${t0Type=='05' }">selected</c:if></c:forEach>>二代手刷T+0</option>
                                                            </select>

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
                                              <!--   <button class="btn btn-danger btn-sm" type="submit">
                                                    <span class="ace-icon fa 	fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                    Excel
                                                </button> -->
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2"  >
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        结算查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 12%">流水号</th>
                                                <th style="text-align: center; width: 10%">商户编号</th>
                                                <th style="text-align: center;width: 14%"> 发起时间 </th>
                                                <th style="text-align: center;width: 10%">金额(元)</th>
                                                <th style="text-align: center;width: 10%">手续费(元)</th>
                                                <th style="text-align: center;width: 10%">结算方式</th>
                                                <th style="text-align: center;width: 10%">完成时间</th>
                                                <th style="text-align: center;width: 8%">交易状态</th>
                                                <th style="text-align: center;" >操作</th>
                                            </tr>
                                            </thead>

                                               <tbody>
                                           <c:forEach items="${mecIfSettleList}" var="de"  varStatus="status">
													<tr>
														<td style="text-align: left;"> ${de.setOno }</td>
														<td style="text-align: center;">${de.mno }</td>
														<td style="text-align: center;">${de.strDate }</td>
														<td style="text-align: right;" class="numberPointFormatForText">${de.setAmt }</td>
														<td style="text-align: right;" class="numberPointFormatForText">${de.setFeeAmt }</td>
														<td style="text-align: center;">${de.modAlias }</td>
														<td style="text-align: center;">${de.endDate }</td>
														<td style="text-align: center;">${de.stsAlias }</td>
														<td  style="text-align: left;">
										                     <div class="   action-buttons">
										                         <a href="#" onclick="mecIfSetdetailShow('${de.setOno}','${de.inMno}')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看详情</font></i>
										                         </a>
										                         
										                          <c:if test="${de.setMod=='01' }">
																      <a href="<%=request.getContextPath()%>/mecIfSettle/detailTrade.do?setOno=${de.setOno}&flg=1&inMno=${de.inMno}" >
												                     <i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">结算明细</font></i>
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
    <script type="text/javascript">
    function resetMecForm(){
      	 $(':input','#searchForm')  
      	 .not(':button, :submit, :reset, :hidden')  
      	 .val('')  
      	 .removeAttr('checked')  
      	 .removeAttr('selected'); 
   		 $("#setSts").val('');
   		 $("#setSts").trigger("chosen:updated");
   		 //add by hss 2016-04-28 付款类型
   		 $("#payTyp").val('');
   		 $("#payTyp").trigger("chosen:updated");		 
   		 $("#setMod").val('');
   		 $("#setMod").trigger("chosen:updated");
   		 
   		 $("#dateStart").val(getFormatDate());
   		 $("#dateStart").trigger("chosen:updated");	
   		 $("#dateEnd").val(getFormatDate());
   		 $("#dateEnd").trigger("chosen:updated");	
   		 $("#payTypAdmin").val("");
   		 $("#payTypAdmin").trigger("chosen:updated");	
   		 $("#t0Type").val("");
   		 $("#t0Type").trigger("chosen:updated");	
   		$("#t0Show").hide();
       }

    function mecIfSetdetailShow(id,inMno){
  	  $.fancybox.open({
			href : '<%=request.getContextPath()%>/mecIfSettle/detail.do?setOno='+id+'&inMno='+inMno,
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 800,
	        height: 480,
	        autoSize: false,
	        closeClick: false,
				afterClose:function(){
				}
			});
       }
  
    
    
    
    
    
   function subCheck(){
	   if(($('#bStr_Dt').val()==''&&$('#bStr_Dt2').val()!='')||($('#bStr_Dt').val()!=''&&$('#bStr_Dt2').val()==''))
		{
			alert('发起日期不正确!');return false;
		}
		if(($('#eStr_Dt').val()==''&&$('#eStr_Dt2').val()!='')||($('#eStr_Dt').val()!=''&&$('#eStr_Dt2').val()==''))
		{
			alert('完成日期不正确!');return;
		}
   }
   //校验日期合法
   function revalidateDate(){
   	revalidateFieldByFieldName('searchForm','dateStart');
   	revalidateFieldByFieldName('searchForm','dateEnd');
   }

        $('.chosen-select').chosen({});
        jQuery(function($) {
        	/* if($("#hiddenT0").val() == null || $("#hiddenT0").val() == ""){
		      	 $("#t0Show").hide();
        	 }else{
        		$("#t0Show").show();
        	} */
        	validate();
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

        



        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        }).next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
		

    })
    
   /* 判断付款类型 */
   function validate() {
        	$("#t0Show").hide();
        	var payType = $("#payTypAdmin").val();
        	var flag = $.inArray("02",payType);
        	if(flag != -1){
        		$("#t0Show").show();
        	}
        }
</script>
</body>
</html>











