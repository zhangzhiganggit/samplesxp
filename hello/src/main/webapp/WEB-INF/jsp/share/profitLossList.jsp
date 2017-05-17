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
                            <div class="widget-box widget-color-normal3" style="opacity: 1;height: 100px">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        损失同步履历
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/profitLoss/lossImportList.do" id="searchForm">
                                               <input type="hidden" id="pcd" name="pcd" value="${pcd }">
                                               <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" > 
                                               <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >目标日期:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="year" name="year"   class="col-sm-8 width-40 chosen-select width-40">
                                                                <c:forEach  items="${yearlist }" var="year">
                                                                  <option value="${year}" <c:if test="${thisYear==year }">selected</c:if>>${year}</option>
                                                               </c:forEach>
                                                            </select>
                                                            			年
                                                            <select id="month" name="month"   class="col-sm-6 width-40  chosen-select width-40  ">
                                                              <option value="01" <c:if test="${dsm.month=='01' }">selected</c:if>>01</option>
                                                              <option value="02" <c:if test="${dsm.month=='02' }">selected</c:if>>02</option>
                                                              <option value="03" <c:if test="${dsm.month=='03'}">selected</c:if>>03</option>
                                                              <option value="04" <c:if test="${dsm.month=='04'}">selected</c:if>>04</option>
                                                              <option value="05" <c:if test="${dsm.month=='05' }">selected</c:if>>05</option>
                                                              <option value="06" <c:if test="${dsm.month=='06' }">selected</c:if>>06</option>
                                                              <option value="07" <c:if test="${dsm.month=='07' }">selected</c:if>>07</option>
                                                              <option value="08" <c:if test="${dsm.month=='08' }">selected</c:if>>08</option>
                                                              <option value="09" <c:if test="${dsm.month=='09' }">selected</c:if>>09</option>
                                                              <option value="10" <c:if test="${dsm.month=='10' }">selected</c:if>>10</option>
                                                              <option value="11" <c:if test="${dsm.month=='11' }">selected</c:if>>11</option>
                                                              <option value="12" <c:if test="${dsm.month=='12' }">selected</c:if>>12</option>
                                                            </select>
                                                                  		  月
                                                        </div>
                                                    </div>
                                                <button class="btn btn-danger btn-sm" type="button" id="syn" onclick="lossSynchro()">
                                                                                                                                                                                         同步
                                                </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-box widget-color-normal2"  >
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        同步履历
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center; width: 30%"> 导入日期</th>
 												<th style="text-align: center;width: 30%">  目标月份</th>
                                                <th  style="text-align: center;width: 20%">导入条数</th>
                                                <th  style="text-align: center;width: 20%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                             <c:forEach  items="${list }" var="al">
                                              <tr>
                                              <td style="text-align: center;">${al.importDt }</td>
                                              <td style="text-align: center;">${al.destDt }</td>
                                              <td style="text-align: center;">${al.importCount}</td>
                                              <td style="text-align: center;">
                                              <div class="   action-buttons">
							                         <a href="#" onclick="typeDetailShow('${al.destDt }')" class="blue fancybox-manual-b">
							                             <i class="ace-icon fa fa-search-plus blue bigger-130"><font size="2">详情</font></i>
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
        </div>
    </div>
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">
    $(function(){
    	var datetime=new Date();
	    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() ) : datetime.getMonth() ;
	    $("#month").val(month);
	    $("#month").trigger("chosen:updated");
    });
    
    
      function lossSynchro(){
    	  var year =$("#year").val();
    	  var month =$("#month").val();
    	  if(confirm("确定要同步"+year+"年"+month+"月的损失数据吗?"))
    	  {
    		  document.getElementById("syn").disabled=true;
    		  $.ajax({
      			    	cache: true,
      			        type: "POST",
      			        url:'<%=request.getContextPath()%>/profitLoss/lossSynchro.do',
      			        data: "year="+year+"&month="+month,
      					async : false,
      					error : function(data) {
      						alert(data);
      					},
      					success : function(data) {
      						alert(data.msg);
      						window.location.href='<%=request.getContextPath()%>/profitLoss/lossImportList.do';
      					}
      				});
    	  }
      }
       
      
      function typeDetailShow(destDt){
    	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/profitLoss/lossDetail.do?destDt='+destDt,
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 1200,
	        height: 800,
	        autoSize: false,
	        closeClick: false,
				afterClose:function(){
				}
			});
    	  
      }
        

        $('.chosen-select').chosen({});
        jQuery(function($) {
        })
</script>
</body>
</html>











