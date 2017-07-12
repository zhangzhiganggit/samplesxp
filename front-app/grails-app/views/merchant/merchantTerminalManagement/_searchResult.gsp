<component:portlet cssClass="scaffold-searchResult">
    <portlet:title
            title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'merchantTerminalManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body>
        <div class="installResult"></div>
        <div class="changePosResult"></div>
        <div class="ubBindPosResult"></div>
        <div class="table-scrollable">
            %{--<table class="table table-striped table-bordered table-hover dataTable no-footer text-nowrap">--}%
            <table class="table table-striped table-bordered table-hover dataTable no-footer text-nowrap table-layout-fixed">
                <thead>
                <tr>

                    <domainSearchResult:header domain="merchantTerminalManagement" property="merchantCode" width="120"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="registName" width="120"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="merchantSalesSlipName" width="120"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="legalPersonName" width="80"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="doBusinessAddress" width="200"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="belongtoOrganizationName" width="120" popoverMessage="${message(code:"merchantManagement.belongToOrgResult.show-pop.label")}"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="salesMan" width="80"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="applyMachinesQuantity" width="60"/>
                    <domainSearchResult:header domain="merchantTerminalManagement" property="installMachinesQuantity" width="80"/>

                    <th width="140"><g:message code="default.actions.label"/></th>
                </tr>
                </thead>
                <tbody><g:each var="merchantTerminalManagementInstance"
                               in="${merchantTerminalManagementInstanceList}">
                    <tr>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="merchantTerminalManagement" property="merchantCode"
                                                    domainInstance="${merchantTerminalManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantTerminalManagement" property="registName"
                                                    domainInstance="${merchantTerminalManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantTerminalManagement"
                                                    property="merchantSalesSlipName"
                                                    domainInstance="${merchantTerminalManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantTerminalManagement"
                                                    property="legalPersonName"
                                                    domainInstance="${merchantTerminalManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantTerminalManagement"
                                                    property="doBusinessAddress"
                                                    domainInstance="${merchantTerminalManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantTerminalManagement"
                                                    property="belongtoOrganizationName"
                                                    domainInstance="${merchantTerminalManagementInstance}"/>
                        <domainSearchResult:rowData textAlign="left" type="text" domain="merchantTerminalManagement"
                                                    property="salesMan"
                                                    domainInstance="${merchantTerminalManagementInstance}"/>
                        <td align="right">
                            <g:if test="${merchantTerminalManagementInstance.applyMachinesQuantity > 0}">
                                <g:link controller="merchantTerminalManagement" action="applyUnits"
                                        params="[merchantCode            : merchantTerminalManagementInstance?.merchantCode,
                                                 insideMerchantCode      : merchantTerminalManagementInstance?.insideMerchantCode,
                                                 belongtoOrganization    : merchantTerminalManagementInstance?.belongtoOrganization,
                                                 belongtoOrganizationName: merchantTerminalManagementInstance?.belongtoOrganizationName,
                                                 salesManCode:merchantTerminalManagementInstance?.salesManCode]">${merchantTerminalManagementInstance.applyMachinesQuantity}</g:link>
                            </g:if>
                            <g:else>
                                ${merchantTerminalManagementInstance.applyMachinesQuantity}
                            </g:else>
                        </td>
                        <td align="right">
                            <g:if test="${merchantTerminalManagementInstance.installMachinesQuantity > 0}">
                                <g:link controller="merchantTerminalManagement" action="installedUnits"
                                        params="[merchantCode            : merchantTerminalManagementInstance?.merchantCode,
                                                 insideMerchantCode      : merchantTerminalManagementInstance?.insideMerchantCode,
                                                 belongtoOrganization    : merchantTerminalManagementInstance?.belongtoOrganization,
                                                 belongtoOrganizationName: merchantTerminalManagementInstance?.belongtoOrganizationName,
                                                 salesManCode:merchantTerminalManagementInstance?.salesManCode]">${merchantTerminalManagementInstance.installMachinesQuantity}</g:link>
                            </g:if>
                            <g:else>
                                ${merchantTerminalManagementInstance.installMachinesQuantity}
                            </g:else>
                        </td>
                        <td class="tk-actions" align="left">
                            <g:if test="${merchantTerminalManagementInstance.applyMachinesQuantity != 0 && merchantTerminalManagementInstance.applyMachinesQuantity > merchantTerminalManagementInstance.installMachinesQuantity}">

                                <g:link data-toggle="modal" data-target="#install" controller="merchantTerminalManagement"
                                        action="install"
                                        params="[merchantCode            : merchantTerminalManagementInstance?.merchantCode,
                                                 insideMerchantCode      : merchantTerminalManagementInstance?.insideMerchantCode,
                                                 belongtoOrganization    : merchantTerminalManagementInstance?.belongtoOrganization,
                                                 belongtoOrganizationName: merchantTerminalManagementInstance?.belongtoOrganizationName,
                                                 salesManCode:merchantTerminalManagementInstance?.salesManCode]">
                                    <g:message
                                            code="merchantTerminalManagement.install.label"/></g:link>
                            </g:if>
                            <g:if test="${merchantTerminalManagementInstance.installMachinesQuantity > 0 && isAdmin == true && currentLeverNo == "1"}">
                                %{--<sec:access expression="hasRole('ROLE_AUTH_MERCHANT_TERMINALE_UPDATE')">--}%
                                    <g:link data-toggle="modal" data-target="#replace" controller="merchantTerminalManagement"
                                            action="replace"
                                            params="[merchantCode      : merchantTerminalManagementInstance?.merchantCode,
                                                     insideMerchantCode: merchantTerminalManagementInstance?.insideMerchantCode,
                                                     belongtoOrganization    : merchantTerminalManagementInstance?.belongtoOrganization,
                                                     oldPosSerialNumber: '',salesManCode:merchantTerminalManagementInstance?.salesManCode]"><g:message
                                            code="merchantTerminalManagement.replace.label"/></g:link>
                                %{--</sec:access>--}%
                            </g:if>
                            <g:if test="${merchantTerminalManagementInstance.installMachinesQuantity > 0 && isAdmin == true && currentLeverNo == "1"}">
                                %{--<sec:access expression="hasRole('ROLE_AUTH_MERCHANT_TERMINALE_DELETE')">--}%
                                    <g:link data-toggle="modal" data-target="#remove" controller="merchantTerminalManagement"
                                            action="remove"
                                            params="[merchantCode      : merchantTerminalManagementInstance?.merchantCode,
                                                     insideMerchantCode: merchantTerminalManagementInstance?.insideMerchantCode,
                                                     oldPosSerialNumber: '']"><g:message
                                            code="merchantTerminalManagement.remove.label"/></g:link>
                                %{--</sec:access>--}%
                            </g:if>
                            <g:link data-toggle="modal" data-target="#printWorkOrder"
                                    controller="merchantTerminalManagement" action="printWorkOrder"
                                    params="[merchantCode      : merchantTerminalManagementInstance?.merchantCode,
                                             insideMerchantCode: merchantTerminalManagementInstance?.insideMerchantCode]"><g:message
                                    code="merchantTerminalManagement.printWorkOrder.label"/></g:link>
                        </td>
                    </tr></g:each>
                </tbody>
            </table>
        </div>
        <g:if test="${merchantTerminalManagementInstanceCount != -1}">
            <component:paginate total="${merchantTerminalManagementInstanceCount}"/>
        </g:if>

    %{--<component:modals id="sampleUpload" title="${message(code: 'default.uploadFile.title.label')}" width="content">--}%
    %{--<component:fileupload controller="demo" action="upload"/>--}%
    %{--</component:modals>--}%
    </portlet:body>
