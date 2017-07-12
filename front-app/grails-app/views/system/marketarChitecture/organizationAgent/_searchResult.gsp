
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'organizationAgent'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="organizationAgent" property="empOperationId"/>
                    <domainSearchResult:header domain="organizationAgent" property="orgRunProp"/>
                    <domainSearchResult:header domain="organizationAgent" property="orgRegistNum"/>
                    <domainSearchResult:header domain="organizationAgent" property="legalPersonName"/>
                    <domainSearchResult:header domain="organizationAgent" property="legalPersonCard"/>
                    <domainSearchResult:header domain="organizationAgent" property="registAddress"/>
                    <domainSearchResult:header domain="organizationAgent" property="registCapitall"/>
                    <domainSearchResult:header domain="organizationAgent" property="teamworkManagerId"/>
                    <domainSearchResult:header domain="organizationAgent" property="empOperationDeptId"/>
                    <domainSearchResult:header domain="organizationAgent" property="teamworkManagerDeptId"/>
                    <domainSearchResult:header domain="organizationAgent" property="orgFullName"/>
                    <domainSearchResult:header domain="organizationAgent" property="signDate"/>
                    <domainSearchResult:header domain="organizationAgent" property="breakSignDate"/>
                    <domainSearchResult:header domain="organizationAgent" property="expandNo"/>
                    <domainSearchResult:header domain="organizationAgent" property="expandName"/>
                    <domainSearchResult:header domain="organizationAgent" property="mainContract"/>
                    <domainSearchResult:header domain="organizationAgent" property="regionalAgency"/>
                    <domainSearchResult:header domain="organizationAgent" property="authorizationAreaType"/>
                    <domainSearchResult:header domain="organizationAgent" property="depositmarginReceivable"/>
                    <domainSearchResult:header domain="organizationAgent" property="paidDeposit"/>
                    <domainSearchResult:header domain="organizationAgent" property="depositTime"/>
                    <domainSearchResult:header domain="organizationAgent" property="networkServiceFee"/>
                    <domainSearchResult:header domain="organizationAgent" property="agreementDate"/>
                    <domainSearchResult:header domain="organizationAgent" property="filingProtocolState"/>
                    <domainSearchResult:header domain="organizationAgent" property="authorizedNameplate"/>
                    <domainSearchResult:header domain="organizationAgent" property="agentLever"/>
                    <domainSearchResult:header domain="organizationAgent" property="backCardNumber"/>
                    <domainSearchResult:header domain="organizationAgent" property="virtualAccountId"/>
                    <domainSearchResult:header domain="organizationAgent" property="checkDiscount"/>
                    <domainSearchResult:header domain="organizationAgent" property="checkCut"/>
                    <domainSearchResult:header domain="organizationAgent" property="adminEmpUuid"/>
                    <domainSearchResult:header domain="organizationAgent" property="agentNumber"/>
                    <domainSearchResult:header domain="organizationAgent" property="leverNo"/>
                    <domainSearchResult:header domain="organizationAgent" property="settlementAccountType"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="organizationAgentInstance"
                               in="${organizationAgentInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="empOperationId"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="number" domain="organizationAgent" property="orgRunProp"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="orgRegistNum"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="legalPersonName"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="legalPersonCard"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="registAddress"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="number" domain="organizationAgent" property="registCapitall"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="teamworkManagerId"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="empOperationDeptId"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="teamworkManagerDeptId"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="orgFullName"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="signDate"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="breakSignDate"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="expandNo"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="expandName"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="mainContract"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="regionalAgency"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="authorizationAreaType"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="depositmarginReceivable"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="paidDeposit"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="depositTime"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="networkServiceFee"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="agreementDate"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="number" domain="organizationAgent" property="filingProtocolState"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="number" domain="organizationAgent" property="authorizedNameplate"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="number" domain="organizationAgent" property="agentLever"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="backCardNumber"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="number" domain="organizationAgent" property="virtualAccountId"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="number" domain="organizationAgent" property="checkDiscount"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="number" domain="organizationAgent" property="checkCut"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="organizationAgent" property="adminEmpUuid"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="number" domain="organizationAgent" property="agentNumber"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="number" domain="organizationAgent" property="leverNo"
                                                domainInstance="${organizationAgentInstance }"/>
                    <domainSearchResult:rowData type="number" domain="organizationAgent" property="settlementAccountType"
                                                domainInstance="${organizationAgentInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="organizationAgent" action="show" id="${organizationAgentInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="organizationAgent" action="edit" id="${organizationAgentInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
