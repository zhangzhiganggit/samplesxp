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
                                   		    二代手刷实名认证信息查询
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/mobMercAuthAdmin/realNamCheckList" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mno" id="mno" value="${mobMercAuth.mno }" class="form-control input-small width-200px"  onkeyup="this.value=this.value.replace(/[^+\d]/g,'')">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >手机号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        	<input type="text" maxlength="20" name="telNO"
																value="${mobMercAuth.telNO }" id="telNO"
																onkeyup="this.value=this.value.replace(/\D/g,'')"
																class="form-control input-small width-200px "
																data-placement="bottom" title="只能填数字">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >审核状态:</label>
                                                    <div class="col-sm-8  no-padding"  >                                          
                                                            <select data-placeholder="请选择" id="authStatus" name="authStatus"   class="chosen-select form-control width-200px" >
                                                                <option value="" >请选择</option>
                                                                <option value="00" <c:if test="${mobMercAuth.authStatus == '00'}">selected="selected"</c:if>>未审核</option>
                                                                <option value="01" <c:if test="${mobMercAuth.authStatus == '01'}">selected="selected"</c:if>>审核通过</option>
                                                                <option value="02" <c:if test="${mobMercAuth.authStatus == '02'}">selected="selected"</c:if>>审核驳回</option>
                                                            </select>

                                                        </div>
													</div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="startCreateDte" name="startCreateDte" value="${mobMercAuth.startCreateDte }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="endCreateDte" name="endCreateDte" value="${mobMercAuth.endCreateDte }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">申请认证时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="startApplyDte" name="startApplyDte" value="${mobMercAuth.startApplyDte }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="endApplyDte" name="endApplyDte" value="${mobMercAuth.endApplyDte }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">审核时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="startAuditTime" name="startAuditTime" value="${mobMercAuth.startAuditTime }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="endAuditTime" name="endAuditTime" value="${mobMercAuth.endAuditTime }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>  
                                                    <div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户来源:</label>
                                                    <div class="col-sm-8  no-padding"  >                                          
                                                            <select data-placeholder="请选择" id="mobileSource" name="mobileSource" onchange="showMecType();"  class="chosen-select form-control width-200px" >
                                                                <option value="" >请选择</option>
                                                                <option value="01" <c:if test="${mobMercAuth.mobileSource == '01'}">selected="selected"</c:if>>手刷商户</option>
                                                                <option value="02" <c:if test="${mobMercAuth.mobileSource == '02'}">selected="selected"</c:if>>mPos商户</option>
                                                            </select>
                                                        </div>
													</div>
													
													<div id="protocolFlag1" class="form-group form-group-sm width-300px" hidden="hidden">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户类型:</label>
                                                    <div class="col-sm-8  no-padding"  >                                          
                                                            <select data-placeholder="请选择" id="protocolFlag" name="protocolFlag"   class="chosen-select form-control width-200px" >
                                                                <option value="" >请选择</option>
                                                                <option value="02" <c:if test="${mobMercAuth.protocolFlag == '02'}">selected="selected"</c:if>>两方</option>
                                                                <option value="03" <c:if test="${mobMercAuth.protocolFlag == '03'}">selected="selected"</c:if>>三方</option>
                                                            </select>
                                                        </div>
													</div>
													
													  
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                                                                                                                检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa  fa-search-minus bigger-110"></span>
                                                    清空检索条件
                                                </button>
                                                <c:if test="${loginUserPermission.SMSA_QUERY_026!=null}">
                                                <button class="btn btn-primary btn-sm" type="button" onclick='exportDown()'>
                                                	<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                                导出检索结果
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
                                                <th style="text-align:center;width: 10%">商户编号</th>
                                                <th style="text-align:center;width: 10%">商户来源</th>  
                                                <th style="text-align:center;width: 10%">商户类型</th>  
                                                <th style="text-align:center;width: 10%">手机号</th>
                                                <th style="text-align:center;width: 10%">注册时间</th>
                                                <th style="text-align:center;width: 10%">申请认证时间</th>
                                                <th style="text-align:center;width: 10%">审核人</th>
                                                <th style="text-align:center;width: 10%">审核状态</th>
                                                <th style="text-align:center;width: 10%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            
                                            <c:forEach items="${mobMercAuthList}" var="mobMercAuth" varStatus="status">
                                            	<tr>
                                            	<td style="text-align:center">${mobMercAuth.mno }</td>
												<td style="text-align:center" >
													<c:if test="${mobMercAuth.mobileSource=='01'}" >手刷商户</c:if>
							                        <c:if test="${mobMercAuth.mobileSource=='02'}" >mPos商户</c:if>
												</td>
												<c:if test="${mobMercAuth.mobileSource == '02'}">
												<td style="text-align:center" >
                                                    <c:if test="${mobMercAuth.protocolFlag=='02'}" >两方</c:if>
							                        <c:if test="${mobMercAuth.protocolFlag=='03'}" >三方</c:if> 
                                                 </td>                  
                                                </c:if>
                                                <c:if test="${mobMercAuth.mobileSource ne '02'}">
												<td style="text-align:center" > </td>                  
                                                </c:if>    
                                            	<td style="text-align:center" class="hiddenMainInfo">${mobMercAuth.telNO }</td>
                                            	<td style="text-align:center" ><fmt:parseDate value="${mobMercAuth.creteDte}" var="creteDte" pattern="yyyyMMddHHmmss"/><fmt:formatDate value="${creteDte}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                            	<td style="text-align:center" ><fmt:parseDate value="${mobMercAuth.applyAuthDte }" var="applyAuthDte" pattern="yyyyMMddHHmmss"/><fmt:formatDate value="${applyAuthDte}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                            	<td style="text-align:center" >${mobMercAuth.authUsrNm}</td>
                                            	<td style="text-align:center" >
													<c:if test="${mobMercAuth.authStatus=='00'}" >未审核</c:if>
							                        <c:if test="${mobMercAuth.authStatus=='01'}" >审核通过</c:if>
							                        <c:if test="${mobMercAuth.authStatus=='02'}" >审核驳回</c:if>
												</td>
                                            	<td style="text-align:center" >
                                            		<a href="javaScript:openIframe('${mobMercAuth.mno}','1','${mobMercAuth.uuid}')" class="blue">
                                            		<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看详情</font></i>
                                            		</a>
                                            		<c:if test="${loginUserPermission.SMSA_MOB_003!=null }">
                                            		<c:if test="${mobMercAuth.authStatus=='00'}">
                                            			<a href="javaScript:openIframe('${mobMercAuth.mno}','2','${mobMercAuth.uuid}')" class="blue">
                                            			<i class="ace-icon fa fa-edit  blue bigger-130"><font size="2">审核</font></i>
                                            			</a>
                                            		</c:if>
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
    
     function showMecType(){
    	var mobileSource=$("#mobileSource").val();
    	if(mobileSource=='02'){
    		$("#protocolFlag1").show();
    	}else{
    		$("#protocolFlag1").hide();
    	}
    }
     
    
    function exportDown(){
    	var mno=$("#mno").val();
    	var telNO=$("#telNO").val();
    	var authStatus=$("#authStatus").val();
    	var startCreateDte=$("#startCreateDte").val();
    	var endCreateDte=$("#endCreateDte").val();
    	var startApplyDte=$("#startApplyDte").val();
    	var endApplyDte=$("#endApplyDte").val();
    	
    	var startAuditTime=$("#startAuditTime").val();
    	var endAuditTime=$("#endAuditTime").val();
    	var apply=false;
    	
    	
    	if(startApplyDte=="" || endApplyDte=="" ){
    		//alert("请选择要导出的申请认证时间范围");	
    	}else{
    		apply=true;
    	}
    	if((startAuditTime=="" || endAuditTime=="") && !apply ){
    		alert("请选择要导出的申请认证时间范围或审核时间范围");
    		return;
    	}
    	if(DateDiff(startApplyDte, endApplyDte)>30){
    		alert("导出认证时间范围不能超过31天");	
    		return;
    	}
    	if(DateDiff(startAuditTime, endAuditTime)>30){
    		alert("导出审核时间范围不能超过31天");	
    		return;
    	}
    	location.href='<%=request.getContextPath()%>/mobMercAuthAdmin/exportDown.do?'
    	+'mno='+mno
    	+'&telNO='+telNO
    	+'&authStatus='+authStatus
    	+'&startCreateDte='+startCreateDte
    	+'&endCreateDte='+endCreateDte
    	+'&startApplyDte='+startApplyDte
    	+'&endApplyDte='+endApplyDte
    	+'&startAuditTime='+startAuditTime
    	+'&endAuditTime='+endAuditTime;
    }
    
	  //计算两个日期天数差
	function DateDiff(sDate1, sDate2) {  //sDate1和sDate2是yyyy-MM-dd格式
		var aDate, oDate1, oDate2, iDays;
		aDate = sDate1.split("-");
		oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);  //转换为yyyy-MM-dd格式
		aDate = sDate2.split("-");
		oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
		iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24); //把相差的毫秒数转换为天数
		
		return iDays;  //返回相差天数
	}
    
    
    function resetMecForm(){
   	 $(':input','#searchForm')  
   	 .not(':button, :submit, :reset, :hidden')  
   	 .val('')  
   	 .removeAttr('checked')  
   	 .removeAttr('selected'); 
   	 $("#authStatus").val('');
	 $("#authStatus").trigger("chosen:updated");
	 $("#mobileSource").val('');
	 $("#mobileSource").trigger("chosen:updated");
	 $("#protocolFlag").val('');
	 $("#protocolFlag").trigger("chosen:updated");
	 $("#protocolFlag1").hide();
    }

        $('.chosen-select').chosen({});
        jQuery(function($) {

       



        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        }).next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
         $("#protocolFlag1").hide();
        var mobileSource=$("#mobileSource").val();
     	if(mobileSource=='02'){
     		$("#protocolFlag1").show();
     	}else{
     		$("#protocolFlag1").hide();
     	}
 
    })
    
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
        
    function openIframe(mno,flag,uuid){
    	var href = '';
    	href = '<%=request.getContextPath() %>/mobMercAuthAdmin/queryrealNamChecDetail?mno='+mno+'&flag='+flag+'&uuid='+uuid;
    	$.fancybox.open({
			href : href,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: $(window).width() * 0.95,
            centerOnScroll:true,
            autoSize: true,
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
</script>
</body>
</html>
