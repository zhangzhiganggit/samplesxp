<%@ page import="com.suixingpay.ssp.front.merchant.MerchantTerminalManagement" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title"><g:message code="merchantTerminalManagement.install.label"/></h4>
</div>

<div class="modal-body">
    <component:portlet>
        <portlet:title
                title="${message(code: 'merchantTerminalManagement.merchantInformation.label', args: message.domain(domain: 'merchantTerminalManagement'))}"/>
        <portlet:body withForm="true">
            <form:form action="index">
                <form:body>
                    <formCommon:hiddenField name="id" value="${merchantTerminalManagementInstance?.id}"/>
                    <formCommon:hiddenField name="insideMerchantCode"
                                            value="${merchantTerminalManagementInstance?.insideMerchantCode}"/>
                    <formCommon:hiddenField name="belongtoOrganization" id="belongtoOrganizationIns"
                                            value="${merchantTerminalManagementInstance?.belongtoOrganization}"/>
                    <formCommon:hiddenField name="organizationCode"
                                            value="${merchantTerminalManagementInstance?.organizationCode}"/>
                    <formCommon:hiddenField name="salesManCode" id="salesManCodeIns"
                                            value="${merchantTerminalManagementInstance?.salesManCode}"/>
                    <formCommon:hiddenField name="userCode"
                                            value="${merchantTerminalManagementInstance?.userCode}"/>


                    %{--<domainShow:displayNumber colCssClass="4" labelCssClass="4" valueCssClass="8"--}%
                                              %{--domain="merchantTerminalManagement" property="merchantCode"--}%
                                              %{--domainInstance="${merchantTerminalManagementInstance}"/>--}%
                    %{--<domainShow:displayNumber colCssClass="4" labelCssClass="4" valueCssClass="8"--}%
                                              %{--domain="merchantTerminalManagement" property="merchantCode"--}%
                                              %{--domainInstance="${merchantTerminalManagementInstance}"/>--}%

                    %{--<domainShow:displayNumber colCssClass="4" labelCssClass="4" valueCssClass="8"--}%
                                              %{--domain="merchantTerminalManagement" property="merchantCode"--}%
                                              %{--domainInstance="${merchantTerminalManagementInstance}"/>--}%

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><message:property domain="merchantTerminalManagement"
                                                                                    property="merchantCode"/><g:message code="dashBoard.system.colon"></g:message></label>

                            <div class="col-md-8">
                                <p class="form-control-static">${merchantTerminalManagementInstance?.merchantCode}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><message:property domain="merchantTerminalManagement"
                                                                                    property="merchantName"/><g:message code="dashBoard.system.colon"></g:message></label>

                            <div class="col-md-8">
                                <p class="form-control-static">${merchantTerminalManagementInstance?.merchantName}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><message:property domain="merchantTerminalManagement"
                                                                                    property="linkman"/><g:message code="dashBoard.system.colon"></g:message></label>

                            <div class="col-md-8">
                                <p class="form-control-static">${merchantTerminalManagementInstance?.linkman}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="control-label col-md-2"><message:property domain="merchantTerminalManagement"
                                                                                    property="installMachinesAddress"/><g:message code="dashBoard.system.colon"></g:message></label>

                            <div class="col-md-10">
                                <p class="form-control-static">${merchantTerminalManagementInstance?.installMachinesAddress}</p>
                            </div>
                        </div>
                    </div>

                    %{--<div class="col-md-4">--}%
                    %{--</div>--}%

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><message:property domain="merchantTerminalManagement"
                                                                                    property="contactTelephone"/><g:message code="dashBoard.system.colon"></g:message></label>

                            <div class="col-md-8">
                                <p class="form-control-static">${merchantTerminalManagementInstance?.contactTelephone}</p>
                            </div>
                        </div>
                    </div>
                </form:body>
            </form:form>
        </portlet:body>
    </component:portlet>
    <component:portlet>
        <portlet:title
                title="${message(code: 'merchantTerminalManagement.installationApplicationInformation.label', args: message.domain(domain: 'merchantTerminalManagement'))}"/>
        <portlet:body withForm="true">
            <form:form action="index">
                <form:body>

                    <domainShow:displayNumber domain="merchantTerminalManagement" property="applyPosQuantity"
                                              domainInstance="${merchantTerminalManagementInstance}"/>

                    <domainShow:displayNumber domain="merchantTerminalManagement" property="bindingPosQuantity"
                                              domainInstance="${merchantTerminalManagementInstance}"/>

                    <domainShow:displayString domain="merchantTerminalManagement" property="remark"
                                              domainInstance="${merchantTerminalManagementInstance}"/>

                </form:body>
            </form:form>
        </portlet:body>
    </component:portlet>
    <component:portlet>
        <portlet:title
                title="${message(code: 'merchantTerminalManagement.installInformation.label', args: message.domain(domain: 'merchantTerminalManagement'))}"/>
        <portlet:body withForm="true">
            <div style="margin-left: 50px">
                <span style="color: red">(输入终端序列号，点击鼠标左键或者回车键回显POS型号信息。可以增加多个终端的绑定但是不能大于可安装的数量。)</span>
                <div class="form-actions right">
                    <button class="btn btn-add"
                            onclick="addPosRow()">${message(code: 'merchantTerminalManagement.create.label')}</button>
                </div>
            </div>
            <form:form id="installForm">
                <formCommon:hiddenField name="merchantCode"
                                        value="${merchantTerminalManagementInstance?.merchantCode}"/>
                <formCommon:hiddenField name="insideMerchantCode"
                                        value="${merchantTerminalManagementInstance?.insideMerchantCode}"/>
                <formCommon:hiddenField id="canBindPosQuantity" name="canBindPosQuantity"
                                        value="${merchantTerminalManagementInstance?.applyPosQuantity - merchantTerminalManagementInstance?.bindingPosQuantity}"/>
                <formCommon:hiddenField id="applyBindPosQuantity" name="applyBindPosQuantity" value="1"/>
                <form:body>
                    <div class="info">
                        <hr class="hrLine" hidden="hidden"/>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label col-md-4"><span class="required">*</span><message:property domain="merchantTerminalManagement"
                                                                                        property="posSerialNumber"/><g:message code="dashBoard.system.colon"></g:message>
                                    </label>

                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="q_posSerialNumber" value=""/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label col-md-4">
                                    <message:property domain="merchantTerminalManagement" property="communicationWay"/><g:message code="dashBoard.system.colon"></g:message>
                                </label>

                                <div class="col-md-8">
                                    <g:select class="form-control" name="q_communicationWay"
                                              from="${com.suixingpay.ssp.front.merchant.MerchantTerminalManagement.getConstraintsMap()['communicationWay'].inList}"
                                              valueMessagePrefix="merchantTerminalManagement.communicationWay"
                                              value="${params ? params['q_communicationWay'] : ''}"
                                              noSelection="['': '请选择...']"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label col-md-4">
                                    <span class="required">*</span><message:property domain="merchantTerminalManagement" property="factory"/><g:message code="dashBoard.system.colon"></g:message>

                                </label>

                                <div class="col-md-8">
                                    <g:select class="form-control" name="q_factory" optionKey="factory"
                                              optionValue="factoryshortName"
                                              from="${factoryList}" value="${params ? params['q_factory'] : ''}"
                                              noSelection="['': '请选择...']"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label col-md-4">
                                    <message:property domain="merchantTerminalManagement" property="terminalModel"/><g:message code="dashBoard.system.colon"></g:message>
                                </label>

                                <div class="col-md-8">
                                    <g:select class="form-control" name="q_terminalModel"
                                              from="" value="${params ? params['q_terminalModel'] : ''}"
                                              noSelection="['': '请选择...']"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label col-md-4">
                                    <message:property domain="merchantTerminalManagement" property="passwordKeyboardModel"/><g:message code="dashBoard.system.colon"></g:message>
                                </label>

                                <div class="col-md-8">
                                    <g:select class="form-control" name="q_passwordKeyboardModel"
                                              from="" value="${params ? params['q_passwordKeyboardModel'] : ''}"
                                              noSelection="['': '请选择...']"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label col-md-4"><message:property domain="merchantTerminalManagement"
                                                                                        property="keyboardSerialNumber"/><g:message code="dashBoard.system.colon"></g:message>
                                </label>

                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="q_keyboardSerialNumber" value="" />

                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label col-md-4"><message:property domain="merchantTerminalManagement"
                                                                                        property="simNumber"/><g:message code="dashBoard.system.colon"></g:message>
                                    </label>

                                <div class="col-md-8">
                                    <input type="text" class="form-control" name="q_simNumber" value="" />

                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label col-md-4">
                                    <message:property domain="merchantTerminalManagement" property="whetherIndependentProcurement"/><g:message code="dashBoard.system.colon"></g:message>
                                </label>

                                <div class="col-md-8">
                                    <g:select disabled="true" class="form-control" name="q_whetherIndependentProcurement"
                                              from="${com.suixingpay.ssp.front.merchant.MerchantTerminalManagement.getConstraintsMap()['whetherIndependentProcurement'].inList}"
                                              valueMessagePrefix="merchantTerminalManagement.whetherIndependentProcurement"
                                              value="${params ? params['q_whetherIndependentProcurement'] : ''}"
                                              noSelection="['': '请选择...']"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="left reMoveInfo" hidden="hidden">
                                <button class="btn btn-cancle"
                                        onclick="removeRoleRow(this);">${message(code: 'merchantTerminalManagement.cancel.label')}</button>
                            </div>
                        </div>


                    </div>

                </form:body>

                <form:actions>
                    <button class="btn btn-machine ssp-merchant-bindpos-button" id="installButton" onclick="bindpos(event)">${message(code: 'merchantTerminalManagement.install.label')}</button>
                %{--<component:modals id="installResultModal" title="${message(code: 'merchantTerminalManagement.install.label')}"--}%
                %{--width="full"/>--}%
                    <button type="button" class="btn btn-close" data-dismiss="modal"><g:message
                            code="default.button.close.label"/></button>

                </form:actions>
            </form:form>
        </portlet:body>
    </component:portlet>
