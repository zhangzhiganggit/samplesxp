<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.OtherConsumeRate" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title">修改POS扫码费率</h4>
</div>
<div class="modal-body">

    <div class="row text-nowrap">
        <component:portlet cssClass="scaffold-show">


            <portlet:body withForm="true">
                <form:form action="#" id="updateRete">
                    <form:body>
                        <input type="hidden" id="insideMerchantCode" value="${otherConsumeRateInstance?.insideMerchantCode}"/>
                        <input type="hidden" id="merchantCode" value="${otherConsumeRateInstance?.merchantCode}"/>
                        <input type="hidden" id="receiptsName" value="${otherConsumeRateInstance?.receiptsName}"/>
                        <input type="hidden" id="currentRate" value="${otherConsumeRateInstance?.currentRate}"/>


                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="col-md-3 col-sm-3 col-xs-12 control-label"><g:message code="otherConsumeRate.merchantCode.label"></g:message><g:message code="dashBoard.system.colon"></g:message>
                                    </label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <p class="form-control-static">${otherConsumeRateInstance?.insideMerchantCode}&nbsp;</p>
                                       %{-- <g:textField class="form-control" name="merchantCode"  value="${otherConsumeRateInstance?.merchantCode }" readonly="readonly" />--}%
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="col-md-3 col-sm-3 col-xs-12 control-label"><g:message code="otherConsumeRate.receiptsName.label"></g:message><g:message code="dashBoard.system.colon"></g:message>
                                    </label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <p class="form-control-static">${otherConsumeRateInstance?.receiptsName }&nbsp;</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="col-md-3 col-sm-3 col-xs-12 control-label"><g:message code="otherConsumeRate.currentRate.label"></g:message><g:message code="dashBoard.system.colon"></g:message>
                                    </label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <p class="form-control-static">${otherConsumeRateInstance?.currentRate}&nbsp;</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-sm-12">
                                <div class="form-group">
                                    <label class="col-md-3 col-sm-3 col-xs-12 control-label"><g:message code="otherConsumeRate.newRate.label"></g:message><g:message code="dashBoard.system.colon"></g:message>
                                    </label>
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <select class="form-control" name="newRate" id="newRate" required="required">
                                            <option value="0.5">0.5</option>
                                            <option value="0.38">0.38</option>
                                        </select>
                                        %{-- <g:select class="form-control" name="newRate" from="${from}" value="${params ? params['q_' + property] : '' }" valueMessagePrefix="${domain}.${property}" noSelection="${noSelection?noSelection:['':'']}" />--}%
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form:body>

                </form:form>
            </portlet:body>
            <div class="col-md-12 text-center">
                <button class="btn btn-modify Editor" id="updateRate" >修改</button>
                <button class="btn btn-cancle" data-dismiss="modal" id="closed">关闭</button>
            </div>
        </component:portlet>


        <g:javascript>
            $("#updateRate").on('click', function () {
                if($("#currentRate").val()==$("#newRate").val()){

                    bootbox.alert("新费率不允许与当前生效费率一致");
                }else {
                    $.ajax({
                        url: '/otherConsumeRate/rateEdit',
                        data:{
                            insideMerchantCode: $("#insideMerchantCode").val(),merchantCode: $("#merchantCode").val(),
                            currentRate: $("#currentRate").val(), newRate: $("#newRate").val()
                            }
                    }).done(function(data) {
                        if (data != "") {
                            bootbox.dialog({
                                message: "提示信息："+data,
                                onEscape: function() {
                                    $("div.scaffold-search form").submit();
                                },
                                buttons: {
                                    success: {
                                        label: '关闭',
                                        className: "green",
                                        callback: function () {
                                            $("div.scaffold-search form").submit();
                                        }
                                    }
                                }
                            });

                        }
                    })
                }
            })
        </g:javascript>
    </div>


</div>
<div class="modal-footer"></div>