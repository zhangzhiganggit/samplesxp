
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'merchantTerminalManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form id="merchantTerminalManagementSearchForm" controller="merchantTerminalManagement" action="index"
                   name="scaffold-search-merchantTerminalManagement">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden"  id="hiddenSalesMan" value="${hiddenSalesMan}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenUserCode" value="${hiddenUserCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <formCommon:hiddenField id="salesMan" name="salesMan" value="${params['q_salesMan']}"/>
                <domainSearch:textField domain="merchantTerminalManagement" property="merchantCode"/>
                <domainSearch:textField domain="merchantTerminalManagement" property="merchantSalesSlipName"/>
                <domainSearch:textField domain="merchantTerminalManagement" property="machinesSerialNumber"/>
            %{--<domainSearch:textField domain="merchantTerminalManagement" property="belongtoOrganization"  />--}%
                <g:if test="${isAdmin}">
                    <domainSearch:orgTree popoverMessage="${message(code:"merchantManagement.belongToOrg.show-pop.label")}" domain="merchantTerminalManagement" property="belongtoOrganization" directly="true"/>
                %{--// 下拉列表--}%
                %{--<domainSearch:select property="merchantStatus" domain="merchantRiskControlStatusManagement" class="form-control" name="q_result" from="${com.suixingpay.ssp.front.riskcontrol.MerchantRiskControlStatusManagement.constrainedProperties['merchantStatus'].inList}" valueMessagePrefix="merchantRiskControlStatusManagement.merchantStatus" value="${params ? params['q_result'] : ''}" noSelection="['':'']" />--}%
                %{--<domainSearch:textField domain="merchantTerminalManagement" property="salesMan"/>--}%
                    <domainSearch:select2  popoverMessage="${message(code:"merchantManagement.salesMan.show-pop.label")}" domain="merchantTerminalManagement" property="salesMan" class="form-control"
                                           from=""
                                           value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="merchantManagement.belongToOrg.show-pop.label"></g:message>"></i>  <message:property domain="merchantTerminalManagement" property="belongtoOrganization" />
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenCurrentOrgName}" readonly id="readonlyOrgNm"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="merchantManagement.salesMan.show-pop.label"></g:message>"></i> <message:property domain="merchantTerminalManagement" property="salesMan" />
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenRemarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>
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