<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="../../common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付Admin </title>

    <%@include file="../../layout/common.jsp"%>
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
                                        发货单详情
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="list.html">
                                            	<input type="text" name="goodsTransferId" id="goodsTransferId" value="${goodsTransferId }" style="display:none">
                                            	<input type="text" name="goodsOrderId" id="goodsOrderId" value="${goodsOrderId }" style="display:none">
                                            	<input type="text" name="totalQuantity" id="totalQuantity" value="${totalQuantity} " style="display:none">
                                            	<input type="text" name="deviceData" id="deviceData" style="display:none">
                                                <h3 class=" header smaller lighter green">
                                                      订单基本信息
                                                </h3>
                                                <div class="col-sm-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >订单编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-80   view-control  "  >${goodsOrder.goodsOrderId }</label>

                                                            <button class="btn btn-minier btn-purple" onclick="javaScript:detail(${goodsOrder.goodsOrderId });">明细</button>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >发货单编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "  >${goodsTransferId}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >发货单状态:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "  >
                                                            <c:if test="${goodsTransfer.transferStatus==10}" >待发货</c:if>
									                        <c:if test="${goodsTransfer.transferStatus==80}" >发货已完成</c:if>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class=" col-xs-12">
                                                   <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >发货方式:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "  >${goodsTransfer.deliverTypeStr }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >数量总计:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "  >${goodsOrder.totalQuantity }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >价格合计:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "  >${goodsOrder.adjustmentAmount }</label>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商:</label>

                                                        <div class="col-sm-8  no-padding  "  >
                                                            <label class="form-control input-small width-200px   view-control  "  >${goodsOrder.orgNm }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号:</label>

                                                        <div class="col-sm-8  no-padding  "  >
                                                            <label class="form-control input-small width-200px   view-control  "  >${goodsOrder.orgUuid }</label>
                                                        </div>
                                                    </div>
 													<div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收货人:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "  >${goodsOrder.contact }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收货人电话:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "  >${goodsOrder.contactTelNo }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收货地址:</label>

                                                        <div class="col-sm-8  no-padding width-85"  >
                                                            <label class="form-control input-small width-100   view-control  "  >${goodsOrder.address }</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:if test="${goodsTransfer != null}">
	                                                <div class="col-sm-12">
	                                                    <div class="form-group form-group-sm width-300px ">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >物流公司:</label>
	
	                                                        <div class="col-sm-8  no-padding"  >
	                                                            <label id="logisticsCompany" class="form-control input-small width-200px   view-control  "  >${goodsTransfer.logisticsCompany }</label>
	                                                        </div>
	                                                    </div>
	                                                    <div class="form-group form-group-sm width-100 ">
	                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >物流单号:</label>
	
	                                                        <div class="col-sm-8  no-padding width-85"  >
	                                                            <label id="logisticsNo" class="form-control input-small width-100   view-control  "  >${goodsTransfer.logisticsNo }</label>
	                                                        </div>
	                                                    </div>
	                                                </div>
                                                </c:if>
                                                 
                                                <div class="col-sm-12 no-padding ">
                                                	<c:forEach items="${deviceList }"  var="device">
	                                                    <table class="table">
	                                                        <tr class="btn-app no-hover">
	                                                            <td>类型</td>
	                                                            <td>
	                                                            	<input type="text" name="goodsNm" id="goodsNm" value="${device.goodsName }" class="form-control input-small width-100"  style="height:25px;font-size:13px" readonly >
	                                                            </td>
	                                                            <td>厂商</td>
	                                                            <td>
	                                                            	<input type="text" name="factNm" id="factNm" value="${device.factName }" class="form-control input-small width-100"  style="height:25px;font-size:13px" readonly>
	                                                            </td>
	                                                            <td>型号</td>
	                                                            <td>
	                                                            	<input type="text" name="modNm" id="modNm" value="${device.modName }" class="form-control input-small width-100"  style="height:25px;font-size:13px" readonly >
	                                                            </td>
	                                                            <td>应发货数量</td>
	                                                            <td>
	                                                            	<input type="text" name="quan" id="quan" value="${device.quantity }" class="form-control input-small width-100"   style="height:25px;font-size:13px" readonly>
	                                                            </td>
	                                                            <td>
	                                                            	<button class="btn btn-minier btn-purple" onclick="javaScript:detailList(${goodsTransferId },'${device.goodsId }','${device.factId }','${device.modId }');">序列号列表</button>
	                                                            </td>
	                                                        </tr>
	                                                    </table>
													</c:forEach>
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
													<button class="btn  btn-sm" type="button"  onclick="closeWin()">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
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

    <%@include file="../../layout/common.js.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">
    function closeWin(){
    	parent.$.fancybox.close();
    }
    
    $('.chosen-select').chosen({});
    jQuery(function($) {

        $('.id-file-format').removeAttr('checked').on('change', function() {
            var whitelist_ext, whitelist_mime;
            var btn_choose
            var no_icon
            if(this.checked) {
                btn_choose = "Drop images here or click to choose";
                no_icon = "ace-icon fa fa-picture-o";
                whitelist_ext = ["jpeg", "jpg", "png", "gif" , "bmp"];
                whitelist_mime = ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"];
            }
            else {
                btn_choose = "Drop files here or click to choose";
                no_icon = "ace-icon fa fa-cloud-upload";
                whitelist_ext = null;//all extensions are acceptable
                whitelist_mime = null;//all mimes are acceptable
            }
            var file_input = $('#id-input-file-3');
            file_input
                    .ace_file_input('update_settings',
                    {
                        'btn_choose': btn_choose,
                        'no_icon': no_icon,
                        'allowExt': whitelist_ext,
                        'allowMime': whitelist_mime
                    })
            file_input.ace_file_input('reset_input');
            file_input
                    .off('file.error.ace')
                    .on('file.error.ace', function(e, info) {
                        //console.log(info.file_count);//number of selected files
                        //console.log(info.invalid_count);//number of invalid files
                        //console.log(info.error_list);//a list of errors in the following format
                        //info.error_count['ext']
                        //info.error_count['mime']
                        //info.error_count['size']
                        //info.error_list['ext'] = [list of file names with invalid extension]
                        //info.error_list['mime'] = [list of file names with invalid mimetype]
                        //info.error_list['size'] = [list of file names with invalid size]
                        /**
                         if( !info.dropped ) {
        //perhapse reset file field if files have been selected, and there are invalid files among them
        //when files are dropped, only valid files will be added to our file array
        e.preventDefault();//it will rest input
        }
                         */
                        //if files have been selected (not dropped), you can choose to reset input
                        //because browser keeps all selected files anyway and this cannot be changed
                        //we can only reset file field to become empty again
                        //on any case you still should check files with your server side script
                        //because any arbitrary file can be uploaded by user and it's not safe to rely on browser-side measures
                    });
        });


        $('.id-input-file').ace_file_input({
            style:'well',
            btn_choose:'请上传图片或文件！',
            btn_change:null,
            no_icon:'ace-icon fa fa-cloud-upload',
            droppable:true,
            height:300,
            thumbnail:'large'//large | fit |small
            //,icon_remove:null//set null, to hide remove/reset button
            /**,before_change:function(files, dropped) {
            //Check an example below
            //or examples/file-upload.html
            return true;
            }*/
            /**,before_remove : function() {
            return true;
            }*/
            ,
            preview_error : function(filename, error_code) {
                //name of the file that failed
                //error_code values
                //1 = 'FILE_LOAD_FAILED',
                //2 = 'IMAGE_LOAD_FAILED',
                //3 = 'THUMBNAIL_FAILED'
                //alert(error_code);
            }
        }).on('change', function(){
            //console.log($(this).data('ace_input_files'));
            //console.log($(this).data('ace_input_method'));
        });

        $('#searchForm').bootstrapValidator({
            message: 'This value is not valid',
            container:'popover',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                firstName: {
                    validators: {
                        notEmpty: {},
                        stringCase: {
                            'case': 'upper'
                        }
                    }
                },
                lastName: {
                    validators: {
                        notEmpty: {},
                        stringCase: {
                            'case': 'upper'
                        }
                    }
                },
                username: {
                    validators: {
                        notEmpty: {},
                        stringLength: {
                            min: 6,
                            max: 20
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/
                        },
//                        remote: {
//                            url: 'remote.php',
//                            message: 'Tên tài khoản này đã được đăng ký'
//                        },
                        different: {
                            field: 'email',
                            message: 'The username and password cannot be the same as each other'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {},
                        emailAddress: {}
                    }
                },
                password: {
                    validators: {
                        notEmpty: {},
                        identical: {
                            field: 'confirmPassword'
                        },
                        different: {
                            field: 'username',
                            message: 'Mật khẩu và tên đăng nhập phải khác nhau'
                        }
                    }
                },
                confirmPassword: {
                    validators: {
                        notEmpty: {},
                        identical: {
                            field: 'password'
                        },
                        different: {
                            field: 'username',
                            message: 'Mật khẩu và tên đăng nhập phải khác nhau'
                        }
                    }
                },
                age: {
                    validators: {
                        notEmpty: {},
                        digits: {},
                        greaterThan: {
                            value: 18
                        },
                        lessThan: {
                            value: 100
                        }
                    }
                },
                website: {
                    validators: {
                        notEmpty: {},
                        uri: {}
                    }
                },
                phoneNumber: {
                    validators: {
                        notEmpty: {},
                        digits: {},
                        phone: {
                            country: 'US'
                        }
                    }
                },
                gender: {
                    validators: {
                        notEmpty: {}
                    }
                },
                'languages[]': {
                    validators: {
                        notEmpty: {}
                    }
                },
                'programs[]': {
                    validators: {
                        choice: {
                            min: 2,
                            max: 4
                        }
                    }
                }
            }
        });


        //show the dropdowns on top or bottom depending on window height and menu position
        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
            var offset = $(this).offset();

            var $w = $(window)
            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                $(this).addClass('dropup');
            else $(this).removeClass('dropup');
        });



        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        })
