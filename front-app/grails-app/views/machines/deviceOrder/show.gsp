<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="scaffold">
</head>
<component:portlet>
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-filter"></i>
            <span class="caption-subject bold uppercase"><g:message code="deviceOrder.orderConfirm.label"></g:message> </span>
            <span class="caption-helper"></span>
        </div>
                <label style="color: red;margin-top:10px" class="col-md-9" onload="this.focus();">
                   <strong>
                       <g:message code="deviceOrder.remind.label"></g:message>:<g:message
                               code="deviceOrder.remindMessage.label"></g:message>
                   </strong>
                </label>
    </div>
    <portlet:body withForm="true">
        <!--提示信息-->
        <form controller="deviceOrder" action="confirmDeviceOrder" id="confirmForm" method="post">
        <input type="hidden" name="onlinepay" id="onlinepay"/>
        <input type="hidden" name="remintpay" id="remintpay"/>
        <g:if test="${addressList.size() > 3}">
            <div style="overflow-y: auto; height: 200px;">
        </g:if>
        <table class="table table-striped table-hover dataTable no-footer">
            <input type="hidden" value="" name="priceIds" id="priceIds">

            <div class="row">

                <tr>
                    <td colspan="6"><g:message code="deviceOrder.receiverMessage.label"></g:message></td>
                    <td colspan="2"> <g:link  controller="systemReceiptAddress" action="create" params="[isFromOrder:true,orderUrl:request.getRequestURL()+'?'+request.getQueryString()]">
                        <i class="fa fa-plus"></i>
                        ${message(code: 'deviceOrder.address.button.create.label')}
                    </g:link></td>
                </tr>
            </div>
        <!-- 收货地址-->
            <g:each var="systemReceiptAddressInstance"
                    in="${addressList}">
                <tr>
                    <td>
                        <label class=" col-sm-4 col-xs-4 col-md-4 control-label">
                            <input type="radio" name="addressId" value="${systemReceiptAddressInstance?.id}"
                                   <g:if test="${systemReceiptAddressInstance.defaultFlag}">checked</g:if>>
                            <span></span>
                        </label>
                    </td>
                    <domainSearchResult:rowData type="text" domain="systemReceiptAddress" property="receiverName"
                                                domainInstance="${systemReceiptAddressInstance}"/>
                    <domainSearchResult:rowData type="text" domain="systemReceiptAddress" property="province"
                                                domainInstance="${systemReceiptAddressInstance}"/>
                    <domainSearchResult:rowData type="text" domain="systemReceiptAddress" property="city"
                                                domainInstance="${systemReceiptAddressInstance}"/>
                    <domainSearchResult:rowData type="text" domain="systemReceiptAddress" property="address"
                                                domainInstance="${systemReceiptAddressInstance}"/>
                    <domainSearchResult:rowData type="text" domain="systemReceiptAddress" property="mobileNo"
                                                domainInstance="${systemReceiptAddressInstance}"/>
                    %{--<domainSearchResult:rowData type="boolean" domain="systemReceiptAddress" property="defaultFlag"--}%
                                                %{--domainInstance="${systemReceiptAddressInstance}"/>--}%
                    <td class="tk-actions">
                    <g:if test="${systemReceiptAddressInstance.defaultFlag}">
                        <span class="label label-sm label-default" ><g:message
                                code="deviceOrder.defaultAddress.label"></g:message></span>
                    </g:if>
                    <g:if test="${!systemReceiptAddressInstance.defaultFlag}">
                        <g:link class="ssp-system-receipt-address" controller="systemReceiptAddress" action="setDefault"
                                id="${systemReceiptAddressInstance?.id}" params="[isFromOrder:true,orderUrl:request.getRequestURL()+'?'+request.getQueryString()]"><g:message
                                code="systemReceiptAddress.default.button.default.label"/></g:link>
                    </g:if>
                        <g:link controller="systemReceiptAddress" action="edit"
                                id="${systemReceiptAddressInstance?.id}" params="[isFromOrder:true,orderUrl:request.getRequestURL()+'?'+request.getQueryString()]"><g:message
                                code="default.button.edit.label"/></g:link>
                        <g:link class="ssp-system-receipt-address" controller="systemReceiptAddress" action="delete"
                                id="${systemReceiptAddressInstance?.id}" params="[isFromOrder:true,orderUrl:request.getRequestURL()+'?'+request.getQueryString()]"><g:message
                                code="default.button.delete.label"/></g:link>
                    </td>
                </tr>

            </g:each>

        </table>
        <g:if test="${addressList.size() > 3}">
            </div>
        </g:if>

        <table class="table table-striped table-bordered table-hover dataTable no-footer">
            <tr>

                <domainSearchResult:header domain="deviceOrder" property="orderList"/>
                <domainSearchResult:header domain="deviceOrder" property="quantity"/>
                <domainSearchResult:header domain="deviceOrder" property="unitPrice"/>
                <domainSearchResult:header domain="deviceOrder" property="preferential"/>
                <domainSearchResult:header domain="deviceOrder" property="subtotal"/>
            </tr>

        %{--第一行--}%
            <g:each var="deviceOrderInstance"
                    in="${deviceOrderInstanceList}">
                <input type="hidden" value="${deviceOrderInstance.priceId}" name="priceId" data-quantity ="${deviceOrderInstance.orderQuantity}"
                       data-modelId="${deviceOrderInstance.subModelId}">
                <tr role="row" class="odd">
                    <td class="col-md-8  col-sm-8 col-xs-8">
                        <div class="row">
                            %{--图片信息--}%
                            <div class="col-md-3 col-sm-3 col-xs-3">
                            <g:set var="path" value="${deviceOrderInstance.imagePath}"/>
                            %{--<img style="width: 150px;height: 100px" src="<g:createLink controller="deviceOrder" action="viewImage" params="[title: path]"/>"/>                            --}%
                            <img style="width: 150px;height: 100px" class="lazy" data-original="<g:createLink controller="deviceOrder" action="viewImage" params="[title: path]"/>"
                                 src="/assets/default.jpg"/> </div>
                            %{--中间列物品信息等--}%
                            <div class="col-md-9  col-sm-9 col-xs-9">
                                %{--物品信息--}%
                                <div class="row">
                                    <label class="col-md-2 col-sm-2 col-xs-2 left"><strong
                                            style="color: grey"><small><g:message
                                                code="deviceOrder.goodsMessage.label"></g:message></small></strong>
                                    </label>
                                    <label class="col-md-9  col-sm-9 col-xs-9"><small>${deviceOrderInstance.factShortName}${deviceOrderInstance.model}${deviceOrderInstance.goodsName}
                                    <g:if test="${deviceOrderInstance.communicationMode != null && deviceOrderInstance.communicationMode != ""}">
                                        <g:message code="deviceOrder.support.label"></g:message></g:if><g:message code="deviceOrder.communicationMode.${deviceOrderInstance.communicationMode}"></g:message>
                                    | <g:message code="deviceOrder.eSignature.${deviceOrderInstance.eSignature}"></g:message>
                                    | <g:message code="deviceOrder.nonContact.${deviceOrderInstance.nonContact}"></g:message>
                                    </small></label>
                                </div>
                                %{--价格--}%
                                <div class="row">
                                    <label class="col-md-2 col-sm-2 col-xs-2 left" >
                                        <strong style="color: grey"><small><g:message
                                                code="deviceOrder.priceType.${deviceOrderInstance.priceType}"></g:message></small>
                                        </strong></label>
                                    <label class="col-md-9  col-sm-9 col-xs-9" ><small>
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
                                    <label class="col-md-2 col-sm-2 col-xs-2 left" ><small>
                                        &nbsp;&nbsp;&nbsp;&nbsp;<strong style="color: grey"><g:message
                                                code="deviceOrder.minmumOfAmount.label"></g:message></strong></small>
                                    </label>
                                    <label class="col-md-9  col-sm-9 col-xs-9" ><small>
                                        ${deviceOrderInstance.minmumOfAmount}<g:message
                                                code="deviceOrder.a.label"></g:message>;<g:message
                                                code="deviceOrder.minimumOfPack.label"></g:message>:${deviceOrderInstance.minimumOfPack}<g:message
                                                code="deviceOrder.a.label"></g:message>
                                        <g:if test="${deviceOrderInstance.isCredit== '1'}">
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
                                    <label class="col-md-2 col-sm-2 col-xs-2 left" >
                                        <g:if test="${deviceOrderInstance.isFreeGiftsForOne == '1'}">
                                            <span class="label label-sm label-success"><g:message
                                                    code="deviceOrder.singleGiveAway.label"></g:message></span></g:if>
                                        <g:if test="${deviceOrderInstance.isFreeGiftsForTotal == '1'}">

                                            <span class="label label-sm label-success"><g:message
                                                    code="deviceOrder.accumulatedGifts.label"></g:message></span></g:if>
                                    </label>
                                    <label class="col-md-9  col-sm-9 col-xs-9" >
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
                                                <g:if test="${deviceOrderInstance.ifAddUpTop=='1'}">
                                                    <span class="label label-sm label-danger"><small><g:message
                                                            code="deviceOrder.addUpTop.label"></g:message></small></span></g:if>

                                            </small>
                                        </g:if>
                                    </label>
                                </div>
                            %{--折扣--}%
                                <g:if test="${deviceOrderInstance.isDiscount == '1'}">
                                    <div class="row">
                                        <label class="col-md-2 col-sm-2 col-xs-2 left">
                                            <span class="label label-sm label-danger">&nbsp;&nbsp;&nbsp;&nbsp;<g:message
                                                    code="deviceOrder.discount.label"></g:message></span>
                                        </label>
                                        <label class="col-md-9  col-sm-9 col-xs-9">
                                            <small style="color: grey"><g:message
                                                    code="deviceOrder.thisCommodity.label"></g:message>${deviceOrderInstance.discount}<g:message
                                                    code="deviceOrder.fracture.label"></g:message></small>
                                        </label>
                                    </div>
                                </g:if>
                            %{--奖励金--}%
                                <g:if test="${deviceOrderInstance.isBounty=='1'}">
                                    <div class="row">
                                        <label class="col-md-2 col-sm-2 col-xs-2 left" >
                                            <span class="label label-sm label-warning"><g:message
                                                    code="deviceOrder.bounty.label"></g:message></span>
                                        </label>
                                        <label class="col-md-9  col-sm-9 col-xs-9">
                                            <small style="color: grey"><g:message
                                                    code="deviceOrder.haveBounty.label"></g:message></small>
                                        </label>
                                    </div>
                                </g:if>
                            </div>
                        </div>

                    </td>

                    <div class="row">
                        <domainSearchResult:rowData textAlign="right" type="text" domain="deviceOrder" property="orderQuantity"
                                                    domainInstance="${deviceOrderInstance}"/>

                        <domainSearchResult:rowData type="text" textAlign="right" domain="deviceOrder" property="levelOnePrice"
                                                    domainInstance="${deviceOrderInstance}"/>
                        <g:if test="${deviceOrderInstance.isDiscount == '1'}">
                            <domainSearchResult:rowData type="text"  textAlign="right" domain="deviceOrder" property="itemDiscountAmount"
                                                        domainInstance="${deviceOrderInstance}"/>
                        </g:if>
                        <g:if test="${deviceOrderInstance.isDiscount != '1'}">
                            <td class="right">00.00</td>
                        </g:if>
                        <domainSearchResult:rowData type="text" textAlign="right" domain="deviceOrder" property="itemTotalAmount"
                                                    domainInstance="${deviceOrderInstance}"/>

                    </div>
                    <input type="hidden" name="priceString" value="${deviceOrderInstance.priceId}/${deviceOrderInstance.priceString}"/>
                </tr>

            </g:each>
        %{--第四行--}%

            <tr role="row" class="odd">
                <td colspan="5">%{--<label class="control-label"><g:message code="deviceOrder.orderRemark.label"></g:message></label>--}%
                %{-- <small style="color: grey"><textarea name="remark" rows="3" cols="110" id="remarkText"
                                                                       placeholder="${message(code: 'deviceOrder.inputTop.label')}"></textarea></small>--}%
                    <form role="form">
                        <div class="form-group">
                            <label class="col-md-1" style="padding-top:20px"><g:message
                                    code="deviceOrder.orderRemark.label"></g:message></label>

                            <div class="col-md-9">
                                <textarea class="form-control" name="remark" rows="3" cols="110" id="remarkText"
                                          placeholder="${message(code: 'deviceOrder.inputTop.label')}"></textarea>
                            </div>
                        </div>
                    </form>
                </td>
            </tr>
            %{--第五行--}%
            <tr role="row" class="odd">
                <td colspan="5">
                    <dd style="line-height: 20px"><g:message code="deviceOrder.aggregate.label"></g:message>0
                    <g:message code="deviceOrder.bountyMessage.label"></g:message>￥0.00</dd>

                    <div style="height:0px;border-top:1px grey dashed;"/>
                </div>
                </td>
            </tr>

        </table>


        <div class="row form-group">
            <div class="col-md-1 text-right">
                <g:message code="deviceOrder.orderAmountReceivable.label"></g:message>
            </div>
            %{--<domainShow:displayString domain="deviceOrder" property="orderAmountReceivable"--}%
            %{--domainInstance="${actualAmountInstance}"/>--}%
            <label class="text-right col-md-2">￥${actualAmount}</label>
        </div>
        </div>
        <div class="row form-group">
            <div class="col-md-1 text-right">
                <g:message code="deviceOrder.haveSave.label"></g:message>
            </div>
            %{--<domainShow:displayString domain="deviceOrder" property="haveSave"--}%
            %{--domainInstance="${discountAmount}"/>--}%
            <label class="text-right col-md-2">￥${discountAmount}</label>
        </div>

        <div class="row form-group">
            <div class="col-md-1 text-right">
                <g:message code="deviceOrder.userBounty.label"></g:message>
            </div>
            %{--<domainShow:displayString domain="deviceOrder" property="userBounty"--}%
            %{--domainInstance="${ordersPay}"/>--}%
            <label class="text-right col-md-2">￥0.00</label>
        </div>

        <div class="row form-group">
            <div class="col-md-1 text-right">
                <g:message code="deviceOrder.orderPaidAmount.label"></g:message>
            </div>
            %{--<domainShow:displayString domain="deviceOrder" property="orderPaidAmount"--}%
            %{--domainInstance="${ordersPay}"/>--}%
            <label class="text-right col-md-2">￥${actualAmount - discountAmount}</label>
        </div>

        <tr role="row" class="odd">
            <td colspan="5">
                <div class="text-right form-group">
                    <button type="button" class="btn btn-submit" onclick="confirmDeviceOrder();"><g:message
                            code="deviceOrder.orderConfirm.label"></g:message></button>
                    <button type="button" class="btn btn-return" onclick="goToCart()"><g:message
                            code="deviceOrder.return.label"></g:message></button>
                </div>
            </td>
        </tr>
        </form>
        </body>
        <content tag="takin-footer">
            <asset:javascript src="/machines/deviceOrder.js"/>
            <asset:javascript src="/jquery.lazyload.js"/>

            <g:javascript>
        $(function () {
            $("img.lazy").lazyload();
            $('.ssp-system-receipt-address').on('click',function (e) {
                e.preventDefault();
                var deleteUrl = $(this).attr('href');
                var action = $(this).html();
                bootbox.dialog({
                    message: "${message(code: 'default.confirm.label')}"+action+"?",
                    title: '${message(code: 'default.flash.type.info')}',
                    buttons: {
                        success: {
                            label: '${message(code: 'default.button.cancel.label')}',
                            className: "green",
                            callback: function () {
                            }
                        },
                        danger: {
                            label:  '${message(code: 'default.button.enter.label')}',
                            className: "red",
                            callback: function () {
                                window.location.href = deleteUrl;
                            }
                        }
                    }
                });
            });
        })
            </g:javascript>
        </content>
    </portlet:body>
</component:portlet>
</html>