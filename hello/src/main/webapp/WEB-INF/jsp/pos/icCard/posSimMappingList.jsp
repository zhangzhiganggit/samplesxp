<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../../layout/common.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/common/common.js"></script>
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
                                        机卡绑定信息查询条件
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/posSimMapping/list.do" id="searchForm" method="post">
                                            	<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" id="isFirstLoad" name="isFirstLoad" value="false" />
                                                <div class=" col-xs-12"> 
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="mno" id="mno" value="${simCard.mno }" class="form-control input-small width-200px"  onkeyup="javascript:this.value=this.value.replace(/\s/g,'');">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >IMSI号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="imsi" id="imsi" value="${simCard.imsi }" class="form-control input-small width-200px" onkeyup="javascript:this.value=this.value.replace(/\s/g,'');" >
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >IMSI标识:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <select data-placeholder="请选择" id="imsiIden" name="imsiIden"  "
                                                              class="chosen-select form-control width-200px" >
                                                               <option value="">全部</option>
                                                                <option value=1 <c:if test="${simCard.imsiIden == 1}">selected="selected"</c:if>>其他</option>
                                                                <option value=2 <c:if test="${simCard.imsiIden == 2}">selected="selected"</c:if>>有效</option>
                                                                <option value=3 <c:if test="${simCard.imsiIden == 3}">selected="selected"</c:if>>重复</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >SIM卡号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="simCard" id="simCard" value="${simCard.simCard }" class="form-control input-small width-200px" onkeyup="javascript:this.value=this.value.replace(/\s/g,'');" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >IMEI号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="imei" id="imei" value="${simCard.imei }" class="form-control input-small width-200px"  onkeyup="javascript:this.value=this.value.replace(/\s/g,'');">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >版本号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="version" id="version" value="${simCard.version }" class="form-control input-small width-200px" onkeyup="javascript:this.value=this.value.replace(/\s/g,'');" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备序列号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="factSn" id="factSn" value="${simCard.factSn }" class="form-control input-small width-200px"  onkeyup="javascript:this.value=this.value.replace(/\s/g,'');">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >厂商简称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <select data-placeholder="请选择" id="factId" name="factId"  onchange="changeFactId()"
                                                              class="chosen-select form-control width-200px" >
                                                               <option value="">全部</option>
																<c:if test="${!empty manuFactoryList }">
																	<c:forEach items="${manuFactoryList}" var="item">
																		<option value="${item.factId}"
																		<c:if test="${item.factId==simCard.factId}"> selected </c:if>>${item.factShortname}</option>									
																    </c:forEach>
																</c:if>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >设备型号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="modId" name="modId" 
                                                              class="chosen-select form-control width-200px" >
                                                               <option value="">全部</option>
																<c:if test="${!empty adList }">
																	<c:forEach items="${adList}" var="item">
																	    <option value="${item.modId}"
																		<c:if test="${item.modId==simCard.modId}"> selected </c:if>>${item.modNm}</option>
																	</c:forEach>
																</c:if>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">最后签到时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="signTimeStart" id="signTimeStart" value="${simCard.signTimeStart }" class="input-small form-control">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>

                                                                <input type="text" name="signTimeEnd" id="signTimeEnd" value="${simCard.signTimeEnd }" class="input-small form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit" onclick="return checkForm();" id="searchMobBtn">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button" onclick="resetSearchForm()">
													<span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
				  清空检索条件
												</button>
                                                <button class="btn btn-primary btn-sm" type="button" onclick="uploadExcel()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                    当前绑定关系导出
                                                </button>
                                                <button class="btn btn-primary btn-sm" type="button"  onclick="uploadHisExcel()">
                                                    <span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
                                                                                                                                  历史绑定关系导出
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
                                        机卡绑定信息查询结果
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width: 8%">归属分公司</th>
                                                <th style="text-align:center;width: 8%">商户编号</th>
                                                <th style="text-align:center;width: 10%">设备序列号</th>
                                                <th style="text-align:center;width: 7%">厂商简称</th>
                                                <th style="text-align:center;width: 7%">设备型号</th>
                                                <th style="text-align:center;width: 7%">版本号</th>
                                                <th style="text-align:center;width: 5%">是否携机</th>
                                                <th style="text-align:center;width: 8%">SIM卡卡号</th>
                                                <th style="text-align:center;width: 5%">SIM卡来源</th>
                                                <th style="text-align:center;width: 7%">IMSI号</th>
                                                <th style="text-align:center;width: 5%">IMSI号标识</th>
                                                <th style="text-align:center;width: 7%">IMEI号</th>
                                                <th style="text-align:center;width: 8%">最后签到时间</th>
                                                <th style="text-align:center;width: 8%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            	<c:forEach items="${simCardList}" var="simCard" varStatus="status">
													<tr>
														<td style="text-align:center">${simCard.branchNm}</td>
														<td style="text-align:left">${simCard.mno}</td>
														<td style="text-align:center">${simCard.factSn}</td>
														<td style="text-align:left">${simCard.factShortName}</td>
														<td style="text-align:center">${simCard.modName}</td>
														<td style="text-align:center">${simCard.version}</td>
														<td style="text-align:center">
														    <c:if test="${simCard.mercOwn ==0}" >否</c:if>
									                        <c:if test="${simCard.mercOwn ==1}" >是</c:if>
														
														</td>
														<td style="text-align:center">${simCard.simCard}</td>
														<td style="text-align:center">
														    <c:if test="${simCard.simSource ==1}" >自采</c:if>
									                        <c:if test="${simCard.simSource ==2}" >非自采</c:if>
									                        <c:if test="${simCard.simSource ==3}" >其他</c:if>
														</td>
														<td style="text-align:center">${simCard.imsi}</td>
														<td style="text-align:center">
														    <c:if test="${simCard.imsiIden==1}" >其他</c:if>
									                        <c:if test="${simCard.imsiIden==2}" >有效</c:if>
									                        <c:if test="${simCard.imsiIden==3}" >重复</c:if>
														</td>
														<td style="text-align:center">${simCard.imei}</td>
														<td style="text-align:center"> ${simCard.signTime}</td>
														<td>
															<a href="javaScript:openIframe('${simCard.factSn}','${simCard.factId}','${simCard.bindTime}','${simCard.inMno}')" class="blue">查看详情</a>
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

        $('#searchForm').bootstrapValidator({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                lastName: {
                    validators: {
                        notEmpty: {},
                        stringCase: {
                            'case': 'upper'
                        }
                    }
                }
            }
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
    })
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
        
    function openIframe(factSn,factId,bindTime,inMno){
    	var href = '<%=request.getContextPath() %>/posSimMapping/detail.do?factSn='+factSn+'&factId='+factId+'&bindTime='+bindTime+'&inMno='+inMno;
    	$.fancybox.open({
			href : href,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: 900,
            height: 500,
	        autoSize: false,
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
    function uploadExcel(){
		$("#searchForm").attr("action","<%=request.getContextPath()%>/posSimMapping/uploadExcel.do");
		document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","<%=request.getContextPath() %>/posSimMapping/list.do");
	}
    function uploadHisExcel(){
		$("#searchForm").attr("action","<%=request.getContextPath()%>/posSimMapping/uploadHisExcel.do");
		document.getElementById("searchForm").submit();
		$("#searchForm").attr("action","<%=request.getContextPath() %>/posSimMapping/list.do");
	}
    function resetSearchForm(){
    	$(':input','#searchForm') 
      	 .not(':button, :submit, :reset, :hidden')
      	 .val('')  
      	 .removeAttr('checked')  
      	 .removeAttr('selected');
    	
      	 $("#imsiIden").val('');
      	 $("#imsiIden").trigger("chosen:updated");
      	 $("#factId").val('');
 		 $("#factId").trigger("chosen:updated");
 		 $("#modId").chosen("destroy"); 
 		 $("#modId").trigger("chosen:updated");
 	     $("#modId").html('<option value="">全部</option>');
 	     $("#modId").chosen({});
	     $("#modId").trigger("chosen:updated");
      	 
      }

    //提交前校验
    function checkForm(){
    	var startTime=$("#signTimeStart").val();  
        var start=new Date(startTime.replace("-", "/").replace("-", "/"));  
        var endTime=$("#signTimeEnd").val(); 
        var end=new Date(endTime.replace("-", "/").replace("-", "/")); 
        if(end<start){
        	alert("最后签到时间起始时间不能大于结束时间!");
        	return false;
        }else{
          	 $("#searchMobBtn").removeAttr("disabled");
            }  
   		 return true;
    }
  //厂商简称和型号下拉框变动	
	  function changeFactId() {
			var fact_id = $("#factId").val();
			var mobj = $("#modId");
			var option="<option value=''> 请选择...  </option>";
			mobj.empty();
			$.ajax({
				url : '/posSimMapping/changeFactId',
				data : {fact_id : fact_id},
				cache : true,
				async : false,
				success : function(data) {
					debugger
					for (var i = 0; i < data.length; i++) {
						option+="<option value='"+data[i].modId+"'>" + data[i].modNm + "</option>";
					}
					$("#modId").html(option);
					$("#modId").trigger("chosen:updated");
				}
			});
		}
</script>
</body>
</html>