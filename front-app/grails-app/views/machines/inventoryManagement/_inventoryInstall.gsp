<component:portlet cssClass="scaffold-searchResult">
    <portlet:title
            title="${message(code: 'inventoryManagement.installTransfer.label', args: message.domain(domain: 'payCostManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body>
        <form:form controller="payCostManagement" action="index"
                   name="scaffold-search-payCostManagement">
            <form:scaffoldSearchProperties/>

        </form:form>


        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>

                    <domainSearchResult:header domain="inventoryManagement" property="sn"/>
                    <domainSearchResult:header domain="inventoryManagement" property="goodsName"/>
                    <domainSearchResult:header domain="inventoryManagement" property="factShortName"/>
                    <domainSearchResult:header domain="inventoryManagement" property="model"/>
                    <domainSearchResult:header domain="inventoryManagement" property="communicationType"/>
                    <domainSearchResult:header domain="inventoryManagement" property="signa"/>
                    <g:if test="${isAdmin}">
                        <domainSearchResult:header domain="inventoryManagement" property="belongtoOrg" popoverMessage="${message(code:"inventoryManagement.belongtoOrg2.show-pop.label")}"/>
                        <domainSearchResult:header domain="inventoryManagement" property="directlyOrg" popoverMessage="${message(code:"inventoryManagement.directlyOrg.show-pop.label")}"/>
                        <domainSearchResult:header domain="inventoryManagement" property="salesMan" popoverMessage="${message(code:"inventoryManagement.salesMan2.show-pop.label")}"/>
                    </g:if>
                    <domainSearchResult:header domain="inventoryManagement" property="assistMachineNet"/>
                    <domainSearchResult:header domain="inventoryManagement" property="putInStorageString"/>
                    <domainSearchResult:header domain="inventoryManagement" property="installString"/>
                    <domainSearchResult:header domain="inventoryManagement" property="merchantCode"/>
                    <domainSearchResult:header domain="inventoryManagement" property="terminalCode"/>
                    <domainSearchResult:header domain="inventoryManagement" property="status"/>


                </tr>
                </thead>
                <tbody><g:each var="inventoryManagementInstance"
                               in="${inventoryManagementInstanceList}">
                    <tr>


                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="sn"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="goodsName"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="factShortName"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="model"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement"
                                                    property="communicationType"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="signa"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        %{--隐藏范围--}%
                        <g:if test="${isAdmin}">
                            <domainSearchResult:rowData type="text" domain="inventoryManagement" property="belongtoOrg"
                                                        domainInstance="${inventoryManagementInstance}"/>
                            <domainSearchResult:rowData type="text" domain="inventoryManagement" property="directlyOrg"
                                                        domainInstance="${inventoryManagementInstance}"/>
                            <domainSearchResult:rowData type="text" domain="inventoryManagement" property="salesMan"
                                                        domainInstance="${inventoryManagementInstance}"/>
                        </g:if>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="assistMachineNet"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="putInStorageString"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="installString"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="merchantCode"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="terminalCode"
                                                    domainInstance="${inventoryManagementInstance}"/>
                        <domainSearchResult:rowData type="text" domain="inventoryManagement" property="status"
                                                    domainInstance="${inventoryManagementInstance}"/>

                    </tr></g:each>
                </tbody>

            </table>
        </div>
        %{--<g:if test="${inventoryManagementInstanceCount != -1}">--}%
            %{--<component:paginate total="${inventoryManagementInstanceCount}"/>--}%
        %{--</g:if>--}%
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <div class="col-md-offset-5 col-md-12">
                    <button type="submit" class="btn btn-close" id="zzz" data-dismiss="modal"><g:message
                            code="payCostManagement.close.label"></g:message></button>
                </div>
            </div>
        </form>

    </portlet:body>
</component:portlet>