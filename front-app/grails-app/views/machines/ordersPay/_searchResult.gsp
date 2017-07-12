<div class="portlet light form-fit bordered">
    <div class="portlet-title">
        <div class="caption">
            <i class="icon-book-open"></i>
            <span class="caption-subject bold uppercase"><g:message code="ordersPay.label"></g:message></span>
            <span style="font-size: 13px;font-weight: bold; color: red" onload="this.focus();">
                <g:message code="ordersPay.payReminder.label"></g:message>
                <g:message code="ordersPay.payMessage1.label"></g:message></span>
        </div>
        %{--<div class="col-md-8" style="padding: 10px;">
            <span style="font-size: 15px; color: red">下单后当天未支付成功，订单将被取消</span>
        </div>--}%
    </div>

    <div class="portlet-body form">
        <component:modals id="sample_modal1" title="" width="content"/>
        <component:modals id="sample_modal2" title="" width="gl"/>
        <g:uploadForm controller="ordersPay" action="remitPay" name="remitPayForm"
                      class="form-horizontal ng-pristine ng-valid form-bordered remitPayForm">
        %{--<form class="form-horizontal ng-pristine ng-valid form-bordered" role="form"  action="/ordersPay/remitPay" method="post">--}%
            <div class="portlet-body form">

                <form class="form-horizontal">
                 <input type="hidden" name="onlinepay" id="onlinepay" value="${onlinepay}"/>
                  <input type="hidden" name="remintpay" id="remintpay"  value="${remintpay}"/>
        <div class="row" style="padding-top: 10px">
            <div class="col-md-4">
                        <label class="col-md-4 text-right ">
            <message:property domain="ordersPay" property="orderCode"/>
            </label>

            <div class="col-md-8">
                <span class="text-left goodsOrderId">${ordersPayInstance.goodsOrderId}</span>
            </div>
            </div>

            <div class="col-md-4">
                <label class="col-md-4 text-right">
                    <message:property domain="ordersPay" property="total"/>
                </label>

                <div class="col-md-8">
                    <span class="text-left">${ordersPayInstance.total}</span>
                </div>
            </div>

            <div class="col-md-4">
                <label class="col-md-5 text-right">
                    <message:property domain="ordersPay" property="actualAmount"/>
                </label>

                <div class="col-md-7">
                    <span class="text-left actualAmount">${ordersPayInstance.actualAmount}</>
                </div>
            </div>
            </div>
            <div>
                <div class="row">
                    <div class="col-md-4">
                        <label class="col-md-4 text-right">
                            <message:property domain="ordersPay" property="arriveGoodsPersonName"/>
                        </label>

                        <div class="col-md-8">
                            <span class="text-left">${ordersPayInstance.arriveGoodsPersonName}</span>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <label class="col-md-4 text-right">
                            <message:property domain="ordersPay" property="contactNumber"/>
                        </label>

                        <div class="col-md-8">
                            <span class="text-left">${ordersPayInstance.contactNumber}</span>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <label class="col-md-5 text-right">
                            <message:property domain="ordersPay" property="orderGoodsSalesMan"/>
                        </label>

                        <div class="col-md-7">
                            <span class="text-left">${ordersPayInstance.orderGoodsSalesMan}</span>
                        </div>
                    </div>
                </div>
            </div>
        %{--收货地址--}%
            <div>
                <div class="row">
                    <div class="col-md-4">
                        <label class="col-md-4 text-right">
                            <message:property domain="ordersPay" property="deliveryArrive"/>
                        </label>

                        <div class="col-md-8">
                            %{--<span class="control-label">${ordersPayInstance.deliveryArrive}</span>--}%
                            <span class="text-left text-nowrap">${ordersPayInstance.deliveryArrive}</span>
                        </div>
                    </div>

                </div>
            </div>
        %{--赊购--}%
            <g:if test="${isCredit != '0'}">
                <div class="row">
                    <div class="control-label col-md-4" id="credit">
                        <label class="control-label  col-md-4">赊购</label>
                        <div class="col-md-2">
                            <input type="checkbox" class="make-switch creditAmount" data-on-color="success" name="isCredit" id="creditAmount1"
                                data-off-color="default" onchange="checkCreditPay();" data-size="small"></div>
                    </div>

                    <div class="col-md-6">
                        <label class="col-md-7 control-label"><g:message
                                code="ordersPay.haveCreditAmount.label"></g:message><label id="amount">${ordersPayInstance.creditAmount}</label>
                        <g:message code="ordersPay.yuan.label"></g:message>,<g:message
                                code="ordersPay.useCreditAmount.label"></g:message></label>

                        <div class="col-md-2"><g:textField
                                name="usedAmount" id="usedAmount"
                                class="form-control" value="${ordersPayInstance.creditAmount}" ></g:textField>

                        </div>
                        <label class="col-md-1 orderText_leftBottom"><g:message code="ordersPay.yuan.label"></g:message></label></div>

                </div>
            </g:if>

            <div class="row">
                <div class="col-md-4 online">
                    <label class="control-label col-md-4"><g:message code="ordersPay.payMod.label"></g:message></label>
                    <label class="orderText_leftBottom col-md-3 ">在线支付</label>

                    <div class="col-md-3">
                        <input type="checkbox" class="make-switch onlinePay" data-on-color="success"
                              data-off-color="default" onchange="checkOnlinePay();" data-size="small"></div>

                </div>

                <div class="col-md-6 remint">
                    <label class="control-label col-md-2">汇款</label>
                    <div class="col-md-3">
                        <input type="checkbox" class="make-switch remittance" data-on-color="success"
                              data-off-color="default" onchange="checkRemitPay();" data-size="small"></div>

                </div>
            </div>
            <div style="display: none;" id="remittanceInfo">
            <div >
             <div class="row">
                 <div class="col-md-4">
                     <label class="text-right col-md-4">
            <g:message code="ordersPay.payee.label"></g:message>
            </label>

            <div class="col-md-8">
                <span class="text-left text-nowrap">${ordersPayInstance.payee}</span>
            </div>
            </div>
        </div>
            </div>
        %{--开户行--}%
            <div>
                <div class="row">
                    <div class="col-md-4">
                        <label class="text-right col-md-4"><g:message
                                code="ordersPay.openBank.label"></g:message></label>

                        <div class="col-md-8">
                            <span class="text-left text-nowrap">${ordersPayInstance.openBank}</span>
                        </div>
                    </div>
                </div>
            </div>

        %{--汇款账号--}%
            <div>
                <div class="row">
                    <div class="col-md-4">
                        <label class="text-right col-md-4"><g:message
                                code="ordersPay.remittanceAccountNo.label"></g:message></label>

                        <div class="col-md-8">
                            <span class="text-left">${ordersPayInstance.remittanceAccountNo}</span>
                        </div>
                    </div>

                    <div class="col-md-8" style="color: red"><span class="text-left"><g:message
                            code="ordersPay.remittanceMessage.label"></g:message></span></div>
                </div>
                <div class="row" >
                    <div class="col-md-8" style="padding-left: 50px;color: red"><span class="text-center"><g:message
                            code="ordersPay.remittanceMessage2.label"></g:message></span></div>
                </div>
            </div>
        %{--上传凭证--}%
            <div>
                <div class="row">
                    <div class="col-md-4" style="color: green;">
                        <label class="col-md-11 text-center" style="font-size:23px;"><g:message
                                code="ordersPay.uploadDocument.label"></g:message></label>
                    </div>

                    <div class="col-md-12">
                        <div class="col-md-1"></div>
                        <label class="col-sm-3" align="center">
                            <div class="col-md-9" align="center">
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail"
                                         style="width: 200px; height: 150px;">
                                        <div style="margin-top: 30%;color: #2a4d6c"><g:message code="ordersPay.uploadDocument.label"/> </div></div>

                                    <div class="fileinput-preview fileinput-exists thumbnail"
                                         style="max-width: 200px; max-height: 150px; line-height: 10px;"></div>

                                    <div>
                                        <span class="btn default btn-file">
                                            <span class="fileinput-new"><g:message code="ordersPay.uploadImage.label"/> </span>
                                            <span class="fileinput-exists"><g:message code="ordersPay.modifyImage.label"/> </span>
                                            <input type="hidden"><input type="file" name="inFile" onchange="selectFile(this)"></span>
                                        <a href="javascript:;" class="btn red fileinput-exists"
                                           data-dismiss="fileinput"><g:message code="ordersPay.deleteImage.label"/></a>
                                    </div>
                                </div>

                                <div class="clearfix margin-top-10">
                                </div>
                            </div></label>

                    </div>
                </div>
            </div>

            <div>
                <div class="row">
                    <div>
                      %{--  <domainEdit:textField domain="ordersPay" property="payAccountNo"
                                              domainInstance="${ordersPayInstance}" required="true"/>
                        <domainEdit:textField domain="ordersPay" property="accountNoName"
                                              domainInstance="${ordersPayInstance}" required="true"/>--}%
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="">
                                <label class="col-md-3 col-sm-3 col-xs-12 control-label">
                                  <g:message code="ordersPay.remittanceAccountNo.label"></g:message>
                                    <span class="required">*</span>
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">

                                    <input type="text" class="form-control" name="payAccountNo" value="" required="required" id="payAccountNo" maxlength="30" title="不能超过30个数字" onkeyup="this.value=this.value.replace(/\D/g,'')">

                                    <span class="help-block"></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="">
                                <label class="col-md-3 col-sm-3 col-xs-12 control-label">
                                    <g:message code="ordersPay.accountNoName.label"></g:message>
                                    <span class="required">*</span>
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">

                                    <input type="text" class="form-control" name="accountNoName" value="" required="required" id="accountNoName"  onkeyup="WidthCheck(this, 60)" title="不能超过60个字符">

                                    <span class="help-block"></span>
                                </div>
                            </div>
                        </div>





                        <div class="col-md-6">
                            <div>
                                <label class="control-label col-md-3"><message:property domain="ordersPay"
                                                                                        property="remittanceDate"/>
                                    <span class="required">*</span>
                                </label>

                                <div class="col-md-9">
                                    <div class="input-group date-picker input-daterange" data-date-format="yyyy-mm-dd">
                                        <input type="text" class="form-control" name="remittanceDate"
                                               value="${params ? params[remittanceDate] : ''}" required="required"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <g:hiddenField name="goodsOrderId" value="${ordersPayInstance.goodsOrderId}"
                                       class="hiddenOrderId"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12" align="center">
                    <div style="display: none" id="remittance">
                        <button type="submit" class="btn btn-pay remitPayButton" onclick="makeSure();">
                            <g:message code="ordersPay.sureRemittance.label"></g:message>
                        </button>
                        %{--<button class="btn btn-return" onclick="javascript:history.go(-1);"><g:message
                                code="ordersPay.return.label"></g:message></button>--}%
                        <g:link data-toggle="modal" data-target="#sample_modal2" class="btn btn-close"
                                controller="ordersPay" action="close"><g:message
                                code="ordersPay.close.label"></g:message></g:link>
                    </div>

                </div>
            </div>
        %{--</form>--}%
        </g:uploadForm>

    </div>

        <div class="form-group">
            <div class="col-md-12" align="center">
                <div id="checkstand" style="display: none">
                    <g:link onclick="payConfirm()"
                            controller="ordersPay" action="payConfirm" class="btn btn-pay onlinePayButton">
                        <g:message code="ordersPay.toCheckstand.label"></g:message>
                    </g:link>
                    %{--  <button class="btn btn-return" onclick="javascript:history.go(-1);"><g:message
                              code="ordersPay.return.label"></g:message></button>--}%
                    <g:link data-toggle="modal" data-target="#sample_modal2" class="btn btn-close"
                            controller="ordersPay" action="close"><g:message
                            code="ordersPay.close.label"></g:message></g:link>
                </div>

                <div style="display: none" id="creditAmount">
                    <g:link class="btn btn-pay creditPay" >
                        <g:message code="ordersPay.creditPay.label"></g:message>
                    </g:link>
                    <g:link data-toggle="modal" data-target="#sample_modal2" class="btn btn-close"
                            controller="ordersPay" action="close"><g:message
                            code="ordersPay.close.label"></g:message></g:link>
                </div>

            </div>
        </div>
    </div>
    </form>
    </div>

