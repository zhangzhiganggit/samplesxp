<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

	<%@include file="../layout/common.jsp"%>
	<%@include file="../common/taglib.jsp"%>
	<script src="<%=request.getContextPath()%>/js/common/common.js"></script>
	
	<script type="text/javascript">
    	function taskEnd(){
    		var businessKey = $("[name=businessKey]").val().trim();
    		if(!businessKey){
    			alert("工单号不能为空");
    			return ;
    		}
    		$.ajax({
    			url:"/mercIncomeEntering/taskEnd",
    			type:"post",
    			data:{"businessKey":businessKey},
    			success:function(data){
    				data = eval("("+data+")");
    				alert(data.message);
    				$("[name = businessKey]").val("");
    			}
    		});
    	}
    </script>
</head>
<body class="no-skin ">
	<div class="main-container" id="main-container">
		<div class="main-content ">
			<div class="main-content-inner ">
				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal3" style="opacity: 1;" >
								<div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table">
                                        	结束工单
                                        </i>
                                    </h5>
                                </div>
                                <input type="hidden" id="strMsg" value="${strMsg}">
                                <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/mercIncomeEntering/taskEnd" id="searchForm" method="post"  enctype="multipart/form-data">
	                                <div class="widget-body">
	                                	<div class="widget-main no-padding ">
	                                		<div class="widget-main ">
	                                			<div class=" col-xs-12">
		                               				<div class="form-group form-group-sm width-300px" style="width: 810px;">
	                                                   <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >工单编号:</label>
	                                                   <div class="col-sm-8  no-padding"  >
	                                                       <input type="text" name="businessKey" value="${businessKey}"  class="form-control input-small width-300px" style="width: 500px;" data-placement="bottom" title=""  id="businessKey" data-rel="tooltip" data-original-title="Hello Tooltip!">
	                                                   </div>
	                                               </div>
	                                			</div>
	                                			
												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px" style="width: 810px;">
														<label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结束原因:</label>
														<div class="col-sm-8  no-padding">
															<input type="text" name="stopReason" class="form-control input-small width-300px"
																style="width: 500px;" data-placement="bottom" title="" id="stopReason"
																value="${stopReason }" data-rel="tooltip" data-original-title="Hello Tooltip!">
														</div>
													</div>
												</div>

												<div class=" col-xs-12">
													<div class="form-group form-group-sm width-300px">
														<input type="text" name="strMsg" class="form-control input-small width-300px"
															style="width: 500px; border: none; padding-left: 100px;<c:if test="${strMsg != '操作成功' }">color:red;</c:if>"
															data-placement="bottom" title="" id="strMsg"
															value="${strMsg }" onfocus="this.blur();" data-rel="tooltip" data-original-title="Hello Tooltip!">
													</div>
												</div>
												<div align="center">
		                                			<button class="btn btn-normal btn-sm" type="submit" >
	                                                   <span class="ace-icon fa fa-search icon-on-right bigger-110">
	                                                   	提交
	                                                   </span>
		                                            </button>
	                                			</div>
	                                		</div>
	                                	</div>
	                                </div>
                                </form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript">
		jQuery(function ($) {
	
		    $('#searchForm').formValidation({
		        message: 'This value is not valid',
		        container: 'popover',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            stopReason: {
		                validators: {
		                    notEmpty: {
		                        message: '结束原因不能为空'
		                    },
		                    stringLength: {
		                        message: "只能输入20个汉字",
		                        max: 40
		                    },
		                    notRegexp: {
		                        message: "不能输入特殊字符",
		                        regexp: "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？《》]"
		                    }
		                }
		            },
		            businessKey: {
		                validators: {
		                    notEmpty: {
		                        message: '工单号不能为空'
		                    }
		                }
		            }
		        }
		    });
		})
	</script>
</body>
</html>