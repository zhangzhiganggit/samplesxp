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
                                       		 商户电子协议查询条件
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecIf/findAgreement.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                            	<input type="hidden" name="starterAttrOrgNo" value="${starterAttrOrgNo}"/>
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mercId"  name="mercId" value="${mecIf.mercId }"  onkeyup="javascript:this.value=this.value.replace(/\s/g,'');"  class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                  
                                                     <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >协议编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="agreementNo"  name="agreementNo" value="${mecIf.agreementNo }"  onkeyup="javascript:this.value=this.value.replace(/\s/g,'');"  class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orderNo" id="orderNo" value="${mecIf.orderNo }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <c:if test="${pbCheck==false }">
                                                    <div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="branchOrgNo" name="branchOrgNo" 
																	class="chosen-select form-control width-200px">
																	<option value="">请选择</option>
																	<c:forEach items="${orgAllList }" var="orgs">
																		<option value="${orgs.orgUuid }"
																			<c:if test="${orgs.orgUuid == mecIf.branchOrgNo }"> selected </c:if>>${orgs.orgNm}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>
													</c:if>
<!--                                                       <div class="form-group form-group-sm width-300px "> -->
<!--                                                         <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属一代:</label> -->
<!-- 														<div class="col-sm-8  no-padding"> -->
<!-- 															<input type="text" id="orgNm" name="orgNm"  -->
<%-- 																value="${mecIf.orgNm }" class="form-control input-small width-200px " --%>
<!-- 																title="" data-placement="bottom" title="" data-rel="tooltip" data-original-title=""> -->
<!-- 														</div> -->
<!--                                                     </div>  -->
                                                    <c:if test="${pbCheck ==false }">
                                                      <div class="form-group form-group-sm width-300px">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属一代:</label>

														<div class="col-sm-8  no-padding">
															<div class="col-sm-8  no-padding">
																<select id="orgNo" name="orgNo" 
																	class="chosen-select form-control width-200px">
																	<option value="">请选择</option>
																	<c:forEach items="${orgLeverNo }" var="orgs">
																		<option value="${orgs.orgUuid }"
																			<c:if test="${orgs.orgUuid == mecIf.orgNo }"> selected </c:if>>${orgs.orgNm}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div> 
                                                    </c:if>
                                                    
                                                    
							
                                                    
                                                      <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户类型:</label>
                                                        <div class="col-sm-8  no-padding width-200px">
                                                        	<div class="width-48 inline has-feedback">
	                                                            <select data-placeholder="全部" name="mercTyp" id="mercTyp"  class="chosen-select form-control width-200px">
	                                                            	<option value="">全部</option>
	                                                            	<option value="1" <c:if test="${mTyp == 1}">selected</c:if>>普通商户</option>
												    				<option value="2" <c:if test="${mTyp== 2}">selected</c:if>>连锁总店</option>
												    				<option value="3" <c:if test="${mTyp == 3}">selected</c:if>>连锁分店</option>
												    		 		<option value="4" <c:if test="${mTyp == 4}">selected</c:if>>1+N总店</option>
												    				<option value="5" <c:if test="${mTyp == 5}">selected</c:if>>1+N分店</option>
	                                                            </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                   <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                                                                                                                                                         检索
                                                </button>
                                                 <%@include file="../common/resetForm.jsp"%>
                                                  <button class="btn btn-danger btn-sm" type="button" onclick="downLoad();">
                                                    <span class="ace-icon fa 	fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                 		   下载
                                                </button>
                                                 <button class="btn btn-danger btn-sm" type="button" onclick="doPrint();">
                                                    <span class="ace-icon fa 	fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                              		     打印
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
                                        	商户查询结果
                                    </h5>


                                </div>
                            
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                           		 <th style="text-align: center;width: 8%">	<a href="#" onclick="checkAll();">全选</a>/<a href="#" onclick="uncheckAll();">取消</a></th>
                                                <th style="text-align: center;width: 10%">商户编号 </th>
                                                <th style="text-align: center;width: 18%">工单编号</th>
                                                <th style="text-align: center;width: 15%">注册名称</th>
                                                <th style="text-align: center;width: 18%">协议编号</th>
                                                <th style="text-align: center;width: 15%">商户类型</th>
                                                <th style="text-align: center;width: 15%;display:none">下载UUID</th>
                                                <th  style="text-align: center;">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                           <c:forEach items="${mecIfList}" var="de"  varStatus="status">
													<tr>
													   <td style="text-align: center;"><input type="checkbox" name="box" value="<c:out value='${de.agreementNo }'/>"/></td>
														<td style="text-align: center;">${de.mercId }</td>
