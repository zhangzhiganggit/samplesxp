<g:if test="${deviceOrderInstanceList.size() > 2}">
	<div style="overflow-y: auto; height: 450px;">
</g:if>
<table class="table table-striped table-bordered table-hover dataTable no-footer" style="width: 630px">
	<domainSearchResult:header domain="deviceOrder" property="orderList" />
	<domainSearchResult:header domain="deviceOrder" property="goodsMessage" />
	<domainSearchResult:header domain="deviceOrder" property="quantity" />
	<th>
		<g:message code="default.actions.label" />
	</th>
	<g:each var="deviceOrderInstance" in="${deviceOrderInstanceList}">
		<input type="hidden" id="levelOneQuantity" value="${deviceOrderInstance.levelOneQuantity}" />
		<input type="hidden" id="levelTwoQuantity" value="${deviceOrderInstance.levelTwoQuantity}" />
		<input type="hidden" id="levelOnePrice" value="${deviceOrderInstance.levelOnePrice}" />
		<input type="hidden" id="levelTwoPrice" value="${deviceOrderInstance.levelTwoPrice}" />
		<input type="hidden" id="levelThreePrice" value="${deviceOrderInstance.levelThreePrice}" />
		<input type="hidden" id="priceId" value="${deviceOrderInstance.priceId}" />
		<tr role="row">
			<td class="col-md-1  col-sm-1 col-xs-1">
				<div class="col-md-1  col-sm-1 col-xs-1" align="left">
					<g:set var="path" value="${deviceOrderInstance.imagePath}" />
					%{--<img style="width: 80px;height: 80px"--}%
						 %{--src="<g:createLink controller="deviceOrder" action="viewImage" params="[title: path]"/>"/>--}%
					<img style="width: 80px;height: 80px"
						 src="<g:createLink controller="deviceOrder" action="viewImage" params="[title: path]"/>" onerror='this.src="/assets/default.jpg"'/>
				</div>

			</td>
			<td class="col-md-9  col-sm-9 col-xs-9">
				<div class="col-md-12  col-sm-12 col-xs-12 left">
					<div class="row">
						<label class="col-md-3 col-sm-3 col-xs-3 right"><strong
                                style="color: grey"><small><g:message
                                    code="deviceOrder.goodsMessage.label"></g:message></small></strong></label>
						<label class="col-md-9 col-sm-9 col-xs-9 left" ><small>${deviceOrderInstance.factShortName}${deviceOrderInstance.model}${deviceOrderInstance.goodsName}
                        <g:if test="${deviceOrderInstance.communicationMode != null &&deviceOrderInstance.communicationMode != ""}">
                            <g:message code="deviceOrder.support.label"></g:message></g:if><g:message code="deviceOrder.communicationMode.${deviceOrderInstance.communicationMode}"></g:message>
                        | <g:message code="deviceOrder.eSignature.${deviceOrderInstance.eSignature}"></g:message>
                        | <g:message code="deviceOrder.nonContact.${deviceOrderInstance.nonContact}"></g:message>
                        </small></label>
					</div>
				</div>
			</td>

			<td class="col-md-1  col-sm-1 col-xs-1">
				${deviceOrderInstance.orderQuantity}
			</td>

			<td class="col-md-1  col-sm-1 col-xs-1">
				<button type="button" class="btn btn-danger" onclick="deleteFromSmallCart('${deviceOrderInstance?.subModelId}', ${deviceOrderInstance.orderQuantity})"><g:message
                        code="deviceOrder.delete.label"></g:message></button>
			</td>
		</tr>

	</g:each>
</table>
<div class="col-md-6  col-sm-6 col-xs-6 right" style="line-height: 40px;width: 600px;">
	<g:link class="btn btn-shop" controller="deviceOrder" action="cart">
		<g:message code="deviceOrder.toShoppingCart.label"></g:message>
	</g:link>
</div>
<g:if test="${deviceOrderInstanceList.size() > 2}">
	</div>
</g:if>