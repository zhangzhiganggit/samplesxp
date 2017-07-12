
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'handBrushMerchantManagement'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
    %{--begin 自定义模态窗口--}%
        <input type="hidden" id="level" value="${level}"/>
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
                <g:link controller="handBrushMerchantManagement" action="edit"
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
                        <component:checkbox title="" cssClass="group-checkable" property="merchantCode"/><g:message code="handBrushMerchantManagement.checkAll.label"></g:message>
                    </th>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="businessName" width="90"/>
                %{--    <domainSearchResult:header domain="handBrushMerchantManagement" property="businessWay"/>--}%
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="mobileNo" width="80"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="merchantSource" width="60"/>

                    <domainSearchResult:header domain="handBrushMerchantManagement" property="belongToOrg"  popoverMessage="${message(code:"merchantManagement.belongToOrgResult.show-pop.label")}" width="120"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="directlyOrg" width="120"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="salesMan" width="60"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="localarea" width="90"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="createDate" width="60"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="realnameAuthenticationStatus" width="90"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="rate" width="80"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="qrcodeRat" width="80"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="merchantGrade" width="60"/>

                    <domainSearchResult:header domain="handBrushMerchantManagement" property="status" width="40"/>


                    <th width="105"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="handBrushMerchantManagementInstance"
                               in="${handBrushMerchantManagementInstanceList }">
                    <tr>
                        <td align="center">
                            <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                <input type="checkbox" class="checkboxes" name="merchantCode" value="${handBrushMerchantManagementInstance.insideMerchantCode}">
                                <span></span>
                            </label>
                        </td>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="handBrushMerchantManagement" property="merchantCode"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="handBrushMerchantManagement" property="businessName"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
%{--                        <domainSearchResult:rowData textAlign="left" type="text" domain="handBrushMerchantManagement" property="businessWay"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>--}%
                        <domainSearchResult:rowData textAlign="center" type="text" domain="handBrushMerchantManagement" property="mobileNo"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="handBrushMerchantManagement" property="merchantSource"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>

                        <domainSearchResult:rowData textAlign="left" type="text" domain="handBrushMerchantManagement" property="belongToOrg"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="handBrushMerchantManagement" property="directlyOrg"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="handBrushMerchantManagement" property="salesMan"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="handBrushMerchantManagement" property="localarea"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="handBrushMerchantManagement" property="createDate"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="handBrushMerchantManagement" property="realnameAuthenticationStatus"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="handBrushMerchantManagement" property="rate"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="right" type="text" domain="handBrushMerchantManagement" property="qrcodeRat"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="handBrushMerchantManagement" property="merchantGrade"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>

                        <domainSearchResult:rowData textAlign="center" type="text" domain="handBrushMerchantManagement" property="status"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>

                        <td class="tk-actions" align="left">
                            <g:link data-toggle="modal" data-target="#sample_modal1" controller="handBrushMerchantManagement" action="show" id="${handBrushMerchantManagementInstance?.insideMerchantCode}"><g:message
                                    code="default.button.show.label"/></g:link>
                            <g:if test="${level=='1'}">
                                <g:link data-toggle="modal" data-target="#sample_modal3" controller="handBrushMerchantManagement" action="rateEdit" params='[insideMerchantCode:"${handBrushMerchantManagementInstance?.insideMerchantCode}"]'><span class="clickShowList">费率修改</span></g:link>
                                <%--判断是否显示手刷解绑--%>
                                <g:if test="${handBrushMerchantManagementInstance?.isFlag==1}">
                                     <g:link data-toggle="modal" data-target="#sample_modal4" controller="handBrushMerchantManagement" action="unbindDetails" params='[insideMerchantCode:"${handBrushMerchantManagementInstance?.insideMerchantCode}"]'><span class="clickShowList">解绑</span></g:link>
                                </g:if>
                                    %{--code="default.button.edit.label"/></g:link>--}%
                            </g:if>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${handBrushMerchantManagementInstanceCount != -1}">
        <component:paginate total="${handBrushMerchantManagementInstanceCount }"/>
        </g:if>
    %{--手刷商户详情--}%
        <component:modals id="sample_modal1" title="查看详情" width="full"/>
    %{--批量修改--}%
        <component:modals id="sample_modal2" title="批量修改" width="lg"/>
    %{--费率修改--}%
        <component:modals id="sample_modal3" title="" width="lg"/>
    %{--手刷解绑--}%
        <component:modals id="sample_modal4" title="" width="lg"/>
    </portlet:body>
</component:portlet>

