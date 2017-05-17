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
                                   		    大POS自动秒到审核
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/posOpenAuth/posOpenAuthList.do" id="searchForm" method="post">
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
                                                                                                        <div class="form-group form-group-sm width-300px">
                                                    <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户来源:</label>
                                                    <div class="col-sm-8  no-padding"  >                                          
                                                            <select data-placeholder="请选择" id="mobileSource" name="mobileSource"   class="chosen-select form-control width-200px" >
                                                                <option value="" >请选择</option>
                                                                <option value="01" <c:if test="${mobMercAuth.mobileSource == '01'}">selected="selected"</c:if>>大POS商户</option>
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
                                               <button class="btn btn-primary btn-sm" type="button" onclick='exportDown()'>
                                                	<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                                导出检索结果
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
                                                <th style="text-align:center;width: 10%">商户编号</th>
                                                <th style="text-align:center;width: 10%">商户来源</th>                                                
                                                <th style="text-align:center;width: 10%">申请认证时间</th>
                                                <th style="text-align:center;width: 10%">审核人</th>
                                                <th style="text-align:center;width: 10%">审核状态</th>
                                                <th style="text-align:center;width: 10%">审核时间</th>
                                                <th style="text-align:center;width: 10%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            
                                            <c:forEach items="${mobMercAuthList}" var="mobMercAuth" varStatus="status">
                                            	<tr>
                                            	<td style="text-align:center">${mobMercAuth.mno }</td>
												<td style="text-align:center" >
													<c:if test="${mobMercAuth.mobileSource=='01'}" >大POS商户</c:if>
												</td>
												<td style="text-align:center">${mobMercAuth.applyAuthDte }
												</td>
                                            	<%-- <td style="text-align:center" ><fmt:parseDate value="${mobMercAuth.applyAuthDte }" var="applyAuthDte" pattern="yyyyMMddHHmmss"/><fmt:formatDate value="${applyAuthDte}" pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
                                            	<td style="text-align:center" >${mobMercAuth.authUsrNm}</td>
                                            	<td style="text-align:center" >
													<c:if test="${mobMercAuth.authStatus=='00'}" >未审核</c:if>
							                        <c:if test="${mobMercAuth.authStatus=='01'}" >审核通过</c:if>
							                        <c:if test="${mobMercAuth.authStatus=='02'}" >审核驳回</c:if>
												</td>
												<td style="text-align:center">${mobMercAuth.auditTime }
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
    function exportDown(){
    	debugger
    	var mno=$("#mno").val();
    	var authStatus=$("#authStatus").val();
    	var startApplyDte=$("#startApplyDte").val();
    	var endApplyDte=$("#endApplyDte").val();
    	var mobileSource=$("#mobileSource").val();
    	
    	if(startApplyDte=="" || endApplyDte=="" ){
    		alert("请选择要导出的申请认证时间范围");	
    		return;
    	}
    	if(DateDiff(startApplyDte, endApplyDte)>92){
    		alert("导出时，申请认证时间范围不允许超过三个月");	
    		return;
    	}
    	location.href='<%=request.getContextPath()%>/posOpenAuth/exportDown?'
    	+'mno='+mno
    	+'&mobileSource='+mobileSource
    	+'&authStatus='+authStatus
    	+'&startApplyDte='+startApplyDte
    	+'&endApplyDte='+endApplyDte;
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



    })
    
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
        
    function openIframe(mno,flag,uuid){
    	var href = '';
    	href = '<%=request.getContextPath() %>/posOpenAuth/posOpenAuthDetail.do?mno='+mno+'&flag='+flag+'&uuid='+uuid;
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