<%-- 														<td style="text-align: center;">${de.orgNo }</td> --%>
														<td style="text-align: center;">${de.orderNo }</td>
														<td style="text-align: center;">${de.mercSnm }</td>
														<td style="text-align: center;">${de.agreementNo }</td>
														
														<td style="text-align: center;">
														  
														   <c:if test="${de.mercTyp==1 }">
														   普通商户
														   </c:if>
														     <c:if test="${de.mercTyp==2 }">
														    连锁总店
														   </c:if>
														     <c:if test="${de.mercTyp==3 }">
														 连锁分店
														   </c:if>
														     <c:if test="${de.mercTyp==4 }">
														     1+N总店
														   </c:if>
														    <c:if test="${de.mercTyp==5 }">
														    1+N分店
														   </c:if>
														</td>
														<td style="text-align: center;display:none">${de.dlrqmuuid }</td>
														<td   style="text-align: center;">
										                     <div class="   action-buttons">
										                        <a href="javaScript:alertIframe('${de.agreementNo }');" class="blue">
										                             <i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">预览</font></i>
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

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%@include file="../layout/common.alljs.jsp"%>
<script type="text/javascript">
function myResetForm(){
    $("#mecSts").val('');
	 $("#mecSts").trigger("chosen:updated");
	 $("#mercTyp").val('');
	 $("#mercTyp").trigger("chosen:updated");
	 $("#branchOrgNo").val('');
	 $("#branchOrgNo").trigger("chosen:updated");
	 
	 $("#createdStaffId").val('');
	 $("#createdStaffId").trigger("chosen:updated");
	 $("#orgNo").val('').trigger("chosen:updated").trigger("onchange");
	
}

function alertIframe(agreementNo){										
	var href = '<%=request.getContextPath() %>/mecIf/findAgreementDetail.do?agreementNo='+agreementNo;
// 	alert(uuid+","+agreementNo);
	$.fancybox.open({
		href : href,
		type: 'iframe',
        padding: 5,
        scrolling: 'no',
        width: $(window).width() * 1.0,
        centerOnScroll:true,
        autoSize: true,
        helpers:{
        	overlay:{
        		closeClick:false
        	}
        }
	});
}

function checkAll() {
	var f=document.getElementsByName("box");
	for(var i=0;i<f.length;i++)
	{
		
			f[i].checked=true;
		
		
	}
}
function uncheckAll() {
	var f=document.getElementsByName("box");
	for(var i=0;i<f.length;i++)
	{
			f[i].checked=false;
	}
}




function downLoad() {
	var str = document.getElementsByName("box");
	var objarray = str.length;
	var chestr = "";
	for (i = 0; i < objarray; i++) {
		if (str[i].checked == true) {
			chestr += str[i].value + ",";
		}
	}
	if (chestr == "") {
		alert("请选择要下载的内容！！");
		return;
	} 

	window.location.href='<%=request.getContextPath()%>/mecIf/downLoad.do?id=1&agreementNo='+chestr;
}

function doPrint(){
	var str = document.getElementsByName("box");
	var objarray = str.length;
	var args=0;
	var chestr = "";
	for (i = 0; i < objarray; i++) {
		if(str[i].checked){
			args++;
			chestr += str[i].value;
			}
	}
	
	if(args==0){
		alert("请选择要打印的内容！");
	}else if(args>1){
		alert("只能选中一行打印！");
	}else if (args==1){
		//window.location.href='<%=request.getContextPath()%>/mecIf/downLoad.do?id=2&agreementNo='+chestr;
		window.open('<%=request.getContextPath()%>/mecIf/downLoad.do?id=2&agreementNo='+chestr);
	}

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
</script>

</body>
</html>











