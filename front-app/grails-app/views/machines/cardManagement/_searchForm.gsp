<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'cardManagement.search.label')}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="cardManagement" action="index"
                   name="scaffold-search-cardManagement">
            <form:scaffoldSearchProperties/>

            <form:body>
                <domainSearch:textField domain="cardManagement" property="cardNumber" disabled="disabled"/>
                <g:if test="${isAdmin}">
                    <domainSearch:orgTree domain="cardManagement" property="belongtoOrg" name="q_belongtoOrg"  directly="true" class="belongtoOrg"/>
                    <domainSearch:select2 domain="cardManagement" property="belongPerson" class="form-control belongtoEmp"
                                         from="${com.suixingpay.ssp.front.machines.CardManagement.getConstraintsMap()['belongtoOrg'].inList}"
                                         name="q_belongtoEmp" valueMessagePrefix="cardManagement.belongtoOrg"
                                         value="${params ? params['q_belongtoEmp'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="cardManagement" property="belongtoOrg" />
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${orgNm}" readonly id="readonlyOrgNm"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="cardManagement" property="belongPerson" />
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${remarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>
                <domainSearch:datePicker domain="cardManagement" property="effectiveDate" dataDateFormat="yyyy-mm-dd"/>
                <domainSearch:datePicker domain="cardManagement" property="expiryDate" dataDateFormat="yyyy-mm-dd"/>
                <domainSearch:select domain="cardManagement" property="status" class="form-control"
                                     from="${com.suixingpay.ssp.front.machines.CardManagement.getConstraintsMap()['status'].inList}"
                                     name="q_status" valueMessagePrefix="cardManagement.status"
                                     value="${params ? params['q_status'] : ''}" noSelection="['': '--请选择--']"/>
                <input type="hidden" id="selectedEmp" value="${params ? params['q_belongPerson'] : ''}"/>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>

