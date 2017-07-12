<%@ page import="com.suixingpay.ssp.front.workorder.CustomerServiceWorkOrder" %>
<component:portlet>
    <portlet:title
            title="${message(code: 'customerServiceWorkOrder.baseInformation.label')}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${customerServiceWorkOrderInstance?.id}"/>
                <formCommon:hiddenField name="person" value="${customerServiceWorkOrderInstance?.noticePerson}"/>
                <formCommon:hiddenField name="retCode" id="retCode" value="${customerServiceWorkOrderInstance?.retCode}"/>
                <formCommon:hiddenField name="retMessage" id="retMessage" value="${customerServiceWorkOrderInstance?.retMessage}"/>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="workOrderNo"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.workOrderNo}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="orderStatus"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.orderStatus}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="orderCreateDept"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.orderCreateDept}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="orderCreateName"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.orderCreateName}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="createTime"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.createTime}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="latestProcessingTime"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.latestProcessingTime}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="customerName"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.customerName}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="customerPhone"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.customerPhone}</p>
                        </div>
                    </div>
                </div>
                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="workOrderNo"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%
                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="orderStatus"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%

                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="orderCreateDept"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%

                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="orderCreateName"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%
                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="createTime"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%
                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="latestProcessingTime"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%
                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="customerName"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%

                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="customerPhone"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%
            </form:body>
        %{--<form:actions>--}%
        %{--<formActions:submit value="${message(code: 'default.button.back.label')}"/>--}%
        %{--</form:actions>--}%
        </form:form>
    </portlet:body>
</component:portlet>
<component:portlet>
    <portlet:title
            title="${message(code: 'customerServiceWorkOrder.merchantInformation.label')}"/>
%{--<portlet:title--}%
%{--title="${message(code: 'customerServiceWorkOrder.merchantInformation.label', args: message.domain(domain: 'customerServiceWorkOrder'))}"/>--}%
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${customerServiceWorkOrderInstance?.id}"/>


                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="merchantCode"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.merchantCode}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="receiptsName"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.receiptsName}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="posModel"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.posModel}</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="communicationWay"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.communicationWay}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="terminalNumber"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.terminalNumber}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="legalPersonName"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.legalPersonName}</p>
                        </div>
                    </div>
                </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">

                            <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="registMobileNo"/><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.registMobileNo}</p>
                            </div>
                        </div>
                    </div>
                    %{--<div class="col-md-4">--}%
                    %{--<div class="form-group">--}%

                    %{--<label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="registMobileNo"/><g:message code="dashBoard.system.colon"></g:message>--}%
                    %{--</label>--}%
                    %{--<div class="col-md-8">--}%
                    %{--<p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.registMobileNo}</p>--}%
                    %{--</div>--}%
                    %{--</div>--}%
                    %{--</div>--}%
                    <div class="col-md-4">
                        <div class="form-group">

                            <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="belongToOrg"/><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.belongToOrg}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">

                            <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="directlyOrg"/><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.directlyOrg}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="salesman"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.salesman}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="createDate"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.createDate}</p>
                        </div>
                    </div>
                </div>
                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="merchantCode"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%



                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="receiptsName"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%



                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="posModel"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%



                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="communicationWay"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%



                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="terminalNumber"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%



                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="legalPersonName"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%



                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="registMobileNo"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%

                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="belongToOrg"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%

                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="directlyOrg"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%
                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="salesman"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%
                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="createDate"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%

            </form:body>
        </form:form>
    </portlet:body>
