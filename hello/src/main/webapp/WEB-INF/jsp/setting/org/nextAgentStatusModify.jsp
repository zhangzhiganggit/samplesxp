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
                                        代理商状态维护
                                    </h5>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" method="post" action="list.html">
                                            <input type="hidden" value="${org.orgUuid }" name="orgUuid"/>
                                            <input type="hidden" value="modSta" name="action"/>
                                            <input type="hidden" value="${org.orgNm }" name="orgNm"/>
                                            <input type="hidden" value="${parentOrg }" name="parentOrg"/>
                                            <input type="hidden" value="${org.orgProp }" name="orgProp"/>
                                            <input type="hidden" value="${org.activeFlg }" name="activeFlg"/>
                                            <input type="hidden" value="${fromFunction }" name="fromFunction"/>
                                            
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgUuid }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgUuid }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgNm }</label>
                                                        </div>
                                                    </div>

                                                    
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >状态<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select data-placeholder="请选择" name="orgSts" id="orgSts"  class="chosen-select form-control width-200px">
                                                                <option value="1">正常</option>
                                                                <option value="2" <c:if test="${org.orgSts ==2 }"> selected </c:if>>停用</option>
                                                                <option value="9" <c:if test="${org.orgSts ==9 }"> selected </c:if>>注销</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px a1">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >解约日期<span class="red">*</span>:</label>
														<div class="col-sm-8  no-padding">
															<div class="input-daterange input-group width-200px"
																data-date-format="yyyy-mm-dd">
																<input type="text" name="breakSignDate"  value="${org.breakSignDateStr }"
																	id="breakSignDate" class="input-small form-control">
															</div>
														</div>
                                                    </div>


                                                    <div class="form-group form-group-sm  width-300px a1">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >存量商户<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select data-placeholder="请选择" name="hasStockBus" id="hasStockBus"  class="chosen-select form-control width-200px">
                                                                <option value="0">无存量商户</option>
                                                                <option value="1" <c:if test="${org.hasStockBus ==1 }"> selected </c:if>>有存量商户</option>
                                                            </select>
                                                        </div>
                                                    </div>
													

                                                    <div class="form-group form-group-sm width-300px  a2">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >接收人编号:</label>

                                                        <div class="col-sm-8  no-padding "  >
                                                            <input type="text" name="recipientNumber" 
                                                            value="${org.recipientNumber }" maxlength="16" 
                                                            id="recipientNumber" class="form-control input-small width-200px  " 
                                                            data-placement="bottom" title="" 
                                                            onblur="choseOutEmp()" >
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm  width-300px  a2">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >接收人姓名:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <input type="text" name="recipientName" 
                                                            readonly="readonly" value="${org.recipientName }" 
                                                            maxlength="25" id="recipientName" 
                                                            class="form-control input-small width-200px "
                                                            data-placement="bottom" title="" readonly="readonly"
                                                            >
                                                        </div>
                                                    </div>

                                                </div>





                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="button" onclick="checkValue()">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        保存
                                                    </button>
                                                    <button class="btn  btn-sm" type="button" onclick="window.location.href='/org/getNextOrg.do?orgUuid=${org.parentOrg }'">
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

    <%@include file="../../layout/common.alljs.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">
    function checkValue(){
    	$.ajax({
    		    	cache: true,
    			    type: "POST",
    		        url:'/org/checkQuickAddView.do',
    				data : $('#searchForm').serialize(),// 你的formid
    				async : false,
    				error : function(data) {
    					data = eval("(" + data + ")")
    					alert(data.message);
    				},
    				success : function(data) {
    					data = eval("(" + data + ")")
    					if(data.message == 'ok'){
    						$("#searchForm").attr("action","/org/confirmUpdateAgent.do")
    						document.getElementById("searchForm").submit()
    					}else{
    						alert(data.message);
    					}
    				}
    			});
    	    }
    	    
    	    function choseOutEmp(){
    	    	var empNo = $("#recipientNumber").val();
    	    	if(empNo!=""){
    		    	$.ajax({
    			    	cache: true,
    				    type: "POST",
    			        url:'/employee/findOrgClerk.do',
    					data : 'empNo='+empNo,// 你的formid
    					async : false,
    					error : function(data) {
    						alert("获取接收人姓名有误");
    					},
    					success : function(data) {
    						data = eval("(" + data + ")")
    						if(data.result =='0'){
    							alert("接收人编号有误，请重新输入");
    							$("#recipientName").val("");
    						}else{
    							$("#recipientName").val(data.message)
    						}
    					}
    				});
    	    	}else{
    	    		$("#recipientName").val("");
    	    	}
    	    }
        
    $('.main-content .chosen-select').chosen({});
    $(".a1 ,.a2").hide();
    $("#orgSts").chosen({}).change(function(){
        if($("#orgSts").val()==9)
            $('.a1').show();
        else{
            $('.a1').hide()
            $('.a2').hide()
        }
    });

    $("#hasStockBus").chosen({}).change(function(){
        if($("#hasStockBus").val()==1)
            $('.a2').show();
        else
            $('.a2').hide()
    });

    jQuery(function($) {
    	if($("#orgSts").val()==9)
            $('.a1').show();
        else{
            $('.a1').hide()
            $('.a2').hide()
        }
        if($("#hasStockBus").val()==1)
            $('.a2').show();
        else
            $('.a2').hide()
            
        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        })
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        $('.input-daterange').datepicker({autoclose:true});


    })
</script>
</body>
</html>











