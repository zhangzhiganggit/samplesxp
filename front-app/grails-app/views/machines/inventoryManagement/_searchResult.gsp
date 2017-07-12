<component:portlet cssClass="scaffold-searchResult">
    <portlet:title
            title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'inventoryManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body>

        <table class="table table-striped table-bordered table-hover dataTable no-footer text-nowrap table-layout-fixed">
            <thead>
            <tr>

                <domainSearchResult:header domain="inventoryManagement" property="goodsType" width="40"/>
                <domainSearchResult:header domain="inventoryManagement" property="goodsName" width="80"/>
                <domainSearchResult:header domain="inventoryManagement" property="factShortName" width="100"/>
                <domainSearchResult:header domain="inventoryManagement" property="model" width="80"/>
                <domainSearchResult:header domain="inventoryManagement" property="communicationType" width="60"/>
                <domainSearchResult:header domain="inventoryManagement" property="signa" width="40"/>

                <domainSearchResult:header domain="inventoryManagement" property="unInstallNumber" width="40" popoverMessage="${message(code:"inventoryManagement.unInstallNumber.show-pop.label")}"/>
                <domainSearchResult:header domain="inventoryManagement" property="installNumber" width="40" popoverMessage="${message(code:"inventoryManagement.installNumber.show-pop.label")}"/>
                %{--<th><g:message code="default.actions.label"/></th>--}%
            </tr>
            </thead>
            <tbody><g:each var="inventoryManagementInstance"
                           in="${inventoryManagementInstanceList}">
                <tr class="text-nowrap">

                    <domainSearchResult:rowData textAlign="left" type="text" domain="inventoryManagement" property="goodsType"
                                                domainInstance="${inventoryManagementInstance}"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="inventoryManagement" property="goodsName"
                                                domainInstance="${inventoryManagementInstance}"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="inventoryManagement" property="factShortName"
                                                domainInstance="${inventoryManagementInstance}"/>

                    <domainSearchResult:rowData textAlign="left" type="text" domain="inventoryManagement" property="model"
                                                domainInstance="${inventoryManagementInstance}"/>



                    <domainSearchResult:rowData textAlign="left" type="text" domain="inventoryManagement" property="communicationType"
                                                domainInstance="${inventoryManagementInstance}"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="inventoryManagement" property="signa"
                                                domainInstance="${inventoryManagementInstance}"/>
        <g:if test="${inventoryManagementInstance.unInstallNumber=='0'}">
                    <td align="right">
                        ${inventoryManagementInstance ? inventoryManagementInstance['unInstallNumber'] : '' }
                    </td>
        </g:if>
        <g:else>
            <td align="right"> <g:link class="unInstallNumber" controller="inventoryManagement" action="inventoryOperationManagement" params="[factShortNameCode:inventoryManagementInstance?.factShortNameCode,modelCode:inventoryManagementInstance?.modelCode,goodsNameCode:inventoryManagementInstance?.goodsNameCode,code:inventoryManagementInstance?.code,acFlag:'1']">
                ${inventoryManagementInstance ? inventoryManagementInstance['unInstallNumber'] : '' }   </g:link>
            </td>
        </g:else>

        <g:if test="${inventoryManagementInstance.installNumber=='0'}">
                    <td align="right">
                        ${inventoryManagementInstance ? inventoryManagementInstance['installNumber'] : '' }
                    </td>
        </g:if>
        <g:else>
            <td align="right"> <g:link class="installNumber" data-toggle="modal" data-target="#sample_modal1" controller="inventoryManagement" action="inventoryInstall" params="[factShortNameCode:inventoryManagementInstance?.factShortNameCode,modelCode:inventoryManagementInstance?.modelCode,goodsNameCode:inventoryManagementInstance?.goodsNameCode,code:inventoryManagementInstance?.code]">
                ${inventoryManagementInstance ? inventoryManagementInstance['installNumber'] : '' }   </g:link>
            </td>
        </g:else>
                    %{--  <domainSearchResult:rowData type="date" domain="inventoryManagement" property="unInstallNumber"
                                                                        domainInstance="${inventoryManagementInstance}"/>


                                        <domainSearchResult:rowData type="number" domain="inventoryManagement" property="installNumber"
                                                                    domainInstance="${inventoryManagementInstance}"/>--}%


                </tr></g:each>
            </tbody>
        </table>

        <g:if test="${inventoryManagementInstanceCount!= -1}">
        <component:paginate total="${inventoryManagementInstanceCount}"/>
        </g:if>
        <component:modals id="sample_modal1" title="" width="full"/>
    </portlet:body>
</component:portlet>


