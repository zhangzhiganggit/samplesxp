<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付Admin</title>

    <%@include file="../layout/common.jsp"%>
    <script type="text/javascript">

    </script>
    
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
                                        秒到查询条件
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/mecMDinfo/view.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
                                                <div class=" col-xs-12">
                                                    
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mecNo" id="mecNo" value="${mecMDinfo.mecNo }" class="form-control input-small width-200px"  
                                                             onkeyup="this.value=this.value.replace(/\D/g,'')"  onchange="fifteen()" >
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户名称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mecNm" id="mecNm" value="${mecMDinfo.mecNm }" class="form-control input-small width-200px">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >归属分公司:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="全部" id="branchNo" name="branchNo"  onchange="getOrg()" class="chosen-select form-control width-200px">
                                                                <c:if test="${orgNo=='0010000000'}">
                                                               		<option value="">全部</option>
                                                                </c:if>
                                                                <c:forEach items="${branchOrg}" var="branch">
                                                                	 <option value="${branch.orgUuid }"<c:if test="${mecMDinfo.branchNo == branch.orgUuid }"> selected="selected" </c:if>>${branch.orgNm }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属一代:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                        <input type="hidden" id="orgNo" value="${mecMDinfo.firstOrgNo }" />
                                                           <select data-placeholder="全部" id="firstOrgNo" name="firstOrgNo"   class="chosen-select form-control width-200px">
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >业务状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="全部" id="MDSts" name="MDSts"   class="chosen-select form-control width-200px">
                                                                <option value="">全部</option>
                                                                <option value="01" <c:if test="${mecMDinfo.MDSts == '01'}">selected="selected"</c:if>>开通</option>
                                                                <option value="00" <c:if test="${mecMDinfo.MDSts == '00'}">selected="selected"</c:if>>关闭</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">开通日期:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input  type="text" id ="startTimeStart" name="startTimeStart" value="${mecMDinfo.startTimeStart }" onchange="changeDateStart1()" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input  type="text" id="startTimeEnd" name="startTimeEnd" value="${mecMDinfo.startTimeEnd }" onchange="changeDateEnd1()" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="btn btn-normal btn-sm"  type="submit" >
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    	检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button"
													onclick="resetMecForm()">
													   <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span> 清空检索条件
												</button>
												<c:if test="${loginUserPermission.SMSA_MDMEC_INFO_002!=null }">
												 <button class="btn btn-primary btn-sm" type="button" onclick="exportDown()">
													<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
													导出
												 </button>
												 </c:if>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        秒到查询结果
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width: 8%">商户编号</th>
                                                <th style="text-align:center;width: 5%">商户名称</th>
                                                <th style="text-align:center;width: 3%">业务状态</th>
                                                <th style="text-align:center;width: 6%" hidden >秒到单笔交易上限</th>
                                                <th style="text-align:center;width: 6%" hidden >秒到日上限</th>
                                                <th style="text-align:center;width: 6%"  >费率</th>
                                                <th style="text-align:center;width: 6%">归属分公司</th>
                                                <th style="text-align:center;width: 6%">所属一代</th>
                                                <th style="text-align:center;width: 6%">直属代理</th>
                                                <th style="text-align:center;width: 4%">开通时间</th>
                                                <th style="text-align:center;width: 4%">进件日期</th>
                                              
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach items="${mDinfoList}" var="mecMD" varStatus="status">
													<tr>
														<td style="text-align:center">${mecMD.mecNo}</td>
														<td style="text-align:center">${mecMD.mecNm}</td>
														<c:if test="${mecMD.MDSts == '01'}"><td style="text-align:center">开通</td></c:if>
                                                        <c:if test="${mecMD.MDSts == '00'}"><td style="text-align:center">关闭</td></c:if>
														<td style="text-align:center" hidden >${mecMD.oneMDLimit}</td>
														<td style="text-align:center" hidden >${mecMD.dayMDLimit}</td>
														<td style="text-align:center" >
															<a href="javaScript:openIframe('${mecMD.mecNo}','${mecMD.mecNm}')" class="blue">
		                                            			<i class="ace-icon fa fa-search-plus  blue bigger-130"><font size="2">查看</font></i>
		                                            		</a>
														</td>
														<td style="text-align:center">${mecMD.branchNm}</td>
														<td style="text-align:center">${mecMD.firstOrgNm}</td>
														<td style="text-align:center">${mecMD.orgNm}</td>
														<td style="text-align:center">${mecMD.startTime}</td>
														<td style="text-align:center">${mecMD.dtCte}</td>
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

    <%@include file="../layout/common.js.jsp"%>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
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
            	stopTimeStart: {
                    validators: {
                        
                        dateSub: {
                        	dayLength:1
                        }
                    }
                },
                stopTimeEnd: {
                    validators: {
                        
                        dateSub: {
                        	dayLength:1
                        }
                    }
                },
                
                receDateStart: {
                    validators: {
                        
                        dateSubs: {
                        	dayLength:1
                        }
                    }
                },
                receDateEnd: {
                    validators: {
                        
                        dateSubs: {
                        	dayLength:1
                        }
                    }
                }
                
               }
        });

        $('.easy-pie-chart.percentage').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
            var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
            var size = parseInt($(this).data('size')) || 50;
            $(this).easyPieChart({
                barColor: barColor,
                trackColor: trackColor,
                scaleColor: false,
                lineCap: 'butt',
                lineWidth: parseInt(size/10),
                animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
                size: size
            });
        })

        $('.sparkline').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
            $(this).sparkline('html',
                {
                    tagValuesAttribute:'data-values',
                    type: 'bar',
                    barColor: barColor ,
                    chartRangeMin:$(this).data('min') || 0
                });
        });
        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
            var offset = $(this).offset();

            var $w = $(window)
            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                $(this).addClass('dropup');
            else $(this).removeClass('dropup');
        });



        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        })
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
		
        var orgNo=$("#orgNo").val();
        getOrg();
        if(orgNo!=null && orgNo!=""){
        	$("#firstOrgNo").val(orgNo);
        	$("#firstOrgNo").trigger("chosen:updated");
        }
        
        

    })
    
  //清空检索条件
    function resetMecForm(){
       	 $(':input','#searchForm') 
       	 .not(':button, :submit, :reset, :hidden')
       	 .val('')  
       	 .removeAttr('checked')  
       	 .removeAttr('selected');
       	
       	
       	 $("#branchNo").val('');
    	 $("#branchNo").trigger("chosen:updated");
    	 $("#firstOrgNo").val('');
   		 $("#firstOrgNo").trigger("chosen:updated");
    	 $("#MDSts").val('');
   		 $("#MDSts").trigger("chosen:updated");
   		 
   	}
    function changeDateStart1(){
  		 var creStartTm=Number($("#startTimeStart").val().replace(/-/g,''));
  		 var creEndTm=Number($("#startTimeEnd").val().replace(/-/g,''));
  		 if(creEndTm!=0){
  			 if(creStartTm>creEndTm){
  				 $("#startTimeEnd").val($("#startTimeStart").val());
  			 }
  		 }
  	 }
  	 function changeDateEnd1(){
  		 var creStartTm=Number($("#startTimeStart").val().replace(/-/g,''));
  		 var creEndTm=Number($("#startTimeEnd").val().replace(/-/g,''));
  		 if(creStartTm!=0){
  			 if(creStartTm>creEndTm){
  				 $("#startTimeStart").val($("#startTimeEnd").val());
  			 }
  		 }
  	 }
     
  	 function fifteen(){
  		debugger;
  		 var mecNo=$("#mecNo").val();
  		 var fifteen =/^\d{15}$/;
  		 if(!fifteen.test(mecNo)){
  			 alert("商户编号输入有误，必须是15数字");
  		 }
  	 }
  	 function getOrg(){
     	var orgUuid =$("#branchNo").val();
     	if(orgUuid!=null && orgUuid!=""){
 	    	$.ajax({ 
 	    		url:"<%=request.getContextPath() %>/IcCardManage/getOrg",
 				type:"GET",
 				data: {
 			    	   orgUuid : orgUuid
 		  		        },
 				async:false,
 				cache:false,
 				success:function(orgNameList){
 					if(orgNameList != null && orgNameList !=undefined){
 						var options = '';
 	      	 			options = "<option value=''>全部</option>";
 					for(var i=0;i<orgNameList.length;i++){
 						options+="<option value=\""+orgNameList[i].orgUuid+"\">"+orgNameList[i].orgNm+"</option>";
 			    	 }
 					 $("#firstOrgNo").html(options);
 			         $("#firstOrgNo").trigger("chosen:updated");
 					}
 				}
 			}); 
     	}
     }
 	
  	function exportDown(){
  		$("#searchForm").attr("action","<%=request.getContextPath()%>/mecMDinfo/uploadExcel.do");
		document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","<%=request.getContextPath() %>/mecMDinfo/view.do");
    }
  	function openIframe(mno,mecNm){
    	var href = '';
    	href = '<%=request.getContextPath() %>/mecMDinfo/getInfoRat?mno='+mno+'&mecNm='+mecNm;
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
		});
    }
</script>
</body>
</html>