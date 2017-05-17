<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付</title>
    <style type="text/css">
            #goodsNamemain{width:500px;height:100px;}
			#goodsNameleft{width:100px;height:80px;}
			#goodsNameright{width:395px;height:80px;}
			#goodsNameleft,#goodsNameright{float:left;}
    </style>
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

                        <div class=" widget-container-col ui-sortable  "  >

                            <div class="widget-box widget-color-normal3"  >
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        订单改价
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <form class="form-inline form-horizontal" action="" id="searchForm">
                                        <input type="hidden" id="goodsOrderId" name="goodsOrderId" value="${goodsOrder.goodsOrderId }">
                                            <div class="widget-main no-padding">
                                                <div class="col-sm-12">
                                                <h6 class="header smaller lighter red">提醒：订单当天不支付则会失效</h6>
                                                </div>
                                                <div class="col-sm-12">
                                                    <h4 class="header smaller lighter green">收货人信息 </h4>
                                                    <table class="table table-striped table-bordered width-50">
                                                        <tbody>
                                                        		<tr class="ar" >
                                                        			<td nowrap class="">
	                                                        				<input type="radio" name="address" class="ad"  checked="checked">
                                                        			</td>
                                                        			<td nowrap class="postUser">${goodsOrder.contact}</td>
                                                        			<td nowrap class="address">${goodsOrder.address}</td>
                                                        			<td nowrap >${goodsOrder.contactTelNo}</td>
                                                        			<td nowrap><span style="color: red">
	                                                        			<c:if test="${goodsOrder.addressDefaultFlag == true }" >默认地址</c:if>
										                                <c:if test="${goodsOrder.addressDefaultFlag == false}" >非默认地址</c:if>
                                                        			</span></td>
                                                        		</tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="col-sm-12 no-padding">
                                                    <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                                        <thead class="thin-border-bottom">
                                                        <tr>
                                                            <th style="text-align:center;width:40%">名称 </th>
                                                            <th style="text-align:center;width:10%">数量</th>
                                                            <th style="text-align:center;width:10%">单价 </th>
                                                            <th style="text-align:center;width:10%">优惠(元)</th>
                                                            <th style="text-align:center;width:10%">小计(元)</th>
                                                        </tr>
                                                        </thead>

                                                        <tbody>
                                                            <c:forEach items="${goodsOrderList}" var="oL">
																<tr >
																	<td class="goodsName" >
																		<div id="goodsNamemain">
																		   <div id="goodsNameleft">
																			<img style="width: 70px; height: 70px" alt="" src="<%=request.getContextPath()%>/orderChange/imgShow?picturePath=${oL.picturePath}"/>
																		   </div>
																		   <div id="goodsNameright">${oL.priceDetail}</div>
																			
																		</div>	
																	</td>
																	<td class="quantity" style="text-align:center;">${oL.quantity}</td>
																	<td class="numberPointFormatForText" style="text-align:center;">${oL.unitPrice}</td>
																	<td class="numberPointFormatForText" style="text-align:center;">${oL.itemDiscount}</td>
																	<td class="numberPointFormatForText" style="text-align:center;">${oL.paymentAmount}</td>
																</tr>
															</c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                &nbsp;
                                                <div class="col-sm-12" style="padding-top:2px">                                                   
                                                   <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >订单备注:</label>
                                                        <div class="col-sm-8  no-padding">
                                                           <textarea  style="height:80px" name="memo" id="memo"  class="form-control limited input-small width-100"  readonly="readonly">${goodsOrder.memo}</textarea>
                                                        </div>
                                                   </div>
                                                </div>
												&nbsp;
                                                <div class="col-sm-12" style="padding-top:2px">
                                                	<table style="width: 120%">
                                                	<tr>
														<td width="5%"><input type="checkbox" class="ace " id="chk1" name="type"  disabled>
																		              <span class="lbl middle"></span>
														</td>
														<td>
															<div class="form-group form-group-sm width-300px ">
														        <div class="col-sm-8  no-padding"  >
                                                                     <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='questionDetail' data-placement="bottom" data-trigger="hover" data-rel="popover" 
                                                                                    >共计￥0奖励金可抵现￥0.00</label>                               
                                                                </div>
                                                            </div>
														</td>
													</tr>
													<tr>
														<td width="5%"><br/><br/><br/></td>
														<td>
															<div class="form-group form-group-sm width-300px ">
		                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-right"  >应收金额:</label>
		                                                        <div class="col-sm-8  no-padding "  >
                                                                   ￥<input type="text" name="payableAmount" id="payableAmount" value="${goodsOrder.payableAmount}" class="form-control input-small width-200px" readonly="readonly" >
                                                                </div>
                                                            </div>
														</td>
													</tr>
													<tr>
														<td width="5%"></td>
														<td>
															<div class="form-group form-group-sm width-300px ">
		                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-right"  >已节省:</label>
		                                                        <div class="col-sm-8  no-padding"  >
                                                                   ￥<input type="text" name="cutAmount" id="cutAmount" value="0.00" class="form-control input-small width-200px" readonly="readonly" >
                                                                </div>
                                                            </div>
														</td>
													</tr>
													<tr>
														<td width="5%"><br/><br/><br/></td>
														<td>
															<div class="form-group form-group-sm width-300px ">
		                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-right"  >使用奖励金:</label>
		                                                        <div class="col-sm-8  no-padding"  >
                                                                   ￥<input type="text" name="factShortname" id="factShortname" value="0.00" class="form-control input-small width-200px" readonly="readonly" >
                                                                </div>
                                                            </div>
														</td>
													</tr>
													<tr>
														<td width="5%"><br/><br/><br/></td>
														<td>
															<div class="form-group form-group-sm width-300px ">
		                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-right"  >实收金额:</label>
		                                                        <div class="col-sm-8  no-padding"  >
                                                                   ￥<input type="text" name="paymentAmount" id="paymentAmount" value="${goodsOrder.paymentAmount}" class="form-control input-small width-200px" readonly="readonly" >
                                                                </div>
                                                            </div>
														</td>
													</tr>
													<tr class="tr-row">
														<td width="5%"><br/><br/><br/></td>
														<td>
															<div class="form-group form-group-sm width-300px ">
		                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-right"  ><span style="color: red">*</span>订单调整额:</label>
		                                                        <div class="col-sm-8  no-padding"  >
                                                                   ￥<input type="text" name="adjustAmount" id="adjustAmount" value="0.00" class="form-control input-small width-200px" onblur="checkAdjust(this.value,this.id)">
                                                                </div>
                                                            </div>
														</td>
													</tr>
													<tr class="tr-row">
														<td width="5%"><br/><br/><br/></td>
														<td>
															<div class="form-group form-group-sm width-300px ">
		                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-right"  >调整后金额:</label>
		                                                        <div class="col-sm-8  no-padding"  >
                                                                   ￥<input type="text" name="adjustmentAmount" id="adjustmentAmount" value="0.00" class="form-control input-small width-200px" readonly="readonly" >
                                                                </div>
                                                            </div>
														</td>
													</tr>
												</table>
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm saveBtn" type="button" onclick="confirm()">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        	保存
                                                    </button>
                                                    <button class="btn  btn-sm" type="button"  onclick="closeWin()">
                                                        <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
                                                        关闭
                                                    </button>
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

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%@include file="../../layout/common.js.jsp"%>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    function closeWin(){
    	parent.$.fancybox.close();
    }

        $('.chosen-select').chosen({});
        jQuery(function($) {
        	$(".price").each(function(index){
	       		var index=this.innerHTML.indexOf('.');
	       		if(index == -1){
	       			this.innerHTML=this.innerHTML+".00";
	       		}
       });
       		$(".payableAmount").each(function(index){
	       		var index=this.innerHTML.indexOf('.');
	       		if(index == -1){
	       			this.innerHTML=this.innerHTML+".00";
	       		}
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
            	adjustAmount: {
                    validators: {
                    	 regexp: {
                             regexp: /^(([0-9]+\d*)|([0-9]+\d*\.\d{1,2}))$/,
                             message:'最多保留小数点后两位'
                         }
                    }
                }
            }
        });
    })
    
    function confirm(){
        	$(".saveBtn").attr('disabled',true);
        	var adjustAmount=$("#adjustAmount").val();
        	var paymentAmount=Number($("#paymentAmount").val());
        	var check=/^(([0-9]+\d*)|([0-9]+\d*\.\d{1,2}))$/;
        	if(Number(adjustAmount)>paymentAmount || !check.test(adjustAmount)){
        		alert("订单调整金额的范围应在0-实收金额之间,并且最多保留两位小数！");
        		$(".saveBtn").attr('disabled',false);
        		return;
        	}
        	var adjustmentAmount=$("#adjustmentAmount").val();
        	var goodsOrderId=$("#goodsOrderId").val();
        	$.ajax({
        	   	    	cache: true,
        	   	        type: "POST",
        	   	        url:"<%=request.getContextPath()%>/orderChange/updateSave.do?adjustAmount="+adjustAmount+"&adjustmentAmount="+adjustmentAmount+"&goodsOrderId="+goodsOrderId,
        	   	        dataType : "json",
        				async : false,
        				error : function(data) {
        					alert("提交失败");
        				},
        				success : function(data) {
        					var resCode = data.resCode;
        					alert(data.resMsg);
        					parent.$.fancybox.close();
        					window.parent.location.reload();
        				}
        			});
	    }
        function checkAdjust(value,id){
        	var paymentAmount=Number($("#paymentAmount").val());
        	var adjustmentAmount=paymentAmount-Number(value);
        	var check=/^(([0-9]+\d*)|([0-9]+\d*\.\d{1,2}))$/;
        	if(Number(value)>paymentAmount || !check.test(value)){
        		alert("订单调整金额的范围应在0-实收金额之间,并且最多保留两位小数！");
        		document.getElementById("adjustmentAmount").value =paymentAmount;
        		return;
        	}
        //调整后金额展示两位小数
        	var s = adjustmentAmount.toString();    
            var rs = s.indexOf('.');    
            if (rs < 0) {    
                rs = s.length;    
                s += '.';    
            }    
            while (s.length <= rs + 2) {    
                s += '0';    
            }      
        	document.getElementById("adjustmentAmount").value =s;
        }
</script>
</body>
</html>