</component:portlet>
<component:modals id="install" title="${message(code: 'merchantTerminalManagement.install.label')}"
                  width="full"/>
<component:modals id="replace" title="${message(code: 'merchantTerminalManagement.replace.label')}"
                  width="full"/>
<component:modals id="remove" title="${message(code: 'merchantTerminalManagement.remove.label')}"
                  width="full"/>
<component:modals id="printWorkOrder" title="${message(code: 'merchantTerminalManagement.printWorkOrder.label')}"
                  width="full"/>

<asset:stylesheet src="global/plugins/bootstro/css/bootstro.css"/>

<content tag="takin-footer">
    <asset:javascript src="global/plugins/bootstro/js/bootstro.js"/>
    <g:javascript>
        $(function () {
            $("input").keyup(function () {
                this.value=this.value.replace(/\s/g,'');
            });

            $("#orgInput").bind('change',function () {
                var orgNo = $("#orgInputId").val();
                var currentEmpNo= $("#salesMan").val();
                getOrgUserNameList(orgNo,currentEmpNo);
            }).change();

            $("#q_salesMan").change(function(){
                $("#salesMan").val(this.value);
            });

            $(".btn-modify").click(function (e) {
                e.preventDefault();
                $("input:text").not("[readonly]").val("");
                $("select").prop('selectedIndex', 0);
                $(".select2-hidden-accessible").val("").trigger("change");
                $("#orgInputId").val($("#hiddenCurrentOrgNo").val());
                $("#orgInput").val($("#hiddenCurrentOrgName").val());
            });
        });


        function bindpos(e){
            e.preventDefault();
            $("#installButton").attr("disabled", true);
            // var mainForm = $("#installForm");
            // console.log(mainForm);
            // if (!mainForm.valid()) {
            //     console.log("===========校验未通过.");
            //     $("#installButton").attr("disabled", false);
            //     return false;
            // } else {
            //     console.log("===========校验通过.");
            // }
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

        function posSerialNumberChanged(node) {
            alert(asd);
            var parent = $(node).parents("div.info");
            var posSerialNumber = parent.find("input[name='q_posSerialNumber']").val();
            if ("" != posSerialNumber) {
                $.ajax({
                    url: "/merchantTerminalManagement/getPosInfo",
                    data: {posSerialNumber: posSerialNumber},
                    async: false,
                    success: function (data) {
                        if ('' == data || null == data || data.length == 0) {
                            bootbox.alert("该序列号无信息，请确认序列号是否正确或已被绑定。")
                        } else if (data.length > 1) {
                            bootbox.alert("该序列号有多条信息，请手动设置通讯方式、厂商和终端型号。");
                        } else {
                            resetDataValue(parent);
                            parent.find("select[name='q_communicationWay']").val(data[0].communicationWay);
                            parent.find("select[name='q_factory']").val(data[0].factory).change();
                            parent.find("select[name='q_terminalModel']").val(data[0].terminalModel).change();
                        }
                    }
                });
            }
        }

        //获取当前机构下业务员
        function getOrgUserNameList(orgNo,currentEmp){
            $.ajax({
                url: '/cardManagement/getOrgUserNameList',
                data:{
                    orgNo:orgNo
                }
            }).done(function(data) {
                if (data != "") {
                    $('#q_salesMan').empty();
                    var optionList = "";
                    if(currentEmp == ""){
                        optionList='<option value="" selected="selected" >--请选择--</option>';
                    }else{
                        optionList='<option value="" >--请选择--</option>';
                    }
                    for (var i = 0; i < data.length; i++) {
                        if(currentEmp != "" && currentEmp== data[i].userCode){
                            optionList += "<option selected='selected'  value='" + data[i].userCode + "'>" + data[i].userName + "</option>";
                        }else{
                            optionList += "<option  value='" + data[i].userCode + "'>" + data[i].userName + "</option>";
                        }
                    }
                    $("#q_salesMan").append(optionList);
                }
            });
        }


    </g:javascript>
</content>
