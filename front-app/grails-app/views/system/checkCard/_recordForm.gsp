
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'checkCard.titleCondition.label')}"
            iconCssClass="fa fa-filter" popHelper="${message(code:"checkCard.popHelper.label")}"/>
    <portlet:body withForm="true">
        <form:form controller="checkCard" action="tradeList"
                   name="scaffold-search-checkCard">
            <form:scaffoldSearchProperties/>
            <form:body>

                <domainSearch:textField domain="checkCard" property="merchantCode"/>
                <domainSearch:textField domain="checkCard" property="receiptsName"/>
                <domainSearch:textField domain="checkCard" property="terminalNumber"/>
                %{--<domainSearch:select domain="checkCard" property="salesMan"/>--}%
                <div class="col-xs-12 col-md-4 col-sm-4">
                    <label class="control-label col-md-4">
                    <g:message code="checkCard.salesMan.label"></g:message>
                    </label>
                    <div class="col-md-8">
                        <g:if test="${salesmanList != null}">
                            <g:select name="salesmanCode" from="${salesmanList}" optionKey="userCode" optionValue="userName"
                                      value="${params ? params['salesmanCode'] : ''}"
                                      noSelection="['':'--请选择--']"
                                      class="form-control select2"/>
                        </g:if>
                    </div>
                </div>
                <domainSearch:textField domain="checkCard" property="bankCardNum"/>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-reset"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
