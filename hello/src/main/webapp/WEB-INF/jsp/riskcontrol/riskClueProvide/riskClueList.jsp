<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/riskClueProvide/queryList.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="firstLoad" value="no">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >标题:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="title" id="title" maxlength="20" value="${riskClueProvide.title }" class="form-control input-small width-200px">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="clueStatus" name="clueStatus"   class="chosen-select form-control width-200px">
                                                                <option value="">请选择</option>
                                                                <option value="1" <c:if test="${riskClueProvide.clueStatus == 1}">selected="selected"</c:if>>待核实</option>
                                                                <option value="2" <c:if test="${riskClueProvide.clueStatus == 2}">selected="selected"</c:if>>已采纳</option>
                                                                <option value="3" <c:if test="${riskClueProvide.clueStatus == 3}">selected="selected"</c:if>>已忽略</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >提出日期:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="beginDate" name="beginDate" value="${riskClueProvide.beginDate}" class="input-small form-control" onchange="changeDateStart()">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="endDate" name="endDate" value="${riskClueProvide.endDate}" class="input-small form-control" onchange="changeDateEnd()">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    查询
                                                </button>
                                                 <button class="btn btn-info btn-sm" type="button" onclick="javaScript:resetClueForm()">
                                                    <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                    重置
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
                                                <th style="text-align:center;width: 13%">提出时间</th>
                                                <th style="text-align:center;width: 20%">标题</th>
                                                <th style="text-align:center;width: 10%">联系人</th>
                                                <th style="text-align:center;width: 10%">联系方式</th>
                                                <th style="text-align:center;width: 15%">所属分公司</th>
                                                <th style="text-align:center;width: 15%">一级代理商</th>
                                                <th style="text-align:center;width: 7%">状态</th>
                                                <th style="text-align:center;width: 10%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach items="${riskClueProvideList}" var="riskClue" varStatus="status">
													<tr>
														<td style="text-align:center"><fmt:formatDate value="${riskClue.createTime}" type="time" pattern="yyyy-MM-dd HH:mm:ss"/></td>
														<td style="text-align:left" >${riskClue.title}</td>
														<td style="text-align:left">${riskClue.linkman}</td>
														<td style="text-align:center">${riskClue.contactTel}</td>
														<td style="text-align:center">${riskClue.belongTo}</td>
														<td style="text-align:left">${riskClue.firstMerchant}</td>
														<td style="text-align:center" >
															<c:if test="${riskClue.clueStatus==1}" >待核实</c:if>
									                        <c:if test="${riskClue.clueStatus==2}" >已采纳</c:if>
									                        <c:if test="${riskClue.clueStatus==3}" >已忽略</c:if>
														</td>
														<td style="text-align:center">
															<c:if test="${riskClue.clueStatus==1}" >
																<a href="javaScript:openIframe('${riskClue.id}','1')" class="blue">核实</a>
															</c:if>
																<a href="javaScript:openIframe('${riskClue.id}','2')" class="blue">查看</a>
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

        $("#title").keyup(function () {
            this.value = this.value.replace(/\s/g, '');
        });
    })
    
    function changeDateStart(){
 		 var creStartTm=Number($("#beginDate").val().replace(/-/g,''));
 		 var creEndTm=Number($("#endDate").val().replace(/-/g,''));
 		 if(creEndTm!=0){
 			 if(creStartTm>creEndTm){
 				 $("#endDate").val($("#beginDate").val());
 			 }
 		 }
 	 }
 	 function changeDateEnd(){
 		 var creStartTm=Number($("#beginDate").val().replace(/-/g,''));
 		 var creEndTm=Number($("#endDate").val().replace(/-/g,''));
 		 if(creStartTm!=0){
 			 if(creStartTm>creEndTm){
 				 $("#beginDate").val($("#endDate").val());
 			 }
 		 }
 	 }
    
    function resetClueForm(){
        	$(':input','#searchForm')  
          	 .not(':button, :submit, :reset, :hidden')  
          	 .val('') ; 
        	$('#clueStatus').val('1');
        	$("#clueStatus").trigger("chosen:updated");
        }
    //校验日期合法
	function revalidateDate(){
		revalidateFieldByFieldName('searchForm','dateStart');
		revalidateFieldByFieldName('searchForm','dateEnd');
	}

    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
        
    function openIframe(id,flag){
    	var href = '';
    	if(1 == flag ){
    		href = '<%=request.getContextPath() %>/riskClueProvide/check.do?id='+id;
    	}else{
    		href = '<%=request.getContextPath() %>/riskClueProvide/show.do?id='+id;
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
				if(1 == flag){
					reloadParent();
				}
			}
		});
    }
</script>
</body>
</html>