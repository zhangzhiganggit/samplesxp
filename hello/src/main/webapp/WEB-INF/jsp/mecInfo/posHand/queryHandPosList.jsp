<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付</title>

    <%@include file="../../layout/common.jsp"%>
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
                                            <form class="form-inline form-horizontal" action="/mecIfHandPos/doQueryHandPosList" id="searchForm">
                                            	<%-- <input type="hidden" name="mercSn" value="${mercSn}" />		
												<input type="hidden" name="mercCnm" value="${mercCnm}" /> --%>
												<input type="hidden" name="flag" value = "1">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum() }">
												<input type="hidden" name="pageSize" value="${pageInfo.getPageSize() }">
												<input type="hidden" id="defaultBeginDate" name="defaultBeginDate" value="${posInfo.defaultBeginDate }">
												<input type="hidden" id="defaultEndDate" name="defaultEndDate" value="${posInfo.defaultEndDate }">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mercSn" id="mercSn" value="${posInfo.mercSn }" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mercCnm" id="mercCnm" value="${posInfo.mercCnm }" onkeyup="javascript:this.value=this.value.replace(/\s/g,'');" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机具序列号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="trmSn" id="trmSn" value="${posInfo.trmSn }" onkeyup="javascript:this.value=this.value.replace(/\s/g,'');" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >手机号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mecAdminTel" id="mecAdminTel" value="${posInfo.mecAdminTel }" onkeyup="javascript:this.value=this.value.replace(/\s/g,'');" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <%-- <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >注册时间:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="creStartTm" name="creStartTm" onchange="revalidateDate();" value="${posInfo.creStartTm }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="creEndTm" name="creEndTm" onchange="revalidateDate();" value="${posInfo.creEndTm }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div> --%>
                                                    <%-- <div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户类别:</label>
                                                    <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="mercTyp" name="mercTyp" class="chosen-select form-control width-200px">
                                                                <option value="00" >POS商户</option>
                                                                <option value="02" <c:if test="${posInfo.mercTyp =='02'}">selected="selected"</c:if>>手刷商户</option>
                                                            </select>

                                                        </div>
													</div> --%>
													<%-- <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属机构:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="orgNo" name="orgNo" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
																<option value="直属商户"
																<c:if test="${'直属商户'==posInfo.orgNo}">selected</c:if>
																>直属商户</option>
                                                               <c:forEach items="${orgList}" var="org"  varStatus="status">
                                                                <option value="${org.orgUuid}" 
                                                                	<c:if test="${org.orgUuid == posInfo.orgNo}">
																     selected
																    </c:if>
                                                                >${org.orgNm }</option>
                                                               </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div> --%>
                                                    
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >注册时间:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="dateStart" name="dateStart" onchange="revalidateDate();" value="${posInfo.dateStart }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="dateEnd" name="dateEnd"  onchange="revalidateDate();" value="${posInfo.dateEnd }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
												</div>
												
	                                            <button class="btn btn-normal btn-sm" type="submit" onclick="return checkResult()">
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
                                        查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width:10%">商户编号</th>
                                                <th style="text-align:center;width:13%">注册名称</th>
                                                <th style="text-align:center;width:10%">手机号</th>
                                                <th style="text-align:center;width:15%">所属一代</th>
                                                <th style="text-align:center;width:20%">直属机构</th>
                                                <!-- <th style="text-align:center;width:8%">所属业务员</th> -->
                                                <th style="text-align:center;width:7%">绑定台数</th>
                                                <th style="text-align:center;width:17%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach items="${posList}" var="pos"  varStatus="status">
													<tr>
														<!-- <td style="border:1px solid  #969696;">${status.index+1 }</td> -->
														<td >${pos.mercSn}</td>
														<td style="display: none">${pos.mercId}</td>
														<td style="display: none">${pos.mercSts}</td>
														<td >${pos.mercCnm}</td>
                                                        <td class="hiddenMainInfo">${pos.mecAdminTel}</td>
														<td >${pos.topOrgName}</td>
														<td >${pos.orgNm}</td>
														<%-- <td >${pos.empNm}</td> --%>
														<td style="text-align:right;">${pos.posInstallCont}</td>
														<td>
										                     <div class="action-buttons center">
										                     <c:if test="${pos.posInstallCont >0 && show=='1'}">
                                                                            <a href="javaScript:alertIframe(this,${pos.mercSn},4,${pos.mercSn},'${pos.orgNo}','${pos.orgNm}')" class="blue">解绑</a>
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

        /* $('#searchForm').bootstrapValidator({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            }
        }); */
        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
            var offset = $(this).offset();

            var $w = $(window)
            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                $(this).addClass('dropup');
            else $(this).removeClass('dropup');
        });



