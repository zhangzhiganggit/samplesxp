
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'immediatelyArrive'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="immediatelyArrive" property="merchantCode"/>
                    <domainSearchResult:header domain="immediatelyArrive" property="businessName"/>
                    <domainSearchResult:header domain="immediatelyArrive" property="registMobileNo"/>
                    <domainSearchResult:header domain="immediatelyArrive" property="belongtoOrgName"/>
                    <domainSearchResult:header domain="immediatelyArrive" property="directlyOrgName"/>
                    <domainSearchResult:header domain="immediatelyArrive" property="salesmanName"/>
                    <domainSearchResult:header domain="immediatelyArrive" property="merchantType"/>
                    <domainSearchResult:header domain="immediatelyArrive" property="merchantLevel"/>
                    <domainSearchResult:header domain="immediatelyArrive" property="immediatelyArriveStatus"/>
                    <domainSearchResult:header domain="immediatelyArrive" property="immediatelyArriveCreateDate"/>
                    <domainSearchResult:header domain="immediatelyArrive" property="modifyDate"/>

                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="immediatelyArriveInstance"
                               in="${immediatelyArriveInstanceList }">
                    <tr class="text-nowrap">
                    <domainSearchResult:rowData type="text" domain="immediatelyArrive" property="merchantCode"
                                                domainInstance="${immediatelyArriveInstance }"/>
                    <domainSearchResult:rowData type="text" domain="immediatelyArrive" property="businessName"
                                                domainInstance="${immediatelyArriveInstance }"/>
                    <domainSearchResult:rowData type="text" domain="immediatelyArrive" property="registMobileNo"
                                                domainInstance="${immediatelyArriveInstance }"/>
                    <domainSearchResult:rowData type="text" domain="immediatelyArrive" property="belongtoOrgName"
                                                domainInstance="${immediatelyArriveInstance }"/>
                    <domainSearchResult:rowData type="text" domain="immediatelyArrive" property="directlyOrgName"
                                                domainInstance="${immediatelyArriveInstance }"/>
                    <domainSearchResult:rowData type="text" domain="immediatelyArrive" property="salesmanName"
                                                domainInstance="${immediatelyArriveInstance }"/>
                    <domainSearchResult:rowData type="inList" domain="immediatelyArrive" property="merchantType"
                                                domainInstance="${immediatelyArriveInstance }"/>
                    <domainSearchResult:rowData type="text" domain="immediatelyArrive" property="merchantLevel"
                                                domainInstance="${immediatelyArriveInstance }"/>
                    <domainSearchResult:rowData type="inList" domain="immediatelyArrive" property="immediatelyArriveStatus"
                                                domainInstance="${immediatelyArriveInstance }"/>
                    <domainSearchResult:rowData type="text" domain="immediatelyArrive" property="immediatelyArriveCreateDate"
                                                domainInstance="${immediatelyArriveInstance }"/>
                    <domainSearchResult:rowData type="text" domain="immediatelyArrive" property="modifyDate"
                                                domainInstance="${immediatelyArriveInstance }"/>

                        <td class="tk-actions">
                        <g:if test="${messageMap['message'] == '1'}">
                            <g:if test="${immediatelyArriveInstance.immediatelyArriveStatus == '0'}">
                                <g:link data-toggle="modal" data-target="#sample_modal2" controller="immediatelyArrive" action="toOpenView" params="[merchantCode:immediatelyArriveInstance?.merchantCode,businessName:immediatelyArriveInstance?.businessName,merchantLevel:immediatelyArriveInstance?.merchantLevel]">
                                    <g:message code="immediatelyArrive.open.label"/>
                                </g:link>
                            </g:if>
                            <g:if test="${immediatelyArriveInstance.immediatelyArriveStatus == '1'}">
                                <g:link data-toggle="modal" data-target="#sample_modal3" controller="immediatelyArrive" action="toCloseView" params="[merchantCode: immediatelyArriveInstance?.merchantCode,businessName: immediatelyArriveInstance?.businessName,merchantLevel:immediatelyArriveInstance?.merchantLevel]" >
                                    <g:message code="immediatelyArrive.close.label"/>
                                </g:link>
                            </g:if>
                        </g:if>
                        <g:if test="${messageMap['message'] == '2'}">
                            <g:if test="${immediatelyArriveInstance.immediatelyArriveStatus == '1'}">
                                <g:link controller="immediatelyArrive" action="toCloseView" params="[merchantCode: immediatelyArriveInstance?.merchantCode,businessName: immediatelyArriveInstance?.businessName,merchantLevel:immediatelyArriveInstance?.merchantLevel]">
                                    <g:message code="immediatelyArrive.close.label"/>
                                </g:link>
                            </g:if>
                        </g:if>
                            <g:link data-toggle="modal" data-target="#sample_modal" controller="immediatelyArrive" action="queryImmediatelyArriveOperationList" params="[insideMerchantCode:immediatelyArriveInstance?.insideMerchantCode]">
                                <g:message code="default.button.record.label"/>
                            </g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>

        %{--即刷即到操作记录--}%
        <component:modals id="sample_modal" title=""
                          width="lg"/>
        %{--即刷即到开通--}%
        <component:modals id="sample_modal2" title=""
                          width="content"/>
        %{--即刷即到关闭--}%
        <component:modals id="sample_modal3" title=""
                          width="content"/>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/products/immediatelyArrive.js"/>
</content>
