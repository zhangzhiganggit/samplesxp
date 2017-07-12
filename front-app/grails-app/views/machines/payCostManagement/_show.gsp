<%@ page import="com.suixingpay.ssp.front.machines.PayCostManagement" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            iconCssClass="fa fa-filter"  title="${message(code: 'payCostManagement.payCost.label', args: message.domain(domain: 'payCostManagement'))}"/>
    <portlet:body withForm="true">
        <form:form>
            <form:body>

                <formCommon:hiddenField name="id" value="${payCostManagementInstance?.id}"/>


                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><g:message
                                    code="payCostManagement.totalPayCostAmount.label"></g:message></label>

                            <div class="col-md-8">
                                <p class="form-control-static">${payCostManagementInstance.totalPayCostAmount}
                                <g:message code="payCostManagement.yuan.label"></g:message>
                                </p>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-3">
                        <div class="form-group">
                            <label class="control-label col-md-4"><g:message
                                    code="payCostManagement.total.label"></g:message></label>

                            <div class="col-md-8">
                                <p class="form-control-static">${payCostManagementInstance.total}
                                <g:message code="payCostManagement.card.label"></g:message>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-5">
                        <div class="form-group">
                            <label class="control-label col-md-4"><g:message
                                    code="payCostManagement.serial.label"></g:message></label>

                            <div class="col-md-8">
                                <p class="form-control-static">${payCostManagementInstance.serial}</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group" style="">
                            <label class="control-label col-md-4"><message:property domain="payCostManagement"
                                                                                    property="payCostWay"></message:property></label>

                            <div class="col-md-8">
                                <div class="mt-radio-inline">
                                    <label class="mt-radio">
                                        <input type="radio" name="radio" value="1" checked="checked"
                                               onclick="radio1();"/>
                                        <message:property domain="payCostManagement"
                                                          property="online"></message:property>
                                        <span></span>
                                    </label>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            %{--隐藏div--}%

                <input type="hidden" id="deviceIds" value="${payCostManagementInstance.deviceId}"/>
                <input type="hidden" id="serial" value="${payCostManagementInstance.serial}"/>

                <div class="form-actions">
                    <div class="row">
                        <div class="col-md-offset-5 col-md-12">
                            <g:link data-toggle="modal" data-target="#sample_modal1"
                                    controller="payCostManagement" action="payConfirm"
                                    class="btn btn-pay" id="onlinePayButton"
                                    onclick="nextStep()">
                                <g:message code="payCostManagement.toCheckstand.label"></g:message>
                            </g:link>
                            <g:link controller="payCostManagement" action="index" class="btn btn-return"><g:message
                                    code="payCostManagement.back.label"></g:message></g:link>
                        </div>
                    </div>
                </div>


            </form:body>

        </form:form>
        <component:modals id="sample_modal1" title="" width="content"/>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <g:javascript>
        /*$(function () {
            $("#onlinePayButton").on('click', function () {
                nextStep()
            })
        });*/
       var flag = true;

        function nextStep() {
            var deviceIds = $("#deviceIds").val();
            var serial = $("#serial").val();
            var url = '/payCostManagement/payOrder?deviceIds=' + deviceIds + '&serial=' + serial;
            if(flag){
                window.open(url);
            }

            flag = false;
            return;
        }

        function payDone() {
            var onlinePayNo = $("#serial").val();
            window.location.href = '/payCostManagement/payDone?onlinePayNo=' + onlinePayNo;
        }
        // function nextStep(goodsOrderId){
        //     var payMod = $("input[name='radio']:checked").val();
        //     var usedAmount = $("#usedAmount").val();
        //     var isCredit = $("input[name='isCredit']:checked").val();
        //     if(''==payMod || payMod == undefined){
        //         alert("请选择付款方式！");
        //         return;
        //     }
        //     var url = '/ordersPay/confirmPayment?goodsOrderId='+goodsOrderId+'&payMod='+payMod+'&usedAmount='+usedAmount+'&isCredit='+isCredit;
        //     if('1'==payMod){
        //         window.open(url);
        //         return ;
        //     }
        //     document.getElementById("searchForm").action=url;
        //     document.getElementById("searchForm").submit();
        // }
    </g:javascript>
</content>