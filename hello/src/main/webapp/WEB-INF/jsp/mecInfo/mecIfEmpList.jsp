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
                                       		 商户查询条件
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

		
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecIf/listSearch.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                            	<input type="hidden" name="isFirstLoad" value="false" >
                                            	
                                            	<input type="hidden" id="prov" name="prov" value="${mecIf.mecProvCd}">
                                            	<input type="hidden" id="city" name="city" value="${mecIf.mecCityCd}">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mno"  name="mno" value="${mecIf.mno }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="cprRegNmCn" name="cprRegNmCn" value="${mecIf.cprRegNmCn }" class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                   <%--  <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属机构:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="mecSts" name="orgUuid" data-placeholder="请选择"  class="chosen-select form-control width-200px">
                                                                 <option value="">全部</option>
                                                                <c:forEach items="${orgList }" var="org" >
                                                                	<option value="${org.orgUuid }" 
                                                                		<c:if test="${mecIf.orgUuid == org.orgUuid }"> selected </c:if>
                                                                	>${org.orgNm }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div> --%>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属一代:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="orgNo" name="orgNo" data-placeholder="请选择"  class="chosen-select form-control width-200px">
                                                                 <option value="">全部</option>
                                                                <c:forEach items="${orgList }" var="org" >
                                                                	<option value="${org.orgUuid }"
                                                                		<c:if test="${mecIf.orgNo == org.orgUuid }"> selected </c:if>
                                                                	>${org.orgNm }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >开通时间:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="openStartTm" name="openStartTm" value="${mecIf.openStartTm }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="openEndTm" name="openEndTm" value="${mecIf.openEndTm }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属地区:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="mecProvCd" name="mecProvCd" data-placeholder="请选择" onchange="fillCitySelect('mecProvCd','mecCityCd','${mecIf.mecCityCd}')"    class="col-sm-8 width-48 chosen-select width-45">
                                                               <%--  <option value=""></option>
                                                                <c:forEach items="${provs }" var="prov">
																		<option value="${prov.areaId }"  <c:if test="${prov.areaId==mecIf.mecProvCd }">selected</c:if>>${prov.areaNm}</option>
																		</c:forEach> --%>
                                                            </select>
                                                            <select id="mecCityCd" name="mecCityCd" data-placeholder="请选择"  class="col-sm-6 width-48  chosen-select width-45  ">
                                                                <!-- <option value=""></option>
                                                                 -->
                                                            </select>
                                                        </div>
                                                    </div>


                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                                                                                                                                                         检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
                                                </button> 
                                                <button class="btn btn-danger btn-sm" type="button" onclick="getMnoList()">
                                                    <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                                                                                                                                                         修改
                                                </button>
                                                 <button class="btn btn-primary btn-sm" type="button" onclick="location.href='<%=request.getContextPath() %>/mecIf/downloadExcel.do'">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                                                                         下载模板
                                                </button>
                                               
                                                <button class="btn btn-danger btn-sm" type="button" onclick="batchChange()">
                                                    <span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
                                                                                                                                                                                         批量导入修改
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
                                                
                                                 <th style="text-align: center;width: 6%" >
                                            		<input type="checkbox" class="ace "  id="ckAll" name="ckAll">
			                                       <span class="lbl middle">全选</span>
		                                       </th>
                                                <th style="text-align: center;width: 12%">  商户编号 </th>
                                                <th style="text-align: center;width: 12%">  商户名称</th>
                                                <th style="text-align: center;width: 10%">联系人</th>
                                                <th style="text-align: center;width: 10%">所属销售</th>
                                                <th style="text-align: center;width: 9%">所属一代</th>
                                                <th style="text-align: center;width: 9%">所属分公司</th>
                                                <th style="text-align: center;width: 10%">开通日期</th>
                                                <th style="text-align: center;width: 8%">状态</th>
                                                
                                                <th  style="text-align: center;">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                           <c:forEach items="${mecIfList}" var="de"  varStatus="status">
													<tr>
														<!-- <td style="border:1px solid  #969696;">${status.index+1 }</td> -->
														<td class="" style="text-align: center;">
                                                             <input type="checkbox" class="ace abc" value="${de.inMno }" id="changedmno" name="changedmno">
							                                 <span class="lbl middle"></span>
						                                </td>
														<td style="text-align: center;">${de.mno }</td>
														<td style="text-align: left;">${de.cprRegNmCn }</td>
														<td style="text-align: left;">${de.contNmCn }</td>
														<td style="text-align: left;">${de.empNm}</td>
														<td style="text-align: left;">${de.firstNm}</td>
														<td style="text-align: center;">${de.branchNm}</td>
														<td style="text-align: center;">${de.signDt }</td>
														<td style="text-align: center;">${de.mercStss }</td>
														
														<td   style="text-align: center;">
										                     <div class="   action-buttons">
										                         <a href="#" onclick="updateEmp('${de.inMno}')" class="blue fancybox-manual-b">
										                            <i class="ace-icon fa fa-edit  blue bigger-130"><font size="2">修改销售人员</font></i>
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

    <%-- <%@include file="../layout/footer.jsp"%> --%>
    <%@include file="../layout/common.alljs.jsp"%>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
       var proValue = $("#prov").val();
       fillProvSelect('mecProvCd',proValue);
       var cityValue = $("#city").val();
       fillCitySelect('mecProvCd','mecCityCd',cityValue);
       function resetMecForm(){
      	 $(':input','#searchForm')  
      	 .not(':button, :submit, :reset, :hidden')  
      	 .val('')  
      	 .removeAttr('checked')  
      	 .removeAttr('selected'); 
      	 $("#orgNo").val('');
   		 $("#orgNo").trigger("chosen:updated");
   		 $("#mecProvCd").val('');
  		 $("#mecProvCd").trigger("chosen:updated");
  		 $("#mecCityCd").val('');
   		 $("#mecCityCd").trigger("chosen:updated");		 
  		 $("#openEndTm").val(getFormatDate());
   		 $("#openEndTm").trigger("chosen:updated");	
   		 $("#openStartTm").val(getFormatDateBefore('3'));
  		 $("#openStartTm").trigger("chosen:updated");	
       }
     </script>
    
    <script type="text/javascript">
    
    
    $("#ckAll").click(function() {
        $("input[name='changedmno']").prop("checked", this.checked);
      });
      
      $("input[name='changedmno']").click(function() {
    	    var $subs = $("input[name='changedmno']");
    	    $("#ckAll").prop("checked" , $subs.length == $subs.filter(":checked").length ? true :false);
      });
      
      function getMnoList(){
    	  var id = "";
    	  var flag = false;
    	  $("input[name='changedmno']:checkbox:checked").each(function(){
    		  id = id + ","+$(this).val();
    		  flag =true ;
    	  })
    	  if(flag){
    		  updateEmp(id.substr(1))
    	  }else{
    		  alert("至少勾选一条记录")
    	  }
    	  
      }
      function updateEmp(id){
    	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/mecIf/updateEmp.do?mecIf='+id,
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
      function batchChange(){
    	  $.fancybox.open({
				href : '<%=request.getContextPath() %>/mecIf/batchChange.do',
				type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 900,
	        height: 800,
	        autoSize: false,
	        closeClick: true,
				afterClose:function(){
					document.getElementById("searchForm").submit();
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
   
     
</script>
</body>
</html>











