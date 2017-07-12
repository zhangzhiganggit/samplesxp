%{--<component:portlet cssClass="scaffold-searchResult">--}%
<component:portlet cssClass="scaffold-search hide">
    <portlet:body withForm="true">
        <form:form id="merchantTerminalManagementSearchForm" controller="merchantTerminalManagement" action="installedUnits"
                   name="scaffold-search-merchantTerminalManagement">
            <form:scaffoldSearchProperties/>
            <form:body>
                <formCommon:hiddenField name="merchantCode" value="${params.merchantCode}"/>
                <formCommon:hiddenField name="insideMerchantCode" value="${params.insideMerchantCode}"/>
                <formCommon:hiddenField name="belongtoOrganization" value="${params.belongtoOrganization}"/>
                <formCommon:hiddenField name="salesManCode" value="${params.salesManCode}"/>
                <formCommon:hiddenField name="belongtoOrganizationName" value="${params.belongtoOrganizationName}"/>
            </form:body>
        </form:form>
    </portlet:body>
</component:portlet>

<component:portlet cssClass="scaffold-searchResult">
<portlet:title title="${message(code: 'merchantTerminalManagement.merchantTerminalInformationList.label', args: message.domain(domain: 'merchantTerminalManagement'))}"
               iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="changePosResult"></div>
        <div class="ubBindPosResult"></div>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                    <tr>

                        <domainSearchResult:header domain="merchantTerminalManagement" property="terminalNumber"/>
                        <domainSearchResult:header domain="merchantTerminalManagement" property="oldPosSerialNumber"/>
                        <domainSearchResult:header domain="merchantTerminalManagement" property="communicationWay"/>
                        <domainSearchResult:header domain="merchantTerminalManagement" property="factory"/>
                        <domainSearchResult:header domain="merchantTerminalManagement" property="terminalModel"/>
                        <domainSearchResult:header domain="merchantTerminalManagement" property="keyboardSerialNumber"/>
                        <domainSearchResult:header domain="merchantTerminalManagement" property="passwordKeyboardModel"/>
                        <domainSearchResult:header domain="merchantTerminalManagement" property="simNumber"/>
                        <domainSearchResult:header domain="merchantTerminalManagement" property="whetherIndependentProcurement"/>
                        <th><g:message code="default.actions.label"/></th>
                    </tr>
                </thead>
                <tbody><g:each var="merchantTerminalManagementInstance"
                               in="${merchantTerminalManagementInstanceList }">
                    <tr>

                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantTerminalManagement" property="terminalNumber"
                        domainInstance="${merchantTerminalManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantTerminalManagement" property="posSerialNumber"
                        domainInstance="${merchantTerminalManagementInstance }"/>
                        <td><g:message
                            code="merchantTerminalManagement.communicationWay.${merchantTerminalManagementInstance.communicationWay}"/></td>
                        %{--<domainSearchResult:rowData type="text" domain="merchantTerminalManagement" property="communicationWay"--}%
                                                    %{--domainInstance="${merchantTerminalManagementInstance }"/>--}%
                         <domainSearchResult:rowData textAlign="center" type="text" domain="merchantTerminalManagement" property="factory"
                                                    domainInstance="${merchantTerminalManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantTerminalManagement" property="terminalModel"
                                                    domainInstance="${merchantTerminalManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantTerminalManagement" property="keyboardSerialNumber"
                                                    domainInstance="${merchantTerminalManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantTerminalManagement" property="passwordKeyboardModel"
                                                                domainInstance="${merchantTerminalManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantTerminalManagement" property="simNumber"
                                                                domainInstance="${merchantTerminalManagementInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantTerminalManagement" property="whetherIndependentProcurement"
                                                                domainInstance="${merchantTerminalManagementInstance }"/>

                        <td class="tk-actions">
                                <g:if test="${isAdmin == true && currentLeverNo=="1"}">
                                    %{--<sec:access expression="hasRole('ROLE_AUTH_MERCHANT_TERMINALE_UPDATE')">--}%
                                        <g:link controller="merchantTerminalManagement" data-toggle="modal" data-target="#replace" action="replace" params="[merchantCode:merchantTerminalManagementInstance?.merchantCode,
                                                                                                                  insideMerchantCode:merchantTerminalManagementInstance?.insideMerchantCode,
                                                                                                                  oldPosSerialNumber:merchantTerminalManagementInstance?.terminalNumber,
                                                                                                                  belongtoOrganization:merchantTerminalManagementInstance?.belongtoOrganization,
                                                                                                                  salesManCode:merchantTerminalManagementInstance?.salesManCode]"
                                        ><g:message
                                                code="merchantTerminalManagement.replace.label"/></g:link>
                                    %{--</sec:access>--}%
                                    %{--<sec:access expression="hasRole('ROLE_AUTH_MERCHANT_TERMINALE_DELETE')">--}%
                                        <g:link controller="merchantTerminalManagement" data-toggle="modal" data-target="#remove" action="remove" params="[merchantCode:merchantTerminalManagementInstance?.merchantCode,
                                                                                                             insideMerchantCode:merchantTerminalManagementInstance?.insideMerchantCode,
                                                                                                             oldPosSerialNumber:merchantTerminalManagementInstance?.terminalNumber,belongtoOrganization:merchantTerminalManagementInstance?.belongtoOrganization,
                                                                                                                                                                                   salesManCode:merchantTerminalManagementInstance?.salesManCode]"

                                        ><g:message
                                            code="merchantTerminalManagement.remove.label"/></g:link>
                                    %{--</sec:access>--}%
                                </g:if>

                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <component:paginate total="${merchantTerminalManagementInstanceCount }"/>
        <component:modals id="replace" title="${message(code: 'merchantTerminalManagement.replace.label')}" width="full"/>
        <component:modals id="remove" title="${message(code: 'merchantTerminalManagement.remove.label')}" width="full"/>
    </portlet:body>
