%{--<component:portlet cssClass="scaffold-searchResult">--}%
<component:portlet cssClass="scaffold-search hide">
    <portlet:body withForm="true">
        <form:form id="merchantTerminalManagementSearchForm" controller="merchantTerminalManagement" action="applyUnits"
                   name="scaffold-search-merchantTerminalManagement">
            <form:scaffoldSearchProperties/>
            <form:body>
                <formCommon:hiddenField name="merchantCode" value="${params.merchantCode}"/>
                <formCommon:hiddenField name="insideMerchantCode" value="${params.insideMerchantCode}"/>
                <formCommon:hiddenField name="belongtoOrganization" value="${params.belongtoOrganization}"/>
                <formCommon:hiddenField name="belongtoOrganizationName" value="${params.belongtoOrganizationName}"/>
                <formCommon:hiddenField name="salesManCode" value="${params.salesManCode}"/>
            </form:body>
        </form:form>
    </portlet:body>
</component:portlet>

<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'merchantTerminalManagement.applyInformationList.label', args: message.domain(domain: 'merchantTerminalManagement'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="installResult"></div>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>

                    <domainSearchResult:header domain="merchantTerminalManagement" property="communicationWay"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="posType"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="posQuantity"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="whetherPasswordKeyboard"/>

                    <th><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="merchantTerminalManagementInstance"
                               in="${merchantTerminalManagementInstanceList }">
                    <tr>
                        <td><g:message
                                code="merchantTerminalManagement.communicationWay.${merchantTerminalManagementInstance.communicationWay}"/></td>
                        %{--<domainSearchResult:rowData type="text" domain="merchantTerminalManagement" property="communicationWay"--}%
                                                    %{--domainInstance="${merchantTerminalManagementInstance }"/>--}%
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantTerminalManagement" property="posType"
                                                    domainInstance="${merchantTerminalManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantTerminalManagement" property="posQuantity"
                                                    domainInstance="${merchantTerminalManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantTerminalManagement" property="whetherPasswordKeyboard"
                                                    domainInstance="${merchantTerminalManagementInstance }"/>


                        <td class="tk-actions">

                            <g:link controller="merchantTerminalManagement" data-toggle="modal" data-target="#install" action="install" params="[merchantCode:merchantTerminalManagementInstance?.merchantCode,
                            insideMerchantCode:merchantTerminalManagementInstance?.insideMerchantCode,
                            belongtoOrganization:merchantTerminalManagementInstance?.belongtoOrganization,
                            belongtoOrganizationName:merchantTerminalManagementInstance?.belongtoOrganizationName,
                            salesManCode:merchantTerminalManagementInstance?.salesManCode]"><g:message
                            code="merchantTerminalManagement.install.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <component:paginate total="${merchantTerminalManagementInstanceCount }"/>
        <component:modals id="install" title="${message(code: 'merchantTerminalManagement.install.label')}" width="full"/>
    </portlet:body>
</component:portlet>
<div class="text-center">
    <button id="btn" class="btn btn-close" value="${message(code: 'merchantTerminalManagement.back.label')}">${message(code: 'merchantTerminalManagement.back.label')}
    </button>
</div>
<content tag="takin-footer">
    <g:javascript>
        // 后退
        $(function() {
            $("#btn").on('click', function () {
                window.location.href="/merchantTerminalManagement/index";
            });
        });

        function bindpos(e){
            e.preventDefault();
            $("#installButton").attr("disabled", true);
            var merchantCode = $("input[name='merchantCode']").val();
            var insideMerchantCode = $("input[name='insideMerchantCode']").val();
            var q_posSerialNumber=[];
            $("input[name='q_posSerialNumber']").each(function(i,o){
                q_posSerialNumber.push($(o).val());
            });
            var q_communicationWay =[];
            $("select[name='q_communicationWay']").each(function(i,o){
                q_communicationWay.push($(o).val());
            });
            var q_factory = [];
            $("select[name='q_factory']").each(function(i,o){
                q_factory.push($(o).val());
            });
            var q_terminalModel = [];
            $("select[name='q_terminalModel']").each(function(i,o){
                q_terminalModel.push($(o).val());
            });
            var q_keyboardSerialNumber = [];
            $("input[name='q_keyboardSerialNumber']").each(function(i,o){
                q_keyboardSerialNumber.push($(o).val());
            });
            var q_passwordKeyboardModel = [];
            $("select[name='q_passwordKeyboardModel']").each(function(i,o){
                q_passwordKeyboardModel.push($(o).val());
            });
            var q_simNumber = [];
            $("input[name='q_simNumber']").each(function(i,o){
                q_simNumber.push($(o).val());
            });
            var q_whetherIndependentProcurement = [];
            $("select[name='q_whetherIndependentProcurement']").each(function(i,o){
                q_whetherIndependentProcurement.push($(o).val());
            });
            $.ajax({
                url: "/merchantTerminalManagement/bindPos",
                data: {
                    merchantCode: merchantCode,
                    insideMerchantCode: insideMerchantCode,
                    q_posSerialNumber: q_posSerialNumber,
                    q_communicationWay:q_communicationWay,
                    q_factory:q_factory,
                    q_terminalModel:q_terminalModel,
                    q_keyboardSerialNumber:q_keyboardSerialNumber,
                    q_passwordKeyboardModel:q_passwordKeyboardModel,
                    q_simNumber:q_simNumber,
                    q_whetherIndependentProcurement:q_whetherIndependentProcurement
                },
                success: function (data) {
                    $('#install').modal('hide');
                    $('.installResult').append(data);
                    $('#installResultModal').modal('show');
                    $("#installButton").attr("disabled", false);
                }
            });
        }


        // function bindpos(e){
        //     e.preventDefault();
        //     var merchantCode = $("input[name='merchantCode']").val();
        //     var insideMerchantCode = $("input[name='insideMerchantCode']").val();
        //     var q_posSerialNumber = $("input[name='q_posSerialNumber']").val();
        //     var q_communicationWay = $("select[name='q_communicationWay']").val();
        //     var q_factory = $("select[name='q_factory']").val();
        //     var q_terminalModel = $("select[name='q_terminalModel']").val();
        //     var q_keyboardSerialNumber = $("input[name='q_keyboardSerialNumber']").val();
        //     var q_passwordKeyboardModel = $("select[name='q_passwordKeyboardModel']").val();
        //     var q_simNumber = $("input[name='q_simNumber']").val();
        //     var q_whetherIndependentProcurement = $("select[name='q_whetherIndependentProcurement']").val();
        //
        //     $.ajax({
        //         url: "/merchantTerminalManagement/bindPos",
        //         data: {
        //             merchantCode: merchantCode,
        //             insideMerchantCode: insideMerchantCode,
        //             q_posSerialNumber: q_posSerialNumber,
        //             q_communicationWay:q_communicationWay,
        //             q_factory:q_factory,
        //             q_terminalModel:q_terminalModel,
        //             q_keyboardSerialNumber:q_keyboardSerialNumber,
        //             q_passwordKeyboardModel:q_passwordKeyboardModel,
        //             q_simNumber:q_simNumber,
        //             q_whetherIndependentProcurement:q_whetherIndependentProcurement
        //         },
        //         success: function (data) {
        //             $('#install').modal('hide');
        //             $('.installResult').append(data);
        //             $('#installResultModal').modal('show');
        //         }
        //     });
        // }
    </g:javascript>
</content>