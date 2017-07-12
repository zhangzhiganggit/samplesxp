
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'homePanel'))}"
                   iconCssClass="fa fa-filter"/>
    %{--<div class="portlet-title">--}%
        %{--<div class="caption">--}%
            %{--<span class="caption-subject bold font-dark uppercase">--}%
                %{--${message(code: 'default.searchResult.label', args: message.domain(domain: 'homePanel'))}--}%
            %{--</span>--}%
        %{--</div>--}%
        %{--<div class="actions">--}%
            %{--<g:link controller="homePanel" action="create">--}%
                %{--<formActions:button value="${message(code: 'default.button.create.label')}"--}%
                                    %{--btnIconClass="fa fa-plus"/>--}%
            %{--</g:link>--}%
        %{--</div>--}%
    %{--</div>--}%
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    <domainSearchResult:header domain="homePanel" property="panelName"/>
                    <domainSearchResult:header domain="homePanel" property="identity"/>
                    <domainSearchResult:header domain="homePanel" property="panelController"/>
                    <domainSearchResult:header domain="homePanel" property="panelAction"/>
                    <domainSearchResult:header domain="homePanel" property="panelShowStatus"/>
                    <domainSearchResult:header domain="homePanel" property="remark"/>
                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="homePanelInstance"
                               in="${homePanelInstanceList }">
                    <tr>

                    <domainSearchResult:rowData type="text" domain="homePanel" property="panelName"
                                                    domainInstance="${homePanelInstance }"/>
                    <domainSearchResult:rowData type="inList" domain="homePanel" property="identity"
                                                domainInstance="${homePanelInstance }"/>
                    <domainSearchResult:rowData type="text" domain="homePanel" property="panelController"
                                                domainInstance="${homePanelInstance }"/>
                    <domainSearchResult:rowData type="text" domain="homePanel" property="panelAction"
                                                domainInstance="${homePanelInstance }"/>
                    <domainSearchResult:rowData type="inList" domain="homePanel" property="panelShowStatus"
                                                domainInstance="${homePanelInstance }"/>
                    <domainSearchResult:rowData type="text" domain="homePanel" property="remark"
                                                domainInstance="${homePanelInstance }"/>
                        <td class="tk-actions">
                            <g:link controller="homePanel" action="show" id="${homePanelInstance?.id}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:link controller="homePanel" action="edit" id="${homePanelInstance?.id}"><g:message
                                    code="default.button.edit.label"/></g:link>
                            <g:link class="ssp-system-home-panel"  controller="homePanel" action="delete" id="${homePanelInstance?.id}"><g:message
                                    code="default.button.delete.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <g:javascript>
        $(function () {
            $('.ssp-system-home-panel').on('click',function (e) {
                e.preventDefault();
                var deleteUrl = $(this).attr('href');
                var action = $(this).html();
                bootbox.dialog({
                    message: "${message(code: 'default.confirm.label')}"+action+"?",
                    title: '${message(code: 'default.flash.type.info')}',
                    buttons: {
                        success: {
                            label: '${message(code: 'default.button.cancel.label')}',
                            className: "green",
                            callback: function () {
                            }
                        },
                        danger: {
                            label:  '${message(code: 'default.button.enter.label')}',
                            className: "red",
                            callback: function () {
                                window.location.href = deleteUrl;
                            }
                        }
                    }
                });
            });
        })
    </g:javascript>
</content>
