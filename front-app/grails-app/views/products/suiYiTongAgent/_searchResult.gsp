
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'suiYiTongAgent'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="suiYiTongAgent" property="yieldNow"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="yield"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="businessScale"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="investmentProportionNow"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="agentName"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="agentOrgNo"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="businessScaleNow"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="city"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="date"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="dayBalance"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="dayRatio"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="dayResidueAmount"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="daySettleUsed"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="dayUsedAmount"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="decreaseAmount"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="increaseAmount"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="investmentAmount"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="investmentAmountNow"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="investmentProportion"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="merchantInvestmentAmount"/>
                    <domainSearchResult:header domain="suiYiTongAgent" property="settleAmount"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="suiYiTongAgentInstance"
                               in="${suiYiTongAgentInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="number" domain="suiYiTongAgent" property="yieldNow"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="number" domain="suiYiTongAgent" property="yield"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="businessScale"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="investmentProportionNow"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="agentName"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="agentOrgNo"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="businessScaleNow"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="city"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="date"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="dayBalance"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="dayRatio"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="dayResidueAmount"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="daySettleUsed"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="dayUsedAmount"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="decreaseAmount"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="increaseAmount"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="investmentAmount"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="investmentAmountNow"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="investmentProportion"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="merchantInvestmentAmount"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAgent" property="settleAmount"
                                                domainInstance="${suiYiTongAgentInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="suiYiTongAgent" action="show" id="${suiYiTongAgentInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="suiYiTongAgent" action="edit" id="${suiYiTongAgentInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