</component:portlet>

<div class="text-center">
    <button id="btn" class="btn btn-close" value="${message(code: 'merchantTerminalManagement.back.label')}">${message(code: 'merchantTerminalManagement.back.label')}
    </button>
</div>
%{--</component:portlet>--}%
<content tag="takin-footer">
<g:javascript>
    // 后退
    $(function() {
        $("#btn").on('click', function () {
            window.location.href="/merchantTerminalManagement/index";
        })
    })
    function changePos(e){
        e.preventDefault();
        $("#replaceButton").attr("disabled", true);
        if( $("#oldPosSerialNumber").val() == "" ){
            bootbox.alert("请选择已安装的POS序列号!",function(){
                $("#replaceButton").attr("disabled", false);
            });
            return false;
        }
        var merchantCode = $("input[name='merchantCode']").val();
        var insideMerchantCode = $("input[name='insideMerchantCode']").val();
        var q_posSerialNumber = $("input[name='q_posSerialNumber']").val();
        var q_communicationWay = $("select[name='q_communicationWay']").val();
        var q_factory = $("select[name='q_factory']").val();
        var q_terminalModel = $("select[name='q_terminalModel']").val();
        var q_keyboardSerialNumber = $("input[name='q_keyboardSerialNumber']").val();
        var q_passwordKeyboardModel = $("select[name='q_passwordKeyboardModel']").val();
        var q_simNumber = $("input[name='q_simNumber']").val();
        var q_whetherIndependentProcurement = $("select[name='q_whetherIndependentProcurement']").val();
        var q_terminalNumber = $("input[name='q_terminalNumber']").val();
        var oldPosSerialNumberSubmit = $("input[name='oldPosSerialNumberSubmit']").val();
        var oldCommunicationWaySubmit = $("input[name='oldCommunicationWaySubmit']").val();

        var attSnSimOld = $("#oldSimNumber").val();
        var attSnKeyOld = $("#oldKeyboardSerialNumber").val();
        var trmSnOld = $("#oldPosSerialNumber").find('option:selected').html();
        var trmNoOld = $("#oldTerminalNumber").val();
        var modNmOld = $("#oldTerminalModel").val();

        $.ajax({
            url: "/merchantTerminalManagement/changePos",
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
                q_whetherIndependentProcurement:q_whetherIndependentProcurement,
                q_terminalNumber:q_terminalNumber,
                oldPosSerialNumberSubmit:oldPosSerialNumberSubmit,
                oldCommunicationWaySubmit:oldCommunicationWaySubmit,
                attSnSimOld:attSnSimOld,
                attSnKeyOld:attSnKeyOld,
                trmSnOld:trmSnOld,
                trmNoOld:trmNoOld,
                modNmOld:modNmOld
            },
            success: function (data) {
                $('#replace').modal('hide');
                // alert(data)
                $('.changePosResult').append(data);
                $('#replaceResultModal').modal('show');
                $("#replaceButton").attr("disabled", false);
            }
        });
    }

    function ubBindPos(e){
        e.preventDefault()
        $("#removeButton").attr("disabled", true);
        if( $("#oldPosSerialNumberRE").val() == "" ){
            bootbox.alert("请选择已安装的POS序列号!",function(){
                $("#removeButton").attr("disabled", false);
            });
            return false;
        }
        $("input[name='ifBalanceSet']").val("00");      //默认不进行余额结算
        var result = null;
        if( $("input[name='posListsBindedSize']").val() == 1){
            //最后一台机器
            result = balancePayLast($(this));
            var account = parseFloat(result.merchantAccount);//获取账户余额
            $("input[name='merchantAccount']").val(account);
            if(account >= 10.0){//如果账户余额大于等于10元
                $("input[name='ifBalanceSet']").val("01");//默认自动结算
            }else if(account <= 0.0){
                $("input[name='ifBalanceSet']").val("zero");
            }else{
                if(confirm("商户账户余额："+account+"元。请选择是否结算，点确定余额结算；点取消余额清零；"))
                {
                    $("input[name='ifBalanceSet']").val("01");
                }else{
                    $("input[name='ifBalanceSet']").val("-1");
                }
            }
        }else{
            result = balancePay($(this));
            if(result){
                if(confirm("是否进行撤机余额结算？")){
                    $("input[name='ifBalanceSet']").val("01");
                }
            }
        }
        var merchantCode = $("input[name='merchantCode']").val();
        var insideMerchantCode = $("input[name='insideMerchantCode']").val();
        var terminalNumber = $("input[name='oldTerminalNumberSubmit']").val();
        var communicationWay = $("input[name='oldCommunicationWaySubmit']").val();
        var posSerialNumber = $("input[name='oldPosSerialNumberSubmit']").val();
        var merchantAccount = $("input[name='merchantAccount']").val();
        var ifBalanceSet = $("input[name='ifBalanceSet']").val();

        var attSnSimOld = $("#oldSimNumber").val();
        var attSnKeyOld = $("#oldKeyboardSerialNumber").val();
        var trmSnOld = $("#oldPosSerialNumberRE").find('option:selected').html();
        var trmNoOld = $("#oldTerminalNumber").val();
        var modNmOld = $("#oldTerminalModel").val();

        $.ajax({
            url: "/merchantTerminalManagement/unbindPos",
            data: {merchantCode: merchantCode, insideMerchantCode: insideMerchantCode,
                terminalNumber: terminalNumber,
                communicationWay: communicationWay, posSerialNumber: posSerialNumber,
                merchantAccount: merchantAccount,
                ifBalanceSet: ifBalanceSet,
                attSnSimOld:attSnSimOld,
                attSnKeyOld:attSnKeyOld,
                trmSnOld:trmSnOld,
                trmNoOld:trmNoOld,
                modNmOld:modNmOld},
            async: false,
            success: function (data) {
                $('#remove').modal('hide');
                console.log(33)
                $('.ubBindPosResult').append(data);
                $('#removeResultModal').modal('show');
                $("#removeButton").attr("disabled", false);
            }});


    }
    //是否进行余额结算
    function balancePay(node){
        var posSerialNumber = $("input[name='oldPosSerialNumberSubmit']").val();
        var terminalNumber = $("input[name='oldTerminalNumberSubmit']").val();
        var insideMerchantCode = $("input[name='insideMerchantCode']").val();
        var rs = false;
        $.ajax({ url: "/merchantTerminalManagement/balancePay.do" ,
            data:{posSerialNumber:posSerialNumber,terminalNumber:terminalNumber,insideMerchantCode:insideMerchantCode,bindingPosQuantity:0},
            async:false,
            success: function(data){
                if(data.returnCode=='1'){
                    rs =  true;
                }
            }});
        return rs;
    }

    //最后一台机器解绑余额的结算操作
    function balancePayLast(node){
        var posSerialNumber = $("input[name='oldPosSerialNumberSubmit']").val();
        var terminalNumber = $("input[name='oldTerminalNumberSubmit']").val();
        var insideMerchantCode = $("input[name='insideMerchantCode']").val();
        $.ajax({ url: "/merchantTerminalManagement/balancePay.do" ,
            data:{posSerialNumber:posSerialNumber,terminalNumber:terminalNumber,insideMerchantCode:insideMerchantCode,bindingPosQuantity:0},
            async:false,
            success: function(data){
                result = data
            }});
        return result
    }
    </g:javascript>
</content>