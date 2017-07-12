
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'merchantLabel'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="merchantLabel" property="typeCode"/>
                    <domainSearchResult:header domain="merchantLabel" property="name"/>
                    <domainSearchResult:header domain="merchantLabel" property="describe"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="merchantLabelInstance"
                               in="${merchantLabelInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="number" domain="merchantLabel" property="typeCode"
                                                domainInstance="${merchantLabelInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantLabel" property="name"
                                                domainInstance="${merchantLabelInstance }"/>
                    <domainSearchResult:rowData type="text" domain="merchantLabel" property="describe"
                                                domainInstance="${merchantLabelInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="merchantLabel" action="show" id="${merchantLabelInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="merchantLabel" action="edit" id="${merchantLabelInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
