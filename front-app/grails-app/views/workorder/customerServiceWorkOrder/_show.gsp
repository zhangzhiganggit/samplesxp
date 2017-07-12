<%@ page import="com.suixingpay.ssp.front.workorder.CustomerServiceWorkOrder" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title">${message(code: 'customerServiceWorkOrder.orderDetail.label')}</h4>
</div>

<div class="modal-body">
    <component:portlet>
        <portlet:title
                title="${message(code: 'customerServiceWorkOrder.baseInformation.label')}"/>
        <portlet:body withForm="true">
            <form:form action="index">
                <form:body>
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
                    %{--<formCommon:hiddenField name="id" value="${customerServiceWorkOrderInstance?.id}"/>--}%

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



                    %{--<domainShow:displayString domain="customerServiceWorkOrder" property="handleBranchCompany"--}%
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
                %{--<form:actions>--}%
                    %{--<formActions:submit value="${message(code: 'default.button.back.label')}"/>--}%
                %{--</form:actions>--}%
            </form:form>
        </portlet:body>
    </component:portlet>
    <component:portlet>
        <portlet:title
                title="${message(code: 'customerServiceWorkOrder.questionInformation.label')}"/>
        %{--<portlet:title--}%
                %{--title="${message(code: 'customerServiceWorkOrder.questionInformation.label', args: message.domain(domain: 'customerServiceWorkOrder'))}"/>--}%
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
                    <div class="row"></div>
                    <div class="col-md-4">
                        <div class="form-group">

                                <label class="control-label col-md-4"><message:property domain="customerServiceWorkOrder" property="questionDetail"/><g:message code="dashBoard.system.colon"></g:message>
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
                                <label class="col-md-2 control-label">${message(code:"customerServiceWorkOrder.questionDescribe.label")}<g:message code="dashBoard.system.colon"></g:message></label>
                                <div class="col-md-10">
                                    <g:textArea class="form-control" domain="customerServiceWorkOrder" readonly="true"  value="${customerServiceWorkOrderInstance.questionDescribe}"  domainInstance="${customerServiceWorkOrderInstance}" name="questionDescribe" property="questionDescribe" rows="7"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:body>
            </form:form>
        </portlet:body>
        %{--<portlet:title--}%
                %{--title="${message(code: 'customerServiceWorkOrder.questionHandle.label', args: message.domain(domain: 'customerServiceWorkOrder'))}"/>--}%
        %{--<portlet:body withForm="true">--}%
            %{--<form:form action="index">--}%
                %{--<form:body>--}%

                    %{--<domainSearch:select property="recipientRole" readonly="true" domain="customerServiceWorkOrder" class="form-control" name="q_recipientRole" from="${com.suixingpay.ssp.front.workorder.CustomerServiceWorkOrder.getConstraintsMap()['recipientRole'].inList}" valueMessagePrefix="customerServiceWorkOrder.recipientRole" value="${params ? params['q_recipientRole'] : ''}" noSelection="['':'']" />--}%
                    %{--<domainSearch:select property="noticePerson" readonly="true" domain="customerServiceWorkOrder" class="form-control" name="q_noticePerson" from="${com.suixingpay.ssp.front.workorder.CustomerServiceWorkOrder.getConstraintsMap()['noticePerson'].inList}" valueMessagePrefix="customerServiceWorkOrder.noticePerson" value="${params ? params['q_noticePerson'] : ''}" noSelection="['':'']" />--}%

                    %{--<div class="row">--}%
                        %{--<div class="col-md-4">--}%
                            %{--<div class="form-group">--}%
                                %{--<label class="col-md-4 control-label">${message(code:"customerServiceWorkOrder.handleSuggestion.label")}</label>--}%
                                %{--<div class="col-md-8">--}%
                                    %{--<textarea class="form-control" domain="customerServiceWorkOrder"   domainInstance="${customerServiceWorkOrderInstance}" readonly="true" property="handleSuggestion" rows="7"></textarea>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%

                %{--</form:body>--}%
            %{--</form:form>--}%
        %{--</portlet:body>--}%
    </component:portlet>
    <component:portlet>
        <portlet:title
                title="${message(code: 'customerServiceWorkOrder.operationHistory.label')}"/>
        %{--<portlet:title title="${message(code: 'customerServiceWorkOrder.operationHistory.label', args: message.domain(domain: 'customerServiceWorkOrder'))}"--}%
                       %{--iconCssClass="fa fa-filter"/>--}%
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
                                   in="${customerServiceWorkOrderInstanceList }">
                        <tr>
                            %{--<td textAlign="right">${i + 1}</td>--}%
                            <domainSearchResult:rowData textAlign="center" type="text" domain="customerServiceWorkOrder" property="stepName"
                                                        domainInstance="${customerServiceWorkOrderInstance }"/>
                            <domainSearchResult:rowData textAlign="center" type="text" domain="customerServiceWorkOrder" property="receiverPosition"
                                                        domainInstance="${customerServiceWorkOrderInstance }"/>
                            <domainSearchResult:rowData textAlign="center" type="text" domain="customerServiceWorkOrder" property="handleSuggestion"
                                                        domainInstance="${customerServiceWorkOrderInstance }"/>
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
                            <domainSearchResult:rowData textAlign="center" type="text" domain="customerServiceWorkOrder" property="processingTime"
                                                        domainInstance="${customerServiceWorkOrderInstance }"/>
                        </tr></g:each>
                    </tbody>

                </table>
            </div>
            %{--<form:actions>--}%
                %{--<g:link controller="customerServiceWorkOrder" action="index" class="btn btn-return"><g:message code="default.button.back.label"/></g:link>--}%
            %{--</form:actions>--}%
        </portlet:body>
    </component:portlet>
    <button type="button" class="btn btn-close" data-dismiss="modal"><g:message
            code="assistBillQuery.close.label"/></button>
</div>
<div class="modal-footer"></div>