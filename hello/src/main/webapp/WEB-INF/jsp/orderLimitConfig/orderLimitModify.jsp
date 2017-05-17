<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
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
					<div class="row">
						<div class=" widget-container-col ui-sortable">
							<div class="widget-box widget-color-normal3">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i>
										订购限额设置修改
									</h5>
								</div>
								<div class="widget-main " style="padding-left: 20px" >
									<form id="searchForm"  class="form-inline form-horizontal" 
									action="/orderLimitConfig/batchImport" 
									method="post" enctype ="multipart/form-data">
									<input type="hidden" id="hidSumCanBuy" value="${orderLimitConfig.sumCanBuy }"/>
									<input type="hidden" id="hidSubModelId" value="${orderLimitConfig.subModelId }"/>
									<input type="hidden" id="hidOrgUuid" value="${orderLimitConfig.orgUuid }"/>
									<input type="hidden" id="subModelName" value="${orderLimitConfig.subModelName }"/>
										<div class=" col-xs-12">
											<div class="form-group form-group-sm width-300px">
												<label
													class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">小型号名称:</label>
	
												<div class="col-sm-8" style="padding-left: 8px">
													<input type="text" name="subModelId" value="${orderLimitConfig.subModelName }" readonly="readonly"
														class="form-control input-small width-200px "
														data-placement="bottom" title="" id="subModelId"
														data-rel="tooltip" data-original-title="Hello Tooltip!">
												</div>
											</div>
											<div class="form-group form-group-sm width-300px">
												<label for="form-field-6"
													class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">一代名称:</label>

												<div class="col-sm-8  no-padding">
													<input type="text" name="orgName" value="${orderLimitConfig.orgName }" readonly="readonly"
														class="form-control input-small width-200px "
														data-placement="bottom" title="" id="orgName"
														data-rel="tooltip" data-original-title="Hello Tooltip!">
												</div>
											</div>
											<div class="form-group form-group-sm width-310px">
												<label for="form-field-6"
													class="col-sm-4 control-label widget-color-normal5 width-110px no-padding-left">累计可购买台数:</label>

												<div class="col-sm-8  no-padding">
													<input type="text" name="sumCanBuy" value="${orderLimitConfig.sumCanBuy }"
														class="form-control input-small width-200px "
														data-placement="bottom" title="" id="sumCanBuy"
														data-rel="tooltip" data-original-title="Hello Tooltip!">
												</div>
											</div>
										</div>
										<div class="form-actions center widget-color-normal5">
											<button class="btn btn-danger  btn-sm" type="submit" onclick="return save()" id="sub">
												<span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
												提交
											</button>
											<button class="btn btn-default btn-sm" type="button"
												onclick="closeWindow();">
												<span
													class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
												取消
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
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript">
		$('.chosen-select').chosen({});
		function save() {
			var hidSumCanBuy = $("#hidSumCanBuy").val();
			var sumCanBuy = $("#sumCanBuy").val();
			if(hidSumCanBuy == sumCanBuy){
				$("button[type='submit']").removeAttr("id");
				alert("累计可购买台数未进行修改，保存失败");
				return false;
			}
			if(parseInt(sumCanBuy) > 10000000){
				$("button[type='submit']").removeAttr("id");
				alert("订购数量已超限，请修改");
				return false;
			}
			var hidOrgUuid = $("#hidOrgUuid").val();
			var hidSubModelId = $("#hidSubModelId").val();
			var flag = validateCount(hidOrgUuid,hidSubModelId);
			if(!flag){
				$("button[type='submit']").removeAttr("id");
				alert("此一代已购买数量超过限额");
				return false;
			}
			
			$("#sub").attr({"disabled":"disabled"});
			modifyOrderLimitSumCanBuy(hidSumCanBuy,sumCanBuy,hidOrgUuid,hidSubModelId);
		}

		function closeWindow(){
			window.parent.$.fancybox.close();
		};
		//校验可购买台数是否合理
		function validateCount(hidOrgUuid,hidSubModelId){
			var flag = true;
			$.ajax({
				url:"<%=request.getContextPath()%>/orderLimitConfig/validateCount",
				dataType:"json",
				type:"post",
				async : false,
				data:{"orgUuid":hidOrgUuid,"subModelId":hidSubModelId},
				success : function(data){
					if(data != null){
						var haveBuy = data.haveBuy;
						var sumCanBuy = $("#sumCanBuy").val();
						if(haveBuy > sumCanBuy){
							flag = false;
						}
					}else{
						flag = false;
					}
				}
			});
			return flag;
		};
		
		//更新累计可购买台数
		function modifyOrderLimitSumCanBuy(hidSumCanBuy,sumCanBuy,hidOrgUuid,hidSubModelId){
			var subModelName = $("#subModelName").val();
			$.ajax({
				url:"<%=request.getContextPath()%>/orderLimitConfig/modifyOrderLimitSumCanBuy",
				dataType:"json",
				type:"post",
				async : false,
				data:{"orgUuid":hidOrgUuid,"subModelId":hidSubModelId,"sumCanBuy":sumCanBuy,"hidSumCanBuy":hidSumCanBuy,"subModelName":subModelName},
				success : function(data){
					if(data){
						alert("修改成功");
						window.parent.$.fancybox.close();
						window.parent.location.reload();
					}else{
						alert("修改失败！");
					}
				}
			});
		}
		
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
                	sumCanBuy: {
                        validators: {
                        	notEmpty: {
                        		message: '累计可购买台数不能为空'
                        	},
                        	regexp: {
                                regexp: /^\+?[1-9]\d*$/,
                                message: '只能输入整数'
                            },
                        	stringLength: {
                                max: 7,
                                message: '最大可输入9999999'
                            }
                            
                        }
                    }
                }
            });
        });
	</script>
</body>
</html>











