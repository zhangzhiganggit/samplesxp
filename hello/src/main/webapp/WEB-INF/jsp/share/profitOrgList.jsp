<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>
    <%@include file="../common/taglib.jsp"%>
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
                                        分润机构设置
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/profitArea/profitOrglist.do" id="searchForm">
                                               <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" > 
                                            	<input type="hidden" name="orgProp" value="${profitOrg.orgProp }">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6"
                                                            class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构编号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="orgUuid" value="${profitOrg.orgUuid }"
                                                                class="form-control input-small width-200px"
                                                                data-placement="bottom" title="" id="form-field-6"
                                                                data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6"
                                                            class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构名称:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="orgNm" value="${profitOrg.orgNm }"
                                                                class="form-control input-small width-200px "
                                                                data-placement="bottom" title="" id="form-field-6"
                                                                data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label
                                                            class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">经营城市:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select id="prov" name="prov"
                                                                class="chosen-select form-control width-48"
                                                                onchange="fillCitySelect('prov','cityCd','');">
                                                                <option value="0">请选择省份</option>
                                                                <c:forEach items="${provs }" var="prov">
                                                                    <option value="${prov.areaId }">${prov.areaNm}</option>
                                                                </c:forEach>
                                                            </select> <select id="cityCd" name="cityCd"
                                                                class="chosen-select form-control width-48">
                                                                <option value="0">请选择城市</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label
                                                            class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">归属分公司:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <div class="col-sm-8  no-padding">
                                                                <select id="branchAttribution" name="branchAttribution" 
                                                                    class="chosen-select form-control width-200px">
                                                                    <option value="">请选择</option>
                                                                    <c:forEach items="${orgList }" var="branchOrg">
                                                                        <option value="${branchOrg.orgUuid }"
                                                                            <c:if test="${branchOrg.orgUuid == profitOrg.branchAttribution }"> selected </c:if>>${branchOrg.orgNm}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label
                                                            class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">合作经理:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="empCooperateManagerNm" value="${profitOrg.empCooperateManagerNm }"
                                                                class="form-control input-small width-200px "
                                                                data-placement="bottom" title="" id="form-field-6"
                                                                data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label
                                                            class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">机构状态:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <div class="col-sm-8  no-padding">
                                                                <select class="chosen-select form-control width-200px"
                                                                    name="orgSts" disabled="disabled">
                                                                    <option value="" >所有</option>
                                                                    <option value="1" selected="selected" >正常</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label
                                                            class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">代理商等级:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <div class="col-sm-8  no-padding">
                                                                <select class="chosen-select form-control width-200px"
                                                                    name="agentLever">
                                                                    <option value="" >所有</option>
                                                                    <option value="1"<c:if test="${profitOrg.agentLever==1}"> selected="selected" </c:if> >黑名单</option>
                                                                    <option value="0"<c:if test="${profitOrg.agentLever==0}"> selected="selected" </c:if>>普通</option>
                                                                    <option value="2"<c:if test="${profitOrg.agentLever==2}"> selected="selected" </c:if>>★★</option>
                                                                    <option value="3"<c:if test="${profitOrg.agentLever==3}"> selected="selected" </c:if>>★★★</option>
                                                                    <option value="4"<c:if test="${profitOrg.agentLever==4}"> selected="selected" </c:if>>★★★★</option>
                                                                    <option value="5"<c:if test="${profitOrg.agentLever==5}"> selected="selected" </c:if>>★★★★★</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >创建时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="startCreate" value="${profitOrg.startCreate }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="endCreate" value="${profitOrg.endCreate }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >激活状态:</label>
                                                        <div class="col-sm-8   no-padding">
                                                        	<div class="col-sm-8   no-padding">
                                                        		<select class="chosen-select form-control width-200px"
                                                                    name="switch1Flag">
                                                                    <option value="0"<c:if test="${profitOrg.switch1Flag==0}"> selected="selected" </c:if> >全部</option>
                                                                    <option value="1"<c:if test="${profitOrg.switch1Flag==1}"> selected="selected" </c:if>>已激活</option>
                                                                    <option value="2"<c:if test="${profitOrg.switch1Flag==2}"> selected="selected" </c:if>>未激活</option>                                                                    
                                                                </select>
                                                        	</div>                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button" onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
                                                    清空检索条件
                                                </button>
                                                <button class="btn btn-primary btn-sm" type="button" onclick="findOrgExcelInfo()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                       导出
                                                </button>
                                                <a class="btn btn-primary btn-sm saveBtn" href="/profitArea/downloadOrgExcel" >
													<span
														class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
													下载模板
												</a>
                                                 <button class="btn btn-danger btn-sm" type="button"  onclick="profitOrgUpExcel()">
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
                                                    <th width="7%">代理商编号</th>
                                                    <th width="7%">机构编号</th>
                                                    <th width="12%">机构名称</th>
                                                    <th width="12%">所属分公司</th>
                                                    <th width="12%" >创建时间</th>
                                                    <th width="6%" >状态</th>
                                                    <th width="8%" >代理商等级</th>
                                                    <th width="10%" >合作经理</th>
                                                    <th width="6%" >激活状态</th>
	                                                <th width="6%">  设置状态 </th>

                                                <th  style="text-align: center;width: 20%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                             <c:forEach  items="${profitOrgList }" var="org">
                                              <tr>
                                              <td align="center">${org.agentNumber }</td>
                                              <td align="center">${org.orgUuid }</td>
                                              <td>${org.orgNm }</td>
                                              <td>${org.branchAttributionName }</td>
                                              <td align="center">${org.dateCreatedStr }</td>
                                              <td align="center">${org.orgStsStr }</td>
                                              <td align="center">${org.agentLeverStr }</td>
                                              <td>${org.empCooperateManagerNm }</td>
                                              <td align="center">
                                              <c:if test="${org.switch1Flag==1}">
                                                 	<font color=green> 已激活</font>
                                              </c:if>
                                              <c:if test="${org.switch1Flag==0}">
                                                	未激活
                                              </c:if>
                                              </td>
                                              <td style="text-align: center;">${org.setSts}</td>
                                              
                                              <td style="text-align: left;">
								                 <div class="   action-buttons">
								                 <c:if test="${loginUserPermission.SMSA_PROFIT_006!=null }">
								                    <c:if test="${org.setSts=='未设置' }">
								                      <a href="#" class="green" id="edit" onclick="showAddOrgView('${org.orgUuid }','${org.orgNm }');" >
	                                                            <i class="ace-icon fa fa-edit  blue bigger-130"><font size="2"> 设置</font></i>
	                                                  </a>
	                                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								                    </c:if>
								                 </c:if>
								                  <c:if test="${loginUserPermission.SMSA_PROFIT_008!=null }">
	                                                 <c:if test="${org.setSts=='已设置' }">
								                      <a href="#" class="green" id="edit" onclick="showEditOrgView('${org.orgUuid }','${org.orgNm }');" >
	                                                            <i class="ace-icon fa fa-edit  blue bigger-130"><font size="2"> 修改</font></i>
	                                                  </a>
	                                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								                   </c:if> 
	                                                  <a href="#" class="green" id="edit" onclick="seeDetailOrg('${org.orgUuid }','${org.orgNm }');" >
	                                                            <i class="ace-icon fa fa-search-plus blue bigger-130"><font size="2"> 查看</font></i>
	                                                 </a>
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
    function findOrgExcelInfo(){
		$("#searchForm").attr("action","<%=request.getContextPath()%>/profitArea/findOrgExcelInfo");
		document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","<%=request.getContextPath()%>/profitArea/profitOrglist");
	}
    
    
    function profitOrgUpExcel(){
 	   $.fancybox.open({
			href : '<%=request.getContextPath() %>/profitArea/profitOrgUpExcel',
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
    
        /* var pcd = $("#pcd").val();
        fillProvSelect('provCd',pcd); */
        
        $(function(){
        
        	$('.chosen-select').chosen({}); 
        	
        	getTopOrgList();

            $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
            
            
            $(function(){
                
                if('${profitOrg.prov}' != ''){
                    $("#prov").val('${profitOrg.prov}');
                    $("#prov").trigger("chosen:updated");
                    fillCitySelect('prov','cityCd','');
                    $("#cityCd").val(${profitOrg.cityCd});
                    $("#cityCd").trigger("chosen:updated");
                }
                
                
            });

        });
        
        
        function seeDetailOrg(areaId,areaNm){
        	$.fancybox.open({
    			href : '<%=request.getContextPath() %>/profitArea/showOrgProfitDetailView?orgNo='+areaId+'&orgNm='+areaNm,
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

       
       
       function showAddOrgView(areaId,areaNm){
           var provCd = $("#orgNo").val();
           $.fancybox.open({
            href : '<%=request.getContextPath() %>/profitArea/showAddOrgView?orgNo='+areaId+'&orgNm='+areaNm,
            type: 'iframe',
               padding: 5,
               scrolling: 'no',
               fitToView: true,
               width: 1100,
               height: 600,
               autoSize: false,
               closeClick: false,
            afterClose:function(){
                window.location.href='<%=request.getContextPath()%>/profitArea/profitOrglist.do?provCd='+provCd; 
            }
        });
           
           
       }
       
       
       
       function showEditOrgView(areaId,areaNm){
    	   var provCd = $("#provCd").val();
    	   $.fancybox.open({
   			href : '<%=request.getContextPath() %>/profitArea/showEditProfitOrgView?orgNo='+areaId+'&orgNm='+areaNm,
   			type: 'iframe',
               padding: 5,
               scrolling: 'no',
               fitToView: true,
               width: 1100,
               height: 600,
               autoSize: false,
               closeClick: false,
   			afterClose:function(){
   				window.location.href='<%=request.getContextPath()%>/profitArea/profitOrglist.do?provCd='+provCd; 
   			}
   		});
       }
        
       function getTopOrgList(){
    	    var branchOrgUuid = $("#hiddenOrgNo").val();
    	    $.ajax({
    	        url: '/commonUtils/getTopOrgList',
    	        async:true,
    	        cache: true,
    	        success : function(orgList) {
    	            if(orgList != null && orgList !=undefined){
    	                 var options = "<option value=''>请选择</option>";
    	                 for(var i=0;i<orgList.length;i++){
    	                     if(orgList[i].ORG_UUID == branchOrgUuid){
    	                         options+="<option selected='selected' value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
    	                     }else{
    	                         options+="<option value=\""+orgList[i].ORG_UUID+"\">"+orgList[i].ORG_NM+"</option>";
    	                     }
    	                 }
    	                 $("[name=orgNo").html(options);
    	                 $("[name=orgNo").trigger("chosen:updated");
    	            }
    	        }
    	    });
    	}
       
       
       function resetMecForm(){
       	$(':input','#searchForm')  
         	 .not(':button, :submit, :reset, :hidden')  
         	 .removeAttr('checked')  
         	 .removeAttr('selected'); 
         	$("input[name='orgUuid']").val('');
      	 	$("input[name='orgUuid']").trigger("chosen:updated");
      	 	$("input[name='orgNm']").val('');
      	 	$("input[name='orgNm']").trigger("chosen:updated");
      	 	$("select[name='prov']").val('0');
      	 	$("select[name='prov']").trigger("chosen:updated");
      	 	$("select[name='cityCd']").val('0');
      	 	$("select[name='cityCd']").trigger("chosen:updated");
      	 	$("select[name='branchAttribution']").val('');
      	 	$("select[name='branchAttribution']").trigger("chosen:updated");
      	 	$("input[name='empCooperateManagerNm']").val('');
      	 	$("input[name='empCooperateManagerNm']").trigger("chosen:updated");
      	 	$("select[name='orgSts']").val('1');
      	 	$("select[name='orgSts']").trigger("chosen:updated");
      	 	$("select[name='agentLever']").val('');
      	 	$("select[name='agentLever']").trigger("chosen:updated");
      	 	$("input[name='startCreate']").val('');
      	 	$("input[name='startCreate']").trigger("chosen:updated");
      	 	$("input[name='endCreate']").val('');
      	 	$("input[name='endCreate']").trigger("chosen:updated");
      	 	//激活状态清空
      	 	$("select[name='switch1Flag']").val('0');
      	 	$("select[name='switch1Flag']").trigger("chosen:updated");
   	}


    
</script>
</body>
</html>











