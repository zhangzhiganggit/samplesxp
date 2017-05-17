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
                                        确认发货
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="<%=request.getContextPath() %>/posTransferAdmin/transferBatchUpdate.do" method="post"  enctype="multipart/form-data">
												<input type="text" name="goodsTransferId" id="goodsTransferId" value="${goodsTransferId }" style="display:none">
                                            	<input type="text" name="goodsOrderId" id="goodsOrderId" value="${goodsOrderId }" style="display:none">
                                            	<input type="text" name="totalQuantity" id="totalQuantity" value="${totalQuantity}" style="display:none">
                                            	<input type="text" name="deviceData" id="deviceData" style="display:none">
                                            	<input type="text" name="orgUuid" id="orgUuid" style="display:none" value="${goodsOrder.orgUuid }" >
                                            	<input type="hidden" name="inputStaffId" id="inputStaffId"  value="${goodsOrder.inputStaffId }" >
                                                <h3 class=" header smaller lighter green">
                                                      订单基本信息
                                                </h3>

                                                <div class="col-sm-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >订单编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-80   view-control  goodsOrderId"  >${goodsOrder.goodsOrderId }</label>
                                                            <button class="btn btn-minier btn-purple" onclick="javaScript:detail(${goodsOrder.goodsOrderId });">明细</button>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >发货单编号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  totalQuantity"  >${goodsTransferId }</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >数量总计:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  totalQuantity"  >${goodsOrder.totalQuantity }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >价格合计:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  paymentAmount"  >${goodsOrder.adjustmentAmount }</label>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商:</label>

                                                        <div class="col-sm-8  no-padding  "  >
                                                            <label class="form-control input-small width-200px   view-control orgNm "  >${goodsOrder.orgNm }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号:</label>

                                                        <div class="col-sm-8  no-padding  "  >
                                                            <label class="form-control input-small width-200px   view-control  orgUuid"  >${goodsOrder.orgUuid }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收货人电话:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  contactTelNo"  >${goodsOrder.contactTelNo }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收货地址:</label>

                                                        <div class="col-sm-8  no-padding width-85"  >
                                                            <label class="form-control input-small width-100   view-control  address"  >${goodsOrder.address }</label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >收货人:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  contact"  >${goodsOrder.contact }</label>
                                                        </div>
                                                    </div>


                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >物流公司<span style="color:red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select id="logisticsCompany" name="logisticsCompany"  data-placeholder="请选择" onchange="fillinput()" 
                                                         	       class="chosen-select form-control width-200px">
                                                                <option value="">请选择</option>
                                                                <c:forEach items="${logCompanyList }" var="org" >
                                                                	<option value="${org.logistCompanyNo }"
                                                                	>${org.logistCompanyName }</option>
                                                                </c:forEach>
                                                                <option value="200">其他</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px " id="otherlog" style="display:none;">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >其他物流名称<span style="color:red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="otherlogisticsCompany" id="otherlogisticsCompany" data-placeholder="最多输入20字符以内" class="form-control input-small width-200px" maxlength="20"  >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >物流单号<span style="color:red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding width-85"  >
                                                            <input type="text" name="logisticsNo" id="logisticsNo" class="form-control input-small width-100"  maxlength="200">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <h3 class="row header smaller lighter green">
                                                    </h3>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >发货方式:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="全部" id="deliverType" name="deliverType" onchange="deliverTypeChange()"  class="chosen-select form-control width-150px">
                                                                <option value="1" <c:if test="${goodsTransfer.deliverType == 1}">selected="selected"</c:if>>订购发货</option>
                                                                <option value="2" <c:if test="${goodsTransfer.deliverType == 2}">selected="selected"</c:if>>划拨发货</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                    &nbsp;&nbsp;&nbsp;                                                   
                                                    <div class="form-group form-group-sm width-300px" style="display: none" id="saveTypeDiv"  onchange="saveTypeChange()" >
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >序列号录入:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="全部" id="saveType" name="saveType"   class="chosen-select form-control width-150px">
                                                                <option value="1">号段录入</option>
                                                                <option value="2">导入录入</option>
                                                            </select>

                                                        </div>
                                                    </div>
                                                     &nbsp;&nbsp;&nbsp;                                                   
                                                    <div class="form-group form-group-sm width-100px" style="display: none" id="excelModel"  >
                                                         <div class="col-sm-4  no-padding"  >
                                                           <button class="btn btn-info btn-sm" type="button" onclick="downLoad()">
                                              				      下载模板
                                               			 </button>
                                                        </div>
                                                    </div>
                                                 </div>
                                                <div class="col-sm-12 no-padding ">
                                                	<c:forEach items="${deviceList }"  var="device">
                                                	  <div id="sim">
	                                                    <table class="table">
	                                                        <tr class="btn-app no-hover firstTr">
	                                                            <td>类型</td>
	                                                            <td><input type="text" name="goodsNm" id="goodsNm" value="${device.goodsName }" class="form-control input-small width-100"  style="height:25px;font-size:13px" readonly></td>
	                                                            <td>厂商</td>
	                                                            <td><input type="text" name="factNm" id="factNm" value="${device.factName }" class="form-control input-small width-100"  style="height:25px;font-size:13px" readonly></td>
	                                                            <td>型号</td>
	                                                            <td><input type="text" name="modNm" id="modNm" value="${device.modName }" class="form-control input-small width-100"  style="height:25px;font-size:13px" readonly></td>
	                                                            <td>应发货数量</td>
	                                                            <td><input type="text" name="quan" id="quan" value="${device.quantity }" class="form-control input-small width-100"   style="height:25px;font-size:13px" readonly></td>
	                                                            <td>
	                                                            	<c:if test="${device.goodsName !='SIM卡'}">
	                                                            		<button class="btn btn-minier btn-light excelComm" onclick="$(this).parents('table').append($(this).parents('tr').next()[0] .outerHTML)">+</button>
	                                                            	</c:if> 
	                                                            	<c:if test="${device.goodsName =='SIM卡'}">
	                                                            		<button class="btn btn-minier btn-light excelComm">*</button>
	                                                            	</c:if> 
	                                                            </td>
	                                                        </tr>
	                                                        <!-- SIM卡批量上传 -->
	                                                        <c:if test="${device.goodsName =='SIM卡'}">
	                                                        <tr class="info">
	                                                             <td colspan="10">
	                                                                   <input class="btn-default simcard" type="button" value="导入excel" id="simcard" onclick="javascript:void(0);"></input>
	                                                                   
	                                                                   <input type="text" class="simFlag" value="0" style="display:none">
	                                                                   <input type="text" class="simJson" value="" style="display:none">
	                                                            	   <span id="uploadResult" class="upload"></span>
	                                                            </td>
	                                                            <td style="display:none">
	                                                        		<input type="text"  name="goodsIds" id="goodsIds" value="${device.goodsId }" >
		                                            				<input type="text"  name="modIds" id="modIds" value="${device.modId }"  >
		                                            				<input type="text"  name="factIds" id="factIds" value="${device.factId }"  >
		                                            			</td>
	                                                        </tr>
	                                                        </c:if>
	                                                         <c:if test="${device.goodsName !='SIM卡'}">
	                                                        <!-- 上传结束 -->
	                                                        <tr class="info">
	                                                        	<td style="display:none">
	                                                        		<input type="text" class="goodsId" name="goodsId" id="goodsId" value="${device.goodsId }" >
		                                            				<input type="text" class="modId" name="modId" id="modId" value="${device.modId }" >
		                                            				<input type="text" class="factId" name="factId" id="factId" value="${device.factId }"  >
		                                            			</td>
	                                                            <td>前缀</td>
	                                                            <td><input type="text" name="prefix" id="prefix" class="form-control input-small width-100"  style="height:25px;font-size:11px" onchange="this.value=this.value.substring(0,15)"></td>
	                                                            <td>起始</td>
	                                                            <td><input type="text" name="begFactSn" id="begFactSn" class="form-control input-small width-100"  style="height:25px;font-size:11px" ></td>
	                                                            <td>终止</td>
	                                                            <td><input type="text" name="endFactSn" id="endFactSn" class="form-control input-small width-100"  style="height:25px;font-size:11px" ></td>
	                                                            <td>后缀</td>
	                                                            <td><input type="text" name="suffix" id="suffix" class="form-control input-small width-100"   style="height:25px;font-size:11px" onchange="this.value=this.value.substring(0,15)"></td>
	                                                            <td><button class="btn btn-minier btn-light excelComm" onclick="if($(this).parents('table').find('tr').length >2) $(this).parents('tr').remove()">-</button></td>
	                                                        </tr>
	                                                        </c:if>
	                                                    </table>
	                                                  </div>
                                                    </c:forEach>
                                                    <div class ="col-sm-12" id="commExcel" style="display: none">
                                                    <div class="form-group col-sm-4 ">
                                                        <label class="ace-file-input ace-file-multiple widget-main" style="height:200px">
                                                            <input type="file" name="excelFile" id="excelFile" class="id-input-file" multiple=""  >
                                                        </label>
                                                    </div>
                                                   </div>
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm saveBtn" id="disBtn"  type="button" onclick="javaScript:save()">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        保存
                                                    </button>
                                                    <button class="btn  btn-sm" type="button"  onclick="closeWin()">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
                                                        关闭
                                                    </button>
                                                </div>
                                            </form>
                                            <form id="UploadForm" action="<%=request.getContextPath()%>/posTransferAdmin/simcard.do" method="post" style="display:none">
                                                      <input type="file" id="fileinput" name="attFile" hidden="hidden" onchange="uploadStart()"/>
                                                      <input type="button" onclick="ajaxFileUpload('UploadForm','fileinput')" value="上传" id="upload"  hidden="hidden"/>
                                                      <input type="text" hidden="hidden" id="deviceInfo" name="deviceInfo"/>
                                            </form>
                                             <form  action="<%=request.getContextPath()%>/posTransferAdmin/downExcel.do" id="downLoadForm" method="post">
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
    function downLoad(){
   		document.getElementById("downLoadForm").submit();
    }
    
    function deliverTypeChange(){
    	var deliverType = $("#deliverType").val();
    	if(deliverType=='1'){
    		$("#saveTypeDiv").attr("style","display:none");
    		$("#excelModel").attr("style","display:none");
    		$("#commExcel").attr("style","display:none");
    		$(".info").attr("style","display:display");
    	}else{
    		$("#saveTypeDiv").attr("style","display:display");
    	}
    }
    
    function saveTypeChange(){
    	var saveType = $("#saveType").val();
    	if(saveType=='1'){
    		$(".info").attr("style","display:display");
    		$(".excelComm").attr("style","display:display");
    		$("#commExcel").attr("style","display:none");
    		$("#excelModel").attr("style","display:none");
    	}else{
    		$(".info").attr("style","display:none");
    		$(".excelComm").attr("style","display:none");
    		$("#commExcel").attr("style","display:display");
    		$("#excelModel").attr("style","display:display");
    	}
    }
    
    function closeWin(){
    	parent.$.fancybox.close();
    }
    
    var fileName = '';
    function uploadStart(){
       	fileName = $('input[name=attFile]').val();
    	var clean=fileName.split('\\').pop(); // clean from C:\fakepath OR C:\fake_path 
    	$("#fileName").html("<font color=red>"+fileName+"</font>");
    	var strArray = fileName.split(".")
    	if(strArray.length == 2){
    		var las = strArray[1].toUpperCase();
    		if("XLS" != las && "XLSX" != las && "xls" != las && "xlsx" != las){
    			alert("请导入EXCEL文件！");
    			
    			return;
    		}
    	}else{
    		alert("请导入EXCEL文件！");
			return;
    	}
    	//确认上传
    	$("#upload").click(); 
    }
        /** sim卡上传 */
     var simElement;   
     
     $(".simcard").click(function() {
    	 simElement = this;
    	 var goodsNm = $(this).parents("#sim").find("#goodsNm").val();
    	 var factNm = $(this).parents("#sim").find("#factNm").val();
    	 var modNm = $(this).parents("#sim").find("#modNm").val();
    	 var goodsId = $(this).parents(".info").find("#goodsIds").val();
    	 var modId = $(this).parents(".info").find("#modIds").val();
    	 var factId = $(this).parents(".info").find("#factIds").val();
    	 var quan = $(this).parents("#sim").find("#quan").val();
    	 var orgUuid = $(".orgUuid").text();
    	 var goodsTransferId = $("#goodsTransferId").val();
    	 var deviceInfo = goodsNm+","+factNm+","+modNm+","+quan+","+goodsId+","+modId+","+factId+","+orgUuid+","+goodsTransferId;
    	 $("#fileinput").click();
    	 $("#deviceInfo").val(deviceInfo);
        });
        $("#sure").click(function(){
            $("#upload").click();  	
        });
    $('.chosen-select').chosen({width:"100%"});
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
                    });
        });

        $('.id-input-file').ace_file_input({
            style:'well',
            btn_choose:'请上传excel文件！',
            btn_change:null,
            allowExt : ['xlxs','xls'],
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

        $('#searchForm').formValidation({
			message : 'This value is not valid',
			container : 'popover',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
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
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
        $('.input-daterange').datepicker({autoclose:true});

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
    function save(){
    	var logisticsCompany=$("#logisticsCompany").val(); 
    	if(logisticsCompany==200 && '' == $("#otherlogisticsCompany").val().trim()){
    		alert("请填写物流信息！");
    		return;
    	}else if (logisticsCompany==200 && '' != $("#otherlogisticsCompany").val().trim()){
    		logisticsCompany=200+$("#otherlogisticsCompany").val();
    	}
    	var inputStaffId=$("#inputStaffId").val();
    	var deliverType = $("#deliverType").val();//订货方式
    	var saveType  = $("#saveType").val();//录入方式
    	document.getElementById("disBtn").disabled=true;
    	//$(".saveBtn").attr('disabled',true);
    	if('' == $("#logisticsCompany").val().trim() || 
   			'' == $("#logisticsNo").val().trim()){
    		$(".saveBtn").attr('disabled',false);
    		alert("请填写物流信息！");
    		return;
    	}
    	var name= $("#goodsNm").val();
        var modId = "";
        var goodsId = "";
        var factId = "";
    	if(name !='SIM卡'){
	    	var begFactSn=$("#begFactSn").val();
	    	var endFactSn=$("#endFactSn").val();
	    	var reg =/^[0-9]*$/;
	        if(!reg.test(begFactSn)){
	            alert("起序列号只能输入数字！");
	            $(".saveBtn").attr('disabled',false);
	            return;
	        }
	        if(!reg.test(endFactSn)){
	            alert("止序列号只能输入数字！");
	            $(".saveBtn").attr('disabled',false);
	            return;
	        }
            modId = $("#modId").val();
            goodsId = $("#goodsId").val();
            factId = $("#factId").val();
        } else {
            modId = $("#modIds").val();
            goodsId = $("#goodsIds").val();
            factId = $("#factIds").val();
        }
        var dataArray = [];
    	if(deliverType=='1' ||(deliverType=='2' && saveType=='1')){
    		if(!checkSn()){
        		$(".saveBtn").attr('disabled',false);
        		return;
        	}
        	if(!checkSimFlag()){
        		$(".saveBtn").attr('disabled',false);
        		alert("SIM卡不能为空！");
        		return;
        	}
        	var simData = '';
        	$(".simJson").each(function(){
        		simData = simData + $(this).val() + '&';
        	});
        	
        	$(".info").each(function(){
        		if('012' != $(this).find("#goodsIds").val()){
    	    		dataArray.push(
    					new infoObject($(this).find("#goodsId").val(),
    							$(this).find("#factId").val(),
    							$(this).find("#modId").val(),
    							$(this).find("#prefix").val(),
    							$(this).find("#begFactSn").val(),
    							$(this).find("#endFactSn").val(),
    							$(this).find("#suffix").val()
    							/* $(this).parents(".col-xs-12").find("#remark").val() */)); 
        		}
    		});
    		$("#deviceData").val(JSON.stringify(dataArray));
            
            var currGoodsOrderId = $("#goodsOrderId").val();
            var flag = true;
            var quantity = $("#quan").val();
            var chiefId;
            var allyId;
            // 判断订单是否为盟主订单
            $.ajax({
                url: "/posTransferAdmin/checkChiefOrder?randomNum=" + new Date().getTime(),
                data: {goodsOrderId:currGoodsOrderId,quantity:quantity,modId:modId,goodsId:goodsId},
                async: false,
                type: "POST",
                success: function(data){
                    chiefId = data.chiefId;
                    allyId = data.allyId;
                    // 1:不是盟主订单 0:是盟主订单且库存数小于发货数 2:是盟主订单且库存数大于等于发货数 -1:程序异常
                    if("0" == data.msg){
                        // 如果库存数小于发货数，提示库存不足，是否确认发货
                        flag = confirm("库存不足，是否确认发货？");
                    } else if ("-1" == data.msg) {
                        flag = false;
                        alert("程序异常，判断是否为盟主订单失败！");
                    }
                },
                error: function(){
                    $(".saveBtn").attr('disabled',false);
                    alert("程序异常，保存失败！！！！！！");
                    flag = false;
                }
            });
            if(flag == false){
                $(".saveBtn").attr('disabled',false);
                return;
            }
            
       		$.ajax({ url: "/posTransferAdmin/inStore.do?randomNum="+new Date().getTime(), 
       			 data:{deviceData:$("#deviceData").val(),goodsTransferId:$("#goodsTransferId").val(),goodsOrderId:$("#goodsOrderId").val(),
       				logisticsCompany:logisticsCompany,logisticsNo:$("#logisticsNo").val(),orgUuid:$(".orgUuid").text(),simData:simData,deliverType:deliverType,inputStaffId:inputStaffId,
                    chiefId:chiefId,allyId:allyId,quantity:quantity,modId:modId},
    				   async:false,
    				   type:'POST',
    				   success: function(data){
    					   if("1" == data.msg){
    				   			alert("保存成功！");
    				   			$(simElement).parents(".info").find(".simFlag").val("1");
    				   			parent.$.fancybox.close();
    					   }else if("-1" == data.msg){
    						   $(".saveBtn").attr('disabled',false);
    						   alert("SN号已存在！");
    					   }else if("3" == data.msg){
    						   $(".saveBtn").attr('disabled',false);
    						  // alert(data.jsonSn);
    						   showExitSn(data.jsonSn,data.deliverType,data.jsonSnSelf);
    					   }else{
    						   $(".saveBtn").attr('disabled',false);
    						   alert("保存失败！");
    					   }
    				  },
    			   	   error:function(){
    			   		$(".saveBtn").attr('disabled',false);
    			   		   alert("保存失败！");
    			   	   } 
    				   
    		        });
    	}else{
    		var excelFile = $("#excelFile").val();
    	    if(excelFile==""||excelFile==null){
    	    	alert("请选择excel进行上传");
        		$(".saveBtn").attr('disabled',false);
    	    	return false;
    	    }
    	    document.getElementById("searchForm").submit();
    	}

    	if(!checkSimFlag()){
    		$(".saveBtn").attr('disabled',false);
    		alert("SIM卡不能为空！");
    		return;
    	}
    	var simData = '';
    	$(".simJson").each(function(){
    		simData = simData + $(this).val() + '&';
    	});
    	
    }
    
    function showExitSn(jsonStr,deliverType,jsonSnSelf){
    	var href = '<%=request.getContextPath() %>/posTransferAdmin/showExitSn?jsonStr='+jsonStr+'&deliverType='+deliverType+'&jsonSnSelf='+jsonSnSelf;
    	$.fancybox.open({
			href : href,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: $(window).width() * 0.6,
            centerOnScroll:true,
            autoSize: true,
            helpers:{
            	overlay:{
            		closeClick:false
            	}
            },
			afterClose:function(){
				
			}
		});
    }
    
    function checkSimFlag(){
    	var flag = true;
    	$(".simFlag").each(function(){
    		if("0" == $(this).val()){
    			flag = false;
    		}
    	});
    	return flag;
    }
    
    function checkSn(){
    	var i = 1;
    	var totalQuantity = 0;
    	var flag = true;
    	var factSn = $("#prefix").val()+$("#begFactSn").val()+$("#suffix").val() ;
    	if((factSn.length<8)||(factSn.length>18)){
    		alert("前缀+起始/终止+后缀的长度应为8~18位!");
    		flag = false;
			return;
    	}
    	
    	
    	$(".table").each(function(){
    		if($(this).find("#goodsNm").val() != 'SIM卡'){
	    		var quan = $(this).find("#quan").val();
	    		var total = 0;
	    		$(this).find(".info").each(function(){
	    			var beg = $(this).find("#begFactSn").val();
	       			var end = $(this).find("#endFactSn").val();
	       			if(beg.length != end.length){
	       				alert("第"+i+"种机具的SN长度不一致");
	       				flag = false;
	       				i++;
	       				return;
	       			}
	       			if(('' != beg && '' == end) || ('' != end && '' == beg) && $(this).find("#goodsNm").val() != 'SIM卡'){
	       				alert("请补全信息!");
	       				flag = false;
	       				return;
	       			}
	       			if($(this).find("#goodsNm").val() != 'SIM卡'){
	         			total += (Number(end) - Number(beg)+1);
	       			}
	    		});
	    		if(flag){
		    		if(total != Number(quan)){
		    			alert("第"+i+"种机具的数量与申请的不符!");
		    			flag = false;
		   				return;
		    		}
		    		totalQuantity += total;
	    		}
    		}
    		i++;
    		
    	});
/*     	if(flag){
	    	if(totalQuantity != Number($("#totalQuantity").val())){
	            alert(totalQuantity);
	    		alert("录入数量不等于总数量!");
	    		flag = false;
				return;
	    	}
    	} */
    	return flag;
    }
    
    
    function infoObject(goodsId,factId,modId,prefix,
    		begFactSn,endFactSn,suffix){ 
    	this.goodsId = goodsId; 
    	this.factId = factId; 
    	this.modId = modId; 
    	this.prefix = prefix; 
    	this.begFactSn = begFactSn; 
    	this.endFactSn = endFactSn; 
    	this.suffix = suffix; 
    	/* this.remark = remark;  */
   		return this;
    } 
    
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
    /** 异步上传excel */
            function ajaxFileUpload(frm,upload) {
            var f = $("#" + frm);
            var param = $("#deviceInfo").val();
            $.ajaxFileUpload({
                        url             : f.attr('action'), 
                        secureuri       : false,
                        fileElementId   : upload, 
                        dataType        : 'text', 
                        data: {
                            'deviceInfo': param
                          },
                        success: function(data,status) 
                        {
                        	if("-1" == data){
                        		alert("EXCEL中的条数不等于订购条数！");
                        		return;
                        	}
                        	if("-2" == data){
                        		alert("EXCEL中的序列号不能为空！");
                        		return;
                        	}
                        	if("-3" == data){
                        		alert("EXCEL中无数据！");
                        		return;
                        	}
                        	if("-4" == data){
                        		alert("获取上传文件失败！");
                        		return;
                        	}
                        	$(simElement).parents(".info").find(".simFlag").val("1");
                        	$(simElement).parents(".info").find(".simJson").val(data);
                        	$(simElement).parents(".info").find(".upload").text(fileName+"上传成功！");
                        },
                        error : function(data, status, e) 
                        {
                        	$(simElement).parents(".info").find(".simFlag").val("0");
                        	$(simElement).parents(".info").find(".upload").text("");
                        	alert("EXCEL上传失败！");
                        	return;
                        	/* $("#uploadResult").html("<font color=red>"+data+"</font>") */
                        }
                    }
            );
        }
    function fillinput(){
           var logisticsCompany=$("#logisticsCompany").val(); 
           if(logisticsCompany==200){
        	   $('#otherlog').show();
           }else{
        	   $('#otherlog').hide();  
           }
    }
    
</script>
</body>
</html>