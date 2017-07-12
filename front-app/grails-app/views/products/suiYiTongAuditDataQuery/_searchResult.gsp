<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'suiYiTongAuditDataQuery'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead id="merchantsyth">
                <tr>
                    <domainSearchResult:header domain="suiYiTongAuditDataQuery" property="taskCode" width="240"/>
                    <domainSearchResult:header domain="suiYiTongAuditDataQuery" property="taskType" width="90"/>
                    <domainSearchResult:header domain="suiYiTongAuditDataQuery" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="suiYiTongAuditDataQuery" property="receiptsName" width="120"/>
                    <domainSearchResult:header domain="suiYiTongAuditDataQuery" property="salesMan" width="80"/>
                    <domainSearchResult:header domain="suiYiTongAuditDataQuery" property="launchTime" width="120"/>
                    <domainSearchResult:header domain="suiYiTongAuditDataQuery" property="updateTime" width="120"/>
                    <domainSearchResult:header domain="suiYiTongAuditDataQuery" property="arriveStatus" width="60"/>
                    <th width="30"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>

                <thead id="agentsyth">
                <tr>

                    <domainSearchResult:header domain="suiYiTongAuditDataQuery" property="taskCode" width="240"/>
                    <domainSearchResult:header domain="suiYiTongAuditDataQuery" property="taskType" width="130"/>
                    <domainSearchResult:header domain="suiYiTongAuditDataQuery" property="promoter" width="80"/>
                    <domainSearchResult:header domain="suiYiTongAuditDataQuery" property="launchTime" width="120"/>
                    <domainSearchResult:header domain="suiYiTongAuditDataQuery" property="updateTime" width="120"/>
                    <domainSearchResult:header domain="suiYiTongAuditDataQuery" property="currentStep" width="60"/>
                    <th width="60"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>

                <tbody id="merchantsytb"><g:each var="suiYiTongAuditDataQueryInstance"
                               in="${suiYiTongAuditDataQueryInstanceList }">
                    <tr class="text-nowrap">
                    <domainSearchResult:rowData type="text" domain="suiYiTongAuditDataQuery" property="taskCode"
                                                domainInstance="${suiYiTongAuditDataQueryInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="inList" domain="suiYiTongAuditDataQuery" property="taskType"
                                                domainInstance="${suiYiTongAuditDataQueryInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAuditDataQuery" property="merchantCode"
                                                domainInstance="${suiYiTongAuditDataQueryInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAuditDataQuery" property="receiptsName"
                                                domainInstance="${suiYiTongAuditDataQueryInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAuditDataQuery" property="salesMan"
                                                domainInstance="${suiYiTongAuditDataQueryInstance }" textAlign="left"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAuditDataQuery" property="launchDate"
                                                domainInstance="${suiYiTongAuditDataQueryInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="text" domain="suiYiTongAuditDataQuery" property="updateDate"
                                                domainInstance="${suiYiTongAuditDataQueryInstance }" textAlign="center"/>
                    <domainSearchResult:rowData type="inList" domain="suiYiTongAuditDataQuery" property="arriveStatus"
                                                domainInstance="${suiYiTongAuditDataQueryInstance }" textAlign="center"/>
                        <td class="tk-actions" align="center">
                            <g:link data-toggle="modal" data-target="#sample_modal" controller="suiYiTongAuditDataQuery" action="showDetail" params="[merchantCode:suiYiTongAuditDataQueryInstance?.merchantCode,taskCode:suiYiTongAuditDataQueryInstance.taskCode]">详情</g:link>
                        </td>
                    </tr></g:each>
                </tbody>

                <tbody id="agentsytb"><g:each var="suiYiTongAuditDataQueryInstance"
                               in="${suiYiTongAuditDataQueryInstanceList }">
                    <tr>
                        <domainSearchResult:rowData type="text" domain="suiYiTongAuditDataQuery" property="taskCode"
                                                    domainInstance="${suiYiTongAuditDataQueryInstance }" textAlign="center"/>
                        <domainSearchResult:rowData type="inList" domain="suiYiTongAuditDataQuery" property="taskType"
                                                    domainInstance="${suiYiTongAuditDataQueryInstance }" textAlign="center"/>
                        <domainSearchResult:rowData type="text" domain="suiYiTongAuditDataQuery" property="promoter"
                                                    domainInstance="${suiYiTongAuditDataQueryInstance }" textAlign="left"/>
                        <domainSearchResult:rowData type="text" domain="suiYiTongAuditDataQuery" property="launchDate"
                                                    domainInstance="${suiYiTongAuditDataQueryInstance }" textAlign="center"/>
                        <domainSearchResult:rowData type="text" domain="suiYiTongAuditDataQuery" property="updateDate"
                                                    domainInstance="${suiYiTongAuditDataQueryInstance }" textAlign="center"/>
                        <domainSearchResult:rowData type="inList" domain="suiYiTongAuditDataQuery" property="currentStep"
                                                    domainInstance="${suiYiTongAuditDataQueryInstance }" textAlign="center"/>
                        <td class="tk-actions" align="left">
                            <g:link data-toggle="modal" data-target="#sample_modal2" controller="suiYiTongAuditDataQuery" action="showAgentSuiYiTongDetail" params="[taskCode:suiYiTongAuditDataQueryInstance?.taskCode,currentStep:suiYiTongAuditDataQueryInstance?.currentStep,flowVersion:suiYiTongAuditDataQueryInstance?.flowVersion]"><g:message
                                    code="suiYiTongAuditDataQueryInstance.button.show.label"/></g:link>
                            <g:if test="${suiYiTongAuditDataQueryInstance?.currentStep == '2'}">
                            <g:link data-toggle="modal" data-target="#sample_modal1" controller="suiYiTongAuditDataQuery" action="showAgentSuiYiTongDetail" params="[taskCode:suiYiTongAuditDataQueryInstance?.taskCode,currentStep:suiYiTongAuditDataQueryInstance?.currentStep,flag:'1',flowVersion:suiYiTongAuditDataQueryInstance?.flowVersion]"><g:message
                                    code="suiYiTongAuditDataQueryInstance.button.audit.label"/></g:link>
                            </g:if>
                            <g:if test="${suiYiTongAuditDataQueryInstance?.currentStep == '-5' || suiYiTongAuditDataQueryInstance?.currentStep == '-4' || suiYiTongAuditDataQueryInstance?.currentStep == '-1' || suiYiTongAuditDataQueryInstance?.currentStep == '-3' || suiYiTongAuditDataQueryInstance?.currentStep == '-2'}">
                            <g:link data-toggle="modal" data-target="#sample_modal1" controller="suiYiTongAuditDataQuery" action="showAgentSuiYiTongDetail" params="[taskCode:suiYiTongAuditDataQueryInstance?.taskCode,currentStep:suiYiTongAuditDataQueryInstance?.currentStep,flag:'3',flowVersion:suiYiTongAuditDataQueryInstance?.flowVersion]"><g:message
                                    code="suiYiTongAuditDataQueryInstance.button.audit.label"/></g:link>
                            </g:if>
                            %{--<g:if test="${suiYiTongAuditDataQueryInstance?.currentStep == '-2'}">--}%
                                %{--<g:link data-toggle="modal" data-target="#sample_modal1" controller="suiYiTongAuditDataQuery" action="showAgentSuiYiTongDetail" params="[taskCode:suiYiTongAuditDataQueryInstance?.taskCode,currentStep:suiYiTongAuditDataQueryInstance?.currentStep,flag:'4',flowVersion:suiYiTongAuditDataQueryInstance?.flowVersion]"><g:message--}%
                                        %{--code="suiYiTongAuditDataQueryInstance.button.audit.label"/></g:link>--}%
                            %{--</g:if>--}%
                        <g:if test="${suiYiTongAuditDataQueryInstance?.currentStep == '9'}">%{--退款确认--}%
                            <g:link data-toggle="modal" data-target="#sample_modal1" controller="suiYiTongAuditDataQuery" action="showAgentSuiYiTongDetail" params="[taskCode:suiYiTongAuditDataQueryInstance?.taskCode,currentStep:suiYiTongAuditDataQueryInstance?.currentStep,flag:'2',flowVersion:suiYiTongAuditDataQueryInstance?.flowVersion]">
                                <g:message code="suiYiTongAuditDataQueryInstance.button.audit.label"/>
                            </g:link>
                        </g:if>
                        </td>
                    </tr></g:each>
                </tbody>

            </table>
        </div>
        <g:if test="${suiYiTongAuditDataQueryInstanceCount != -1}">
            <component:paginate total="${suiYiTongAuditDataQueryInstanceCount }"/>
        </g:if>
    %{--详情--}%
        <component:modals id="sample_modal" title="正在加载……" width="full"/>
    %{--查看--}%
        <component:modals id="sample_modal2" title="正在加载……" width="full"/>
    %{--审核--}%
        <component:modals id="sample_modal1" title="正在加载……" width="full"/>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/products/suiYiTongAuditDataQuery.js"/>
</content>