</div>
</div>

<content tag="takin-footer">
    <asset:javascript src="/machines/orderPay.js"/>
    <asset:javascript src="/validateLength.js"/>
    <asset:javascript src="validationFile.js"/>
<asset:javascript src="/machines/deviceOrder.js"/>
    <g:javascript>


        function payConfirm() {
            bootbox.dialog({
                message: "请到新打开的页面上完成付款操作。并在操作完成后点击下方按钮",
                title: "<h5><i class='ace-icon fa fa-table'></i>支付提示:</h5>",
                buttons: {
                    Cancel: {
                        label: "完成付款",
                        className: "btn btn-pay-ok payDone",
                        callback: function () {
                            payDone()
                        }
                    }
                    , OK: {
                        label: "付款遇到问题",
                        className: "btn  btn-question payDone",
                        callback: function () {
                            payDone()
                        }
                    }
                }
            });
            $(".bootbox-close-button").eq(0).remove()
        }
        $(function () {
            if($("#remintpay").val()==''){
                $(".remint").hide()
            }else if($("#onlinepay").val()==''){
                $(".online").hide()
            }
        })
        function makeSure(){
            var flag = validataAllImg();
            if(!flag){return false;}
        }
        function selectFile(fnUpload) {
            var span = $(fnUpload).parent().parent().find("span[name='outSize']");
            if (span != null)$(span).remove();
            var flag =  validateFile($(fnUpload),'pic',false);
            if(flag != -1){
                var message = "";
                if(flag == 1){
                    message = "</br>超过300k";
                }
                if(flag == 2){
                    message = "</br>格式不支持";
                }
                $(fnUpload).parent().parent().append($("<span style='color:red' name='outSize'>"+message+"</span>"));
            }
        }
        $(function(){

            $("#creditAmount1").val()


            $(".creditPay").click(function(e){
                e.preventDefault();
                var flag = true
                var url1 = '/deviceOrder/index'
                var orderId = $(".hiddenOrderId").val();
                $.ajax({
                    url: '/ordersQuery/orderDetaile',
                    data:{"goodsOrderId":orderId},
                    async:false,
                    success : function(data) {
                        flag = checkInformation(data,url1)
                    }
                });
                if(flag){
                    var actualAmount = $(".actualAmount").eq(0).text().trim();
                    var actualAmount_new = 0;
                    $.ajax({
                        url: '/ordersPay/getActualAmount',
                        data:{"goodsOrderId":orderId},
                        async:false,
                        success : function(data) {
                            actualAmount_new = data.result;
                            if(parseFloat(actualAmount)!=parseFloat(actualAmount_new)){
                                bootbox.alert("实收金额已变，请确认")
                                setTimeout(function () {
                                    location.reload()
                                },2000)
                                return;
                            }
                            creditPay();
                            return false;
                        }
                    });
                }else{
                    return false;
                }


            })
            $(".onlinePayButton").click(function(e){
                var url1 = '/deviceOrder/index'
                var flag1  = true;
                e.preventDefault();
                var orderId = $(".hiddenOrderId").val();
                $.ajax({
                    url: '/ordersQuery/orderDetaile',
                    data:{"goodsOrderId":orderId},
                    async:false,
                    success : function(data) {
                        flag1 = checkInformation(data,url1)
                    }
                });
               if(flag1){
                   return nextStep();
               }else{
                   return false;
               }
            })
            $(".remitPayButton").click(function(e){
               // e.preventDefault();
                var flag1  = true;
                var orderId = $(".hiddenOrderId").val();
                var url1 = '/deviceOrder/index'
                $.ajax({
                    url: '/ordersQuery/orderDetaile',
                    data:{"goodsOrderId":orderId},
                    async:false,
                    success : function(data) {
                        flag1 =  checkInformation(data,url1)

                    }
                });
                if(flag1){
                    return remitPay();
                }else{
                    return false;
                }

            })
        });


        function checkRemitPay(){
            //checkCreditPay()
            if ($(".remittance").prop('checked') && !$(".onlinePay").prop('checked')&& !$(".creditAmount").prop('checked')) {
                $("#checkstand").hide();
                $("#creditAmount").hide();
                $("#remittanceInfo").show();
                $("#remittance").show();
            } else if (!$(".remittance").prop('checked')) {
                $("#remittanceInfo").hide();
            }else if ($(".onlinePay").prop('checked') && $(".remittance").prop('checked')) {
                bootbox.alert({
                    buttons: {
                        ok: {
                            label: '确定',
                        }
                    },
                    message: '汇款和在线支付不能同时选中',
                    title: "",
                });
                $(".onlinePay").prop('checked',false);
                $('.onlinePay').trigger('change');
                $("#checkstand").hide();
                $("#creditAmount").hide();
                $("#remittanceInfo").show();
                $("#remittance").show();
            }
            else if ($(".remittance").prop('checked') && $(".creditAmount").prop('checked')) {
                bootbox.alert({
                    buttons: {
                        ok: {
                            label: '确定',
                        }
                    },
                    message: '赊购和汇款不能同时选中',
                    title: "",
                });
                $(".creditAmount").prop('checked',false);
                $('.creditAmount').trigger('change');
                $("#checkstand").hide();
                $("#creditAmount").hide();
                $("#remittanceInfo").show();
                $("#remittance").show();
            }
        }

        function payDone() {
            var orderId = $(".hiddenOrderId").val();
            window.location.href = '/ordersPay/payDone?goodsOrderId=' + orderId;
        }

        function checkOnlinePay() {
          //  checkCreditPay()
            if ($(".onlinePay").prop('checked') && !$(".remittance").prop('checked')&& !$(".creditAmount").prop('checked')) {
                $("#checkstand").show();
                $("#creditAmount").hide();
                $("#remittanceInfo").hide();
            } else if (!$(".onlinePay").prop('checked')) {
                $("#checkstand").hide();
            } else if ($(".onlinePay").prop('checked') && $(".remittance").prop('checked')) {
                bootbox.alert({
                    buttons: {
                        ok: {
                            label: '确定',
                        }
                    },
                    message: '汇款和在线支付不能同时选中',
                    title: "",
                });
                $(".remittance").prop('checked',false);
                $('.remittance').trigger('change');
                $("#checkstand").show();
                $("#creditAmount").hide();
                $("#remittanceInfo").hide();
            }
            else if ($(".onlinePay").prop('checked') && $(".creditAmount").prop('checked')) {
                bootbox.alert({
                    buttons: {
                        ok: {
                            label: '确定',
                        }
                    },
                    message: '赊购和在线支付不能同时选中',
                    title: "",
                });
                $(".creditAmount").prop('checked',false);
                $('.creditAmount').trigger('change');
                $("#checkstand").show();
                $("#creditAmount").hide();
                $("#remittanceInfo").hide();
            }
        }

    </g:javascript>
</content>