</div>
<div class="modal-footer">
</div>
<script type="text/javascript">
    $(function () {
        $("div.form-body").on("change", "div.info input[name='q_posSerialNumber']", function () {
            posSerialNumberChanged(this)
        }).on("change", "div.info select[name='q_factory']", function () {
            factoryChanged(this);
        }).on("change", "div.info select[name='q_terminalModel']", function () {
            terminalModelChanged(this);
        }).on("change", "div .info select[name='q_communicationWay']", function () {
            communicationWayChanged(this);
        }).on("change", "div.info input[name='q_simNumber']", function(){
            simNumberChanged(this);
        })

        $("#installForm").validate({
            errorElement: "",
            errorClass: "help-block help-block-error",
            ignore: ":hidden",
            messages: {
                q_posSerialNumber: {required: "Pos序列号-不能为空."}
            },
            rules: {
                q_posSerialNumber: {required: true}
            }
        });
    });

    function posSerialNumberChanged(node) {
        var parent = $(node).parents("div.info");
        var posSerialNumber = parent.find("input[name='q_posSerialNumber']").val();
        var belongtoOrganization = $("#belongtoOrganizationIns").val();
        var salesManCode = $("#salesManCodeIns").val();
        parent.find("select[name='q_communicationWay']").val("");
        parent.find("select[name='q_factory']").val("");
        parent.find("select[name='q_terminalModel']").val("");
        resetDataValue(parent);
        if ("" != posSerialNumber) {
            $.ajax({
                url: "/merchantTerminalManagement/getPosInfo",
                data: {posSerialNumber: posSerialNumber,belongtoOrganization:belongtoOrganization,salesManCode:salesManCode},
                async: false,
                success: function (data) {
                    if ('' == data || null == data || data.length == 0) {
                        bootbox.alert("该序列号无信息，请确认序列号归属是否正确或已被绑定。",function (){
                            parent.find("input[name='q_posSerialNumber']").val("");
                        });
                    } else if (data.length > 1) {
                        bootbox.alert("该序列号有多条信息，请手动设置通讯方式、厂商和终端型号。");
                    } else {
                        //resetDataValue(parent);
                        parent.find("select[name='q_communicationWay']").val(data[0].communicationWay);
                        parent.find("select[name='q_factory']").val(data[0].factory).change();
                        parent.find("select[name='q_terminalModel']").val(data[0].terminalModel).change();
                    }
                }
            });
        }
    }

    function factoryChanged(node) {
        var parent = $(node).parents("div.info");
        resetDataValue(parent);
        var communicationWay = parent.find("select[name='q_communicationWay']").val();
        if (communicationWay == "" || communicationWay < 0) {
            bootbox.alert("请选择pos通讯方式")
            parent.find("select[name='q_factory']").find("option[value='']").attr("selected", true);
            return;
        }
        var factory = parent.find("select[name='q_factory']").find('option:selected').val();
        var insideMerchantCode = $("input[name='insideMerchantCode']").val();

        parent.find("select[name='q_terminalModel']").children("option[value!='']").remove().change();
        if (factory != '') {
            $.ajax({
                url: "/merchantTerminalManagement/getModByfactAndConnNo.do",
                data: {
                    communicationWay: communicationWay,
                    factory: factory,
                    machineType: '001',
                    insideMerchantCode: insideMerchantCode
                },
                async: false,
                success: function (data) {
                    if (data != "") {
                        var optionList = "<option  value=''>请选择...</option>";
                        for (var i = 0; i < data.length; i++) {
                            optionList += "<option  value='" + data[i].terminalModel + "'>" + data[i].terminalModelName + "</option>";
                        }
                        parent.find("select[name='q_terminalModel']").html(optionList);
                    }
                }
            });
        }
    }

    function terminalModelChanged(node) {
        var parent = $(node).parents("div.info");
        resetDataValue(parent);
        var terminalModel = parent.find("select[name='q_terminalModel']").val();
        parent.find("select[name='q_passwordKeyboardModel']").children("option[value!='']").remove();
        $.ajax({
            url: "/merchantTerminalManagement/getBoardAndSimInfobyTerminalModel.do",
            data: {terminalModel: terminalModel},
            async: false,
            success: function (data) {
                var keyBoardOption = '<option value="" selected="selected" >请选择...</option>';
                var simOption = '<option   value="" selected="selected"  >请选择...</option>';
                for (var i = 0; i < data.length; i++) {
                    if (data[i].goodsId == '011') {
                        keyBoardOption += "<option  value='" + data[i].terminalModel + "'>" + data[i].terminalModelName + "</option>";
                    }
                    if (data[i].goodsId == '012') {
                        simOption += "<option  value='" + data[i].terminalModel + "'>" + data[i].terminalModelName + "</option>";
                    }
                }
                parent.find("select[name='q_passwordKeyboardModel']").html(keyBoardOption);
            }
        });

    }

    function communicationWayChanged(node) {
        var parent = $(node).parents("div.info");
        if ("" != parent.find("select[name='q_communicationWay']").val()) {
            resetDataValue(parent);
            factoryChanged(node);
        }
    }

    function simNumberChanged(node) {
        var parent = $(node).parents("div.info");
        var simNumber = parent.find("input[name='q_simNumber']").val();
        var insideMerchantCode = $("input[name='insideMerchantCode']").val();
        var belongtoOrganization = $("#belongtoOrganizationIns").val();
        var salesManCode = $("#salesManCodeIns").val();
        parent.find("select[name='q_whetherIndependentProcurement']").val("");
        if( "" != simNumber ){
            $.ajax({
                url: "/merchantTerminalManagement/getSimWhetherIndependentProcurement.do",
                data: {simNumber: simNumber,insideMerchantCode:insideMerchantCode,belongtoOrganization:belongtoOrganization,salesManCode:salesManCode},
                async: false,
                success: function (data) {
                    parent.find("select[name='q_whetherIndependentProcurement']").val(data.whetherIndependentProcurement+"");
                }
            });
        }
    }

    function addPosRow() {
        if (parseInt($("#applyBindPosQuantity").val()) >= parseInt($("#canBindPosQuantity").val())) {
            bootbox.alert("不能多于可安装台数!");
            return;
        }
        $("#install").find("div.info:last").parent().parent().append($("div.info:first").parent()[0].outerHTML);
        $("div.reMoveInfo:last").show();
        $("hr.hrLine:last").show();
        $("#applyBindPosQuantity").val(parseInt($("#applyBindPosQuantity").val()) + 1);
    }

    function removeRoleRow(node){
        if(parseInt($("#applyBindPosQuantity").val()) == 1){
            return false;
        }
        $(node).parents("div.info").parent().remove();
        $("#applyBindPosQuantity").val(parseInt($("#applyBindPosQuantity").val()) -1);
    }

    function resetDataValue(node) {
        //清空键盘序列号 密码键盘序列号 sim卡号 键盘型号 sim卡是否自采
        $(node).find("input[name='q_keyboardSerialNumber']").val("");
        $(node).find("input[name='q_passwordKeyboardModel']").val("");
        $(node).find("input[name='q_simNumber']").val("");
        $(node).find("select[name='q_whetherIndependentProcurement']").val("");
        $(node).find("select[name='q_passwordKeyboardModel']").children("option[value!='']").remove();
    }
</script>
