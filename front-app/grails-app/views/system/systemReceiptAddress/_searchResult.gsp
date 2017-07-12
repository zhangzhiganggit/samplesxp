<component:portlet cssClass="scaffold-searchResult">
        %{--<portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'systemIdentity'))}"
                       iconCssClass="fa fa-filter"/>--}%
    <div class="portlet-title">
       <div class="caption">
           <span class="caption-subject bold font-dark uppercase">
           ${message(code: 'systemReceiptAddress.default.searchResult.label', args: message.domain(domain: 'systemIdentity'))}</span></div>
        <div class="actions"> <g:link class="btn btn-primary" controller="systemReceiptAddress" action="create">
            <i class="fa fa-plus"></i>
            ${message(code: 'systemReceiptAddress.default.button.create.label')}
        </g:link></div>
    </div>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    <domainSearchResult:header domain="systemReceiptAddress" property="receiverName" width="60"/>
                    <domainSearchResult:header domain="systemReceiptAddress" property="mobileNo" width="80"/>
                    <domainSearchResult:header value="${message(code: 'systemReceiptAddress.localarea.label')}" width="120"/>
                    <domainSearchResult:header domain="systemReceiptAddress" property="address" width="120"/>
                    <domainSearchResult:header domain="systemReceiptAddress" property="postcode" width="40"/>
                    <domainSearchResult:header domain="systemReceiptAddress" property="defaultFlag" width="40"/>
                    <th width="70"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="systemReceiptAddressInstance" in="${systemReceiptAddressInstanceList}">
                    <tr>
                        <domainSearchResult:rowData type="text" domain="systemReceiptAddress" property="receiverName"
                                                    domainInstance="${systemReceiptAddressInstance}" textAlign="left"/>
                        <domainSearchResult:rowData type="text" domain="systemReceiptAddress" property="mobileNo"
                                                    domainInstance="${systemReceiptAddressInstance}" textAlign="center"/>
                        <%
                            address_0 = systemReceiptAddressInstance['province']?.toString() + '-' + (systemReceiptAddressInstance['city']?:'')+ (systemReceiptAddressInstance['area']?'-':'') + (systemReceiptAddressInstance['area']?:'')
                        %>

                        <domainSearchResult:rowData type="custom" value="${address_0}" textAlign="left"/>

                        <domainSearchResult:rowData type="text" domain="systemReceiptAddress" property="address"
                                                    domainInstance="${systemReceiptAddressInstance}" textAlign="left"/>
                        <domainSearchResult:rowData type="text" domain="systemReceiptAddress" property="postcode"
                                                    domainInstance="${systemReceiptAddressInstance}" textAlign="center"/>
                        <domainSearchResult:rowData type="boolean" domain="systemReceiptAddress" property="defaultFlag"
                                                    domainInstance="${systemReceiptAddressInstance}" textAlign="center"/>
                        <td class="tk-actions" align="left">
                            <g:link controller="systemReceiptAddress" action="edit"
                                    id="${systemReceiptAddressInstance?.id}"><g:message
                                    code="systemReceiptAddress.default.button.edit.label"/></g:link>
                            <g:link class="ssp-system-receipt-address" controller="systemReceiptAddress" action="delete"
                                    id="${systemReceiptAddressInstance?.id}"><g:message
                                    code="default.button.delete.label"/></g:link>
                            <g:if test="${!systemReceiptAddressInstance.defaultFlag}">
                                <g:link class="ssp-system-receipt-address" controller="systemReceiptAddress" action="setDefault"
                                        id="${systemReceiptAddressInstance?.id}"><g:message
                                        code="systemReceiptAddress.default.button.default.label"/></g:link>
                            </g:if>
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
            $('.ssp-system-receipt-address').on('click',function (e) {
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