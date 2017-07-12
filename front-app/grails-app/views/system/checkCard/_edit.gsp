<%@ page import="com.suixingpay.ssp.front.system.CheckCard" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${message(code: 'default.edit.label', args: message.domain(domain: 'checkCard'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form>
            <form:scaffoldSearchProperties/>
            <input type="hidden" name="cardId" id="cardId" value="${checkCardInstance?.cardId}"/>
            <input type="hidden" id="offsetHidden" value="${offsetHid}">
            <input type="hidden" id="maxHidden" value="${maxHid}">
            <input type="hidden" id="oldSalesManNo" value="${checkCardInstance?.salesmanCode}"/>
            <input type="hidden" id="oldBankCardNum" value="${checkCardInstance?.bankCardNum}"/>
            <form:body>
                <domainEdit:textField domain="checkCard" property="bankCardNum"
                                      domainInstance="${checkCardInstance}" required="true"/>

                    <div class="col-xs-12 col-md-4 col-sm-4">
                    <label class="control-label col-md-4">
                <g:message code="checkCard.reSalesManName.label"></g:message>
                    </label>
                    <div class="col-md-8">
                        <g:if test="${salesmanList != null}">
                    <g:select name="salesmanCode" from="${salesmanList}" optionKey="userCode" optionValue="userName"
                              class="form-control select2"  value="${params ? params['salesmanCode'] : ''}"
                              noSelection="['':'--请选择--']"/>
                </g:if>
                </div>
                </div>
            </form:body>
            <form:actions>
                <formActions:button value="${message(code: 'checkCard.submit.label')}" id="checkEditSubmit"
                                    btnCssClass="btn btn-submit"/>
                <g:link controller="checkCard" action="search" params="[offset:1]" class="btn btn-return"><g:message code="checkCard.return.label"/> </g:link>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/system/checkCard.js"/>
</content>