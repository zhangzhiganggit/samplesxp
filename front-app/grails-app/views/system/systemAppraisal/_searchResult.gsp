
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'systemAppraisal'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="systemAppraisal" property="appraisalTime"/>
                    <domainSearchResult:header domain="systemAppraisal" property="lever"/>
                    <domainSearchResult:header domain="systemAppraisal" property="loginId"/>
                    <domainSearchResult:header domain="systemAppraisal" property="opinion"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="systemAppraisalInstance"
                               in="${systemAppraisalInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="date" domain="systemAppraisal" property="appraisalTime"
                                                domainInstance="${systemAppraisalInstance }"/>
                    <domainSearchResult:rowData type="number" domain="systemAppraisal" property="lever"
                                                domainInstance="${systemAppraisalInstance }"/>
                    <domainSearchResult:rowData type="text" domain="systemAppraisal" property="loginId"
                                                domainInstance="${systemAppraisalInstance }"/>
                    <domainSearchResult:rowData type="text" domain="systemAppraisal" property="opinion"
                                                domainInstance="${systemAppraisalInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="systemAppraisal" action="show" id="${systemAppraisalInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="systemAppraisal" action="edit" id="${systemAppraisalInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
