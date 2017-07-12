<component:portlet cssClass="scaffold-searchResult">

    <div class="portlet-title">
        <div class="caption">
            <span class="caption-subject bold font-dark uppercase">
                ${message(code: 'controller.systemSuggestion.label', args: message.domain(domain: 'systemSuggestion'))}</span>
        </div>

        <div class="actions"><g:link class="btn btn-primary" controller="systemSuggestion" action="create">
            <i class="fa fa-plus"></i>
            ${message(code: 'systemSuggestion.default.button.create.label')}
        </g:link></div>
    </div>

    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    <domainSearchResult:header domain="systemSuggestion" property="theme"/>
                    <domainSearchResult:header domain="systemSuggestion" property="feedbackType"/>
                    <domainSearchResult:header domain="systemSuggestion" property="suggestion"/>
                    <domainSearchResult:header domain="systemSuggestion" property="contactPeople"/>
                    <domainSearchResult:header domain="systemSuggestion" property="contactTel"/>
                    <domainSearchResult:header domain="systemSuggestion" property="contactEmail"/>
                    %{-- <domainSearchResult:header domain="suggestion" property="emailRecipient"/>
                     <domainSearchResult:header domain="suggestion" property="emailRecipientName"/>
                     <domainSearchResult:header domain="suggestion" property="emailArrivalTime"/>
                     <domainSearchResult:header domain="suggestion" property="imageAddr"/>
                     <domainSearchResult:header domain="suggestion" property="proposeTime"/>
                     <domainSearchResult:header domain="suggestion" property="proposePeople"/>
                     <domainSearchResult:header domain="suggestion" property="isAdministrator"/>
                     <domainSearchResult:header domain="suggestion" property="agentOrgNo"/>
                     <domainSearchResult:header domain="suggestion" property="topAgentOrgNo"/>
                     <domainSearchResult:header domain="suggestion" property="branchOrgNo"/>
                     <domainSearchResult:header domain="suggestion" property="branchOrgNm"/>
                     <domainSearchResult:header domain="suggestion" property="operStatus"/>
                     <domainSearchResult:header domain="suggestion" property="operResult"/>
                     <domainSearchResult:header domain="suggestion" property="operNo"/>
                     <domainSearchResult:header domain="suggestion" property="operNm"/>
                     <domainSearchResult:header domain="suggestion" property="operTime"/>
                     <domainSearchResult:header domain="suggestion" property="remarks"/>--}%
                   %{-- <th><g:message code="default.actions.label"/></th>--}%
                </tr>
                </thead>
                <tbody><g:each var="systemSuggestionInstance" in="${systemSuggestionInstanceList}">
                    <tr>
                        <domainSearchResult:rowData type="text" domain="systemSuggestion" property="theme"
                                                    domainInstance="${systemSuggestionInstance}"/>
                        <domainSearchResult:rowData type="text" domain="systemSuggestion" property="feedbackType"
                                                    domainInstance="${systemSuggestionInstance}"/>
                        <domainSearchResult:rowData type="text" domain="systemSuggestion" property="suggestion"
                                                    domainInstance="${systemSuggestionInstance}"/>
                        <domainSearchResult:rowData type="text" domain="systemSuggestion" property="contactPeople"
                                                    domainInstance="${systemSuggestionInstance}"/>
                        <domainSearchResult:rowData type="text" domain="systemSuggestion" property="contactTel"
                                                    domainInstance="${systemSuggestionInstance}"/>
                        <domainSearchResult:rowData type="text" domain="systemSuggestion" property="contactEmail"
                                                    domainInstance="${systemSuggestionInstance}"/>
                        %{-- <domainSearchResult:rowData type="text" domain="suggestion" property="emailRecipient"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="text" domain="suggestion" property="emailRecipientName"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="date" domain="suggestion" property="emailArrivalTime"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="text" domain="suggestion" property="imageAddr"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="date" domain="suggestion" property="proposeTime"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="text" domain="suggestion" property="proposePeople"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="text" domain="suggestion" property="isAdministrator"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="text" domain="suggestion" property="agentOrgNo"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="text" domain="suggestion" property="topAgentOrgNo"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="text" domain="suggestion" property="branchOrgNo"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="text" domain="suggestion" property="branchOrgNm"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="text" domain="suggestion" property="operStatus"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="text" domain="suggestion" property="operResult"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="text" domain="suggestion" property="operNo"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="text" domain="suggestion" property="operNm"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="date" domain="suggestion" property="operTime"
                                                     domainInstance="${suggestionInstance}"/>
                         <domainSearchResult:rowData type="text" domain="suggestion" property="remarks"
                                                     domainInstance="${suggestionInstance}"/>--}%
                       %{-- <td class="tk-actions">
                            <g:link controller="systemSuggestion" action="show"
                                    id="${suggestionInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="systemSuggestion" action="edit"
                                    id="${suggestionInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                        </td>--}%
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
