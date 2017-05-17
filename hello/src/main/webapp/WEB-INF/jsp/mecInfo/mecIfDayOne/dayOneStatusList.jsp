<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

   <%@include file="../../layout/common.css.jsp"%>
   
</head>

<body class="no-skin ">
    
  <%--   <%@include file="../layout/header.jsp"%> --%>

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
       <%--  <%@include file="../layout/menu.jsp"%> --%>

        <div class="main-content ">
            <div class="main-content-inner ">

               
                <div class="page-content ">

                    <div class="row" >


                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        商户D+1状态管理查询条件
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


                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecIfDayOneStatus/list.do" id="searchForm" method="post" >
                                              <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                            	<input type="hidden" id="showBranch" name="showBranch" value="${showBranch }">
                                                <div class=" col-xs-12">
                                                
                                                    <c:if test="${showBranch=='show' }">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司<font color="red">*</font>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="branchOrgNo" name="branchOrgNo" onchange="fillOrgSelect('branchOrgNo','orgNo','${mr.orgNo}')"  data-placeholder="请选择"  class="chosen-select form-control width-200px">
                                                                <option value="">请选择</option>
                                                                <c:forEach items="${orgListB }" var="org" >
                                                                	<option value="${org.orgUuid }"
                                                                		<c:if test="${mr.branchOrgNo == org.orgUuid }"> selected </c:if>
                                                                	>${org.orgNm }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                   <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属机构:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="orgNo" name="orgNo" data-placeholder="请选择"  class="chosen-select form-control width-200px">
                                                                
                                                            </select>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                     <c:if test="${showBranch=='noShow' }">
                                                        <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属一代:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="orgNo" name="orgNo"   data-placeholder="请选择"  class="chosen-select form-control width-200px">
                                                                <option value="">请选择</option>
                                                                <c:forEach items="${orgList }" var="org" >
                                                                	<option value="${org.orgUuid }"
                                                                		<c:if test="${mr.orgNo == org.orgUuid }"> selected </c:if>
                                                                	>${org.orgNm }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                     </c:if>
                                                      <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mno"  name="mno" value="${mr.mno }" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="cprRegNmCn" name="cprRegNmCn" value="${mr.cprRegNmCn }" class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >D+1状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="busSts" name="busSts"   data-placeholder="请选择"  class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
                                                                <option <c:if test="${mr.busSts == '3'}"> selected </c:if> value="3">未开通</option>
                                                                <option <c:if test="${mr.busSts == '1' }"> selected </c:if> value="1">正常</option>
                                                                <option <c:if test="${mr.busSts == '0' }"> selected </c:if> value="0">暂停</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
														<label
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">开通时间:</label>
														<div class="col-sm-8   no-padding">
															<div class="input-daterange input-group width-200px">
																<input type="text" id="startTime"
																	name="startTime"
																	value="${mr.startTime}"
																	class="input-small form-control"> <span
																	class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" id="endTime"
																	name="endTime"
																	value="${mr.endTime}"
																	class="input-small form-control">
															</div>
														</div>
													</div>
                                                    <input type="hidden" id="hiddenOrg" value="${mr.orgNo}">
                                                   </div>

                                                <button class="btn btn-normal btn-sm" type="button" onclick="valiDcount()">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                                                                                                    检索
                                                </button>
                                                 <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
                                                </button> 
                                                <button class="btn btn-primary btn-sm" type="button" onclick="downLoad()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                                                                         下载模板
                                                </button>
                                                 <button class="btn btn-danger btn-sm" type="button" onclick="openDataImportPage()">
                                                    <span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
                                                                                                                                                                                         批量导入开通
                                                </button>
                                                <button class="btn btn-primary btn-sm" type="button" onclick='exportResult()'>
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
                                        商户D+1状态管理查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 6%">序号</th>
                                                <th style="text-align: center;width: 12%">商户编号</th>
                                                <th style="text-align: center;width: 20%">商户名称</th>
                                                <th style="text-align: center;width: 15%">所属一代</th>
                                                <th style="text-align: center;width: 15%">直属代理商</th>
                                                <th style="text-align: center;width: 8%">D+1状态</th>
                                                <th style="text-align: center;width: 8%">开通时间</th>
                                                <th style="text-align: center;width: 8%">操作动作</th>
                                                <th style="text-align: center;width: 8%">操作记录</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                           <c:forEach items="${list}" var="de"  varStatus="status">
													<tr>
                                                        <td style="text-align: center;">${status.index+1 }</td>
														<td style="text-align: center;">${de.mno }</td>
														<td style="text-align: left;">${de.cprRegNmCn }</td>
														<td style="text-align: left;">${de.firstNm }</td>
														<td style="text-align: left;">${de.orgNm }</td>
														<td style="text-align: center;">${de.dayOneStr }</td>
														<td style="text-align: center;">${de.opDate}</td>
														
														<td style="text-align: center;">
														<c:if test="${de.canChangeState }">
														   <c:if test="${de.dayOneStr == '开通' || de.dayOneStr == '暂停' }">
														      <a href="#" onclick="operOne('${de.mno}','close')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa   blue bigger-130"><font size="2">关闭</font></i>
										                      </a>
														   </c:if>
														   <c:if test="${de.dayOneStr == '未开通'}">
														       <a href="#" onclick="operOne('${de.mno}','open')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa   blue bigger-130"><font size="2">开通</font></i>
										                       </a>
														   </c:if>
														</c:if>
														</td>
														
														<td style="text-align: center;">
														    <a href="#" onclick="operDetail('${de.inMno}','${de.mno}','${de.cprRegNmCn }')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa fa-search-plus   blue bigger-130"><font size="2">操作记录</font></i>
										                    </a>
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

    <%-- <%@include file="../layout/footer.jsp"%> --%>
    <%@include file="../../layout/common.alljs.jsp"%>
    <!-- inline scripts related to this page -->
     <script type="text/javascript">
     function exportResult(){
    	 var branchOrgNo = $("#branchOrgNo").val()||'';
    	 var orgNo = $("#orgNo").val();
    	 var cprRegNmCn = $("#cprRegNmCn").val();
    	 var mno = $("#mno").val();
    	 var busSts = $("#busSts").val();
    	 var showBranch = $("#showBranch").val();
    	 var startTime=$("#startTime").val();
    	 var endTime=$("#endTime").val();
    	 if(showBranch=='show' &&(branchOrgNo==''||branchOrgNo==null) &&(mno=='') &&(cprRegNmCn=='')){
    		 alert("请选择归属分公司");
    		 return;
    		}
    	 location.href='<%=request.getContextPath()%>/mecIfDayOneStatus/exportResult?branchOrgNo='+branchOrgNo
    			 +'&orgNo='+orgNo+'&cprRegNmCn='+cprRegNmCn+'&mno='+mno+'&busSts='+busSts
    			 +'&startTime='+startTime+'&endTime='+endTime;
     }
     
       var orgNo = $("#hiddenOrg").val();
       var showBranch = $("#showBranch").val();
       if(showBranch=='show'){
    	   fillOrgSelect('branchOrgNo','orgNo',orgNo);
       }
       
       
       function fillOrgSelect(branchOrgNo,orgNo,orgValue,isContainsEmptyOption){
       	var branchOrgNo = $("[name='"+branchOrgNo+"']").val();
       	if(branchOrgNo!=''){
       		$.ajax({
       	        url: '/mecIfDayOne/getOrgByBranchOrgNo',
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
    function resetMecForm(){
   	 $(':input','#searchForm')  
   	 .not(':button, :submit, :reset, :hidden')  
   	 .val('')  
   	 .removeAttr('checked')  
   	 .removeAttr('selected'); 
		 $("#orgNo").val('');
		 $("#orgNo").trigger("chosen:updated");		
		 $("#branchOrgNo").val('');
		 $("#branchOrgNo").trigger("chosen:updated");
		 $("#busSts").val('');
		 $("#busSts").trigger("chosen:updated");	
    }
  
    
    function valiDcount(){
    	var mno = $("#mno").val();
    	mno =mno.replace(/[ ]/g,""); 
    	var cprRegNmCn = $("#cprRegNmCn").val();
    	cprRegNmCn =cprRegNmCn.replace(/[ ]/g,"");
    	var branchOrgNo = $("#branchOrgNo").val();
    	var showBranch = $("#showBranch").val();
    	var startTime=$("#startTime").val();  
        var start=new Date(startTime.replace("-", "/").replace("-", "/"));  
        var endTime=$("#endTime").val(); 
        var end=new Date(endTime.replace("-", "/").replace("-", "/"));  
    	if(showBranch=='show' &&(branchOrgNo==''||branchOrgNo==null) &&(mno=='') &&(cprRegNmCn=='')){
    		alert("请选择归属分公司");
    		return;
    	}
    	if(end<start){
            alert("开通起始时间不能大于开通结束时间!");
            return;  
            }
    	else {
    		document.getElementById("searchForm").submit();
    	}
    }
    function operOne(mno,operFlg){
    	var oper = "关闭";
    	if(operFlg=='open'){
    		oper="开通";
    	}
    	if(!confirm("是否确认"+oper+"D+1")){
			return ;
		}
    	var flag='';
    	$.ajax({
	    	type: "POST",
	        url: "/mecIfDayOneStatus/operOne.do",
	        data:'operFlg='+operFlg+'&mno='+mno,
	        success: function(data){
		        flag=data.msgCode;
		        if(flag=='00'){
			    	alert("操作成功");
			    	var branchOrgNo = $("#branchOrgNo").val();
			    	var orgNo = $("#orgNo").val();
			    	var cprRegNmCn = $("#cprRegNmCn").val();
			    	var mno = $("#mno").val();
			    	var busSts = $("#busSts").val();
			    	window.location.href='<%=request.getContextPath()%>/mecIfDayOneStatus/list.do?branchOrgNo='+branchOrgNo+'&orgNo='+orgNo+'&cprRegNmCn='+cprRegNmCn+'&mno='+mno+'&busSts='+busSts;
		        }else{
		        	alert(data.msg);
				}
		    }
		});
    }  
   
    function operDetail(inMno,mno,cprRegNmCn) {
    	$.fancybox.open({
			href : '<%=request.getContextPath() %>/mecIfDayOneStatus/seeOperDetail.do?inMno='+inMno+'&mno='+mno+'&cprRegNmCn='+cprRegNmCn,
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 1100,
	        height: 300,
	        autoSize: false,
	        closeClick: false,
				afterClose:function(){
					
				}
			});
    }
    
    function downLoad(){
    	window.location.href='<%=request.getContextPath()%>/mecIfDayOneStatus/downExcel.do?';
    }
    
    function openDataImportPage(){
    	$.fancybox.open({
    		href : '<%=request.getContextPath() %>/mecIfDayOneStatus/importPage.do?',
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 800,
	        height: 500,
	        autoSize: false,
	        closeClick: false,
	        afterClose:function(){
	        	var branchOrgNo = $("#branchOrgNo").val();
		    	var orgNo = $("#orgNo").val();
		    	var cprRegNmCn = $("#cprRegNmCn").val();
		    	var mno = $("#mno").val();
		    	var busSts = $("#busSts").val();
		    	window.location.href='<%=request.getContextPath()%>/mecIfDayOneStatus/list.do?branchOrgNo='+branchOrgNo+'&orgNo='+orgNo+'&cprRegNmCn='+cprRegNmCn+'&mno='+mno+'&busSts='+busSts;
			}
        });
    }
    
    
    
    
    
    
        $('.chosen-select').chosen({});
        jQuery(function($) {
        	 $('#searchForm').formValidation({
                 message: 'This value is not valid',
                 container:'popover',
                 feedbackIcons: {
                     valid: 'glyphicon glyphicon-ok',
                     invalid: 'glyphicon glyphicon-remove',
                     validating: 'glyphicon glyphicon-refresh'
                 },
                 fields: {
                	 branchOrgNo : {
       					validators : {
       						
       						notEmpty: {}

       					}
       				}
                 }
             });
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