</component:portlet>
<component:portlet>
    <portlet:title
            title="${message(code: 'customerServiceWorkOrder.questionInformation.label')}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="orderType"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.orderType}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="questionType"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.questionType}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="questionChildType"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.questionChildType}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="questionTitle"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.questionTitle}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="orderLevel"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.orderLevel}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="timeLimit"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.timeLimit}</p>
                        </div>
                    </div>
                </div>
                <div class="row">

                </div>
                <div class="col-md-4">
                    <div class="form-group">

                        <label class="control-label col-md-4 text-left"><message:property domain="customerServiceWorkOrder" property="questionDetail"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>
                        <div class="col-md-8">
                            <p class="form-control-static" readonly="true">${customerServiceWorkOrderInstance?.questionDetail}</p>
                        </div>
                    </div>
                </div>

                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="orderType"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%
                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="questionType"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%
                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="questionChildType"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%
                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="questionTitle"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%
                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="orderLevel"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%
                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="timeLimit"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%
                %{--<domainShow:displayString domain="customerServiceWorkOrder" property="questionDetail"--}%
                                          %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%

                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="col-md-2 control-label">${message(code: "customerServiceWorkOrder.questionDescribe.label")}<g:message code="dashBoard.system.colon"></g:message></label>

                            <div class="col-md-10">
                                <g:textArea class="form-control" domain="customerServiceWorkOrder" readonly="true" name="questionDescribe"
                                          domainInstance="${customerServiceWorkOrderInstance}" value="${customerServiceWorkOrderInstance.questionDescribe}"
                                          property="questionDescribe" rows="7"/>
                            </div>
                        </div>
                    </div>
                </div>
            </form:body>
        </form:form>
    </portlet:body>
</component:portlet>
<component:portlet>
    <portlet:title
            title="${message(code: 'customerServiceWorkOrder.questionHandle.label')}"/>
    <portlet:body withForm="true">
        <form:form action="index" id="ashin">
            <form:body>
                <input type="hidden" id="id" value="${customerServiceWorkOrderInstance.id}"/>
                <input type="hidden" id="version" value="${customerServiceWorkOrderInstance.version}"/>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="control-label col-md-4">
                            <message:property domain="customerServiceWorkOrder" property="recipientRole"/><g:message code="dashBoard.system.colon"></g:message>
                        </label>

                        <div class="col-md-8 ">
                            <g:select class="form-control" name="q_recipientRole" optionKey="${recipientRole}"
                                      required="true"
                                      optionValue="${recipientRole}"
                                      from="${com.suixingpay.ssp.front.workorder.CustomerServiceWorkOrder.getConstraintsMap()['recipientRole'].inList}"
                                      noSelection="['': '请选择...']"
                                      value="${customerServiceWorkOrderInstance?.recipientRole}"
                                      valueMessagePrefix="customerServiceWorkOrder.recipientRole"
                                      domainInstance="${customerServiceWorkOrderInstance}" disabled="true"/>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-4 control-label">${message(code: "customerServiceWorkOrder.noticePerson.label")}<g:message code="dashBoard.system.colon"></g:message></label>

                        <div class="input-group col-md-7">
                            <g:select id="select2-input-group-append"
                                      class="form-control select2"
                                      from="${com.suixingpay.ssp.front.workorder.CustomerServiceWorkOrder.getConstraintsMap()['noticePerson'].inList}"
                                      name="q_noticePerson"
                                      noSelection="['': '请选择...']"
                                      value="${customerServiceWorkOrderInstance?.noticePerson}"
                                      valueMessagePrefix="customerServiceWorkOrder.noticePerson"
                                      multiple="multiple"/>
                        </div>

                        %{--<div class="col-md-8">--}%
                            %{--<g:select class="form-control select2"--}%
                                      %{--name="q_aaaa" from="${com.suixingpay.ssp.front.workorder.CustomerServiceWorkOrder.getConstraintsMap()['noticePerson'].inList}"--}%
                                      %{--valueMessagePrefix="customerServiceWorkOrder.noticePerson"--}%
                                      %{--noSelection="['': '请选择...']" multiple="multiple"/>--}%
                        %{--</div>--}%

                    </div>
                </div>

                <div class="col-md-12">
                    <div class="form-group">
                        <label class="col-md-2 control-label"><span class="required">*</span>${message(code: "customerServiceWorkOrder.handleSuggestion.label")}<g:message code="dashBoard.system.colon"></g:message>
                        </label>

                        <div class="col-md-9">
                            <g:textArea class="form-control" domain="customerServiceWorkOrder" name="handleSuggestion"
                                      domainInstance="${customerServiceWorkOrderInstance}"
                                      property="handleSuggestion" rows="7" id="handleSuggestion"
                                      value="${customerServiceWorkOrderInstance?.handleSuggestion}"/>
                        </div>
                    </div>
                </div>

            </form:body>
        </form:form>
    </portlet:body>