//show datepicker when clicking on the icon
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
//or change it into a date range picker
        $('.input-daterange').datepicker({autoclose:true});
//to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
//        $('input[name=date-range-picker]').daterangepicker({
//            'applyClass' : 'btn-sm btn-success',
//            'cancelClass' : 'btn-sm btn-default',
//            locale: {
//                applyLabel: 'Apply',
//                cancelLabel: 'Cancel',
//            }
//        })
//            .prev().on(ace.click_event, function(){
//                $(this).next().focus();
//            });
//        $('#timepicker1').timepicker({
//            minuteStep: 1,
//            showSeconds: true,
//            showMeridian: false
//        }).next().on(ace.click_event, function(){
//            $(this).prev().focus();
//        });
//        $('#date-timepicker1').datetimepicker().next().on(ace.click_event, function(){
//            $(this).prev().focus();
//        });


        $(".fancybox-manual-b").click(function() {
            $.fancybox.open({
                href : 'detail.html',
                type : 'iframe',
                scrolling:'no',
                scrollOutside:false,
                model :true,
                minWidth:400,
                width:900,
                height:400,
                autoHeight:true,
                autoWidth:true,
                closeBtn:true,
                padding : 5
            });
        });
        //$('#sidebar').addClass('compact');
    })
    
    function detail(id){
    	$.fancybox.open({
			href : '<%=request.getContextPath()%>/posOrderAdmin/queryOrderDetail.do?goodsOrderId='+id,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: $(window).width() * 0.9,
            centerOnScroll:true,
            autoSize: true,
            helpers:{
            	overlay:{
            		closeClick:false
            	}
            }
		});
    }
    
    function detailList(id,goodsId,factId,modId){
    	$.fancybox.open({
			href : '<%=request.getContextPath()%>/posTransferAdmin/queryTransferDetailList.do?goodsTransferId='+id+'&goodsId='+goodsId+'&factId='+factId+'&modId='+modId,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: $(window).width() * 0.9,
            centerOnScroll:true,
            autoSize: true,
            helpers:{
            	overlay:{
            		closeClick:false
            	}
            }
		});
    }
    
    function confirm(goodsOrderId,goodsTransferId){
    	var logisticsNo=$("#logisticsNo").html();
    	var logisticsCompany=$("#logisticsCompany").html();
    	$(".saveBtn").attr('disabled',true);
    	$.ajax({ url: "<%=request.getContextPath()%>/posTransferAdmin/confirm.do?randomNum="+new Date().getTime()+"&logisticsCompany="+logisticsCompany+"&logisticsNo="+logisticsNo, 
			   data:{goodsOrderId:goodsOrderId,goodsTransferId:goodsTransferId},
			   type: 'POST',
			   async:false,
			   success: function(data){
				   	if("1" == data){
				   		alert("收货成功！");
				   		parent.$.fancybox.close();
				   	}else{
				   		alert("收货失败！");
				   		$(".saveBtn").attr('disabled',false);
				   	}
	        }});
    }
</script>
</body>
</html>