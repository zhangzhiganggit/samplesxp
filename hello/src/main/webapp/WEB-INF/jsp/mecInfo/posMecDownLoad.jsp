<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<%@include file="../layout/common.css.jsp"%>
</head>

<body class="no-skin ">


	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="main-content ">
			<div class="main-content-inner ">

				<div class="page-content ">
					<form class="form-inline form-horizontal" method="post"
						action="<%=request.getContextPath() %>/imageUpload/downloadPosImagesByMercId.do" id="searchForm">
						<input id="aaa" value="${byDay }" type="hidden">
						<div class="row">


							<div class=" widget-container-col ui-sortable  ">
								<div class="widget-box widget-color-normal3" style="opacity: 1;">
									<div class="widget-header">
										<h5 class="widget-title bigger lighter">
											<i class="ace-icon fa fa-table"></i>进件图片下载
										</h5>
										 <h6 class="widget-title bigger lighter white">
                                        		${pageInfo.getPageNum() }
                                    	</h6>
										<span class="widget-toolbar"> <a data-action="collapse"
											href="#"> <i class="ace-icon fa fa-chevron-up"></i>
										</a>
										</span>

									</div>

									<div class="widget-body">
										<div class="widget-main no-padding ">
											<div class="widget-main ">

												<div class="form-group form-group-sm width-100 "
													style="margin-left: 10px;">
                                                    <div class="form-group form-group-sm width-300px a1">
														 <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号<font color="red">*</font>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="mercId"  name="mercId" value="" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
													</div>
													
                                                    <button class="btn btn-normal btn-sm" type="submit">
	                                                    <span class="ace-icon fa  icon-on-right bigger-110"></span>
	                                                  下载
                                                	</button>
													
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</form>
				</div>

			</div>

		</div>
	</div>

	<%@include file="../layout/common.alljs.jsp"%>
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
            	 mercId : {
 					validators : {
 						notEmpty: {},
 					}
 				}
             }
         });
        
	});
	</script>
</body>
</html>











