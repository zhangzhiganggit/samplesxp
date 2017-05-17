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
                                        非标商户修改
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" method="post" action="<%=request.getContextPath()%>/noStandard/addNoStandard.do" >
                                                <div class=" col-xs-12">
                                                   <div class="form-group form-group-sm width-300px ">
                                                        <label for="form-field-6"   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户类别:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="mecBusiType" name="mecBusiType" data-placeholder="全部"  class="chosen-select form-control width-200px">
                                                               <option value="02" selected="selected">优惠类</option>
                                                               <!-- <option value="01" >标准类</option>          -->                                                     
                                                               <option value="03" >减免类</option>
                                                               <option value="04" >特殊优惠类</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                  
                                                    <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >商户编号:</label>

                                                        <div class="col-sm-8 no-padding width-85">
                                                            <textarea maxlength="" id="accountNos" name="accountNos" style="height:200px" class="form-control limited input-small width-100"></textarea>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" id="subbtn" type="button" onclick="subVirtual()">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        保存
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
    </div>
 
	<%@include file="../layout/common.alljs.jsp"%>
	<script type="text/javascript">
/* 	function amountb(){
		 //以下是验证整数的正则
		 var checkCut=$("#backCardNum").val();
	    var reg =/^\d{1,12}?$/ ;
	     if(!reg.test(checkCut)){
	    	 $("#backCardNum").val('');
	 	}
	 }
	 window.setInterval("amountb()",100) */
	function subVirtual(){
		var mecBusiType  =$("#mecBusiType").val();	//标准类别
		var accountNos  =$("#accountNos").val();	//商编
		if(mecBusiType==''||mecBusiType==null){
			alert("商户类别不能为空！");
			return;
		}
		if(accountNos==''||accountNos==null){
			alert("商编不能为空");
			return;
		}
		
		$("#subbtn").attr("disabled", true);
		/*$.ajax({
			    	cache: true,
			        type: 'POST',
			        url:'/noStandard/addNoStandard',
					data : $('#searchForm').serialize(),// 你的formid
					async : false,
					error : function(data) {
						//alert(data.msg);
						$("#subbtn").attr("disabled", false);
					},
					success : function(data) {
						//alert(data.msg);
						$("#subbtn").attr("disabled", false);
					}
				}); */
		document.getElementById("searchForm").submit();
	}
	 $('.main-content .chosen-select').chosen({});

		jQuery(function($) {
			$('#searchForm').bootstrapValidator({
				message : 'This value is not valid',
				container : 'popover',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					accountNos : {
						validators : {
							notEmpty : {},

						}
					}
				}
			});

			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			})
			//show datepicker when clicking on the icon
			.next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
			//or change it into a date range picker
			$('.input-daterange').datepicker({
				autoclose : true
			});

		})
	</script>
</body>
</html>