//or change it into a date range picker
        
        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        }).next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
        
    })
    
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
        
    function alertIframe(obj,mercSn,flag,mercId,orgNo,orgNm){
    	
    	var href = '';
    	if(1 == flag){
    		href = '<%=request.getContextPath() %>/mecIfHandPos/bindPosInfoPage.do?mercSn='+mercSn+'&mercId='+mercId+'&orgNm='+orgNm+'&orgNo='+orgNo;
    	}else if(2 == flag){
    		href = '<%=request.getContextPath() %>/mecIfHandPos/changePosInfoPage.do?mercSn='+mercSn+'&mercId='+mercId+'&orgNm='+orgNm+'&orgNo='+orgNo;
    	}else if(3 == flag){
    		href = '<%=request.getContextPath() %>/mecIfHandPos/toPosDividePageNew.do?mercSn='+mercSn+'&mercId='+mercId+'&orgNm='+orgNm+'&orgNo='+orgNo;
    	}else if(4 == flag){
    		href = '<%=request.getContextPath() %>/mecIfHandPos/toMobDividePageNew?mercSn='+mercSn+'&orgNm='+orgNm+'&orgNo='+orgNo;
    	}else{
    		href = '<%=request.getContextPath() %>/mecIfHandPos/orderPrint.do?mercSn='+mercSn;
    	}
    	$.fancybox.open({
			href : href,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: $(window).width() * 0.9,
            centerOnScroll:true,
            autoSize: true,
            helpers:{
            	overlay:{
            		closeClick:false
            	}
            },
			afterClose:function(){
				reloadParent();
			}
		});
    }
    
    function resetSearchForm(){
		$(':input','#searchForm')  
		.not(':button, :submit, :reset, :hidden')  
		.val('')  
		.removeAttr('checked')  
		.removeAttr('selected'); 
		 
	   	$("#mercTyp").val('00');
	   	$("#mercTyp").trigger("chosen:updated");
		$("#orgNo").val('');
	   	$("#orgNo").trigger("chosen:updated");
	   	
        $("#dateEnd").val('');
        $("#dateEnd").trigger("chosen:updated");  
        $("#dateStart").val('');
        $("#dateStart").trigger("chosen:updated");     
        revalidateDate();
    }
    
    //校验日期合法
    function revalidateDate(){
        revalidateFieldByFieldName('searchForm','dateStart');
        revalidateFieldByFieldName('searchForm','dateEnd');
    }
    
    function checkResult(){
    	var mercSn= $("#mercSn").val().trim();
    	var mercCnm = $("#mercCnm").val().trim();
    	var trmSn= $("#trmSn").val().trim();
    	var mecAdminTel = $("#mecAdminTel").val().trim();
    	
    	if(mercSn=='' && mercCnm=='' && trmSn=='' && mecAdminTel==''){
    		alert('请至少输入商户编号、注册名称、机具序列号、手机号中的一项');
    		return false;
    	}else{
    		return true;
    	}
    }

    jQuery(function($) {

        $('#searchForm').formValidation({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            }
        });
    })


</script>
</body>
</html>











