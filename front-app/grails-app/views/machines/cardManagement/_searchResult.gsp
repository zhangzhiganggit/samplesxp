<component:portlet cssClass="scaffold-searchResult">
    <portlet:title
            title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'cardManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body>
        <component:modals id="sample_modal1" title="" width="content"/>
        <formCommon:hiddenField id="flag" name="flag" value="${flag}"/>

        <div class="table-toolbar">
            <div class="pull-right" >
                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                        code="cardManagement.transfer.show-pop.label"></g:message>"></i>
                <label class="button-group bootstro" data-bootstro-title="" data-bootstro-content="${message(code:"cardManagement.transfer.pageGuide.label")}<div class='input-view'><input id='cardManagement.index' type='checkbox' class='popCheck'  onclick='neverShow();'/>下次不要显示<div>" data-bootstro-width="400px" data-bootstro-placement="top" data-bootstro-step="0">
                    <g:link  controller="cardManagement" action="transfer"
                             class="btn btn-batch-belong batchTransfer " data-modal-target="sample_modal1">
                        <g:message code="cardManagement.transfer.label"></g:message>
                    </g:link>
                </div>

            </div>
        </div>
        <div class="portlet-body">
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    <th class="center" width="65"><component:checkbox title="" cssClass="group-checkable" property="stringValue"
                                            dataSet="#sample_1 .checkboxes"/><g:message code="cardManagement.checkAll.label"></g:message> </th>
                    <domainSearchResult:header domain="cardManagement" property="cardNumber" width="50"/>
                    <domainSearchResult:header domain="cardManagement" property="status" width="60"/>
                    <domainSearchResult:header domain="cardManagement" property="effectiveDate" width="60"/>
                    <domainSearchResult:header domain="cardManagement" property="expiryDate" width="60"/>
                    <domainSearchResult:header domain="cardManagement" property="recipientsDate" width="60"/>
                    <g:if test="${isAdmin}">
                        <domainSearchResult:header domain="cardManagement" property="belongtoOrg" width="120"/>
                        <domainSearchResult:header domain="cardManagement" property="directlyOrg" width="120"/>
                        <domainSearchResult:header domain="cardManagement" property="belongPerson" width="80"/>
                    </g:if>
                    %{--<domainSearchResult:header domain="cardManagement" property="recipientsPersonTelphone"/>--}%
                    <domainSearchResult:header domain="cardManagement" property="permissions" width="90"/>
                    %{--<th><g:message code="default.actions.label"/></th>--}%
                </tr>

                </thead>
                <tbody><g:each var="cardManagementInstance"
                               in="${cardManagementInstanceList}">
                    <tr class="text-nowrap">
                        <td class="center">
                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="checkboxes" name="cardId" value="${cardManagementInstance.cardNumber}">
                                <span></span>
                            </label>
                        </td>

                        <domainSearchResult:rowData textAlign="right" type="text" domain="cardManagement" property="cardNumber"
                                                    domainInstance="${cardManagementInstance}"/>
                        <domainSearchResult:rowData type="inList" domain="cardManagement" property="status"
                                                    domainInstance="${cardManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="date" domain="cardManagement" property="effectiveDate"
                                                    domainInstance="${cardManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="date" domain="cardManagement" property="expiryDate"
                                                    domainInstance="${cardManagementInstance}"/>
                        <domainSearchResult:rowData  textAlign="center" type="date" domain="cardManagement" property="recipientsDate"
                                                    domainInstance="${cardManagementInstance}"/>
                        <g:if test="${isAdmin}">
                            <domainSearchResult:rowData type="text" domain="cardManagement" property="belongtoOrg"
                                                        domainInstance="${cardManagementInstance}" textAlign="left"/>
                            <domainSearchResult:rowData type="text" domain="cardManagement" property="directlyOrg"
                                                        domainInstance="${cardManagementInstance}" textAlign="left"/>
                            <domainSearchResult:rowData type="text" domain="cardManagement" property="belongPerson"
                                                        domainInstance="${cardManagementInstance}" textAlign="left"/>
                        </g:if>
                        %{--<domainSearchResult:rowData type="text" domain="cardManagement"--}%
                                                    %{--property="recipientsPersonTelphone"--}%
                                                    %{--domainInstance="${cardManagementInstance}"/>--}%
                        <domainSearchResult:rowData type="inList" domain="cardManagement" property="permissions"
                                                    domainInstance="${cardManagementInstance}"/>

                        %{--<td class="tk-actions">--}%
                            %{--<g:link data-toggle="modal" data-target="#sample_modal1" controller="cardManagement" action="recipients"--}%
                                    %{--id="${cardManagementInstance?.cardNumber}"><g:message--}%
                                    %{--code="cardManagement.recipients.label"/></g:link>--}%
                            %{--<g:link data-toggle="modal" data-target="#sample_modal1" controller="cardManagement" action="transfer"--}%
                                    %{--id="${cardManagementInstance?.cardNumber}"><g:message--}%
                                    %{--code="cardManagement.transfer.label"/></g:link>--}%

                        %{--</td>--}%
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        </div>
        <g:if test="${cardManagementInstanceCount != -1}">
            <component:paginate total="${cardManagementInstanceCount }"/>
        </g:if>
        <component:modals id="sample_modal1" title="" width="content"/>
    </portlet:body>
</component:portlet>
<asset:stylesheet src="global/plugins/bootstro/css/bootstro.css"/>
<content tag="takin-footer">
    <asset:javascript src="global/plugins/bootstro/js/bootstro.js"/>
    <asset:javascript src="/machines/CardManagement.js"/>
    <g:javascript>
        $(function(){

            $("input").keyup(function () {
                this.value=this.value.replace(/\s/g,'');
            });

            var url = "/cardManagement/transfer";
            var target = "sample_modal1";
            $.ajax({
                url: url,
                data: {
                    cardIds: ""
                },
            }).success(function (data) {
                $('.modal-body').empty();
                $('.modal-footer').remove();
                $('.modal-header').remove();
                $('.modal-content').html(data);
            })
            console.log($("#flag").val()=="true")
            if($("#flag").val()=="true"){
                checkIsShowStro("cardManagement.index");
            }
        })
    </g:javascript>
</content>
