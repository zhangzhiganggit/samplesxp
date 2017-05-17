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

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">

                
                <div class="page-content ">

                    <div class="row" >

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        商户POS信息详情
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="">
                                                <div class=" col-xs-12 no-padding">

                                                    <div class="tabbable">
													
                                                        <div class="tab-content ">
                                                            <div class="tab-pane active no-padding" id="home4">
                                                                <div class="col-sm-12">
																
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户商编:</label>

                                                                        <div class="col-sm-8  no-padding"  id="abc">
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mecIf.mno}</label>
                                                                        </div>
                                                                    </div>
																	
                                                                    <div class="form-group form-group-sm width-300px">
                                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户注册名称:</label>

                                                                        <div class="col-sm-8  no-padding"  >
                                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${mecIf.cprRegNmCn}</label>
                                                                        </div>
                                                                    </div>
																	
																	
																	
																	<h3 class="header smaller lighter green">POS功能状态</h3>
																	
																	<div class="col-sm-3 no-padding">
																		<label>
																			<input type="checkbox" class="ace ace-switch ace-switch-6 btn-flat" name="switch-field-1"
																			value="${mecIf.posXfcx}"
																			<c:if test="${mecIf.posXfcx eq '1'}">
																				checked
																			</c:if>
																			>
																			<span class="lbl">&nbsp;消费撤销(银联卡)</span>
																		</label>
																	</div>	
																	<div class="col-sm-3 no-padding">
																		<label>	
																			<input type="checkbox" class="ace ace-switch ace-switch-6 btn-flat" name="switch-field-1"
																			value="${mecIf.posYecx}"
																			<c:if test="${mecIf.posYecx eq '1'}">
																				checked
																			</c:if>
																			>
																			<span class="lbl">&nbsp;余额查询(银联卡)</span>
																		</label>
																	</div>
																	<div class="col-sm-3 no-padding">
																		<label>
																			<input type="checkbox" class="ace ace-switch ace-switch-6 btn-flat" name="switch-field-1"
																			value="${mecIf.posJymx}"
																			<c:if test="${mecIf.posJymx eq '1'}">
																				checked
																			</c:if>
																			>
																			<span class="lbl">&nbsp;终端交易明细打印</span>
																		</label>
																	</div>
																	
																	<div class="col-sm-3 no-padding">
																		<label>
																			<input type="checkbox" class="ace ace-switch ace-switch-6 btn-flat" name="switch-field-1"
																			value="${mecIf.posXJXFJZ}"
																			<c:if test="${mecIf.posXJXFJZ eq '1'}">
																				checked
																			</c:if>
																			>
																			<span class="lbl">&nbsp;现金消费记账</span>
																		</label>
																	</div>
																	
																	
													                                                                    
														          </div>
                                                            </div>


                                                            
                                                        </div>
                                                    </div>    


                                                </div>



                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">

                                                    <button class="btn btn-default btn-sm" type="button" onclick="javascript:closewin();">
                                                       <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
                                                        关闭
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

<!-- basic scripts -->

     <%@include file="../layout/common.alljs.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">
    
    function closewin(){
    	parent.$.fancybox.close();
    }
	
	
	jQuery(function($){
	
		$(":checkbox").click(function(){
			this.checked = !this.checked;
		});
		
	})
	
	
	
	
	
	
	
	
	

</script>
</body>
</html>











