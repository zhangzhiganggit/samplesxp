
<component:portlet cssClass="scaffold-searchResult">
    <portlet:title title="${message(code: 'happyToSendDevice.searchResult.label', args: message.domain(domain: 'happyToSendDevice'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>

        <div class="table-toolbar">
            %{--新增欢乐送设备--}%
            <g:render template="/machines/happyToSendDevice/addHappyDevice"></g:render>
            %{--批量新增欢乐送设备--}%
            <g:render template="/machines/happyToSendDevice/batchAddHappyDevice"></g:render>
            <div class="addHappyDevice"></div>
            <div class="batchAddHappyDeviceModal"></div>
            <div class="batchAddDeviceResult"></div>
            <div class="btn-group pull-right">
                %{--新增欢乐送设备--}%
                <button class="btn btn-batch-on" onclick="toAddHappyDevice()"><g:message code="happyToSendDevice.addHappyDevice.label"/></button>
                %{--批量新增欢乐送设备--}%
                <button class="btn btn-batch-rate" onclick="toBatchAddHappyDevice()"><g:message code="happyToSendDevice.batchAddHappyDevice.label"/></button>
            </div>
        </div>


        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer table-layout-fixed">
                <thead>
                <tr>
                    
                    <domainSearchResult:header domain="happyToSendDevice" property="originalSerialNm" width="60"/>
                    <domainSearchResult:header domain="happyToSendDevice" property="belongtoOrgName" width="120"/>
                    <domainSearchResult:header domain="happyToSendDevice" property="directlyOrgName" width="120"/>
                    <domainSearchResult:header domain="happyToSendDevice" property="salesManName" width="80"/>
                    <domainSearchResult:header domain="happyToSendDevice" property="deviceStatus" width="60"/>
                    <domainSearchResult:header domain="happyToSendDevice" property="deviceType" width="80"/>
                    <domainSearchResult:header domain="happyToSendDevice" property="openDate" width="60"/>
                    <th width="30"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="happyToSendDeviceInstance"
                               in="${happyToSendDeviceInstanceList }">
                    <tr>
                    <domainSearchResult:rowData type="text" domain="happyToSendDevice" property="originalSerialNm" textAlign="center"
                                                domainInstance="${happyToSendDeviceInstance }"/>
                    <domainSearchResult:rowData type="text" domain="happyToSendDevice" property="belongtoOrgName" textAlign="left"
                                                domainInstance="${happyToSendDeviceInstance }"/>
                    <domainSearchResult:rowData type="text" domain="happyToSendDevice" property="directlyOrgName" textAlign="left"
                                                domainInstance="${happyToSendDeviceInstance }"/>
                    <domainSearchResult:rowData type="text" domain="happyToSendDevice" property="salesManName" textAlign="left"
                                                domainInstance="${happyToSendDeviceInstance }"/>
                    <domainSearchResult:rowData type="inList" domain="happyToSendDevice" property="deviceStatus" textAlign="center"
                                                domainInstance="${happyToSendDeviceInstance }"/>
                    <domainSearchResult:rowData type="inList" domain="happyToSendDevice" property="deviceType" textAlign="center"
                                                domainInstance="${happyToSendDeviceInstance }"/>
                    <domainSearchResult:rowData type="text" domain="happyToSendDevice" property="openDate" textAlign="center"
                                                domainInstance="${happyToSendDeviceInstance }"/>
                    %{--<domainSearchResult:rowData type="text" domain="happyToSendDevice" property="serialNumber"--}%
                                                %{--domainInstance="${happyToSendDeviceInstance }"/>--}%
                        <td class="tk-actions" align="center">
                            <g:link class="closeHappyDevice" serNm="${happyToSendDeviceInstance?.originalSerialNm}" fact="${happyToSendDeviceInstance?.factoryNo}"><g:message
                                    code="happyToSendDevice.close.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${happyToSendDeviceInstanceCount != -1}">
            <component:paginate total="${happyToSendDeviceInstanceCount }"/>
        </g:if>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/validateLength.js"/>
    <asset:javascript src="/products/orgTreeLinkAge.js"/>
    <asset:javascript src="/machines/happyToSendDevice.js"/>
    <g:javascript>
        $(function () {
            var currentEmpDom = $("#q_salesManNo");
            $("#orgInput").bind('change',function () {
                var orgNo = $("#orgInputId").val();
                var currentEmpNo= $("#reSalesManNo").val();
                getOrgUserNameList(orgNo,currentEmpNo,currentEmpDom);

            })
            $('#orgInput').trigger("change");

            // $("input[name='q_merchantCode']").attr('maxlength',15);
            // $("input[name='q_receiptsname']").attr('maxlength',20);
            // $("input[name='q_merchantCode']").keyup(function () {
            //     this.value=this.value.replace(/[^+\d]/g,'');
            // });

            // $("input[name='q_businessName']").keyup(function(){
            //     this.value=this.value.replace(/\s/g,'');
            //     WidthCheck(this, 40)
            // })

        });
        SspHappyToDevice.init();
    </g:javascript>
</content>
