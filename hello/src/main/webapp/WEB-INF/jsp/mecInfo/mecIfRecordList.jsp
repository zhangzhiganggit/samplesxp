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
                                        备案商户查询条件
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


                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/mecRecordOper/mecRecordList.do" id="searchForm" method="post" >
                                              <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                                <div class=" col-xs-12">
                                                <input id="flg" name="flg" value="1" style="display: none">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                         	<select id="branchOrgNo" name="branchOrgNo" data-placeholder="请选择"  class="chosen-select form-control width-200px">
                                                                 <option value="">全部</option>
                                                                <c:forEach items="${orgListB }" var="org" >
                                                                	<option value="${org.orgUuid }"
                                                                		<c:if test="${mr.branchOrgNo == org.orgUuid }"> selected </c:if>
                                                                	>${org.orgNm }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >导入时间:</label>

                                                        <div class="col-sm-8   no-padding">

                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" id="dateStart" name="dateStart" value="${mr.dateStart }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" id="dateEnd" name="dateEnd" value="${mr.dateEnd }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >个体结算人<br />身份证号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="idCardNo" name="idCardNo" value="${mr.idCardNo }" class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="orgNo" name="orgNo" value="${mr.orgNo }" class="form-control input-small width-200px " data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否用于<br />商户进件:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                           <select id="recordFlg" name="recordFlg" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                                 <option value="">全部</option>
                                                                <option value="01" <c:if test="${mr.recordFlg=='01' }">selected</c:if>>是</option>
                                                                <option value="02" <c:if test="${mr.recordFlg=='02' }">selected</c:if>>否</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <br />
                                                   </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                 <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
													清空检索条件
                                                </button> 
                                                <button class="btn btn-primary btn-sm" type="button" id="exp"  onclick="dowmRecord()">
                                                   <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                 导出检索结果
                                                </button>
                                                <button class="btn btn-primary btn-sm" type="button"  onclick="downRecordExl()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                 下载模板
                                                </button>
                                                 <button class="btn btn-danger btn-sm" type="button" onclick="importRecordView()">
                                                    <span class="ace-icon fa fa-th-list icon-on-right bigger-110"></span>
                                                   批量导入
                                                </button> 
                                                <button class="btn btn-danger btn-sm" type="button"  onclick="batchDelRecord()">
                                                    <span class="ace-icon fa fa-trash-o icon-on-right bigger-110"></span>
                                                 删除
                                                </button>
                                                  
                                            </form>
                                            <form id="down" action="<%=request.getContextPath()%>/mecRecordOper/downRecordExl.do" method="post">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        备案商户查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 5%">
                                                     <input type="checkbox" class="ace "  id="ckAll" name="ckAll">
                                                     <span class="lbl middle">全选</span>
                                                 </th>
                                                <th style="text-align: center;width: 9%">  结算户名 </th>
                                                <th style="text-align: center;width: 13%">  结算账号</th>
                                                <th style="text-align: center;width: 8%">联系人手机号</th>
                                                <th style="text-align: center;width: 11%">个体结算人身份证号</th>
                                                <th style="text-align: center;width: 9%">机构编号</th>
                                                <th style="text-align: center;width: 9%">归属分公司</th>
                                                <th style="text-align: center;width: 9%">导入人账号</th>
                                                <th style="text-align: center;width: 13%">导入时间</th>
                                                <th style="text-align: center;width: 7%">用于商户<br />进件次数</th>
                                                <th  style="text-align: center;width: 6%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                           <c:forEach items="${list}" var="de"  varStatus="status">
													<tr class="trRow"">
														<td class="" style="text-align: center;">
														<c:if test="${de.recordCount==0 }">
                                                          <input type="checkbox" class="ace abc" id="sub" name="sub">
                                                          <span class="lbl middle"></span>
                                                          </c:if>
                                                       </td>
                                                        <td class="uuid" style="display: none;">${de.uuid }</td>
														<td style="text-align: center;">${de.stmActNm }</td>
														<td style="text-align: left;">${de.stmAct }</td>
														<td style="text-align: left;" class="hiddenMainInfo">${de.telNo }</td>
														<td style="text-align: left;">${de.idCardNo }</td>
														<td style="text-align: center;">${de.orgNo}</td>
														<td style="text-align: center;">${de.branchOrgNm}</td>
														<td style="text-align: center;">${de.operNo}</td>
														<td style="text-align: center;">${de.importDt }</td>
														<td class="recordCount" style="text-align: center;">${de.recordCount }</td>
														
														
														<td   style="text-align: center;">
														     <c:if test="${de.recordCount==0 }">
										                     <div class="   action-buttons">
										                         <a href="#" onclick="delOneRecord('${de.uuid}','${de.recordCount }')" class="blue fancybox-manual-b">
										                             <i class="ace-icon fa fa-trash-o icon-on-right bigger-110"><font size="2">删除</font></i>
										                         </a>
										                     </div>
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

    <%-- <%@include file="../layout/footer.jsp"%> --%>
    <%@include file="../layout/common.alljs.jsp"%>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    function resetMecForm(){
   	 $(':input','#searchForm')  
   	 .not(':button, :submit, :reset, :hidden')  
   	 .val('')  
   	 .removeAttr('checked')  
   	 .removeAttr('selected'); 
		 $("#recordFlg").val('');
		 $("#recordFlg").trigger("chosen:updated");		
		 $("#branchOrgNo").val('');
		 $("#branchOrgNo").trigger("chosen:updated");	
    }
    
    function importRecordView(){
    	document.getElementById("exp").disabled=true;
    	$.fancybox.open({
    		href : '<%=request.getContextPath() %>/mecRecordOper/importView.do',
			type: 'iframe',
	        padding: 5,
	        scrolling: 'no',
	        fitToView: true,
	        width: 600,
	        height: 500,
	        autoSize: false,
	        closeClick: false,
	        afterClose:function(){
				   window.location.href='<%=request.getContextPath() %>/mecRecordOper/mecRecordList.do?orgNo='+$("#orgNo").val()+'&branchOrgNo='+$("#branchOrgNo").val()+'&dateStart='+$("#dateStart").val()+'&dateEnd='+$("#dateEnd").val()+'&idCardNo='+$("#idCardNo").val()+'&recordFlg='+$("#recordFlg").val();
			}
        });
    };
    
    
    function downRecordExl(){
    	document.getElementById("down").submit();
    }
    function dowmRecord(){
		$("#searchForm").attr("action","<%=request.getContextPath()%>/mecRecordOper/dowmRecord.do");
			document.getElementById("exp").disabled=true;
			document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","<%=request.getContextPath()%>/mecRecordOper/mecRecordList.do");
		document.getElementById("exp").disabled=false;
	}
        function delOneRecord(uuid,recordCount){
        	  var count = recordCount*1;
        	  if(count>0){
        		  alert("该备案商户已用于商户进件,不可进行删除");
        		  return;
        	  }
        	  var res = confirm("确定要删除吗?");
	      	  if(res){
	      		  $.ajax({
	     			   type: "POST",
	     			   url: "<%=request.getContextPath() %>/mecRecordOper/delRecord.do",
	     		       data : {uuid:uuid,flg:1},
	     			   success: function(data){
	     				   alert(data.msg);
	     				   window.location.href='<%=request.getContextPath() %>/mecRecordOper/mecRecordList.do?orgNo='+$("#orgNo").val()+'&branchOrgNo='+$("#branchOrgNo").val()+'&dateStart='+$("#dateStart").val()+'&dateEnd='+$("#dateEnd").val()+'&idCardNo='+$("#idCardNo").val()+'&recordFlg='+$("#recordFlg").val();
	     			   }
	     			});
	      	  }
        }
        
        
        $("#ckAll").click(function() {
            $("input[name='sub']").prop("checked", this.checked);
          });
          
          $("input[name='sub']").click(function() {
        	    var $subs = $("input[name='sub']");
        	    $("#ckAll").prop("checked" , $subs.length == $subs.filter(":checked").length ? true :false);
          });
        
           function batchDelRecord(){
        	  var incomeNum = 0;
        	  var dateArray = [];
        	  $(".abc:checked").each(function(){
          		var parent = $(this).parents(".trRow");
          		       var num = parent.find(".recordCount").text();
          		       num=num*1;
          		       if(num==0){
           				dateArray.push(new myObject(parent.find(".uuid").text())); 
          		       }else{
          		    	 incomeNum++;
          		       }
        		});
        	  
        	  if(dateArray.length == 0){
          		alert("请选中要删除的备案商户！");
          		return;
              }
        	  if(incomeNum>0){
        		  var res = confirm("有"+incomeNum+"条记录已用于商户进件，不能进行删除，是否要继续?");
            	  if(res){
            		  var jsonStr = JSON.stringify(dateArray);
                	  $.ajax({
            			   type: "POST",
            			   url: "<%=request.getContextPath() %>/mecRecordOper/delRecord.do",
            		       data : {jsonStr:jsonStr,flg:2},
            			   success: function(data){
            				   alert(data.msg);
    	     				   window.location.href='<%=request.getContextPath() %>/mecRecordOper/mecRecordList.do?orgNo='+$("#orgNo").val()+'&branchOrgNo='+$("#branchOrgNo").val()+'&dateStart='+$("#dateStart").val()+'&dateEnd='+$("#dateEnd").val()+'&idCardNo='+$("#idCardNo").val()+'&recordFlg='+$("#recordFlg").val();
            			   }
            			});
            	  }
        	  }else{
        		  var res = confirm("确定要删除吗?");
            	  if(res){
            		  var jsonStr = JSON.stringify(dateArray);
                	  $.ajax({
            			   type: "POST",
            			   url: "<%=request.getContextPath() %>/mecRecordOper/delRecord.do",
            		       data : {jsonStr:jsonStr,flg:2},
            			   success: function(data){
            				   alert(data.msg);
    	     				   window.location.href='<%=request.getContextPath() %>/mecRecordOper/mecRecordList.do?orgNo='+$("#orgNo").val()+'&branchOrgNo='+$("#branchOrgNo").val()+'&dateStart='+$("#dateStart").val()+'&dateEnd='+$("#dateEnd").val()+'&idCardNo='+$("#idCardNo").val()+'&recordFlg='+$("#recordFlg").val();
            			   }
            			});
            	  }
        	  }
        	  
          }
          
          function myObject(uuid,recordCount){ 
        	    this.recordCount = recordCount;
        	  	this.uuid = uuid;
        	 	return this;
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
        
</script>
</body>
</html>











