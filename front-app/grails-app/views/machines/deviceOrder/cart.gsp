<!DOCTYPE html>

<head>
    <meta name="layout" content="scaffold">
</head>
<component:portlet>
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-filter"></i>
            <span class="caption-subject bold uppercase">
                <g:message
                        code="deviceOrder.shoppingCart.label"></g:message>
            </span>

            <span class="caption-helper"></span>
        </div>

        <div class="row" style="color: red;margin-top:10px">
            <div class="col-md-8"><strong><g:message code="deviceOrder.remind.label"></g:message>:<g:message
                    code="deviceOrder.buyMessage.label"></g:message></strong></div>
        </div>
    </div>
    <portlet:body>


     %{--   <div class="row" style="color: red;">
            <div class="col-md-8"><strong><g:message code="deviceOrder.remind.label"></g:message>:<g:message
                    code="deviceOrder.buyMessage.label"></g:message></strong></div>
        </div>--}%

        <table class="table table-striped table-bordered table-hover dataTable no-footer ">
            <thead><tr>

                <th><component:checkbox title="" cssClass="group-checkable" property="stringValue"
                                        dataSet="#sample_1 .checkboxes"/><g:message
                        code="cardManagement.checkAll.label"></g:message></th>

                <th><g:message
                        code="deviceOrder.Name.label"></g:message></th>

                <th><g:message
                        code="deviceOrder.quantity.label"></g:message></th>

                <th><g:message code="deviceOrder.unitPrice.label"></g:message></th>

                <th><g:message
                        code="deviceOrder.operation.label"></g:message></th>
            </tr>
            </thead>


        <tbody>
            <g:each var="deviceOrderInstance"
                    in="${deviceOrderInstanceList}">
                <g:hiddenField name="levelOneQuantity" id="levelOneQuantity"
                               value="${deviceOrderInstance.levelOneQuantity}"/>
                <g:hiddenField name="levelTwoQuantity" id="levelTwoQuantity"
                               value="${deviceOrderInstance.levelTwoQuantity}"/>
                <g:hiddenField name="levelOnePrice" id="levelOnePrice"
                               value="${deviceOrderInstance.levelOnePrice}"/>
                <g:hiddenField name="levelTwoPrice" id="levelTwoPrice"
                               value="${deviceOrderInstance.levelTwoPrice}"/>
                <g:hiddenField name="levelThreePrice" id="levelThreePrice"
                               value="${deviceOrderInstance.levelThreePrice}"/>
                <g:hiddenField name="priceId" id="priceId" value="${deviceOrderInstance.priceId}"/>
                <tr>
                    <div class="col-md-1">
                        <td align="center">
                            <div style="line-height: 150px;width:85px">
                                <g:if test="${deviceOrderInstance.status == '01'}">
                                    <g:if test="${deviceOrderInstance.ifCanBuy == '00'}">
                                        <strong
                                                style="color: grey"><small>限购</small></strong>
                                    </g:if>
                                    <g:else>
                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                    <input type="checkbox" name="checkItem" id="checkbox_${deviceOrderInstance.priceId}"
                                           class="checkboxes" data-ifPartlyOrg = ${deviceOrderInstance.ifPartlyOrg} data-amount="${deviceOrderInstance.orderQuantity}"
                                           data-ifcanbuy="${deviceOrderInstance.ifCanBuy}" data-subModelId="${deviceOrderInstance.subModelId}" value="${deviceOrderInstance.priceId}">
                                    %{--<input type="checkbox" class="checkboxes" name="checkItem" value="${deviceOrderInstance.priceId}">--}%
                                    <span></span>
                                </label>
                                    </g:else>

                                </g:if>
                                <g:else>

                                    <strong
                                        style="color: grey"><small><g:message
                                            code="deviceOrder.saleStop.label"></g:message></small></strong>

                                </g:else>
                            </div>
                        </td>
                    </div>

                    %{--厂商信息--}%
                    <div class="col-md-6">
                        %{--物品信息--}%
                        <td>


                    <div class="col-md-3" style="line-height: 150px">
                        <g:set var="path" value="${deviceOrderInstance.imagePath}"/>
                        <img style="width: 150px;height: 100px" class="lazy" data-original="<g:createLink controller="deviceOrder" action="viewImage" params="[title: path]"/>"
                             src="/assets/default.jpg"/>
                    </div>
                    <div class="col-md-9">
                            <div class="row">
                                <label class="col-md-3" style="padding: 2px 10px 2px 43px"><strong
                                        style="color: grey"><small><g:message
                                            code="deviceOrder.goodsMessage.label"></g:message></small></strong>
                                </label>
                                <label class="col-md-9"
                                       style="padding: 2px 10px 2px 5px"><small>${deviceOrderInstance.factShortName}${deviceOrderInstance.model}${deviceOrderInstance.goodsName}
                                <g:if test="${deviceOrderInstance.communicationMode != null &&deviceOrderInstance.communicationMode != ""}">
                                    <g:message code="deviceOrder.support.label"></g:message></g:if><g:message
                                        code="deviceOrder.communicationMode.${deviceOrderInstance.communicationMode}"></g:message>
                                | <g:message
                                        code="deviceOrder.eSignature.${deviceOrderInstance.eSignature}"></g:message>
                                | <g:message
                                        code="deviceOrder.nonContact.${deviceOrderInstance.nonContact}"></g:message>
                                </small></label>
                            </div>
                            %{--价格--}%
                            <div class="row">
                                <label class="col-md-3" style="padding: 2px 10px 2px 43px">
                                    <strong style="color: grey"><small><g:message
                                            code="deviceOrder.priceType.${deviceOrderInstance.priceType}"></g:message></small>
                                    </strong></label>
                                <label class="col-md-9" style="padding: 2px 10px 2px 5px"><small>
                                    <g:if test="${deviceOrderInstance.priceType == '02'}">
                                    %{--一阶--}%
                                        <span style="color: red">[1-${deviceOrderInstance.levelOneQuantity}]<g:message
                                                code="deviceOrder.a.label"></g:message>
                                            <g:message code="deviceOrder.each.label"></g:message> ${
                                            deviceOrderInstance.levelOnePrice} <g:message
                                                code="deviceOrder.yuan.label"></g:message> |
                                        %{--二阶--}%
                                            [${deviceOrderInstance.levelOneQuantity+1}-<g:if test="${deviceOrderInstance.levelTwoQuantity == 9999999}"><g:message code="deviceOrder.andMore.label"></g:message></g:if><g:else>${deviceOrderInstance.levelTwoQuantity}</g:else>]<g:message
                                                code="deviceOrder.a.label"></g:message>
                                            <g:message code="deviceOrder.each.label"></g:message>${
                                            deviceOrderInstance.levelTwoPrice} <g:message
                                                code="deviceOrder.yuan.label"></g:message>
                                        %{--三阶--}%
                                            <g:if test="${deviceOrderInstance.levelThreePrice != null && deviceOrderInstance.levelThreePrice != ''}">
                                                |[${deviceOrderInstance.levelTwoQuantity+1}-<g:message
                                                    code="deviceOrder.andMore.label"></g:message>]<g:message
                                                    code="deviceOrder.a.label"></g:message>
                                                <g:message code="deviceOrder.each.label"></g:message>${
                                                deviceOrderInstance.levelThreePrice} <g:message
                                                    code="deviceOrder.yuan.label"></g:message></g:if></span>
                                    </g:if>
                                    <g:if test="${deviceOrderInstance.priceType == '01'}">
                                        <span style="color: red">
                                            <g:message code="deviceOrder.each.label"></g:message>${
                                                deviceOrderInstance.levelOnePrice}<g:message
                                                    code="deviceOrder.yuan.label"></g:message>
                                        </span></g:if>
                                </small>
                                </label>
                            </div>
                            %{--起订量--}%
                            <div class="row">
                                <label class="col-md-3" style="padding: 2px 10px 2px 43px"><small>
                                    &nbsp;&nbsp;&nbsp;&nbsp;<strong style="color: grey"><g:message
                                            code="deviceOrder.minmumOfAmount.label"></g:message></strong></small>
                                </label>
                                <label class="col-md-9" style="padding: 2px 10px 2px 5px"><small>
                                    ${deviceOrderInstance.minmumOfAmount}<g:message
                                            code="deviceOrder.a.label"></g:message>;<g:message
                                            code="deviceOrder.minimumOfPack.label"></g:message>:${deviceOrderInstance.minimumOfPack}<g:message
                                            code="deviceOrder.a.label"></g:message>
                                    <g:if test="${deviceOrderInstance.isCredit == '1'}">
                                        <span class="label label-sm label-danger"><g:message
                                                code="deviceOrder.credit.label"></g:message></span></g:if>
                                %{--仅部分代理--}%
                                    <g:if test="${deviceOrderInstance.ifPartlyOrg == '01'}">
                                        <span class="label label-sm label-success">限购</span>
                                        <i class="fa fa-question-circle show-pop" data-popover-message="仅支持参与活动的代理购买"></i>
                                    </g:if>
                                </small>
                                </label>
                            </div>
                            %{--满赠--}%
                            <div class="row">
                                <label class="col-md-3" style="padding: 2px 10px 2px 43px">
                                    <g:if test="${deviceOrderInstance.isFreeGiftsForOne == '1'}">
                                        <span class="label label-sm label-success"><g:message
                                                code="deviceOrder.singleGiveAway.label"></g:message></span></g:if>
                                    <g:if test="${deviceOrderInstance.isFreeGiftsForTotal == '1'}">

                                        <span class="label label-sm label-success"><g:message
                                                code="deviceOrder.accumulatedGifts.label"></g:message></span></g:if>
                                </label>
                                <label class="col-md-9" style="padding: 2px 10px 2px 5px">
                                    <g:if test="${deviceOrderInstance.isFreeGiftsForOne == '1'}">
                                        <small style="color: grey"><g:message
                                                code="deviceOrder.full.label"></g:message>${deviceOrderInstance.freeLimitNum}<g:message
                                                code="deviceOrder.a.label"></g:message><g:message
                                                code="deviceOrder.give.label"></g:message>${
                                            deviceOrderInstance.freeGiftsQuantity}<g:message
                                                code="deviceOrder.a.label"></g:message>${
                                            deviceOrderInstance.freeFactShortName}${deviceOrderInstance.freeModelName}${deviceOrderInstance.freeGoodsName}
                                            <g:if test="${deviceOrderInstance.freeCommType != null && deviceOrderInstance.freeCommType != ""}">
                                                <g:message code="deviceOrder.support.label"></g:message></g:if><g:message
                                                code="deviceOrder.communicationMode.${deviceOrderInstance.freeCommType}"></g:message></small>
                                    </g:if>
                                    <g:if test="${deviceOrderInstance.isFreeGiftsForTotal == '1'}">
                                        <small style="color: grey"><g:message
                                                code="deviceOrder.full.label"></g:message>${deviceOrderInstance.freeLimitNum}<g:message
                                                code="deviceOrder.a.label"></g:message><g:message
                                                code="deviceOrder.give.label"></g:message>${
                                            deviceOrderInstance.freeGiftsQuantity}<g:message
                                                code="deviceOrder.a.label"></g:message>${
                                            deviceOrderInstance.freeFactShortName}${deviceOrderInstance.freeModelName}${deviceOrderInstance.freeGoodsName}
                                            <g:if test="${deviceOrderInstance.freeCommType != null && deviceOrderInstance.freeCommType != ""}">
                                                <g:message code="deviceOrder.support.label"></g:message></g:if><g:message
                                                code="deviceOrder.communicationMode.${deviceOrderInstance.freeCommType}"></g:message>
                                            <g:if test="${deviceOrderInstance.ifAddUpTop == '1'}">
                                                <span class="label label-sm label-danger"><small><g:message
                                                        code="deviceOrder.addUpTop.label"></g:message></small>
                                                </span></g:if>

                                        </small>
                                    </g:if>
                                </label>
                            </div>
                        %{--折扣--}%
                            <g:if test="${deviceOrderInstance.isDiscount == '1'}">
                                <div class="row">
                                    <label class="col-md-3" style="padding: 2px 10px 2px 43px">
                                        <span class="label label-sm label-danger">&nbsp;&nbsp;&nbsp;&nbsp;<g:message
                                                code="deviceOrder.discount.label"></g:message></span>
                                    </label>
                                    <label class="col-md-9" style="padding: 2px 10px 2px 5px">
                                        <small style="color: grey"><g:message
                                                code="deviceOrder.thisCommodity.label"></g:message>${deviceOrderInstance.discount}<g:message
                                                code="deviceOrder.fracture.label"></g:message></small>
                                    </label>
                                </div>
                            </g:if>
                        %{--奖励金--}%
                            <g:if test="${deviceOrderInstance.isBounty == '1'}">
                                <div class="row">
                                    <label class="col-md-3" style="padding: 2px 10px 2px 43px">
                                        <span class="label label-sm label-warning"><g:message
                                                code="deviceOrder.bounty.label"></g:message></span>
                                    </label>
                                    <label class="col-md-9" style="padding: 2px 10px 2px 5px">
                                        <small style="color: grey"><g:message
                                                code="deviceOrder.haveBounty.label"></g:message></small>
                                    </label>
                                </div>
                            </g:if>
                    </div>
                        </td>
                    </div>

                    <div class="col-md-2">
                        %{--数量--}%
                        <td>

                            <div class="col-md-12" style="padding-top:50px">
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-p-m btn-outline sbold uppercase "
                                            style="width: 35px;height: 35px"
                                            onclick="fub(${deviceOrderInstance.minmumOfAmount}, ${deviceOrderInstance.minimumOfPack}, ${deviceOrderInstance.priceId});">-</button>
                                </div>
                                <div class="col-md-5">
                                    <g:textField name="minmumOfAmount" value="${deviceOrderInstance.orderQuantity}"
                                                 style="width:59px; height: 36px;"
                                                 id="minmumOfAmount_${deviceOrderInstance.priceId}"
                                                 onchange="check(${deviceOrderInstance.minmumOfAmount}, ${deviceOrderInstance.minimumOfPack}, ${deviceOrderInstance.priceId});
                                   updateOrderQuantity(${deviceOrderInstance.priceId}, ${deviceOrderInstance.subModelId})"/>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-p-m btn-outline sbold uppercase"
                                            style="width: 35px;height: 35px" id="plus"
                                            onclick="plus(${deviceOrderInstance.minmumOfAmount}, ${deviceOrderInstance.minimumOfPack}, ${deviceOrderInstance.priceId});">+</button>
                                </div>
                            </div>
                        </td>
                    </div>
                    %{--单价--}%
                    <td>
                        <div class="col-md-1" style="padding-top:55px"><p
                                dataFormat="xx.xx">${deviceOrderInstance.levelOnePrice}</p></div>
                    </td>
                    %{--操作--}%
                    <td>
                        <div class="col-md-1" style="padding-top:50px">
                            <g:link class="btn btn-delate" controller="deviceOrder" action="deleteFromShoppingCart"
                                    id="${deviceOrderInstance?.subModelId}">
                                <g:message code="deviceOrder.delete.label"></g:message>
                            </g:link>
                        </div>
                    </td>
                </tr>
            </g:each>
        </tbody>
        </table>


        <div class="col-md-12" style="line-height: 80px" align="right">
            <button type="button" class="btn btn-pay" onclick="toConfirmOrder()"><g:message
                    code="deviceOrder.toSettle.label"></g:message></button>
            <button type="button" class="btn btn-return" onclick="goToOrder()"><g:message
                    code="deviceOrder.return.label"></g:message></button>
        </div>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/machines/deviceOrder.js"/>
    <asset:javascript src="/jquery.lazyload.js"/>
    <g:javascript>
        $(function ($) {
            /*  $("#checkAll").click(function () {
             $("input[name='checkItem']").prop("checked", this.checked);
             });*/
            $("input[data-ifcanbuy='00']").attr('disabled','disabled')
        $("img.lazy").lazyload();
        $(".group-checkable").on('click', function () {
            $("input[name='checkItem']").prop("checked", this.checked);
        });
        $(".checkboxes").on('click', function () {
            var $subs = $(".checkboxes");
            $(".group-checkable").prop("checked", $subs.length == $subs.filter(":checked").length ? true : false);
        });
    });
    function goToOrder() {
        window.location.href='/deviceOrder/index';
    }
    </g:javascript>
</content>
