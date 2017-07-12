<%@ page import="com.suixingpay.ssp.front.machines.InventoryManagement" %>
<component:portlet cssClass="scaffold-show">
    <portlet:body withForm="true">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-comments"></i><g:message code="inventoryInstallDetails.label"></g:message> </div>
                <div class="tools">
                    <a href="javascript:;" class="remove" data-original-title="" title=""> </a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-scrollable">
                    <table class="table table-striped table-bordered table-hover dataTable no-footer">
                        <thead>
                        <tr>
                            <domainSearchResult:header domain="inventoryManagement" property="sn"/>
                            <domainSearchResult:header domain="inventoryManagement" property="merchantCode"/>
                            <domainSearchResult:header domain="inventoryManagement" property="terminalCode"/>
                            <domainSearchResult:header domain="inventoryManagement" property="goodsName"/>
                            <domainSearchResult:header domain="inventoryManagement" property="factShortName"/>
                            <domainSearchResult:header domain="inventoryManagement" property="model"/>
                            <domainSearchResult:header domain="inventoryManagement" property="communicationType"/>
                            <domainSearchResult:header domain="inventoryManagement" property="signa"/>
                            <domainSearchResult:header domain="inventoryManagement" property="putInStorageDate"/>
                            <domainSearchResult:header domain="inventoryManagement" property="installDate"/>
                            <th><g:message code="default.actions.label"/></th>
                        </tr>
                        </thead>
                        <tbody><g:each var="inventoryManagementInstance"
                                       in="${inventoryManagementInstanceList}">
                            <tr>
                                <domainSearchResult:rowData type="number" domain="inventoryManagement" property="sn"
                                                            domainInstance="${inventoryManagementInstance }"/>
                                <domainSearchResult:rowData type="number" domain="inventoryManagement" property="nonContact"
                                                            domainInstance="${inventoryManagementInstance }"/>
                                <domainSearchResult:rowData type="number" domain="inventoryManagement" property="terminalCode"
                                                            domainInstance="${inventoryManagementInstance }"/>
                                <domainSearchResult:rowData type="text" domain="inventoryManagement" property="goodsName"
                                                            domainInstance="${inventoryManagementInstance}"/>
                                <domainSearchResult:rowData type="text" domain="inventoryManagement" property="factShortName"
                                                            domainInstance="${inventoryManagementInstance}"/>
                                <domainSearchResult:rowData type="text" domain="inventoryManagement" property="model"
                                                            domainInstance="${inventoryManagementInstance}"/>
                                <domainSearchResult:rowData type="number" domain="inventoryManagement" property="communicationType"
                                                            domainInstance="${inventoryManagementInstance}"/>
                                <domainSearchResult:rowData type="number" domain="inventoryManagement" property="signa"
                                                            domainInstance="${inventoryManagementInstance}"/>
                                <domainSearchResult:rowData type="date" domain="inventoryManagement" property="putInStorageDate"
                                                            domainInstance="${inventoryManagementInstance }"/>
                                <domainSearchResult:rowData type="date" domain="inventoryManagement" property="installDate"
                                                            domainInstance="${inventoryManagementInstance}"/>
                                <td class="tk-actions">
                                    <g:link controller="inventoryManagement" action="show"
                                            id="${inventoryManagementInstance?.id}"><g:message
                                            code="default.button.show.label"/></g:link>
                                    <g:link controller="inventoryManagement" action="edit"
                                            id="${inventoryManagementInstance?.id}"><g:message
                                            code="default.button.edit.label"/></g:link>
                                </td>
                            </tr></g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </portlet:body>
</component:portlet>
