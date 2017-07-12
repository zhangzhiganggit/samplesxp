
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'otherConsumeRate'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="table-toolbar">
            %{--即日付操作记录--}%
            %{--<component:modals id="sample_modal4" title="操作记录" width="lg"/>--}%
            %{--即日付修改--}%
            %{--<component:modals id="sample_modal5" title="修改" width="lg"/>--}%
            %{--开通即日付--}%
            %{--<component:modals id="sample_modal6" title="开通" width="lg"/>--}%
            <g:render template="/merchant/merchantquery/otherConsumeRate/batchOpenOrClose"></g:render>
            <g:render template="/merchant/merchantquery/otherConsumeRate/batchAlterRate"></g:render>
            <g:render template="/merchant/merchantquery/otherConsumeRate/batchAlterAmount"></g:render>
            <div class="batchOpenOrCloseResult"></div>
            <div class="btn-group pull-right" >
                %{--开通--}%
                <button class="btn btn-batch-on" id="otherOpen"><g:message code="otherConsumeRate.open.label"/></button>
                %{--关闭--}%
                <button class="btn btn-modify" id="otherClose"><g:message code="otherConsumeRate.close.label"/></button>
                %{--批量导入开通开通模态弹出--}%
                <button class="btn btn-batch-on" data-toggle="modal" onclick="toBatchOpenOrCloseModal()" data-target="#toBatchOpenOrCloseModal">&nbsp;&nbsp;&nbsp;&nbsp;<g:message code="otherConsumeRate.batchOpen.label"/></button>
                %{--下载模板--}%
                <component:download filePath="excelTemplate/otherConsumeRate.xlsx" class="btn btn-download"
                                    fileName="${message(code: 'otherConsumeRate.otherConsumeRateTemplate.label')}.xlsx"
                                    title="${message(code: 'otherConsumeRate.download.label')}" />
                %{--<button class="btn btn-download fileDownloadTag" data-toggle="modal" onclick="toAmountModal()" data-target="#batchAlterAmountModal"><g:message code="otherConsumeRate.download.label"/></button>--}%
            </div>
        </div>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr class="text-nowrap">
                    <th class="left" width="65">
                        %{--<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">--}%
                            %{--<input type="checkbox" class="group-checkable" property="insideMerchantCode">--}%
                            %{--<span></span>--}%
                        %{--</label>--}%
                        <component:checkbox title="" cssClass="group-checkable" property="insideMerchantCode"/><g:message code="otherConsumeMerchantManagement.checkAll.label"></g:message>
                    </th>
                    <domainSearchResult:header domain="otherConsumeRate" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="otherConsumeRate" property="receiptsName" width="120"/>
                    <domainSearchResult:header domain="otherConsumeRate" property="belongToOrg" width="120"/>
                    <domainSearchResult:header domain="otherConsumeRate" property="directlyOrg" width="120"/>
                    <domainSearchResult:header domain="otherConsumeRate" property="salesMan" width="60"/>
                    <domainSearchResult:header domain="otherConsumeRate" property="scanPayStatus" width="80"/>
                    <domainSearchResult:header domain="otherConsumeRate" property="scanRate" width="80"/>
                    %{--<domainSearchResult:header domain="otherConsumeRate" property="updateDate"/>--}%

                    <th width="100"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="otherConsumeRateInstance"
                               in="${otherConsumeRateInstanceList }">
                    <tr class="text-nowrap">
                        <td align="center">
                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="checkboxes" name="insideMerchantCode" mc="${otherConsumeRateInstance.merchantCode}"
                                       value="${otherConsumeRateInstance.insideMerchantCode}">
                                <span></span>
                            </label>
                        </td>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeRate" property="merchantCode"
                                                domainInstance="${otherConsumeRateInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeRate" property="receiptsName"
                                                domainInstance="${otherConsumeRateInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeRate" property="belongToOrg"
                                                domainInstance="${otherConsumeRateInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeRate" property="directlyOrg"
                                                domainInstance="${otherConsumeRateInstance }"/>
                    <domainSearchResult:rowData textAlign="left" type="text" domain="otherConsumeRate" property="salesMan"
                                                domainInstance="${otherConsumeRateInstance }"/>
                    <domainSearchResult:rowData textAlign="center" type="text" domain="otherConsumeRate" property="scanPayStatus"
                                                domainInstance="${otherConsumeRateInstance }"/>
                    <domainSearchResult:rowData textAlign="right" type="text" domain="otherConsumeRate" property="scanRate"
                                                domainInstance="${otherConsumeRateInstance }"/>

                        <td class="tk-actions" align="left">
                        <g:link data-toggle="modal" data-target="#sample_modal1" controller="otherConsumeRate" action="queryRateEdit" params='[insideMerchantCode:"${otherConsumeRateInstance?.insideMerchantCode}",receiptsName:"${otherConsumeRateInstance?.receiptsName}",scanRate:"${otherConsumeRateInstance?.scanRate}",merchantCode:"${otherConsumeRateInstance?.merchantCode}"]'><span class="clickShowList">费率修改</span></g:link>
                        <g:link data-toggle="modal" data-target="#sample_modal2" controller="otherConsumeRate" action="queryRateEditHistory" params='[insideMerchantCode:"${otherConsumeRateInstance?.insideMerchantCode}",merchantCode:"${otherConsumeRateInstance?.merchantCode}"]'><span class="clickShowList">操作记录</span></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${otherConsumeRateInstanceCount!= -1}">
            <component:paginate total="${otherConsumeRateInstanceCount }"/>
        </g:if>
    %{--费率修改--}%
        <component:modals id="sample_modal1" title="" width="md"/>
    %{--修改记录--}%
        <component:modals id="sample_modal2" title="" width="lg"/>
    </portlet:body>
</component:portlet>

<content tag="takin-footer">
    <asset:javascript src="userNameList.js"/>
    <asset:javascript src="merchant/merchantQuery/otherConsumeRate.js"/>
    <g:javascript>
        $(function(){
            //关闭按钮
            sumbitMerchantCode();
            $("#otherClose").bind('click',function () {

            });
            SspOtherConsumeRate.init();
        });
    </g:javascript>
</content>
