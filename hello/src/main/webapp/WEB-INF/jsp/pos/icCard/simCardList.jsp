<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../../layout/common.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/common/common.js"></script>
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
                                        SIM卡查询条件
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/SimCard/list" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" id="showBranch" name="showBranch" value="${showBranch }">
												<input type="hidden" id="isFirstLoad" name="isFirstLoad" value="false" />
												<input type="hidden" name="begin" id="begin" value="${begin }">
												<input type="hidden" name="end" id="end" value="${end}" >
                                                <div class=" col-xs-12"> 
                                                <c:if test="${showBranch=='show' }">                                                     
                                                  <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属分公司:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="branchNo" name="branchNo" onchange="fillOrgSelect('branchNo','topAgentOrgNo','${simCard.topAgentOrgNo}')"  data-placeholder="请选择"  
                                                         	       class="chosen-select form-control width-200px">
                                                                <option value="">请选择</option>
                                                                <c:forEach items="${orgListB }" var="org" >
                                                                	<option code="${org.orgUuid}" value="${org.orgUuid }"
                                                                		<c:if test="${simCard.branchNo == org.orgUuid }"> selected </c:if>
                                                                	>${org.orgNm }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    <c:if test="${showBranch=='noShow' }">                                                     
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属分公司:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="branchNo" id="branchNo" value="${branchNm}" class="form-control input-small width-200px" data-placement="bottom" title="" readonly="readonly"  data-rel="tooltip" data-original-title="Hello Tooltip!" >
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    <c:if test="${showBranch=='show' }">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属一代:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="topAgentOrgNo" name="topAgentOrgNo" data-placeholder="请选择"  
                                                         	      class="chosen-select form-control width-200px">
                                                              <option value="">请选择</option>  
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" id="hiddenOrg" value="${simCard.topAgentOrgNo}">
                                                    </c:if>
                                                    <c:if test="${showBranch=='noShow' }">
                                                      <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属一代:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="topAgentOrgNo" name="topAgentOrgNo"   data-placeholder="请选择"  
                                                         	       class="chosen-select form-control width-200px">
                                                                <option value="">请选择</option>
                                                                <c:forEach items="${orgList }" var="org" >
                                                                	<option value="${org.orgUuid }"
                                                                		<c:if test="${simCard.topAgentOrgNo == org.orgUuid }"> selected </c:if>
                                                                	>${org.orgNm }</option>
                                                                </c:forEach>
                                                             </select>
                                                         </div>
                                                      </div>
                                                      <input type="hidden" id="hiddenOrg" value="${simCard.topAgentOrgNo}">
                                                     </c:if>
                                                      <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >运营商:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="factId" name="factId"   class="chosen-select form-control width-200px">
                                                                <option value="">请选择</option>
                                                                <option value="005" <c:if test="${simCard.factId == '005'}">selected="selected"</c:if>>中国移动</option>
                                                                <option value="007" <c:if test="${simCard.factId == '007'}">selected="selected"</c:if>>中国电信</option>
                                                                <option value="006" <c:if test="${simCard.factId == '006'}">selected="selected"</c:if>>中国联通</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >卡状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="status" name="status"   class="chosen-select form-control width-200px">
                                                                <option value=0>请选择</option>
                                                                <option value=10 <c:if test="${simCard.status == 10}">selected="selected"</c:if>>正常</option>
                                                                <option value=11 <c:if test="${simCard.status == 11}">selected="selected"</c:if>>暂停</option>
                                                                <option value=12 <c:if test="${simCard.status == 12}">selected="selected"</c:if>>注销</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                   
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >充值状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="payStatus" name="payStatus"   class="chosen-select form-control width-200px">
                                                                <option value="">请选择</option>
                                                                <option value=10 <c:if test="${simCard.payStatus == 10}">selected="selected"</c:if>>未充值</option>
                                                                <option value=11 <c:if test="${simCard.payStatus == 11}">selected="selected"</c:if>>已充值</option>
                                                                <option value=12 <c:if test="${simCard.payStatus == 12}">selected="selected"</c:if>>已续费</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >卡号/IMSI号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="factSn" id="factSn" value="${simCard.factSn }" class="form-control input-small width-200px"  >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">有效日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="useDateStart" id="useDateStart" value="${simCard.useDateStart }" class="input-small form-control" readonly>
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" name="useDateEnd" id="useDateEnd" value="${simCard.useDateEnd }" class="input-small form-control" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">激活日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="actDateStart" id="actDateStart" value="${simCard.actDateStart }" class="input-small form-control" readonly>
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" name="actDateEnd" id="actDateEnd" value="${simCard.actDateEnd }" class="input-small form-control" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">入库日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="storageDateStart" id="storageDateStart" value="${simCard.storageDateStart }" class="input-small form-control" readonly>
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" name="storageDateEnd" id="storageDateEnd" value="${simCard.storageDateEnd }" class="input-small form-control" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否绑定商户:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="isBindMec" name="isBindMec"   class="chosen-select form-control width-200px">
                                                                <option value="">请选择</option>
                                                                <option value=10 <c:if test="${simCard.isBindMec == 10}">selected="selected"</c:if>>是</option>
                                                                <option value=11 <c:if test="${simCard.isBindMec == 11}">selected="selected"</c:if>>否</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit" onclick="return checkForm();" id="searchMobBtn">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button" onclick="resetSearchForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
				  清空检索条件
												</button>
										 <c:if test="${showBranch=='show' }">
                                                <button class="btn btn-primary btn-sm" type="button" onclick="uploadExcel()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                    导出检索结果
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button"  onclick="batchUpExcel()">
                                                    <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                                                                                                   批量入库
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button"  onclick="batchModifyExcel()">
                                                    <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                                                                                                   批量修改
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
                                        SIM卡查询结果
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width: 8%">卡号</th>
                                                <th style="text-align:center;width: 8%">IMSI号</th>
                                                <th style="text-align:center;width: 8%">归属分公司</th>
                                                <th style="text-align:center;width: 8%">归属一代</th>
                                                <th style="text-align:center;width: 8%">运营商</th>
                                                <th style="text-align:center;width: 5%">卡状态</th>
                                                <th style="text-align:center;width: 6%">充值状态</th>
                                                <th style="text-align:center;width: 7%">有效期</th>
                                                <th style="text-align:center;width: 7%">激活日期</th>
                                                <th style="text-align:center;width: 7%">入库日期</th>
                                                <th style="text-align:center;width: 5%">商户编号</th>
                                                <th style="text-align:center;width: 5%">商户名称</th>
                                                <th style="text-align:center;width: 5%">POS序列号</th>
                                                <th style="text-align:center;width: 5%">终端号</th>
                                                <th style="text-align:center;width: 15%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach items="${simCardList}" var="simCard" varStatus="status">
													<tr>
													    <td style="text-align:center">${simCard.factSn}</td>
													    <td style="text-align:center">${simCard.imsi}</td>
														<td style="text-align:center">${simCard.branchNm}</td>
													<c:if test="${simCard.topAgentOrgNo=='0010000000' }">
														<td style="text-align:left"></td>
													</c:if>
													<c:if test="${simCard.topAgentOrgNo!='0010000000' }">
														<td style="text-align:left">${simCard.topAgentOrgNm}</td>
													</c:if>
														<td style="text-align:center">
														    <c:if test="${simCard.factId == 005 }" >中国移动</c:if>
									                        <c:if test="${simCard.factId == 006 }" >中国联通</c:if>
									                        <c:if test="${simCard.factId == 007 }" >中国电信</c:if>
														</td>
														<td style="text-align:center" >
															<c:if test="${simCard.status == 10 }" >正常</c:if>
									                        <c:if test="${simCard.status == 11 }" >暂停</c:if>
									                        <c:if test="${simCard.status == 12 }" >注销</c:if>
														</td>
														<td style="text-align:center" >
															<c:if test="${simCard.payStatus == 10 }" >未充值</c:if>
									                        <c:if test="${simCard.payStatus == 11 }" >已充值</c:if>
									                        <c:if test="${simCard.payStatus == 12 }" >已续费</c:if>
														</td>
														<td style="text-align:center">${simCard.useDate}</td>
														<td style="text-align:center">${simCard.actDate}</td>
														<td style="text-align:center">${simCard.storageDate}</td>
														<td style="text-align:center">${simCard.mno}</td>
														<td style="text-align:center">${simCard.cprNm}</td>
														<td style="text-align:center">${simCard.posFactSn}</td>
														<td style="text-align:center">${simCard.posNum}</td>
														<td>
															<a href="javaScript:openIframe('${simCard.factSn}','${simCard.factId}','${simCard.imsi}','1')" class="blue">详情</a>
															<c:if test="${showBranch=='show' }">
															<a href="javaScript:openIframe('${simCard.factSn}','${simCard.factId}','${simCard.imsi}','2')" class="blue">修改</a>
															<a href="javaScript:openIframe('${simCard.factSn}','${simCard.factId}','${simCard.imsi}','3')" class="blue">操作记录</a>
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

        $('#searchForm').bootstrapValidator({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                firstName: {
                    validators: {
                        notEmpty: {},
                        stringCase: {
                            'case': 'upper'
                        }
                    }
                }
            }
        });
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});

    })
       var topAgentOrgNo = $("#hiddenOrg").val();
       var showBranch = $("#showBranch").val();
       if(showBranch=='show'){
    	   fillOrgSelect('branchNo','topAgentOrgNo',topAgentOrgNo);
       }
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
        
    function openIframe(factSn,factId,imsi,flag){
    	var href = '';
    	if(1 == flag){
    		href = '<%=request.getContextPath() %>/SimCard/detail?factSn='+factSn+'&factId='+factId+'&imsi='+imsi;
    	}else if(2 == flag){
    		href = '<%=request.getContextPath() %>/SimCard/edit?factSn='+factSn+'&factId='+factId+'&imsi='+imsi;
    	}else if(3 == flag){
    		href = '<%=request.getContextPath() %>/SimCard/history?factSn='+factSn+'&factId='+factId;
    	}
    	$.fancybox.open({
			href : href,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: 900,
            height: 500,
	        autoSize: false,
            helpers:{
            	overlay:{
            		closeClick:false
            	}
            },
			afterClose:function(){
				if(1 != flag){
					reloadParent();
				}
			}
		});
    }
    function uploadExcel(){
		$("#searchForm").attr("action","<%=request.getContextPath()%>/SimCard/uploadExcel");
		document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","<%=request.getContextPath() %>/SimCard/list");
	}
    function fillOrgSelect(branchNo,topAgentOrgNo,orgValue,isContainsEmptyOption){
       	var branchNo = $("[name='"+branchNo+"']").val();
       	if(branchNo!=''){
       		$.ajax({
       	        url: '/SimCard/getOrgByBranchNo',
       	        data : {
       	        	branchNo : branchNo
       	        },
       	        async:false,
       	        cache: true,
       	        success : function(orgList) {
       	       	 	if(orgList != null && orgList !=undefined){
       		       	 	var options = '';
       		       	 	if(isContainsEmptyOption || isContainsEmptyOption == undefined || isContainsEmptyOption == null)
       	       	 			options = "<option value=''>请选择</option>";
       		             for(var i=0;i<orgList.length;i++){
       		            	 if(orgValue != ''){
       		            		 if(orgList[i].orgUuid == orgValue){
       		            			 options+="<option selected='selected' value=\""+orgList[i].orgUuid+"\">"+orgList[i].orgNm+"</option>";
       		            		 }else{
       		            			 options+="<option value=\""+orgList[i].orgUuid+"\">"+orgList[i].orgNm+"</option>";
       		            		 }
       		            	 }else{
       		            		 options+="<option value=\""+orgList[i].orgUuid+"\">"+orgList[i].orgNm+"</option>";
       		            	 }
       		             }
       		             $("[name='"+topAgentOrgNo+"']").html(options);
       		             $("[name='"+topAgentOrgNo+"']").trigger("chosen:updated");
       	       	 	}
       	        }
       		});
       	}else{
       		$("[name='"+topAgentOrgNo+"']").html("<option value=''>请选择</option>");
       		$("[name='"+topAgentOrgNo+"']").trigger("chosen:updated");
       	}
       }
    function resetSearchForm(){
    	var begin=$("#begin").val();
		var end=$("#end").val();
    	<c:if test="${showBranch=='show' }">
      	 $("#branchNo").val('');
      	 $("#branchNo").trigger("chosen:updated");      	
      	 $("#topAgentOrgNo").chosen("destroy"); 
   	     $("#topAgentOrgNo").html('<option value="">请选择</option>');
   	     $("#topAgentOrgNo").chosen({});
	     $("#topAgentOrgNo").trigger("chosen:updated");
   	     </c:if>
   	    <c:if test="${showBranch=='noShow' }">
	   	 $("#topAgentOrgNo").val('');
	  	 $("#topAgentOrgNo").trigger("chosen:updated");
   	    </c:if>
      	 $("#factSn").val('');
      	 $("#factSn").trigger("chosen:updated");
      	 $("#status").val('');
     	 $("#status").trigger("chosen:updated");
      	 $("#factId").val('');
      	 $("#factId").trigger("chosen:updated");
    	 $("#payStatus").val('');
     	 $("#payStatus").trigger("chosen:updated");
     	 $("#isBindMec").val('');
     	 $("#isBindMec").trigger("chosen:updated");

     	 $("#storageDateStart").val(begin);
    	 $("#storageDateStart").trigger("chosen:updated");
    	 $("#storageDateEnd").val(end);
    	 $("#storageDateEnd").trigger("chosen:updated");
   	     $("#actDateStart").val('');
    	 $("#actDateStart").trigger("chosen:updated");
    	 $("#actDateEnd").val('');
    	 $("#actDateEnd").trigger("chosen:updated");
    	 $("#useDateStart").val('');
	   	 $("#useDateStart").trigger("chosen:updated");
	   	 $("#useDateEnd").val('');
	   	 $("#useDateEnd").trigger("chosen:updated");

      }
    function batchUpExcel(){
 	   $.fancybox.open({
			href : '<%=request.getContextPath() %>/SimCard/batchUpExcel',
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            fitToView: true,
            width: 1100,
            height: 600,
            autoSize: true,
            closeClick: false,
			afterClose:function(){
			}
		});
    }
    function batchModifyExcel(){
  	   $.fancybox.open({
 			href : '<%=request.getContextPath() %>/SimCard/batchModifyExcel',
 			type: 'iframe',
             padding: 5,
             scrolling: 'no',
             fitToView: true,
             width: 1100,
             height: 600,
             autoSize: true,
             closeClick: false,
 			afterClose:function(){
 			}
 		});
     }
    //提交前校验
    function checkForm(){
    	var startTime=$("#actDateStart").val();  
        var start=new Date(startTime.replace("-", "/").replace("-", "/"));  
        var endTime=$("#actDateEnd").val(); 
        var end=new Date(endTime.replace("-", "/").replace("-", "/")); 
        if(end<start){
        	alert("激活日期起始时间不能大于结束时间!");
        	return false;
        }else{
          	 $("#searchMobBtn").removeAttr("disabled");
            }  
        var startTimeu=$("#useDateStart").val();  
        var startu=new Date(startTimeu.replace("-", "/").replace("-", "/"));  
        var endTimeu=$("#useDateEnd").val();    
        var endu=new Date(endTimeu.replace("-", "/").replace("-", "/"));  
        if(endu<startu){
        	alert("卡有效期起始时间不能大于结束时间!");
        	return false;
        }else{
          	 $("#searchMobBtn").removeAttr("disabled");
            }
        var startTimes=$("#storageDateStart").val();  
        var starts=new Date(startTimes.replace("-", "/").replace("-", "/"));  
        var endTimes=$("#storageDateEnd").val();    
        var ends=new Date(endTimes.replace("-", "/").replace("-", "/")); 
        if(ends<starts){
        	alert("入库日期起始时间不能大于结束时间!");
        	return false;
        }else{
          	 $("#searchMobBtn").removeAttr("disabled");
            }
   		 return true;
    }
</script>
</body>
</html>