<%@ page import="com.suixingpay.ssp.front.riskcontrol.ComplianceRectificationMerchant" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title">${message(code: 'default.button.show.label')}</h4>
</div>

<div class="modal-body">
    <component:portlet>
        <portlet:title
                title="${message(code: 'complianceRectificationMerchant.base.label', args: message.domain(domain: 'complianceRectificationMerchant'))}"/>
        <portlet:body withForm="true">
            <form:form action="index">
                <form:body>
                    <formCommon:hiddenField name="id" value="${complianceRectificationMerchantInstance?.id}"/>
                    <domainShow:displayString domain="complianceRectificationMerchant" property="taskNumber"
                                              domainInstance="${complianceRectificationMerchantInstance}"/>
                    <domainShow:displayString domain="complianceRectificationMerchant" property="types"
                                              domainInstance="${complianceRectificationMerchantInstance}"/>
                    <domainShow:displayString domain="complianceRectificationMerchant" property="type"
                                              domainInstance="${complianceRectificationMerchantInstance}"/>
                </form:body>
            </form:form>
        </portlet:body>
    </component:portlet>
    <component:portlet>
        <portlet:title
                title="${message(code: 'complianceRectificationMerchant.merchantInformation.label', args: message.domain(domain: 'complianceRectificationMerchant'))}"/>
        <portlet:body withForm="true">

            <form:form action="index">
                <form:body>
                    <domainShow:displayString domain="complianceRectificationMerchant" property="merchantCode"
                                              domainInstance="${complianceRectificationMerchantInstance}"/>
                    <domainShow:displayString domain="complianceRectificationMerchant" property="branchOrg"
                                              domainInstance="${complianceRectificationMerchantInstance}"/>
                    <domainShow:displayString domain="complianceRectificationMerchant" property="belongtoOrg"
                                              domainInstance="${complianceRectificationMerchantInstance}"/>
                    <domainShow:displayString domain="complianceRectificationMerchant" property="directlyOrg"
                                              domainInstance="${complianceRectificationMerchantInstance}"/>
                    <domainShow:displayString domain="complianceRectificationMerchant" property="salesManName"
                                              domainInstance="${complianceRectificationMerchantInstance}"/>
                    <domainShow:displayString domain="complianceRectificationMerchant" property="salesManCode"
                                              domainInstance="${complianceRectificationMerchantInstance}"/>
                </form:body>
            </form:form>
        </portlet:body>
    </component:portlet>
    <component:portlet>
    %{--<div class="col-md-6">--}%
        <portlet:title
                title="${message(code: 'complianceRectificationMerchant.auditInformation.label', args: message.domain(domain: 'complianceRectificationMerchant'))}"/>
        <portlet:body withForm="true">

            <form:form action="index">
                <form:body>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2"><span class="required">*</span><message:property
                                        domain="complianceRectificationMerchant"
                                        property="registRregistrationNumber"/><g:message code="dashBoard.system.colon"></g:message>
                                </label>

                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="registRregistrationNumber"
                                           value="${complianceRectificationMerchantInstance.registRregistrationNumber}"
                                           required="true" id="registRregistrationNumber" readonly="true">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2"><span class="required">*</span><message:property
                                        domain="complianceRectificationMerchant"
                                        property="registName"/><g:message code="dashBoard.system.colon"></g:message>
                                </label>

                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="registName"
                                           value="${complianceRectificationMerchantInstance.registName}"
                                           required="true" id="registName" readonly="true">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2"><span class="required">*</span><message:property
                                        domain="complianceRectificationMerchant"
                                        property="registAddress"/><g:message code="dashBoard.system.colon"></g:message>
                                </label>

                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="registAddress"
                                           value="${complianceRectificationMerchantInstance.registAddress}"
                                           required="true" id="registAddress" readonly="true">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2"><span class="required">*</span><message:property
                                        domain="complianceRectificationMerchant"
                                        property="legalPersonName"/><g:message code="dashBoard.system.colon"></g:message>
                                </label>

                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="legalPersonName"
                                           value="${complianceRectificationMerchantInstance.legalPersonName}"
                                           required="true" id="legalPersonName" readonly="true">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2"><span class="required"></span><message:property
                                        domain="complianceRectificationMerchant"
                                        property="receiptsName"/>
                                    <g:message code="dashBoard.system.colon"></g:message>
                                </label>

                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="receiptsName"
                                           value="${complianceRectificationMerchantInstance.receiptsName}"
                                           required="true" id="receiptsName" readonly="true">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2"><span class="required">*</span><message:property
                                        domain="complianceRectificationMerchant"
                                        property="manageContent"/><g:message code="dashBoard.system.colon"></g:message>
                                </label>

                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="manageContent"
                                           value="${complianceRectificationMerchantInstance.manageContent}"
                                           required="true" id="manageContent" readonly="true">
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2"><span class="required">*</span><message:property
                                        domain="complianceRectificationMerchant"
                                        property="manageAddress"/><g:message code="dashBoard.system.colon"></g:message>
                                </label>

                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="manageAddress"
                                           value="${complianceRectificationMerchantInstance.manageAddress}"
                                           required="true" id="manageAddress" readonly="true">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label col-md-2"><span class="required">*</span><message:property
                                        domain="complianceRectificationMerchant"
                                        property="manageSummary"/><g:message code="dashBoard.system.colon"></g:message>
                                </label>

                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="manageSummary"
                                           value="${complianceRectificationMerchantInstance.manageSummary}"
                                           required="true" id="manageSummary" readonly="true">
                                </div>
                            </div>
                        </div>
                    </div>
                </form:body>
            </form:form>
        </portlet:body>
    </component:portlet>
    %{--</div>--}%

    %{--<div class="col-md-6">--}%
        %{--<portlet:title--}%
                %{--title="${message(code: 'complianceRectificationMerchant.merchantOldInformation.label', args: message.domain(domain: 'complianceRectificationMerchant'))}"/>--}%
        %{--<portlet:body withForm="true">--}%

            %{--<form:form action="index">--}%
                %{--<form:body>--}%
                    %{--<div class="row">--}%
                        %{--<div class="col-md-12">--}%
                            %{--<div class="form-group">--}%
                                %{--<label class="control-label col-md-3"><message:property--}%
                                        %{--domain="complianceRectificationMerchant"--}%
                                        %{--property="registRregistrationNumberOld"/>--}%
                                    %{--<span class="required">*</span>--}%
                                %{--</label>--}%

                                %{--<div class="col-md-9">--}%
                                    %{--<input type="text" class="form-control" name="registRregistrationNumberOld"--}%
                                           %{--value="${complianceRectificationMerchantInstance.registRregistrationNumberOld}"--}%
                                           %{--required="true" id="registRregistrationNumberOld" readonly="true">--}%
                                %{--</div>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="row">--}%
                        %{--<div class="col-md-12">--}%
                            %{--<div class="form-group">--}%
                                %{--<label class="control-label col-md-3"><message:property--}%
                                        %{--domain="complianceRectificationMerchant"--}%
                                        %{--property="registNameOld"/>--}%
                                    %{--<span class="required">*</span>--}%
                                %{--</label>--}%

                                %{--<div class="col-md-9">--}%
                                    %{--<input type="text" class="form-control" name="registNameOld"--}%
                                           %{--value="${complianceRectificationMerchantInstance.registNameOld}"--}%
                                           %{--required="true" id="registNameOld" readonly="true">--}%
                                %{--</div>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="row">--}%
                        %{--<div class="col-md-12">--}%
                            %{--<div class="form-group">--}%
                                %{--<label class="control-label col-md-3"><message:property--}%
                                        %{--domain="complianceRectificationMerchant"--}%
                                        %{--property="registAddressOld"/>--}%
                                    %{--<span class="required">*</span>--}%
                                %{--</label>--}%

                                %{--<div class="col-md-9">--}%
                                    %{--<input type="text" class="form-control" name="registAddressOld"--}%
                                           %{--value="${complianceRectificationMerchantInstance.registAddressOld}"--}%
                                           %{--required="true" id="registAddressOld" readonly="true">--}%
                                %{--</div>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="row">--}%
                        %{--<div class="col-md-12">--}%
                            %{--<div class="form-group">--}%
                                %{--<label class="control-label col-md-3"><message:property--}%
                                        %{--domain="complianceRectificationMerchant"--}%
                                        %{--property="legalPersonNameOld"/>--}%
                                    %{--<span class="required">*</span>--}%
                                %{--</label>--}%

                                %{--<div class="col-md-9">--}%
                                    %{--<input type="text" class="form-control" name="legalPersonNameOld"--}%
                                           %{--value="${complianceRectificationMerchantInstance.legalPersonNameOld}"--}%
                                           %{--required="true" id="legalPersonNameOld" readonly="true">--}%
                                %{--</div>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="row">--}%
                        %{--<div class="col-md-12">--}%
                            %{--<div class="form-group">--}%
                                %{--<label class="control-label col-md-3"><message:property--}%
                                        %{--domain="complianceRectificationMerchant"--}%
                                        %{--property="receiptsNameOld"/>--}%
                                    %{--<span class="required">*</span>--}%
                                %{--</label>--}%

                                %{--<div class="col-md-9">--}%
                                    %{--<input type="text" class="form-control" name="receiptsNameOld"--}%
                                           %{--value="${complianceRectificationMerchantInstance.receiptsNameOld}"--}%
                                           %{--required="true" id="receiptsNameOld" readonly="true">--}%
                                %{--</div>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="row">--}%
                        %{--<div class="col-md-12">--}%
                            %{--<div class="form-group">--}%
                                %{--<label class="control-label col-md-3"><message:property--}%
                                        %{--domain="complianceRectificationMerchant"--}%
                                        %{--property="manageContentOld"/>--}%
                                    %{--<span class="required">*</span>--}%
                                %{--</label>--}%

                                %{--<div class="col-md-9">--}%
                                    %{--<input type="text" class="form-control" name="manageContentOld"--}%
                                           %{--value="${complianceRectificationMerchantInstance.manageContentOld}"--}%
                                           %{--required="true" id="manageContentOld" readonly="true">--}%
                                %{--</div>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="row">--}%
                        %{--<div class="col-md-12">--}%
                            %{--<div class="form-group">--}%
                                %{--<label class="control-label col-md-3"><message:property--}%
                                        %{--domain="complianceRectificationMerchant"--}%
                                        %{--property="manageAddressOld"/>--}%
                                    %{--<span class="required">*</span>--}%
                                %{--</label>--}%

                                %{--<div class="col-md-9">--}%
                                    %{--<input type="text" class="form-control" name="manageAddressOld"--}%
                                           %{--value="${complianceRectificationMerchantInstance.manageAddressOld}"--}%
                                           %{--required="true" id="manageAddressOld" readonly="true">--}%
                                %{--</div>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="row">--}%
                        %{--<div class="col-md-12">--}%
                            %{--<div class="form-group">--}%
                                %{--<label class="control-label col-md-3"><message:property--}%
                                        %{--domain="complianceRectificationMerchant"--}%
                                        %{--property="manageSummaryOld"/>--}%
                                    %{--<span class="required">*</span>--}%
                                %{--</label>--}%

                                %{--<div class="col-md-9">--}%
                                    %{--<input type="text" class="form-control" name="manageSummaryOld"--}%
                                           %{--value="${complianceRectificationMerchantInstance.manageSummaryOld}"--}%
                                           %{--required="true" id="manageSummaryOld" readonly="true">--}%
                                %{--</div>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                %{--</form:body>--}%
            %{--</form:form>--}%
        %{--</portlet:body>--}%
    %{--</div>--}%
    <component:portlet>
    <portlet:title
            title="${message(code: 'customerServiceWorkOrder.operationHistory.label')}"/>

    %{--<div class="portlet-title">--}%
        %{--<div class="caption">--}%
            %{--<i class="icon-folder font-green"></i>--}%
            %{--<span class="caption-subject bold uppercase">${message(code: 'customerServiceWorkOrder.operationHistory.label')}</span>--}%
        %{--</div>--}%
    %{--</div>--}%
    <portlet:body>
        <div class="table-scrollable">
            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>
                <tr>
                    %{--<domainSearchResult:header domain="complianceRectificationMerchant" property="serialNumber"/>--}%
                    <domainSearchResult:header domain="complianceRectificationMerchant" property="stepName"/>
                    %{--<domainSearchResult:header domain="complianceRectificationMerchant" property="handlePerson"/>--}%
                    <domainSearchResult:header domain="complianceRectificationMerchant" property="handleTime"/>
                    <domainSearchResult:header domain="complianceRectificationMerchant" property="managementAdvice"/>
                </tr>
                </thead>
                <tbody><g:each var="complianceRectificationMerchantInstance" status="i"
                               in="${complianceRectificationMerchantInstanceList }">
                    <tr>
                        %{--<td>${i + 1}</td>--}%
                        <domainSearchResult:rowData textAlign="center" type="text" domain="complianceRectificationMerchant" property="stepName"
                                                    domainInstance="${complianceRectificationMerchantInstance }"/>
                        %{--<domainSearchResult:rowData textAlign="center" type="text" domain="complianceRectificationMerchant" property="handlePerson"--}%
                                                    %{--domainInstance="${complianceRectificationMerchantInstance }"/>--}%
                        <domainSearchResult:rowData textAlign="center" type="text" domain="complianceRectificationMerchant" property="handleTime"
                                                    domainInstance="${complianceRectificationMerchantInstance }"/>
                        <domainSearchResult:rowData textAlign="center" type="text" domain="complianceRectificationMerchant" property="managementAdvice"
                                                    domainInstance="${complianceRectificationMerchantInstance }"/>
                    </tr></g:each>
                </tbody>

            </table>
        </div>
        <form:actions>
            %{--<g:link controller="complianceRectificationMerchant" action="index" class="btn btn-return"--}%
            %{--><g:message--}%
                    %{--code="default.button.back.label"/></g:link>--}%


        </form:actions>
    </portlet:body>
    </component:portlet>
    <div class="text-center">
        <button type="button" class="btn btn-return" data-dismiss="modal"><g:message
                code="complianceRectificationMerchant.close.label"/></button>
    </div>
</div>
<div class="modal-footer"></div>