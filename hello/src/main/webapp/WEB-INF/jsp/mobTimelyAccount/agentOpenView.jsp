<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">

                <div class="page-content ">

                    <div class="row" >

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
							            代理商即刷即到管理                           
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm1" class="form-inline form-horizontal" method="post"
											action="/MobAgentTimelyAccount/openTimelyAccount.do">
											<input type="hidden" name="flags" id="flags" value="${flags }">
                                                <div class=" col-xs-12" align="center">
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >机构编号:</label>
                                                        <div class="col-sm-8  no-padding">
															<input type="text" maxlength="20" name="orgUuid" readonly="readonly"
																value="${orgUuid }" id="orgUuid"
																class="form-control input-small width-200px "
																data-placement="bottom" >
														</div>
                                                    </div>

                                                    <div class="form-group form-group-sm  width-300px" style="margin-left: -7px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >代理商名称:</label>
                                                        <div class="col-sm-8  no-padding">
															<input type="text"  maxlength="40"
																value="${orgNm }" name="orgNm" readonly="readonly"
																id="orgNm"
																class="form-control input-small width-200px "
																data-placement="bottom" title="不能超过40个字符">
														</div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm  width-300px" style="display: none;">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >保证金金额<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding">
															<input type="text"
																class="form-control input-small width-200px "
																value="0"  name="deposit"
																id="deposit" data-placement="bottom" title="只能填数字">
														</div>
                                                    </div>
                                                
                                                </div>
												<!--  <div class=" col-xs-12" align="center">
                                                   <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" style="margin-left: -166px">费率（％）:</label>
                                                        
                                                        <div class="col-sm-8  no-padding " id="rates" style="margin-left: -80px;margin-top: 8px">
                                                        	<c:if test="${rate == null}">
																<input type="checkbox" width="30px" value="0.7" id='pointFive' name="rate" checked="checked" > 0.7
																<input type="checkbox" width="30px" value="0.6" name="rate"> 0.6
																<input type="checkbox" width="30px" value="0.59" name="rate" > 0.59
																<input type="checkbox" width="30px" value="0.5" name="rate"> 0.50
															</c:if>
															<c:if test="${rate != null }">
																<input type="checkbox" width="30px" value="0.7" id='pointFive' name="rate" <c:if test="${aRate == '0.7' }">checked="checked"</c:if>> 0.7
																<input type="checkbox" width="30px" value="0.6" name="rate" <c:if test="${bRate == '0.6' }">checked="checked"</c:if>> 0.6
																<input type="checkbox" width="30px" value="0.59" name="rate" <c:if test="${cRate == '0.59' }">checked="checked"</c:if>> 0.59
																<input type="checkbox" width="30px" value="0.5" name="rate" <c:if test="${dRate == '0.5' }">checked="checked"</c:if>> 0.50
															</c:if>
														</div>
                                                    </div>
                                                </div> -->
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="submit" id="addButton" onclick="checkData()">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        <c:if test="${flags == 'stopJSJD' }">确认关闭</c:if>    <c:if test="${flags =='openJSJD' }">确认开通</c:if>
                                                        <c:if test="${flags =='reJSJD' }">确认恢复</c:if>
                                                    </button>
                                                    <button class="btn  btn-sm" type="button" onclick="window.parent.$.fancybox.close();">
                                                       <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
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
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->


    <%@include file="../layout/common.alljs.jsp"%>
    <script type="text/javascript">

    $('.main-content .chosen-select').chosen({});

    /* jQuery(function($) {

        $('#searchForm1').formValidation({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	deposit : {
					validators : {
						notEmpty : {
							message : "保证金金额不能为空"
						},
						numeric :{
							message : "只能输入数字"
						}
					}
				}
            }
        });


    }) */
    /* 提交数据之前校验 */
    function checkData(){
    	var flag = $("#flags").val();
    	if(flag=="reJSJD"){
    		$("#searchForm1").attr("action","/MobAgentTimelyAccount/revcoverTimelyAccount.do");
    		document.getElementById("searchForm1").submit();
    	}else if(flag=="stopJSJD"){
    		$("#searchForm1").attr("action","/MobAgentTimelyAccount/pauseTimelyAccount.do");
    		document.getElementById("searchForm1").submit();
    	}
    }
</script>
</body>
</html>
