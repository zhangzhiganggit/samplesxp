<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
     <%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>
    <%@include file="../layout/common.jsp"%>
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
                                        分润地区设置
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/profitArea/list.do?entry=1" id="searchForm">
                                                <input type="hidden" id="pcd" name="pcd" value="${pcd }">
                                               <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" > 
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >省份:</label>
                                                        <div class="col-sm-6  no-padding"  >
                                                            <select data-placeholder="请选择" id="provCd" name="provCd"  class="col-sm-8 width-80 chosen-select width-80">
                                                               
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                                                                                                       检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button"
													onclick="resetMecForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
												</button>
												<button class="btn btn-primary btn-sm" type="button" onclick="findExcelInfo()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                       导出
                                                </button>
												<a class="btn btn-primary btn-sm saveBtn" href="/profitArea/downloadExcel" >
													<span
														class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
													下载模板
												</a>
                                                <button class="btn btn-danger btn-sm" type="button"  onclick="profitAreaUpExcel()">
                                                    <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                                                                                                   批量修改
                                                </button>
												 
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-box widget-color-normal2"  >
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
                                                <th style="text-align: center;width: 40%">  地区 </th>
                                                <th style="text-align: center; width: 40%">  设置状态 </th>
                                                <th  style="text-align: center;width: 20%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                             <c:forEach  items="${areaList }" var="al">
                                              <tr>
                                              <td style="text-align: center;">${al.areaNm }</td>
                                              <td style="text-align: center;">${al.setSts}</td>
                                              <td style="text-align: left;">
								                 <div class="   action-buttons">
								                 <c:if test="${loginUserPermission.SMSA_PROFIT_008!=null }">
								                  <a href="#" class="green" id="edit" onclick="seeDetailArea('${al.areaId }','${al.areaNm }');" >
	                                                            <i class="ace-icon fa fa-search-plus blue bigger-130"><font size="2"> 查看详情</font></i>
	                                                 </a>
	                                                 <c:if test="${al.setSts=='已设置' }">
								                      <a href="#" class="green" id="edit" onclick="showEditAreaView('${al.areaId }','${al.areaNm }');" >
	                                                            <i class="ace-icon fa fa-edit  blue bigger-130"><font size="2"> 信息修改</font></i>
	                                                  </a>
	                                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								                   </c:if> 
	                                                  
	                                                 </c:if>
								                 <c:if test="${loginUserPermission.SMSA_PROFIT_006!=null }">
								                    <c:if test="${al.setSts=='未设置' }">
								                      <a href="#" class="green" id="edit" onclick="showAddAreaView('${al.areaId }','${al.areaNm }');" >
	                                                            <i class="ace-icon fa fa-gear blue bigger-130"><font size="2"> 设置</font></i>
	                                                  </a>
	                                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								                    </c:if>
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
        </div>
    </div>
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">
    function resetMecForm(){
    	$(':input','#searchForm')  
      	 .not(':button, :submit, :reset, :hidden')  
      	 .removeAttr('checked')  
      	 .removeAttr('selected'); 
    	$("#provCd").val('');
   	 	$("#provCd").trigger("chosen:updated");
	}
    function findExcelInfo(){
		$("#searchForm").attr("action","<%=request.getContextPath()%>/profitArea/findExcelInfo");
		document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","<%=request.getContextPath()%>/profitArea/list");
	}
    

        var pcd = $("#pcd").val();
        fillProvSelect('provCd',pcd);
        
        function seeDetailArea(areaId,areaNm){
        	$.fancybox.open({
    			href : '<%=request.getContextPath() %>/profitArea/showDetailView.do?areaId='+areaId+'&areaNm='+areaNm,
    			type: 'iframe',
                padding: 5,
                scrolling: 'no',
                fitToView: true,
                width: 1100,
                height: 600,
                autoSize: false,
                closeClick: false,
    			afterClose:function(){
    			}
    		});
        	
        }
        
       function showAddAreaView(areaId,areaNm){
    	   var provCd = $("#provCd").val();
    	   $.fancybox.open({
   			href : '<%=request.getContextPath() %>/profitArea/showAddAreaView.do?areaId='+areaId+'&areaNm='+areaNm,
   			type: 'iframe',
               padding: 5,
               scrolling: 'no',
               fitToView: true,
               width: 1100,
               height: 600,
               autoSize: false,
               closeClick: false,
   			afterClose:function(){
   				window.location.href='<%=request.getContextPath()%>/profitArea/list.do?provCd='+provCd; 
   			}
   		});
    	   
    	   
       }
       
       
       function showEditAreaView(areaId,areaNm){
    	   var provCd = $("#provCd").val();
    	   $.fancybox.open({
   			href : '<%=request.getContextPath() %>/profitArea/showEditAreaView.do?areaId='+areaId+'&areaNm='+areaNm+'&provCd='+provCd,
   			type: 'iframe',
               padding: 5,
               scrolling: 'no',
               fitToView: true,
               width: 1100,
               height: 600,
               autoSize: false,
               closeClick: false,
   			afterClose:function(){
   				window.location.href='<%=request.getContextPath()%>/profitArea/list.do?provCd='+provCd; 
   			}
   		});
    	   
    	   
       }
       function profitAreaUpExcel(){
    	   $.fancybox.open({
   			href : '<%=request.getContextPath() %>/profitArea/profitAreaUpExcel',
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
       
       function switchFucWithExcel(optTyp) {
    		$.fancybox.open({
    			href : $("#contextPath").val() + '/mecIf/mecIfPosOprWithExcel?'+
    			 "posAttrStatus=" + optTyp,
    			type : 'iframe',
    			padding : 5,
    			scrolling : 'no',
    			fitToView : true,
    			width : 900,
    			height : 400,
    			autoSize : true,
    			closeClick : false,
    			afterClose : function() {
    			}
    		});

    	}
        $('.chosen-select').chosen({});
</script>
</body>
</html>