</component:portlet>
<component:portlet>
    <portlet:title
            title="${message(code: 'customerServiceWorkOrder.operationHistory.label')}"/>
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    %{--<domainSearchResult:header domain="customerServiceWorkOrder" property="serialNumber"/>--}%
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="stepName"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="receiverPosition"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="handleSuggestion"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="uploadAttachments"/>
                    <domainSearchResult:header domain="customerServiceWorkOrder" property="processingTime"/>
                </tr>
                </thead>
                <tbody><g:each var="customerServiceWorkOrderInstance" status="i"
                               in="${customerServiceWorkOrderInstanceList}">
                    <tr>
                        %{--<td textAlign="right">${i + 1}</td>--}%
                        <domainSearchResult:rowData textAlign="center" type="text" domain="customerServiceWorkOrder" property="stepName"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="customerServiceWorkOrder"
                                                    property="receiverPosition"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="customerServiceWorkOrder"
                                                    property="handleSuggestion"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                        %{--<domainSearchResult:rowData type="text" domain="customerServiceWorkOrder"--}%
                                                    %{--property="uploadAttachments"--}%
                                                    %{--domainInstance="${customerServiceWorkOrderInstance}"/>--}%
                        <td textAlign="center">
                            <g:if test="${customerServiceWorkOrderInstance.imgDirFirst != null}">
                                <g:link class="fancybox" controller="displayGraph" action="viewImage"
                                        params='[title: "${customerServiceWorkOrderInstance.imgDirFirst}"]' >
                                    ${message(code: 'customerServiceWorkOrder.uploadAttachments.firstFile.label')}
                                </g:link>
                            </g:if>
                            <g:if test="${customerServiceWorkOrderInstance.imgDirSecond != null}">
                                <g:link class="fancybox" controller="displayGraph" action="viewImage"
                                        params='[title: "${customerServiceWorkOrderInstance.imgDirSecond}"]' >
                                    ${message(code: 'customerServiceWorkOrder.uploadAttachments.secondFile.label')}
                                </g:link>
                            </g:if>
                            <g:if test="${customerServiceWorkOrderInstance.imgDirThird != null}">
                                <g:link class="fancybox" controller="displayGraph" action="viewImage"
                                        params='[title: "${customerServiceWorkOrderInstance.imgDirThird}"]' >
                                    ${message(code: 'customerServiceWorkOrder.uploadAttachments.thirdFile.label')}
                                </g:link>
                            </g:if>
                        </td>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="customerServiceWorkOrder"
                                                    property="processingTime"
                                                    domainInstance="${customerServiceWorkOrderInstance}"/>
                    </tr></g:each>
                </tbody>

            </table>
        </div>
    </portlet:body>
</component:portlet>
<form:actions>
    <button class="btn btn-ok "
            onclick="submitClick()">${message(code: 'customerServiceWorkOrder.submit.label')}</button>

    <button class="btn btn-close" onclick="noHanle()">${message(
            code: "customerServiceWorkOrder.notHandle.label")}</button>

