<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'checkCard.search.label', args: message.domain(domain: 'checkCard'))}"
            iconCssClass="fa fa-filter" popHelper="${message(code:"checkCard.popHelper.label")}"/>
    <portlet:body withForm="true">
        <form:form controller="checkCard" action="index"
                   name="scaffold-search-checkCard">
            <form:scaffoldSearchProperties/>
            <form:body>
                
                <domainSearch:textField domain="checkCard" property="bankCardNum"/>
                <domainSearch:datePicker domain="checkCard" property="takeDate" dataDateFormat="yyyy-mm-dd"/>
                %{--<domainSearch:select domain="checkCard" property="salesMan" from="${userList}" optionKey="userCode" optionValue="remarkName" noSelection="['':'--请选择--']"/>--}%
                %{--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<g:message code="checkCard.salesMan.label"></g:message><g:select name="salesmanCode" from="${salesmanList}" optionKey="userCode" optionValue="userName"
                          value="${params ? params['salesmanCode'] : ''}"
                          noSelection="['':'--请选择--']"/>--}%

                <div class="col-xs-12 col-md-4 col-sm-4">
                    <label class="control-label col-md-4">
                    <g:message code="checkCard.salesManName.label"></g:message>
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

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
        <div class="form-actions right">
            <g:link class="btn btn-add" controller="checkCard" action="create"><g:message code="checkCard.add.label"/> </g:link>
        </div>
    </portlet:body>
</component:portlet>
