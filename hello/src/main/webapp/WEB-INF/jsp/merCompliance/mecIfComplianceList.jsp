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
                                       	        商户追偿核算查询条件
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/MerchantComplianceManage/MercComplianceList" id="searchForm" method="post" >
                                              <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                                <div class=" col-xs-12">
                                                <input id="flg" name="flg" value="1" style="display: none">                                                                                                     
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                         <input	type="text"  name="corg_merc_cd" id="corg_merc_cd" 		value="${mr.corg_merc_cd }"   maxlength="15"     title="请输入有效商户编号！"      class="form-control input-small width-200px   view-control"  /> 
                                                         <div id="mNO_text" class="red"></div>
                                                        </div>
                                                    </div>                                                   
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >执行规则:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="complianceType" name="complianceType" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                                 <option value="">全部</option>
                                                                <c:forEach items="${mecComplianceEnumList}" var="mecComplianceEnum">
											    					<option value="${mecComplianceEnum.status}"  <c:if test="${mr.complianceType==mecComplianceEnum.status}"> selected </c:if> >${mecComplianceEnum.value} </option>
											    				</c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >批次号</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                        	  <input	type="text"  name="batchNumber" id="batchNumber" 		value="${mr.batchNumber }"   maxlength="18"      class="form-control input-small width-200px "  />
                                                        	  <div id="batchNumber_text" class="red"></div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >查询日期:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="year" name="year"   class="col-sm-8 width-40 chosen-select width-40">
                                                                <c:forEach  items="${yearlist }" var="year">
                                                                  <option value="${year}" >${year}年</option>
                                                               </c:forEach>
                                                            </select>                                                            			
                                                            <select id="month" name="month"   class="col-sm-6 width-40  chosen-select width-40  ">
                                                              <option value="01" <c:if test="${month=='01' }">selected</c:if>>01月</option>
                                                              <option value="02" <c:if test="${month=='02' }">selected</c:if>>02月</option>
                                                              <option value="03" <c:if test="${month=='03'}">selected</c:if>>03月</option>
                                                              <option value="04" <c:if test="${month=='04'}">selected</c:if>>04月</option>
                                                              <option value="05" <c:if test="${month=='05' }">selected</c:if>>05月</option>
                                                              <option value="06" <c:if test="${month=='06' }">selected</c:if>>06月</option>
                                                              <option value="07" <c:if test="${month=='07' }">selected</c:if>>07月</option>
                                                              <option value="08" <c:if test="${month=='08' }">selected</c:if>>08月</option>
                                                              <option value="09" <c:if test="${month=='09' }">selected</c:if>>09月</option>
                                                              <option value="10" <c:if test="${month=='10' }">selected</c:if>>10月</option>
                                                              <option value="11" <c:if test="${month=='11' }">selected</c:if>>11月</option>
                                                              <option value="12" <c:if test="${month=='12' }">selected</c:if>>12月</option>
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
                                                <button class="btn btn-primary btn-sm" type="button" id="exp"  onclick="dowmRecord()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                导出检索结果                               
                                                </button>
                                                 <a class="btn btn-primary btn-sm"  href="<%=request.getContextPath()%>/MerchantComplianceManage/downRecordExl">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                    下载模板
                                                </a>
                                                <button class="btn btn-danger btn-sm" type="button" onclick="importRecordView()">
                                                    <span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
                                                    批量导入
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
                                        	 商户追偿核算查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                            	<th style="text-align: center;width: 2%">批次号 </th>
                                            	<th style="text-align: center;width: 2%">导入时间 </th>
                                                <th style="text-align: center;width: 2%">商户编号 </th>
                                                <th style="text-align: center;width: 2%">真实商编</th>
                                                <th style="text-align: center;width: 2%">注册名称</th>
                                                <th style="text-align: center;width: 2%">执照号</th>
                                                <th style="text-align: center;width: 2%">经营概述 </th>
                                                <th style="text-align: center;width: 2%">经营名称</th>
                                                <th style="text-align: center;width: 2%">签购单名称</th>
                                                <th style="text-align: center;width: 2%">注册地址</th>
                                                <th style="text-align: center;width: 2%">经营地址</th>
                                                <th style="text-align: center;width: 2%">32域</th>
                                                <th style="text-align: center;width: 2%">经营范围</th>
                                                <th style="text-align: center;width: 2%">MCC</th>
                                                <th style="text-align: center;width: 1%">是否县乡 </th>
                                                <th style="text-align: center;width: 1%">是否特惠</th>
                                                <th style="text-align: center;width: 2%">归属机构</th>
                                                <th style="text-align: center;width: 2%">机构编号</th>
                                                <th style="text-align: center;width: 2%">归属一代名称</th>
                                                <th style="text-align: center;width: 2%">一代机构编号</th>
                                                <th style="text-align: center;width: 2%">归属分公司</th>
                                                <th style="text-align: center;width: 2%">历史一年交易金额</th>
                                                <th style="text-align: center;width: 2%">交易笔数</th>
                                                <th style="text-align: center;width: 2%">追偿金额</th>
                                                <th style="text-align: center;width: 2%">追偿原因</th>                                                
                                                <th style="text-align: center;width: 2%">跑批时间</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                           <c:forEach items="${list}" var="de"  varStatus="status">
													<tr >
                                                        <td style="text-align: center;">${de.batchNumber }</td>
                                                        <td style="text-align: center;">${de.createTime }</td>	
														<td style="text-align: center;">${de.corg_merc_cd }</td>														
														<td style="text-align: center;"><c:if test="${de.mNO!=de.corg_merc_cd }">${de.mNO }</c:if></td>
														<td style="text-align: center;">${de.cPR_REG_NM_CN }</td>
														<td style="text-align: center;">${de.oPER_LIC_NO }</td>
														<td style="text-align: center;">${de.BUS_OVERVIEW}</td>
														<td style="text-align: center;">${de.cPR_OPER_NM_CN}</td>
                                                        <td style="text-align: center;">${de.mEC_DIS_NM }</td>
                                                        <td style="text-align: center;">${de.cPR_REG_ADDR}</td>                                                        
														<td style="text-align: center;">${de.bUS_ADDR }</td>
														<td style="text-align: right;">${de.cUP_CODE }</td>
														<td style="text-align: center;">${de.oPER_SCOPE }</td>
														<td  style="text-align: right;">${de.MCC_CD }</td>
														<td style="text-align: center;">
															 <c:if test="${de.mEC_FEE_TYP=='01' }">是</c:if>
															 <c:if test="${de.mEC_FEE_TYP!='01' && de.mEC_FEE_TYP!=null}">否</c:if>
															  <c:if test="${de.mEC_FEE_TYP==null }"></c:if>
														</td>
														<td style="text-align: center;">
															 <c:if test="${de.iS_TEYOU=='1' }">是</c:if>
															 <c:if test="${de.iS_TEYOU!='1' && de.iS_TEYOU!=null}">否</c:if>
															 <c:if test="${de.iS_TEYOU!=null }"></c:if>
														</td>
                                                        <td style="text-align: center;">${de.aGENT_ORG_Nm }</td>
														<td style="text-align: center;">${de.aGENT_ORG_NO }</td>
														<td style="text-align: center;">${de.tOP_AGENT_ORG_Nm }</td>
														<td style="text-align: center;">${de.tOP_AGENT_ORG_NO }</td>
														<td style="text-align: center;">${de.bRANCH_ORG_NM }</td>
														<td style="text-align: right;">
														<c:if test="${de.lastYearAmt!='0' }">${de.lastYearAmt.toString()}</c:if>
														<c:if test="${de.lastYearAmt=='0' }">0.00</c:if>
														<c:if test="${de.lastYearAmt==null }"> </c:if>
														</td>
														<td style="text-align: right;">
														<c:if test="${de.lastYearCount!='0' }">${de.lastYearCount.toString()}</c:if>
														<c:if test="${de.lastYearCount=='0' }"></c:if>
														<c:if test="${de.lastYearCount==null }"> </c:if>
														</td>
														<td style="text-align: right;">
														<c:if test="${de.recoveryAmt!='0' }">${de.recoveryAmt.toString()}</c:if>
														<c:if test="${de.recoveryAmt=='0' }">0.00</c:if>
														<c:if test="${de.recoveryAmt==null }"> </c:if>
														</td> 																												
														<td style="text-align: center;">
														<c:if test="${de.complianceType=='01' }">套用一般类</c:if>
														<c:if test="${de.complianceType=='02' }">套用民生类</c:if>
														<c:if test="${de.complianceType=='03' }">餐娱类套低扣</c:if>
														<c:if test="${de.complianceType=='04' }">餐娱类套封顶</c:if>
														<c:if test="${de.complianceType=='05' }">套用县乡非封顶</c:if>
														<c:if test="${de.complianceType=='06' }">套用县乡封顶</c:if>
														<c:if test="${de.complianceType=='07' }">商户名称违规</c:if>
														<c:if test="${de.complianceType=='08' }">签购单违规</c:if>
														<c:if test="${de.complianceType=='09' }">32域违规</c:if>
														<c:if test="${de.complianceType=='10' }">移机挪用</c:if>
														<c:if test="${de.complianceType=='11' }">虚假资料</c:if>
														</td> 
														<td style="text-align: center;">${de.dealTime}
														<c:if test="${de.dealTime == null}">待处理</c:if>
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
    <!-- inline scripts related to this page -->
    <script type="text/javascript">    
    function resetMecForm(){
      	 $(':input','#searchForm')  
      	 .not(':button, :submit, :reset, :hidden')  
      	 .val('')  
      	 .removeAttr('checked')  
      	 .removeAttr('selected'); 
   		 $("#month").val('');
   		 $("#month").trigger("chosen:updated");		
   		 $("#year").val('');
   		 $("#year").trigger("chosen:updated");	
   		 $("#complianceType").val('');
  		 $("#complianceType").trigger("chosen:updated");	
       }
    function importRecordView(){
    	document.getElementById("exp").disabled=true;
    	$.fancybox.open({
    		href : '<%=request.getContextPath() %>/MerchantComplianceManage/importView',
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 600,
	        height: 450,
	        autoSize: false,
	        closeClick: false,
	        afterClose:function(){
				   window.location.href='<%=request.getContextPath() %>/MerchantComplianceManage/toQueryMercComplianceList';   
			}
        });
    };
    
    
    function downRecordExl(){
    	document.getElementById("down").submit();
    }
    function dowmRecord(){ 
    	$("#searchForm").attr("action","<%=request.getContextPath()%>/MerchantComplianceManage/dowmRecord");
			document.getElementById("exp").disabled=true;
			document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","<%=request.getContextPath()%>/MerchantComplianceManage/toQueryMercComplianceList");
		document.getElementById("exp").disabled=false;
    	 
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
            	batchNumber: {
                     validators: {
                         regexp: {  
                        	 regexp: /^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~\,\_]{18}$/,
		                     message:'请输入有效的批次号！'
                         }
                     }
                 },
                 corg_merc_cd: {
                    validators: {
                        regexp: {  
                        	regexp: /\d{15}$/  ,
                        	message: '请输入有效的商户编号！'
                        }
                    }
                }
            }
        }); 
    })  
</script>
</body>
</html>











