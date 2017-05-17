<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file="../../common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

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
                                        厂家订货
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="<%=request.getContextPath() %>/posOrderAdmin/orderForTransferList.do" method="get">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">厂商:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select data-placeholder="请选择" id="factId" name="factId" class="chosen-select form-control width-70 formSelect">
	                                                            <option value="">请选择</option>
										                        <c:forEach items="${factList}" var="fact">
											    					<option value="${fact.factId}"  <c:if test="${fact.factId==factId}">selected="selected" </c:if> >${fact.factName }</option>
											    				</c:forEach>
                                                        	</select>
	                                                        <button class="btn btn-minier btn-purple" type="submit">明细</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">

                                                    <h3 class="header smaller lighter green">订货信息</h3>

                                                    <table class="table1 table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                                        <thead class="thin-border-bottom">
	                                                        <tr>
				                                                <th style="text-align:center;width:10%">订单号</th>
				                                                <th style="text-align:center;width:13%">代理商</th>
				                                                <th style="text-align:center;width:10%">收货电话</th>
				                                                <th style="text-align:center;width:8%">收货人</th>
				                                                <th style="text-align:center;width:10%">订单数量合计</th>
				                                                <th style="text-align:center;width:13%">已订货数量合计</th>
				                                                <th style="text-align:center;width:12%">本次订货合计</th>
				                                            </tr>
                                                        </thead>
                                                    </table>
                                                    <c:forEach items="${goList}" var="orderList">
                                                     <input type="hidden" value="${orderList.goodsOrderId}" class="goodOrderID"/>
			                                         	<div class="div">
					                                        <table class="table2 table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
					                                            <tbody>
																		<tr class="trRow1">
																			<td style="width:10%" class="goodsOrderId">${orderList.goodsOrderId}</td>
																			<td style="display: none" class="factId">${orderList.factId}</td>
																			<td style="display: none" class="orgUuid">${orderList.orgUuid}</td>
																			<td style="width:13%">${orderList.orgNm}</td>
																			<td style="width:10%">${orderList.contactTelNo}</td>
																			<td style="width:8%">${orderList.contact}</td>
																			<td style="text-align:right;display: none" class="totalQuantity">${orderList.totalQuantity}</td>
																			<td style="text-align:right;width:20%">${orderList.totalByFactId}</td>
																			<td style="text-align:right;width:8%">${orderList.totalTransferedQuantity}</td>
																			<td style="text-align:right;width:7%" class="thisTotal">0</td>
																		</tr>	
																</tbody>
															</table>
															<table class="table3 table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
																<tbody>
																		<tr class="trRow2" style="background:#FFFFFF ">
																			<td style="width:33%" colspan="3"><b>收货地址:</b>${orderList.address}</td>
																			<th style="text-align:center;width:8%">型号</th>
																			<th style="text-align:center;width:20%">订单数量</th>
																			<th style="text-align:center;width:8%">已订货</th>
																			<th style="text-align:center;width:7%;border-right:0px">本次订货</th>
																		</tr>
																		<c:forEach items="${orderList.detailList}" var="detailList" varStatus="num">
																			<tr class="trRow3">
																				<c:if test="${num.index == 0}">
																					<td colspan="3" rowspan="${orderList.detailSize }" style="background:#F9F9F9;text-align:center;width:33%;border-bottom:0px">订单详情</td>
																				</c:if>
																				<td style="text-align:right;width:8%">${detailList.modName }</td>
																				<td style="text-align:right;display:none" class="subModId">${detailList.subModId }</td>
																				<td style="text-align:right;display:none" class="goodsOrderDetailId">${detailList.goodsOrderDetailId }</td>
																				<td style="text-align:right;display:none" class="modId">${detailList.modId }</td>
																				<td style="text-align:right;display:none" class="goodsId">${detailList.goodsId }</td>
																				<td style="text-align:right;width:20%" class="quantity">${detailList.quantity}</td>
																				<td style="text-align:right;width:8%" class="transferedQuantity">${detailList.transferedQuantity}</td>
																				<td>
																					<input type="text" id="transferNum" name="transferNum" value="0" onkeyup="compareValue(this,${orderList.goodsOrderId})"  class="input-small form-control ${detailList.modId } ${orderList.goodsOrderId}" data-placement="bottom" title="" style="text-align:right"  >
																				</td>
																			</tr>
																		</c:forEach>
					                                            </tbody>
					                                        </table>
					                                        <hr>
			                                        	</div>
													</c:forEach>
                                                </div>
                                                <div class="col-sm-12">
                                                    <h3 class="header smaller lighter green">汇总信息</h3>
                                                    <table class="table table-striped table-bordered width-50">
                                                        <thead  >
                                                            <tr>
                                                                <th>  型号 </th>
                                                                <th>  订单数量合计 </th>
                                                                <th >已经订货合计</th>
                                                                <th>本次订货数量</th>

                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                        	<c:forEach items="${totalList }"  var="total">
                                                        		<tr>
                                                        			<td class="modNamme">${total.modName }</td>
                                                        			<td style="display:none" class="subModId">${total.subModId }</td>
                                                        			<td style="display:none" class="modId">${total.modId }</td>
                                                        			<td class="quantity">${total.quantity }</td>
                                                        			<td class="transferedQuantity">${total.transferedQuantity }</td>
                                                        			<td id="${total.modId }">0</td>
                                                        		</tr>
                                                        	</c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>


                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm savaBtn" type="button" onclick="save()">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        提交
                                                    </button>
                                                    <button class="btn  btn-sm" type="submit"  onclick="closeWin()">
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
    
    //------------------------
    var dataFlag = true;
    function save(){
    	$(".saveBtn").attr('disabled',true);
    	dataFlag = true;
    	checkData();
      	var url = "<%=request.getContextPath()%>/posOrderAdmin/checkinvalidOrder";
   		var goodsOrderId = $(".goodOrderID")
   		var attr = '';
   		 $(goodsOrderId).each(function(){
   			 //attr.push($(this).val())
   			 attr = attr+','+$(this).val();
   		 })
   		 var flag = true;
        	$.ajax({
        		url:url,
        		data:{
        			"goodsOrderId":attr.substr(1)
        		},
       		 	async:false,
        		success:function(data){
        			if("true"==data){
 					alert("订单已作废，请重新订货！")       				
 						flag = false;
 					location.reload();
        				return false;
        			}
        		}
        		
        	})
        if(flag){
        	if(!dataFlag){
        		$(".saveBtn").attr('disabled',false);
        		return;
        	}
           	var dataArray = [];
           	//通过div找出所有的order数据
           	$(".div").each(function(){
           		var thisTotal = Number($(this).find(".thisTotal").text());
           		if(thisTotal >0){
           			var detailArray = getDetailArray(this);
           			if(detailArray.length > 0){
    	       			dataArray.push(
    	       				new orderObj($(this).find(".goodsOrderId").text(),
    	       						$(this).find(".orgUuid").text(),
    	       						$(this).find(".factId").text(),
    	       						$(this).find(".totalQuantity").text(),
    	       						detailArray)	
    	       				);
           			}
           		}
           	});
           	if(dataArray.length == 0){
           		alert("请填写订购数量!");
           		$(".saveBtn").attr('disabled',false);
           		return;
           	}
           	var data = JSON.stringify(dataArray);
           	saveData(data);	
        }	
    
    }
    
    //根据每个table获取对象
    function getDetailArray(obj){
    	var detailArray = [];
    	$(obj).find(".trRow3").each(function(){
    		detailArray.push(
    				new detailObj($(this).find(".goodsOrderDetailId").text(),
    						$(this).find(".modId").text(),
    						$(this).find(".transferedQuantity").text(),
    						$(this).find("#transferNum").val(),
    						$(this).find(".goodsId").text(),
    						$(this).find(".subModId").text())
    				);
    	});
    	return detailArray;
    }    
    
    function checkData(){
    	$(".trRow3").each(function(){
    		if(Number($(this).find("#transferNum").val())>
    		Number($(this).find(".quantity").text())-Number($(this).find(".transferedQuantity").text())){
    			alert("提交数据错误！");
    			dataFlag = false;
    		}
    	});
    }
        
        
    //详情orderDetail对象
    function detailObj(goodsOrderDetailId,modId,transferedQuantity,transferNum,goodsId,subModId){
        this.goodsOrderDetailId = goodsOrderDetailId;
    	this.modId = modId;
        this.transferedQuantity = transferedQuantity;
        this.transferNum = transferNum;
        this.goodsId = goodsId;
        this.subModId = subModId;
        return this;	
    }
    
    //订单order对象
    function orderObj(goodsOrderId,orgUuid,factId,totalQuantity,detailList){
    	this.goodsOrderId = goodsOrderId;
    	this.orgUuid = orgUuid;
    	this.factId = factId;
    	this.totalQuantity = totalQuantity;
        this.detailList = detailList;
    	return this;
    }
     
    //订货数量改变后判断是否大于可订货数量
    function compareValue(obj,id){
    	obj.value=obj.value.replace(/[^+\d]/g,'');
    	if('' == $(obj).val()){
    		$(obj).val(0);
    	}
    	var parent = $(obj).parents(".trRow3");
    	var num = Number(parent.find(".quantity").text())-Number(parent.find(".transferedQuantity").text())
    	if(Number($(obj).val()) > num){
    		$(obj).val(num);
    	}
    	changeThisTotal(obj,id);
    	changeTotalByModId(parent);
    }
    
    //改变该订单号下本次订货总数
    function changeThisTotal(obj,id){
    	var total = 0;
    	$("."+id).each(function(){
    		total += Number($(this).val());
    		});
    	$(obj).parents(".div").find(".thisTotal").text(total);
    }
    
    //修改汇总页面中的数据
    function changeTotalByModId(parent){
    	var modId = parent.find(".modId").text();
    	var total = 0;
    	$("."+modId).each(function(){
        	total += Number(this.value);
		});
    	$("#"+modId).text(total);
    }
    
    //创建发货单 ajax
    function saveData(data){
    	var url = "<%=request.getContextPath()%>/posOrderAdmin/createTransfer.do?nowTime=";
    	$.ajax({ url: url+new Date().getTime(), 
		  	   data:{orderData:data},
		  	 	type: 'POST',
		       async:false,
		       success: function(data){
		    	   console.info(data);
		    	    if('1' == data){
		    	    	alert("创建发货单成功！");
		    	    	/* $("#goodsOrderId").val(Number(orderId)); */
		    	    	parent.$.fancybox.close();
		            	/* document.getElementById("searchForm").submit(); */
		    	    }else if('2' == data){
		    	    	alert("发货单发货数量超过订单总量！");
		    	    	$(".saveBtn").attr('disabled',false);
		    	    }else {
		    	    	alert("创建发货单失败！");
		    	    	$(".saveBtn").attr('disabled',false);
		    	    }
	    		},
	    		error: function () {
                 alert("创建失败！");
                 $(".saveBtn").attr('disabled',false);
             }}); 
    }
</script>
</body>
</html>
