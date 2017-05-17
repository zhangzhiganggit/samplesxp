<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>
    <%@include file="../../layout/common.css.jsp"%>
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
                                       		 手刷商户查询条件
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecIfHandPos/mecIfPosHandList" id="searchForm" method="post">
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                            	
                                            	<input type="hidden" id="prov" name="prov" value="${mecIf.mecProvCd}">
                                            	<input type="hidden" id="city" name="city" value="${mecIf.mecCityCd}">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mno"  name="mno" value="${mecIf.mno }"  onkeyup="javascript:this.value=this.value.replace(/\s/g,'');"  class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
													<div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经营名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="cprOperNmCn" name="cprOperNmCn" value="${mecIf.cprOperNmCn }" class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <input name="mecTyp" id="mecTyp" value="02" hidden="hidden">
													<div id="div_switch_tel" class="form-group form-group-sm width-300px" >
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left ">手机号:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="mercOprMbl" name="mercOprMbl"
																value="${mecIf.mercOprMbl }" class="form-control input-small width-200px "
																title="不能超过11个字符" data-placement="bottom" title="" data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
													<div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经营方式:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="mobileOperTyp" name="mobileOperTyp" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                              <option value="">全部</option>
                                                              <option value="LS0001" <c:if test="${mecIf.mobileOperTyp=='LS0001' }">selected</c:if>>零售</option>
                                                              <option value="TG0001" <c:if test="${mecIf.mobileOperTyp=='TG0001' }">selected</c:if>>团购</option>
                                                            </select>
                                                        </div>
                                                    </div>
													<div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >创建时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="creStartTm" id="creStartTm" value="${mecIf.creStartTm }" class="input-small form-control" onchange="changeDateStart()">
                                                                    <span class="input-group-addon">
                                                                         <i class="fa fa-exchange"></i>
                                                                    </span>
                                                                <input type="text" name="creEndTm" id="creEndTm" value="${mecIf.creEndTm }" class="input-small form-control" onchange="changeDateEnd()">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属地区:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="mecProvCd" name="mecProvCd" data-placeholder="请选择" onchange="fillCitySelect('mecProvCd','mecCityCd','${mecIf.mecCityCd}')"    class="col-sm-8 width-48 chosen-select width-45">
                                                            </select>
                                                            <select id="mecCityCd" name="mecCityCd" data-placeholder="请选择"  class="col-sm-6 width-48  chosen-select width-45  ">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div id="div_switch_tel" class="form-group form-group-sm width-300px" >
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left ">所属一代:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" id="topAgentOrgNm" name="topAgentOrgNm" 
																value="${mecIf.topAgentOrgNm }" class="form-control input-small width-200px "
																title="" data-placement="bottom" title="" data-rel="tooltip" data-original-title="">
														</div>
													</div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="mecSts" name="mecSts" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                                 <option value="">全部</option>
                                                                <option value="01" <c:if test="${mecIf.mecSts=='01' }">selected</c:if>>正常</option>
                                                                <option value="02" <c:if test="${mecIf.mecSts=='02' }">selected</c:if>>销户</option>
                                                                <option value="03" <c:if test="${mecIf.mecSts=='03' }">selected</c:if>>冻结</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >用户等级:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="mecLevel" name="mecLevel" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
                                                                <option value="1" <c:if test="${mecIf.mecLevel=='1' }">selected</c:if>>1级</option>
                                                                <option value="2" <c:if test="${mecIf.mecLevel=='2' }">selected</c:if>>2级</option>
                                                                <option value="3" <c:if test="${mecIf.mecLevel=='3' }">selected</c:if>>3级</option>
                                                                <option value="4" <c:if test="${mecIf.mecLevel=='4' }">selected</c:if>>4级</option>
                                                                <option value="5" <c:if test="${mecIf.mecLevel=='5' }">selected</c:if>>5级</option>
                                                                <option value="6" <c:if test="${mecIf.mecLevel=='6' }">selected</c:if>>6级</option>
                                                                <option value="7" <c:if test="${mecIf.mecLevel=='7' }">selected</c:if>>7级</option>
                                                                <option value="8" <c:if test="${mecIf.mecLevel=='8' }">selected</c:if>>8级</option>
                                                                <option value="9" <c:if test="${mecIf.mecLevel=='9' }">selected</c:if>>9级</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                               <button class="btn btn-normal btn-sm" type="submit">
                                                   <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                                                                                                                                                         检索
                                                </button>
                                                 <%@include file="../../common/resetForm.jsp"%>
                                                 <c:if test="${loginEmployee.orgUuid == '0010000000' }">
	                                                 <button class="btn btn-danger btn-sm" type="button" onclick="importAndDownload()">
	                                                    <span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
	                                                    商户转移
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
                                        	 手刷商户查询结果
                                    </h5>
                                </div>
                                  <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
												<th style="text-align: center;width: 8%">商户编号</th>
                                                <th style="text-align: center;width: 6%">经营名称</th>
                                                <th style="text-align: center;width: 7%">手机号</th>
                                                <th style="text-align: center;width: 5%">经营方式</th>
                                                <th style="text-align: center;width: 6%">实名认证状态</th> 
                                                <th style="text-align: center;width: 6%">所属地区</th> 
                                                <th style="text-align: center;width: 5%">刷卡费率</th>
                                                <th style="text-align: center;width: 5%">扫码费率</th>  
                                                <th style="text-align: center;width: 7%">创建时间</th>
                                                
                                                <th style="text-align: center;width: 9%">归属一代</th>
                                                <th style="text-align: center;width: 9%">直属机构</th>
                                                <th style="text-align: center;width: 9%">归属分公司</th>
                                                
                                                <th style="text-align: center;width: 5%">状态</th>
                                                <th style="text-align: center;width: 4%">用户等级</th>
                                                <th style="text-align: center;width: 12%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                           		<c:forEach items="${mecIfList}" var="de"  varStatus="status">
													<tr>
														<td style="text-align: center;">${de.mno }</td>
														<td style="text-align: left;">${de.cprOperNmCn }</td>
														<td style="text-align: center;" class="hiddenMainInfo">${de.mercOprMbl }</td>
														<td style="text-align: center;">
															<c:if test="${de.mobileOperTyp =='LS0001' }">零售</c:if>
															<c:if test="${de.mobileOperTyp =='TG0001' }">团购</c:if>
														</td>
														<td style="text-align: center;">
															<c:if test="${de.mecSsAuthSts =='00' }">未认证</c:if>
															<c:if test="${de.mecSsAuthSts =='03' }">未审核</c:if>
															<c:if test="${de.mecSsAuthSts =='02' }">审核驳回</c:if>
															<c:if test="${de.mecSsAuthSts =='01' }">审核通过</c:if>
														</td>
														<td style="text-align: left;">${de.areaNm }</td>
														<td style="text-align: right;">${de.rat1 }%</td>
														<td style="text-align: right;">
														<c:choose>
														<c:when test="${de.qrcodeRat ==null }"> </c:when>
														<c:otherwise>${de.qrcodeRat }%</c:otherwise>
														</c:choose></td>
														<td style="text-align: center;">${de.dtCte }</td>
														
														<td style="text-align: center;">${de.firstOrgNm }</td>
														<td style="text-align: center;">${de.orgNm }</td>
														<td style="text-align: center;">${de.branchNm }</td>
														
														<td style="text-align: center;">${de.mercStss }</td>
														<td style="text-align: center;">
															<c:if test="${de.mecLevel=='1' }">1级</c:if>
															<c:if test="${de.mecLevel=='2' }">2级</c:if>
															<c:if test="${de.mecLevel=='3' }">3级</c:if>
															<c:if test="${de.mecLevel=='4' }">4级</c:if>
															<c:if test="${de.mecLevel=='5' }">5级</c:if>
															<c:if test="${de.mecLevel=='6' }">6级</c:if>
															<c:if test="${de.mecLevel=='7' }">7级</c:if>
															<c:if test="${de.mecLevel=='8' }">8级</c:if>
															<c:if test="${de.mecLevel=='9' }">9级</c:if>
														</td>
														<td   style="text-align: center;">
										                     <div class="   action-buttons">
										                         <a href="#" onclick="mecIfdetailShow('${de.inMno}')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看详情</font></i>
										                         </a>
										                         <a href="#" onclick="mecIfchangRecord('${de.inMno}')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">变更记录</font></i>
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
								<%@include file="../../layout/pagination.jsp" %>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../../layout/common.alljs.jsp"%>
    <script type="text/javascript">
       var proValue = $("#prov").val();
       fillProvSelect('mecProvCd',proValue);
       var cityValue = $("#city").val();
       fillCitySelect('mecProvCd','mecCityCd',cityValue);
     
       function updateQuick(mno){
    	   $("#searchForm").attr("action","<%=request.getContextPath()%>/mercInfoQuickUp/mercInfoUpdateQuickIndex.do?mercId="+mno);
   			document.getElementById("searchForm").submit();
   		   $("#searchForm").attr("action","<%=request.getContextPath()%>/mecIf/list.do");
       }
       
       function updateLog(mno){
    	   $("#searchForm").attr("action","<%=request.getContextPath()%>/mercInfoQuickUp/mercInfoUpdateQuickLog.do?mercId="+mno);
  			document.getElementById("searchForm").submit();
  		   $("#searchForm").attr("action","<%=request.getContextPath()%>/mecIf/list.do");
       }
       
       function importAndDownload(){
           $.fancybox.open({
           href : '<%=request.getContextPath() %>/mecIfHandPos/importAndDownload',
           type: 'iframe',
           padding: 5,
           scrolling: 'no',
           fitToView: true,
           width: 900,
           height: 800,
           autoSize: false,
           closeClick: false,
           afterClose:function(){
           }
       });
   }
    
      function mecIfdetailShow(id){
    	  	  $.fancybox.open({
			  href : '<%=request.getContextPath() %>/mecIfHandPos/detail?mno='+id,
			  type: 'iframe',
	          padding: 5,
	          scrolling: 'no',
	          fitToView: true,
	          width: 900,
	          height: 800,
	          autoSize: false,
	          closeClick: false,
			  afterClose:function(){
			  }
		  });
      }
    
      function mecIfchangRecord(id){
	  	  $.fancybox.open({
		  href : '<%=request.getContextPath() %>/mecIfHandPos/changRecord?mno='+id,
		  type: 'iframe',
          padding: 5,
          scrolling: 'no',
          fitToView: true,
          width: 900,
          height: 800,
          autoSize: false,
          closeClick: false,
		  afterClose:function(){
		  }
	  });
  }
      
      jQuery(function($) {
        	$('.chosen-select').chosen({});
        	
        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        }).next().on(ace.click_event, function(){
            $(this).prev().focus();
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
    
     function myResetForm(){
	    $("#mecSts").val('');
 		$("#mecSts").trigger("chosen:updated");
 		$("#mecLevel").val('');
     	$("#mecLevel").trigger("chosen:updated");
 		$("#mecProvCd").val('');
		$("#mecProvCd").trigger("chosen:updated");
		$("#mecCityCd").val('');
 		$("#mecCityCd").trigger("chosen:updated");
		$("#mecTyp").val('02').trigger("chosen:updated").trigger("onchange");
		$("#orgNo").val('').trigger("chosen:updated").trigger("onchange");
		$("#mobileOperTyp").val('').trigger("chosen:updated").trigger("onchange");
		$("#mercOprMbl").val('').trigger("chosen:updated").trigger("onchange");
		$("#searchForm").data('formValidation').revalidateField('mercOprMbl');
     }
     
     function changeDateStart(){
		 var creStartTm=Number($("#creStartTm").val().replace(/-/g,''));
		 var creEndTm=Number($("#creEndTm").val().replace(/-/g,''));
		 if(creEndTm!=0){
			 if(creStartTm>creEndTm){
				 $("#creEndTm").val($("#creStartTm").val());
			 }
		 }
	 }
	 function changeDateEnd(){
		 var creStartTm=Number($("#creStartTm").val().replace(/-/g,''));
		 var creEndTm=Number($("#creEndTm").val().replace(/-/g,''));
		 if(creStartTm!=0){
			 if(creStartTm>creEndTm){
				 $("#creStartTm").val($("#creEndTm").val());
			 }
		 }
	 }
     
     jQuery(function($){
		 
		 $('#searchForm').formValidation({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	
				mercOprMbl : {
					validators : {
						
						regexp: {
	                        regexp: /^1\d{10}$/g,
	                        message:'请输入正确的手机号'
	                    }

					}
				}
            }
        });
	 })
</script>
</body>
</html>











