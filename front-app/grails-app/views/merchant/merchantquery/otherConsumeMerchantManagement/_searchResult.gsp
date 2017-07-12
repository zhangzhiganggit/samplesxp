
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'otherConsumeMerchantManagement'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
    %{--begin 自定义模态窗口--}%

        <div class="modal modal-scroll fade" id="myModal" tabindex="-1" role="basic" aria-hidden="true" width="full">
            <div class="modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">批量修改归属</h4>
                    </div>

                    <div class="modal-body"></div>

                    <div class="modal-footer">
                        %{-- <button type="button" class="btn default" data-dismiss="modal">确定划拨</button>--}%
                        %{-- <button type="button" class="btn blue"><g:message code="default.button.confirm.label"/></button>--}%
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <div class="table-toolbar">
            <div class="col-md-12">
                <div class="pull-right">
                 <g:link controller="otherConsumeMerchantManagement" action="edit"
                        class="btn btn-batch-belong batchEditor" data-modal-target="myModal">批量修改归属</g:link>
                    %{--<component:modals id="myModal" title="批量修改归属" width="lg"/>--}%
                </div>
            </div>
        </div>
        <div class="table-scrollable text-nowrap">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    <th class="left" width="65">
                        %{--<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">--}%
                            %{--<input type="checkbox" class="group-checkable" property="merchantCode">--}%
                            %{--<span></span>--}%
                        %{--</label>--}%
                        <component:checkbox title="" cssClass="group-checkable" property="merchantCode"/><g:message code="otherConsumeMerchantManagement.checkAll.label"></g:message>
                    </th>
                    
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="merchantRegistName" width="120"/>
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="mobileNo" width="80"/>
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="businessClassify" width="60"/>
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="belongToOrg" width="120" popoverMessage="${message(code:"merchantManagement.belongToOrgResult.show-pop.label")}" />
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="directlyOrg" width="120"/>
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="salesMan" width="60"/>
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="createDate" width="80"/>
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="status" width="60"/>
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="doBusinessQualificationsAuthenticationStatus" width="120"/>
                    <domainSearchResult:header domain="otherConsumeMerchantManagement" property="rate" width="60"/>


                    <th width="135"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="otherConsumeMerchantManagementInstance"
                               in="${otherConsumeMerchantManagementInstanceList }">
                    <tr>
                        <td align="center">
                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="checkboxes" name="merchantCode" value="${otherConsumeMerchantManagementInstance.insideMerchantCode}">
                                <span></span>
                            </label>
                        </td>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeMerchantManagement" property="merchantCode"
                                                domainInstance="${otherConsumeMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeMerchantManagement" property="merchantRegistName"
                                                domainInstance="${otherConsumeMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeMerchantManagement" property="mobileNo"
                                                domainInstance="${otherConsumeMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeMerchantManagement" property="businessClassify"
                                                domainInstance="${otherConsumeMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeMerchantManagement" property="belongToOrg"
                                                domainInstance="${otherConsumeMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeMerchantManagement" property="directlyOrg"
                                                domainInstance="${otherConsumeMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeMerchantManagement" property="salesMan"
                                                domainInstance="${otherConsumeMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeMerchantManagement" property="createDate"
                                                domainInstance="${otherConsumeMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeMerchantManagement" property="status"
                                                domainInstance="${otherConsumeMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeMerchantManagement" property="doBusinessQualificationsAuthenticationStatus"
                                                domainInstance="${otherConsumeMerchantManagementInstance }"/>
                    <domainSearchResult:rowData textAlign="right" type="text" domain="otherConsumeMerchantManagement" property="rate"
                                                domainInstance="${otherConsumeMerchantManagementInstance }"/>


                        <td class="tk-actions" align="left">
                            <g:link data-toggle="modal" data-target="#sample_modal1" controller="otherConsumeMerchantManagement" action="show" id="${otherConsumeMerchantManagementInstance?.insideMerchantCode}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:if test="${otherConsumeMerchantManagementInstance?.currentLeverNo =='1'}">
                                <g:link data-toggle="modal" data-target="#sample_modal3" controller="otherConsumeMerchantManagement" action="updataRate" id="${otherConsumeMerchantManagementInstance?.insideMerchantCode}"><g:message
                                        code="otherConsumeMerchantManagement.updateRate.button.label"/></g:link>

                                <g:link data-toggle="modal" data-target="#sample_modal4" controller="otherConsumeMerchantManagement" action="queryRateLog" id="${otherConsumeMerchantManagementInstance?.insideMerchantCode}"><g:message
                                        code="otherConsumeMerchantManagement.queryRateLog.button.label"/></g:link>
                            </g:if>
                            %{--<g:link controller="otherConsumeMerchantManagement" action="edit" id="${otherConsumeMerchantManagementInstance?.id}"><g:message--}%
                                    %{--code="default.button.edit.label"/></g:link>--}%
                            %{--<g:link controller="otherConsumeMerchantManagement" action="" id="${otherConsumeMerchantManagementInstance?.id}"><g:message--}%
                            %{--/> 修改费率</g:link>--}%
                            %{--<g:link controller="otherConsumeMerchantManagement" action="" id="${otherConsumeMerchantManagementInstance?.id}"><g:message--}%
                            %{--/>修改归属</g:link>--}%
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${otherConsumeMerchantManagementInstanceCount!= -1}">
        <component:paginate total="${otherConsumeMerchantManagementInstanceCount }"/>

      </g:if>
    %{--其他商户详情--}%
        <component:modals id="sample_modal1" title="查看详情" width="lg"/>
    %{--批量修改--}%
        <component:modals id="sample_modal2" title="批量修改" width="lg"/>
    %{--修改费率--}%
        <component:modals id="sample_modal3" title="修改费率" width="md"/>
    %{--操作记录--}%
        <component:modals id="sample_modal4" title="操作记录" width="lg"/>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="merchant/merchant-query.js"/>
    <asset:javascript src="userNameList.js"/>
    <g:javascript>
        $(function(){
            initLoading();
            SspMerchantQuery.init();
            $("input").keyup(function(){this.value=this.value.replace(/\s/g,'')});
            $("input[name='q_mobileNo']").keyup(function(){this.value=this.value.replace(/\D/g,'');this.maxLength=11;});
        });
    </g:javascript>
</content>