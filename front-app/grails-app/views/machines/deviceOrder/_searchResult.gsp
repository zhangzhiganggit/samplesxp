<component:portlet>
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-filter"></i>
            <span class="caption-subject bold uppercase"><g:message code="controller.deviceOrder.label"></g:message></span>
            <span class="caption-helper"></span>
        </div>
        <div class="page-toolbar">
            <div class="top-menu">
                <ul class="nav navbar-nav pull-right">
                    <li class="dropdown dropdown-user">
                        <a href="cart" class="dropdown-toggle" id="cartButton">
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                            ${message(code: 'default.cart.label')}
                            <span class="badge badge-success" id="goodsNumber">${length}</span>
                        </a>
                        <ul class="dropdown-menu pull-right" id="ul">
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <portlet:body>

        <table class="table table-striped table-bordered table-hover dataTable no-footer">
            <g:each var="deviceOrderInstance"
                    in="${deviceOrderInstanceList}">
                <tr>
                    <td><div class="row">
                        %{--图片信息--}%
                        <div class="col-md-3 col-sm-3 col-xs-3">
                            <g:set var="path" value="${deviceOrderInstance.imagePath}"/>
                            <img style="width: 200px;height: 120px" class="lazy" data-original="<g:createLink controller="deviceOrder" action="viewImage" params="[title: path]"/>"
                                 src="/assets/default.jpg"/>
                        </div>
                        %{--中间列物品信息等--}%
                        <div class="col-md-5 col-sm-5 col-xs-5">
                            %{--物品信息--}%
                            <div class="row">
                                <label class="col-md-3 col-sm-3 col-xs-3 right"><strong
                                        style="color: grey"><small><g:message
                                            code="deviceOrder.goodsMessage.label"></g:message></small></strong>
                                </label>
                                <label class="col-md-9 col-sm-9 col-xs-9 left"><small>${deviceOrderInstance.factShortName}${deviceOrderInstance.model}${deviceOrderInstance.goodsName}
                                <g:if test="${deviceOrderInstance.communicationMode != null && deviceOrderInstance.communicationMode != ""}">
                                    <g:message code="deviceOrder.support.label"></g:message></g:if><g:message
                                        code="deviceOrder.communicationMode.${deviceOrderInstance.communicationMode}"></g:message>
                                | <g:message code="deviceOrder.eSignature.${deviceOrderInstance.eSignature}"></g:message>
                                | <g:message code="deviceOrder.nonContact.${deviceOrderInstance.nonContact}"></g:message>
                                </small></label>
                            </div>
                            %{--价格--}%
                            <div class="row">
                                <label class="col-md-3 col-sm-3 col-xs-3 right">
                                    <strong style="color: grey"><small><g:message
                                            code="deviceOrder.priceType.${deviceOrderInstance.priceType}"></g:message></small>
                                    </strong></label>
                                <label class="col-md-9 col-sm-9 col-xs-9 left"><small>
                                    <g:if test="${deviceOrderInstance.priceType == '02'}">
                                    %{--一阶--}%
                                        <span style="color: red">[1-${deviceOrderInstance.levelOneQuantity}]<g:message
                                                code="deviceOrder.a.label"></g:message>
                                            <g:message code="deviceOrder.each.label"></g:message> ${
                                            deviceOrderInstance.levelOnePrice} <g:message
                                                code="deviceOrder.yuan.label"></g:message> |
                                        %{--二阶--}%
                                            [${deviceOrderInstance.levelOneQuantity + 1}-<g:if
                                                test="${deviceOrderInstance.levelTwoQuantity == 9999999}"><g:message
                                                    code="deviceOrder.andMore.label"></g:message></g:if><g:else>${deviceOrderInstance.levelTwoQuantity}</g:else>]<g:message
                                                code="deviceOrder.a.label"></g:message>
                                            <g:message code="deviceOrder.each.label"></g:message>${
                                            deviceOrderInstance.levelTwoPrice} <g:message
                                                code="deviceOrder.yuan.label"></g:message>
                                        %{--三阶--}%
                                            <g:if test="${deviceOrderInstance.levelThreePrice != null && deviceOrderInstance.levelThreePrice != ''}">
                                                |[${deviceOrderInstance.levelTwoQuantity + 1}-<g:message
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
                                <label class="col-md-3 col-sm-3 col-xs-3 right"><small>
                                    &nbsp;&nbsp;&nbsp;&nbsp;<strong style="color: grey"><g:message
                                            code="deviceOrder.minmumOfAmount.label"></g:message></strong></small>
                                </label>
                                <label class="col-md-9 col-sm-9 col-xs-9 left"><small>
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
                                <label class="col-md-3 col-sm-3 col-xs-3 right">
                                    <g:if test="${deviceOrderInstance.isFreeGiftsForOne == '1'}">
                                        <span class="label label-sm label-success"><g:message
                                                code="deviceOrder.singleGiveAway.label"></g:message></span></g:if>
                                    <g:if test="${deviceOrderInstance.isFreeGiftsForTotal == '1'}">

                                        <span class="label label-sm label-success"><g:message
                                                code="deviceOrder.accumulatedGifts.label"></g:message></span></g:if>
                                </label>
                                <label class="col-md-9 col-sm-9 col-xs-9 left">
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
                                                        code="deviceOrder.addUpTop.label"></g:message></small></span></g:if>

                                        </small>
                                    </g:if>
                                </label>
                            </div>
                        %{--折扣--}%
                            <g:if test="${deviceOrderInstance.isDiscount == '1'}">
                                <div class="row">
                                    <label class="col-md-3 col-sm-3 col-xs-3 right">
                                        <span class="label label-sm label-danger">&nbsp;&nbsp;&nbsp;&nbsp;<g:message
                                                code="deviceOrder.discount.label"></g:message></span>
                                    </label>
                                    <label class="col-md-9 col-sm-9 col-xs-9 left">
                                        <small style="color: grey"><g:message
                                                code="deviceOrder.thisCommodity.label"></g:message>${deviceOrderInstance.discount}<g:message
                                                code="deviceOrder.fracture.label"></g:message></small>
                                    </label>
                                </div>
                            </g:if>
                        %{--奖励金--}%
                            <g:if test="${deviceOrderInstance.isBounty == '1'}">
                                <div class="row">
                                    <label class="col-md-3 col-sm-3 col-xs-3 right">
                                        <span class="label label-sm label-warning"><g:message
                                                code="deviceOrder.bounty.label"></g:message></span>
                                    </label>
                                    <label class="col-md-9 col-sm-9 col-xs-9 left">
                                        <small style="color: grey"><g:message
                                                code="deviceOrder.haveBounty.label"></g:message></small>
                                    </label>
                                </div>
                            </g:if>
                        </div>
                        %{--按钮列--}%
                        <div class="col-md-4 col-sm-4 col-xs-4">
                            <div class="row" style="margin-top: 54px;margin-bottom: 10px">

                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <div class="col-md-3 col-sm-3 col-xs-3">
                                        <button type="button" class="btn btn btn-p-m btn-outline sbold uppercase "
                                                style="width: 35px;height: 35px"
                                                onclick="fub(${deviceOrderInstance.minmumOfAmount}, ${deviceOrderInstance.minimumOfPack}, ${deviceOrderInstance.priceId});">-</button>
                                    </div>
                                    <div class="col-md-5 col-sm-5 col-xs-5">
                                        <input type="text" value="${deviceOrderInstance.minmumOfAmount}"
                                               style="width:59px; height: 36px;"
                                               id="minmumOfAmount_${deviceOrderInstance.priceId}"
                                               onchange="check(${deviceOrderInstance.minmumOfAmount}, ${deviceOrderInstance.minimumOfPack}, ${deviceOrderInstance.priceId});"/>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-3">
                                        <button type="button" class="btn btn-p-m btn-outline sbold uppercase"
                                                style="width: 35px;height: 35px" id="plus"
                                                onclick="plus(${deviceOrderInstance.minmumOfAmount}, ${deviceOrderInstance.minimumOfPack}, ${deviceOrderInstance.priceId},${deviceOrderInstance.subModelId});">+</button>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-6"><button type="button" class="btn btn-shop" data-ifCanBuy="${deviceOrderInstance.ifCanBuy}" data-subModelId="${deviceOrderInstance.subModelId}"
                                                                                onclick="addToShoppingCart('minmumOfAmount_${deviceOrderInstance.priceId}', '${deviceOrderInstance.priceId}', '${deviceOrderInstance.subModelId}',this)">加入购物车</button>
                                </div>
                            </div>

                        </div>

                    </div>
                    </td>
                </tr>
            </g:each>
        </table>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/machines/deviceOrder.js"/>
    <asset:javascript src="/jquery.lazyload.js"/>
    <g:javascript>

        $(function () {
            //00代表代理商不能购买
            // $("button[data-ifcanbuy='00']").attr('disabled','disabled')
            $("button[data-ifcanbuy='00']").remove()
            $("img.lazy").lazyload();
            $("#cartButton").on('mouseenter', function () {
                $(".dropdown").addClass("open");
                showCart();
            });
            $("#ul").on('mouseleave', function () {
                $(".dropdown").removeClass("open");
            });
        });
    </g:javascript>
</content>