</form:actions>
<content tag="takin-footer">
    <asset:javascript src="jquery.validate.min.js"/>
    <script type="text/javascript">
    $(function () {
        // 通知角色人回显
        console.log(1222)
        var person = $("input[name='person']").val();
        console.log(person)
        if( person != '' ){
            var notice = person.split(",")
            $('#select2-input-group-append').select2("val", [notice]);
        }

        $('#ashin').validate({
            errorElement: "span",
            errorClass: "help-block help-block-error",
            //focusInvalid: !1,
            ignore: ":hidden",//不对Hidden的元素进行验证

            messages: {
                handleSuggestion: {required:"办理意见不能为空.",byteMaxLength: "请输入最多1000字符."}
            },
            rules: {
                handleSuggestion: {required:true, byteMaxLength: 1000},
            }
        })
        // 《中文字两个字节-区间验证》
        jQuery.validator.addMethod("byteRangeLength", function (value, element, param) {
            var length = value.length;
            for (var i = 0; i < value.length; i++) {
                if (value.charCodeAt(i) > 127) {
                    length++;
                }
            }
            return this.optional(element) || ( length >= param[0] && length <= param[1] );
        }, $.validator.format("请输入 {0}-{1} 个字符(汉字算2个字符)."));

        // 《中文字两个字节-最大验证》
        jQuery.validator.addMethod("byteMaxLength", function (value, element, param) {
            var length = value.length;
            for (var i = 0; i < value.length; i++) {
                if (value.charCodeAt(i) > 127) {
                    length++;
                }
            }
            return this.optional(element) || ( length <= param);
        }, $.validator.format("最多输入 {0} 个字符(汉字算2个字符)."));

        // 《中文字两个字节-最小验证》
        jQuery.validator.addMethod("byteMinLength", function (value, element, param) {
            var length = value.length;
            for (var i = 0; i < value.length; i++) {
                if (value.charCodeAt(i) > 127) {
                    length++;
                }
            }
            return this.optional(element) || ( length >= param);
        }, $.validator.format("最少输入 {0} 个字符(汉字算2个字符)."));

        if($("#retCode").val() != "0"){
            bootbox.alert(
                    $("#retMessage").val(), function(){
                        window.location.href = '/customerServiceWorkOrder/index';
                    })
        }

        $("a.fancybox").fancybox({
            'transitionIn'	:	'elastic',
            'transitionOut'	:	'elastic',
            'speedIn'		:	600,
            'speedOut'		:	200,
            'overlayShow'	:	false
        });


    });
    function submitClick() {
        console.log(33)
        var mainForm = $('#ashin');
        console.log(mainForm);
        if (!mainForm.valid()) {
            console.log("===========校验未通过.");
            return false;
        } else {
            console.log("===========校验通过.");
        }

        var recipientRole = $("select[name = 'q_recipientRole']").val();
        var noticePerson = $("select[name='q_noticePerson']").val();
        var handleSuggestion = $("#handleSuggestion").val();
        var id = $("#id").val();
        var version = $("#version").val();
        var person = '';
        if(noticePerson != null){
            for (var i = 0; i < noticePerson.length; i++) {
                person = person + "," + noticePerson[i]
            }
        }
        $.ajax({
            url: "/customerServiceWorkOrder/handleSave",
            data: {
                recipientRole: recipientRole,
                noticePerson: person.substr(1),
                handleSuggestion: handleSuggestion,
                id: id,
                version: version
            },
            async: false,
            success: function (data) {
                bootbox.dialog({
                    message: data.message,
                    title: "客服工单管理-办理操作结果",
                    buttons: {
                        success: {
                            label: "关闭",
                            className: "green",
                            callback: function () {
                                window.location.href = '/customerServiceWorkOrder/index';

                            }
                        }
                    }
                });
            }

        })
    }

    function noHanle() {
        console.log(33)
        var id = $("#id").val();
        var version = $("#version").val();
        bootbox.setLocale("zh_CN");
        bootbox.dialog({
            message: "是否离开办理页面？",
            %{--title: '${message(code: 'default.flash.type.info')}',--}%
            title: '客服工单管理-不办理操作',
            buttons: {
                success: {
                    label: '${message(code: 'default.button.cancel.label')}',
                    className: "btn-close",
                    callback: function () {
                    }
                },
                danger: {
                    label:  '${message(code: 'default.button.enter.label')}',
                    className: "btn-ok",
                    callback: function () {
                        $.ajax({
                            url: "/customerServiceWorkOrder/noHandle",
                            data: {
                                id: id,
                                version: version
                            },
                            async: false,
                            success: function (data) {
                                bootbox.dialog({
                                    message: data.message,
                                    title: "客服工单管理-不办理操作结果",
                                    buttons: {
                                        success: {
                                            label: "关闭",
                                            className: "btn-close",
                                            callback: function () {
                                                window.location.href = '/customerServiceWorkOrder/index';

                                            }
                                        }
                                    }
                                });
                            }
                        })
                    }
                }
            }
        });

//        bootbox.confirm("是否离开办理页面？",function (result) {
//            if(result) {
//                $.ajax({
//                    url: "/customerServiceWorkOrder/noHandle",
//                    data: {
//                        id: id,
//                        version: version
//                    },
//                    async: false,
//                    success: function (data) {
//                        bootbox.dialog({
//                            message: data.message,
//                            title: "客服工单管理-办理操作结果",
//                            buttons: {
//                                success: {
//                                    label: "关闭",
//                                    className: "green",
//                                    callback: function () {
//                                        window.location.href = '/customerServiceWorkOrder/index';
//
//                                    }
//                                }
//                            }
//                        });
//                    }
//                })
//            }
//        })

    }
</script>
</content>