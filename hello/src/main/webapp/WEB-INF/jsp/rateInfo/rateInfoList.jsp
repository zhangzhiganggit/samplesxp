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
    
   <%--  <%@include file="../layout/header.jsp"%> --%>

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
       <%--   <%@include file="../layout/menu.jsp"%>  --%>

        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       		 评级信息查询条件
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

		
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/rateInfo/listView.do?flag=false" id="searchForm" method="post">
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                            	<input type="hidden" name="nowYear" id="nowYear" value="${rateInfo.rateYear}" >
                                                <div class=" col-xs-12">
                                                    
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属分公司:</label>
                                                          <div class="col-sm-8  no-padding"  >
                                                         	<select id="branchNo" name="branchNo" onchange="fillOrgSelect('branchOrgNo','orgNo','${rateInfo.branchNo}')"  data-placeholder="全部"  class="chosen-select form-control width-200px" 
                                                         	  <c:if test="${isZongBu != '0010000000'}">disabled="disabled"</c:if>       >
                                                                <option value="" selected="selected">全部</option>
                                                                <c:forEach items="${orgAllList}" var="org" >
                                                                	<option value="${org.orgUuid }" 
                                                                	<c:if test="${rateInfo.branchNo == org.orgUuid }"> selected </c:if>
                                                                	>${org.orgNm }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                 </div> 
                                                 <c:if test="${isZongBu == '0010000000'}">
                                                    <div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属一代:</label>

														<div class="col-sm-8  no-padding">
															<select id="orgNo" name="orgNo" data-placeholder="请选择"
																class="chosen-select form-control width-200px">
																<option value="">请选择</option>  
															</select>
														</div>
													</div>
													</c:if>
													<c:if test="${isZongBu != '0010000000'}">
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属一代:</label>

														<div class="col-sm-8  no-padding">
															<select id="orgNo" name="orgNo" data-placeholder="请选择"
																class="chosen-select form-control width-200px">
																 <option value="" selected="selected">全部</option>
																<c:forEach items="${topOrgList}" var="org">
																	<option value="${org.orgUuid }"
																	<c:if test="${rateInfo.orgNo == org.orgUuid }"> selected </c:if>
																	>${org.orgNm}</option>
																</c:forEach> 
															</select>
														</div>
													</div>
													</c:if>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >评级时间:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="rateYear" name="rateYear" data-placeholder="请选择" class="col-sm-6 width-48  chosen-select width-45  ">
                                                            </select>
                                                            <select id="rateQuarter" name="rateQuarter" data-placeholder="请选择"  class="col-sm-6 width-48  chosen-select width-45  ">
                                                                 <option value="">全部</option>
                                                                 <option value="第一季度" <c:if test="${rateInfo.rateQuarter=='第一季度' }">selected</c:if>>第一季度</option>
                                                                 <option value="第二季度" <c:if test="${rateInfo.rateQuarter=='第二季度' }">selected</c:if>>第二季度</option>
                                                                 <option value="第三季度" <c:if test="${rateInfo.rateQuarter=='第三季度' }">selected</c:if>>第三季度</option>
                                                                 <option value="第四季度" <c:if test="${rateInfo.rateQuarter=='第四季度' }">selected</c:if>>第四季度</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                	<div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >评级结果:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="rateResult" name="rateResult" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                               <option value="">全部</option>
                                                               <option value="一星" <c:if test="${rateInfo.rateResult=='一星' }">selected</c:if>>一星</option>
                                                               <option value="二星" <c:if test="${rateInfo.rateResult=='二星' }">selected</c:if>>二星</option>
                                                               <option value="三星" <c:if test="${rateInfo.rateResult=='三星' }">selected</c:if>>三星</option>
                                                               <option value="四星" <c:if test="${rateInfo.rateResult=='四星' }">selected</c:if>>四星</option>
                                                               <option value="五星" <c:if test="${rateInfo.rateResult=='五星' }">selected</c:if>>五星</option>
                                                               <option value="六星" <c:if test="${rateInfo.rateResult=='六星' }">selected</c:if>>六星</option>
                                                               <option value="普通" <c:if test="${rateInfo.rateResult=='普通' }">selected</c:if>>普通</option>
                                                               <option value="黑名单" <c:if test="${rateInfo.rateResult=='黑名单' }">selected</c:if>>黑名单</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >导入时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="insertStartTm" name="insertStartTm" value="${rateInfo.insertStartTm }" class="input-small form-control" onchange="changeWeChatDateStart()">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="insertEndTm" name="insertEndTm" value="${rateInfo.insertEndTm }"  class="input-small form-control" onchange="changeWeChatDateEnd()">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                 
                                                 <br/>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
													检索
                                                </button>
                                                 <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
                                                </button> 
                                                 <button id="exp" class="btn btn-primary btn-sm" type="button" onclick="exportData()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                            导出结果                                                                                                                                
                                                </button>
                                                <button id="exp" class="btn btn-primary btn-sm" type="button" onclick="downLoadView()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                            下载模板                                                                                                                                
                                                </button>
                                                <button class="btn btn-danger btn-sm" type="button"  onclick="downLoadData()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-up icon-on-right bigger-110"></span>
                                                                                                                                       批量导入
                                                </button> 
                                                
												 
					                            <button id="exp" class="btn btn-primary btn-sm" type="button" onclick="getUuidList()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                     批量删除                                                                                                                            
                                                </button>
                                            </form>
                                            <form  action="<%=request.getContextPath()%>/rateInfo/downExcel" id="downLoadForm" method="post">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        	评级信息查询结果
                                    </h5>


                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center; width: 5%">
	                                            		<div>
															<label> 
																<input type="checkbox" id="ckAll" name="ckAll">
																<span class="lbl">全选</span>
															</label>
														</div>
												</th>
                                                <th style="text-align: center;width: 10%">分公司</th>
                                                <th style="text-align: center;width: 10%">机构编号</th>
                                                <th style="text-align: center;width: 10%">代理商名称</th>
                                                <th style="text-align: center;width: 10%">评级时间</th>
                                                <th style="text-align: center;width: 6%">评级结果</th>
                                                <th style="text-align: center;width: 10%">操作人账号</th>
                                                <th style="text-align: center;width: 10%">操作人</th>
                                                <th style="text-align: center;width: 10%">导入时间</th>
                                                
                                            </tr>
                                            </thead>

                                            <tbody>
                                           <c:forEach items="${list}" var="de"  varStatus="status">
													<tr>
														<td style="text-align: center; width: 5%">
		                                            		<div>
																<label> 
																	<input type="checkbox" value="${de.uuid }" id="changedmno" name="changedmno">
																	<span class="lbl"></span>
																</label>
															</div>
														</td>
														<td style="text-align: center;">${de.branchNm }</td>
														<td style="text-align: center;">${de.orgNo }</td>
														<td style="text-align: center;">${de.orgNm }</td>
														<td style="text-align: center;">${de.rateYear}年${de.rateQuarter}</td>
														<td style="text-align: center;">${de.rateResult}</td>
														<td style="text-align: center;">${de.empNo}</td>
														<td style="text-align: center;">${de.empNm}</td>
														<td style="text-align: center;">${de.updateDt}</td>
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
    <%@include file="../layout/common.alljs.jsp"%>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    
    $("#ckAll").click(function() {
	       $("input[name='changedmno']").prop("checked",this.checked);
	 });
    $("input[name='changedmno']").click(function() {
	    var $subs = $("input[name='changedmno']");
	    $("#ckAll").prop("checked" , $subs.length == $subs.filter(":checked").length ? true :false);
     });
    function getUuidList(){
  	  var uuid = "";
  	  var flag = false;
  	  $("input[name='changedmno']:checkbox:checked").each(function(){
  		  uuid = uuid + ","+$(this).val();
  		  flag =true ;
  	  })
  	  if(flag){
  		  alert("您确定删除吗?");
  		deleteInfo(uuid.substr(1));
  	  }else{
  		  alert("至少勾选一条记录");
  	  }
    }
    
    function deleteInfo(uuid){
    	$.ajax({
			cache : true,
			type : "POST",
			url : '/rateInfo/deleteInfo.do',
			data : {uuid:uuid},
			async : false,
			error : function(data) {
				alert(data);
			},
			success : function(data) {
				alert(data);
				window.$.fancybox.close();
				window.location.reload();
				
			}
		});
    }
    
    
    function downLoadView(){
   		document.getElementById("downLoadForm").submit();
    }
    function downLoadData(){
    	$.fancybox.open({
			href : '<%=request.getContextPath() %>/rateInfo/importData.do?',
			type: 'iframe',
        padding: 5,
        scrolling: 'no',
        fitToView: true,
        width: 900,
        height: 800,
        autoSize: false,
        closeClick: false,
			afterClose:function(){
				window.$.fancybox.close();
				window.location.reload();
			}
		});
   		/* document.getElementById("downChangeData").submit(); */
    }
    function exportData(){
    	$('#searchForm').attr('action','/rateInfo/exportRateInfo.do');
	    document.getElementById("searchForm").submit();
	    $('#searchForm').attr('action','/rateInfo/listView.do?flag=false');
    }
    function resetMecForm(){
    	
    	
   	 $(':input','#searchForm')  
   	 .not(':button, :submit, :reset, :hidden')  
   	 .val('')  
   	 .removeAttr('checked')  
   	 .removeAttr('selected'); 
   	    
		 $("#rateYear").val('');
		 $("#rateYear").trigger("chosen:updated");
		 $("#rateQuarter").val('');
		 $("#rateQuarter").trigger("chosen:updated");		 
		 
		 $("#orgNo").val(''); 
		 $("#orgNo").html('<option value="">请选择</option>');
   	     $("#orgNo").trigger("chosen:updated");
   	     $("#rateResult").val('');
   	     $("#rateResult").trigger("chosen:updated");  
   	    <c:if test="${isZongBu == '0010000000'}">
		   	 $("#branchNo").val('');
		  	 $("#branchNo").trigger("chosen:updated");  
  	    </c:if>
   	     
    }
    jQuery(function($){
    	debugger
		 $("#rateYear").find("option").remove();
		 var d=new Date();
		 var year=d.getFullYear();
		 var nowYear=$("#nowYear").val();
		 var rateYear='<option value="">全部</option>';
		  for(var i=0;i<5;i++){
			 var tempYear=year-i;
			 if(nowYear==tempYear){
				 rateYear+='<option value="'+tempYear+'" selected="selected">'+tempYear+'</option>'; 
			 }
			 rateYear+='<option value="'+tempYear+'">'+tempYear+'</option>'; 
		 } 
		 $("#rateYear").html(rateYear).trigger("chosen:updated");
	 });
    function fillOrgSelect(branchOrgNo,orgNo,orgValue,isContainsEmptyOption){
    	debugger
       	var branchOrgNo = $("#branchNo").val();
       	if(branchOrgNo!=''){
       		$.ajax({
       	        url: '/rateInfo/getOrgByBranchNo',
       	        data : {
       	        	branchOrgNo : branchOrgNo
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
       		             $("[name='"+orgNo+"']").html(options);
       		             $("[name='"+orgNo+"']").trigger("chosen:updated");
       	       	 	}
       	        }
       		});
       	}else{
       		$("[name='"+orgNo+"']").html('');
       		$("[name='"+orgNo+"']").trigger("chosen:updated");
       	}
       }
     
     </script>
    
    <script type="text/javascript">
    
    
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











