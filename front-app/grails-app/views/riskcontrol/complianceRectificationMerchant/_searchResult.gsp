
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'complianceRectificationMerchant.complianceRectificationMerchantList.label', args: message.domain(domain: 'complianceRectificationMerchant'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-toolbar">
            %{--<g:render template="/riskcontrol/complianceRectificationMerchant/selfRectificationImport"></g:render>
            <div class="rectificationMerchantResult"></div>

            <div class="col-md-12 ">
                <div class="pull-right">
                    <button class="btn btn-import" data-toggle="modal" data-target="#selfRectificationImportModal"><g:message code="complianceRectificationMerchant.selfRectificationImport.label"/></button>
                </div>
            </div>--}%


            <div class="rectificationMerchantResult"></div>

            <div class="col-md-12 ">
                <div class="pull-right">
                    <g:link data-toggle="modal" data-target="#selfRectificationImportModal" class="btn btn-import"
                            controller="complianceRectificationMerchant" action="selfRectificationImport"><g:message code="complianceRectificationMerchant.selfRectificationImport.label"/></g:link>
                </div>
            </div>

        </div>

        <div class="table-scrollable text-nowrap">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    <domainSearchResult:header domain="complianceRectificationMerchant" property="taskNumber" width="240"/>
                    <domainSearchResult:header domain="complianceRectificationMerchant" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="complianceRectificationMerchant" property="promoter" width="80"/>
                    <domainSearchResult:header domain="complianceRectificationMerchant" property="promoterOrg" width="120"/>
                    <domainSearchResult:header domain="complianceRectificationMerchant" property="launchTime" width="120"/>
                    <domainSearchResult:header domain="complianceRectificationMerchant" property="updateTime" width="120"/>
                    <domainSearchResult:header domain="complianceRectificationMerchant" property="type" width="60"/>

                    <th width="80"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="complianceRectificationMerchantInstance"
                               in="${complianceRectificationMerchantInstanceList }">
                    <tr>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="complianceRectificationMerchant" property="taskNumber"
                                                    domainInstance="${complianceRectificationMerchantInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="complianceRectificationMerchant" property="merchantCode"
                                                    domainInstance="${complianceRectificationMerchantInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="complianceRectificationMerchant" property="promoter"
                                                    domainInstance="${complianceRectificationMerchantInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="complianceRectificationMerchant" property="promoterOrg"
                                                    domainInstance="${complianceRectificationMerchantInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="complianceRectificationMerchant" property="launchTime"
                                                    domainInstance="${complianceRectificationMerchantInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="complianceRectificationMerchant" property="updateTime"
                                                    domainInstance="${complianceRectificationMerchantInstance }"/>
                        <td align="center"><g:message
                                code="complianceRectificationMerchant.type.${complianceRectificationMerchantInstance.type}"/></td>
                        %{--<domainSearchResult:rowData type="text" domain="complianceRectificationMerchant" property="type"--}%
                                                    %{--domainInstance="${complianceRectificationMerchantInstance }"/>--}%

                        <td class="tk-actions" align="left">
                            <g:link controller="complianceRectificationMerchant" action="show" data-toggle="modal"
                                    data-target="#complianceRectificationMerchantShow" params="[flowNo:complianceRectificationMerchantInstance.flowNo,version:complianceRectificationMerchantInstance.version]"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:if test="${complianceRectificationMerchantInstance.type=='2'}">
                            <g:link controller="complianceRectificationMerchant" action="edit" params="[flowNo:complianceRectificationMerchantInstance.flowNo,version:complianceRectificationMerchantInstance.version]"><g:message
                                    code="complianceRectificationMerchant.edit.label"/></g:link></g:if>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${complianceRectificationMerchantInstanceCount != -1}">
            <component:paginate total="${complianceRectificationMerchantInstanceCount }"/>
        </g:if>
    </portlet:body>
</component:portlet>
<component:modals id="complianceRectificationMerchantShow" title="${message(code: 'default.button.show.label')}"
                  width="full"/>
<component:modals id="selfRectificationImportModal" title="${message(code: 'default.button.show.label')}"
                  width="content"/>
<content tag="takin-footer">
    <g:javascript>
        $(function () {
            $("input").keyup(function () {
                this.value=this.value.replace(/\s/g,'');
            });
        });
    </g:javascript>
</content>