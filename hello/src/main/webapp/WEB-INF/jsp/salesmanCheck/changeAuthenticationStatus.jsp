<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
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
                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5  class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        <span id="detailOrEdit">意见详情</span>
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" method="post" action="changeAuthenticationStatus">
                                                <div class=" col-xs-12">
                                                <br/> <br/>
                                                	<input type="hidden" name="empUuid" id="empUuid" value="${empUuid }">
                                                	<input type="hidden" name="signPerNo" id="signPerNo" value="${signPerNo }">
                                                	<input type="hidden" name="signPerDt" id="signPerDt" value="${signPerDt }">
                                                	<input type="hidden" name="flowNo" id="flowNo" value="${flowNo }">
                                             
                                                	<div class="form-group form-group-sm  width-300px">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >人员编号:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input name="empNo" id="empNo" readonly="readonly" class="form-control input-small width-200px   view-control  "
                                                             value="${empNo}" data-placement="bottom" data-trigger="hover" data-rel="popover"/>
                                                        </div>
                                                    </div>
                                                	<div class="form-group form-group-sm width-300px ">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">修改后状态<span style="color: red;">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<select data-placeholder="请选择" name="backStatus" id="backStatus" class="chosen-select form-control width-200px">
																<option value="" >请选择</option>
																<option value="01">未审核</option>
																<option value="02">审核通过</option>
																<option value="03">审核不通过</option>
															</select>
														</div>
													</div>
													<br/>
                                                	<div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >修改原因<span style="color: red;">*</span>:</label>
                                                        <div class="col-sm-8  no-padding width-85"  >
                                                            <textarea name="suggestion" id="suggestion" cols="165" rows="5" data-placement="bottom" data-trigger="hover" data-rel="popover" ></textarea>
                                                        </div>
                                                    </div>
                                                 </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                	<button id="" class="btn btn-danger  btn-sm" type="button" onclick="changeAuthenticationStatus();">
                                                        <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                                        提交
                                                    </button>
                                                    <button id="" class="btn btn-default  btn-sm" type="button" onclick="window.history.go(-1);">
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
                                                        返回
                                                    </button>
												</div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>
   
</div>
	<script type="text/javascript">
	$(function(){
		$('.chosen-select').chosen({});
	});
	
	function changeAuthenticationStatus(){
		var backStatus = $("#backStatus").val();
		var suggestion = $("#suggestion").val();
		var empUuid = $("#empUuid").val();
		var signPerDt = $('#signPerDt').val();
		var signPerNo = $('#signPerNo').val();
		var empNo = $('#empNo').val();
		var flowNo = $("#flowNo").val();
		if(backStatus == null || backStatus==''){
			alert("修改后状态不能为空");
			return;
		}
		if(suggestion == null || suggestion==''){
			alert("修改原因不能为空");
			return;
		}
		if(getLen(suggestion)>1000){
			alert("修改原因不能超过1000个字符");
			return;
		}
		var url = '<%=request.getContextPath() %>/salesmanCheck/changeAuthenticationStatus.do';
		$.ajax({
			url : url,
			data :
				{
				suggestion : suggestion,
				empUuid : empUuid,
				backStatus: backStatus,
				signPerDt: signPerDt,
				signPerNo: signPerNo,
				empNo: empNo,
				flowNo:flowNo
				},
			type : "post",
			cache : true,
			async : false,
			success : function(data) {
				alert(data);
				if(data=='修改成功'){
					location.href = '<%=request.getContextPath() %>/salesmanCheck/salesCheckList.do';
				}
			}
		});
	}
	 
	 
	function getLen(obj){
		var char = obj.replace(/[^\x00-\xff]/g, '**');
		return char.length;
	}
	
	</script>
    <%@include file="../layout/common.js.jsp"%>
</body>
</html>











