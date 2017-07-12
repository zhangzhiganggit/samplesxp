
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'totalShop'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="totalShop" property="merchantCode"/>
                    <domainSearchResult:header domain="totalShop" property="merchantName"/>
                    <domainSearchResult:header domain="totalShop" property="receiptsName"/>
                    <domainSearchResult:header domain="totalShop" property="registName"/>
                    <domainSearchResult:header domain="totalShop" property="totalShopId"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="totalShopInstance"
                               in="${totalShopInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="text" domain="totalShop" property="merchantCode"
                                                domainInstance="${totalShopInstance }"/>
                    <domainSearchResult:rowData type="text" domain="totalShop" property="merchantName"
                                                domainInstance="${totalShopInstance }"/>
                    <domainSearchResult:rowData type="text" domain="totalShop" property="receiptsName"
                                                domainInstance="${totalShopInstance }"/>
                    <domainSearchResult:rowData type="text" domain="totalShop" property="registName"
                                                domainInstance="${totalShopInstance }"/>
                    <domainSearchResult:rowData type="text" domain="totalShop" property="totalShopId"
                                                domainInstance="${totalShopInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="totalShop" action="show" id="${totalShopInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="totalShop" action="edit" id="${totalShopInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
