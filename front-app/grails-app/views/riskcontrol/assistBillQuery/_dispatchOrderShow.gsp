<%@ page import="com.suixingpay.ssp.front.riskcontrol.AssistBillQuery" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title">${message(code: 'assistBillQuery.dispatchOrderDetails.label')}</h4>
</div>

<div class="modal-body">
    <component:portlet>
        <portlet:title
                title="${message(code: 'assistBillQuery.baseInformation.label')}"/>
        <portlet:body withForm="true">
            <div class="pictureUploadShow"></div>

            <form:form action="index">
                <form:body>
                    <formCommon:hiddenField name="id" value="${assistBillQueryInstance?.id}"/>
                    <input name="flowNo" value="${assistBillQueryInstance?.flowNo}" hidden="true"/>
                    <input name="type" value="${assistBillQueryInstance?.type}" hidden="true"/>
                    <input name="launchTime" value="${assistBillQueryInstance?.launchTime}" hidden="true"/>
                    %{--<domainShow:displayString domain="assistBillQuery" property="orderNo"--}%
                                              %{--domainInstance="${assistBillQueryInstance}"/>--}%
                    %{--<domainShow:displayString domain="assistBillQuery" property="orderType"--}%
                                              %{--domainInstance="${assistBillQueryInstance}"/>--}%
                    %{--<domainShow:displayString domain="assistBillQuery" property="orderStatus"--}%
                                              %{--domainInstance="${assistBillQueryInstance}"/>--}%
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                        property="orderNo"/><g:message code="dashBoard.system.colon"></g:message>

                                </label>

                                <div class="col-md-8">
                                    <p class="form-control-static" readonly="true">${assistBillQueryInstance?.orderNo}</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                        property="orderType"/><g:message code="dashBoard.system.colon"></g:message>
                                </label>

                                <div class="col-md-8">
                                    <p class="form-control-static" readonly="true"><g:message
                                            code="assistBillQuery.type.${assistBillQueryInstance.orderType}"/></p>

                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                        property="orderStatus"/><g:message code="dashBoard.system.colon"></g:message>

                                </label>

                                <div class="col-md-8">
                                    <p class="form-control-static" readonly="true"><g:message
                                            code="assistBillQuery.status.${assistBillQueryInstance.orderStatus}"/></p>
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
                title="${message(code: 'assistBillQuery.merchantInformation.label')}"/>
        <portlet:body withForm="true">
            <form:form action="index">
                <form:body>
                    <formCommon:hiddenField name="id" value="${assistBillQueryInstance?.id}"/>
                    <domainShow:displayString domain="assistBillQuery" property="merchantCode"
                                              domainInstance="${assistBillQueryInstance}"/>
                    <domainShow:displayString domain="assistBillQuery" property="businessName"
                                              domainInstance="${assistBillQueryInstance}"/>
                    <domainShow:displayString domain="assistBillQuery" property="receiptsName"
                                              domainInstance="${assistBillQueryInstance}"/>
                    <domainShow:displayString domain="assistBillQuery" property="belongtodoBusinessBranchCompany"
                                              domainInstance="${assistBillQueryInstance}"/>
                    <domainShow:displayString domain="assistBillQuery" property="belongtoOrg"
                                              domainInstance="${assistBillQueryInstance}"/>
                    <domainShow:displayString domain="assistBillQuery" property="directlyOrg"
                                              domainInstance="${assistBillQueryInstance}"/>
                    <domainShow:displayString domain="assistBillQuery" property="salesmanName"
                                              domainInstance="${assistBillQueryInstance}"/>
                    <domainShow:displayString domain="assistBillQuery" property="salesmanCode"
                                              domainInstance="${assistBillQueryInstance}"/>
                    <domainShow:displayString domain="assistBillQuery" property="doBusinessAddress"
                                              domainInstance="${assistBillQueryInstance}"/>
                </form:body>

            </form:form>
        </portlet:body>
    </component:portlet>
    <component:portlet>
        <portlet:title
                title="${message(code: 'assistBillQuery.billtrade.label')}"/>
        <portlet:body>
            <div class="table-scrollable">
                <table class="table table-striped table-bordered table-hover dataTable no-footer">
                    <thead>
                        <tr>
                            <domainSearchResult:header domain="assistBillQuery" property="merchantCode"/>
                            <domainSearchResult:header domain="assistBillQuery" property="tradeCard"/>
                            <domainSearchResult:header domain="assistBillQuery" property="cardType"/>
                            <domainSearchResult:header domain="assistBillQuery" property="tradeType"/>
                            <domainSearchResult:header domain="assistBillQuery" property="tradeAmount"/>
                            <domainSearchResult:header domain="assistBillQuery" property="tradeTime"/>
                            <domainSearchResult:header domain="assistBillQuery" property="batchNumber"/>
                            <domainSearchResult:header domain="assistBillQuery" property="serial"/>
                            <domainSearchResult:header domain="assistBillQuery" property="terminalNumber"/>
                            <domainSearchResult:header domain="assistBillQuery" property="tradeStatus"/>
                            <domainSearchResult:header domain="assistBillQuery" property="transactionIdentifier"/>
                        </tr>
                    </thead>
                    <tbody><g:each var="assistBillQueryInstance"
                                   in="${assistBillQueryInstanceList}">
                        <tr>
                            <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="merchantCode"
                                                        domainInstance="${assistBillQueryInstance}"/>
                            <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="tradeCard"
                                                        domainInstance="${assistBillQueryInstance}"/>
                            <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="cardType"
                                                        domainInstance="${assistBillQueryInstance}"/>
                            <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="tradeType"
                                                        domainInstance="${assistBillQueryInstance}"/>
                            <domainSearchResult:rowData type="text" textAlign="right" domain="assistBillQuery" property="tradeAmount"
                                                        domainInstance="${assistBillQueryInstance}"/>
                            <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="tradeTime"
                                                        domainInstance="${assistBillQueryInstance}"/>
                            <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="batchNumber"
                                                        domainInstance="${assistBillQueryInstance}"/>
                            <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="serial"
                                                        domainInstance="${assistBillQueryInstance}"/>
                            <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="terminalNumber"
                                                        domainInstance="${assistBillQueryInstance}"/>
                            <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="tradeStatus"
                                                        domainInstance="${assistBillQueryInstance}"/>
                            <domainSearchResult:rowData type="text" textAlign="center" domain="assistBillQuery" property="transactionIdentifier"
                                                        domainInstance="${assistBillQueryInstance}"/>
                        </tr></g:each>
                    </tbody>
                </table>
            </div>
        </portlet:body>
    </component:portlet>
    <component:portlet>
        <portlet:title
                title="${message(code: 'assistBillQuery.handleRequirement.label')}"/>
        <portlet:body withForm="true">
            <form:form action="index">
                <form:body>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                    property="launchDate"/><g:message code="dashBoard.system.colon"></g:message>

                                <span class="required"></span>
                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static"
                                   readonly="true">${assistBillQueryInstance?.launchDate}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">

                            <label class="control-label col-md-4">   <span class="required">*</span><message:property domain="assistBillQuery"
                                                                                    property="recoveryTime"/><g:message code="dashBoard.system.colon"></g:message>

                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static"
                                   readonly="true">${assistBillQueryInstance?.recoveryTime}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                    property="reasonCode"/><g:message code="dashBoard.system.colon"></g:message>

                                <span class="required"></span>
                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static"
                                   readonly="true">${assistBillQueryInstance?.reasonCode}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-8">

                        <div class="form-group">
                            <label class="col-md-2 control-label">
                                <message:property domain="assistBillQuery" property="requirement"/><g:message code="dashBoard.system.colon"></g:message>

                                %{--<span class="required">*</span>--}%
                            </label>

                            <div class="col-md-10 ">
                                <g:textField class="form-control" name="linkman"
                                             value="${assistBillQueryInstance?.requirement}"
                                             id="requirement" required="required" readonly="true"/>
                            </div>
                        </div>
                    </div>

                </form:body>
            </form:form>
        </portlet:body>
    </component:portlet>
    <component:portlet>
        <portlet:title
                title="${message(code: 'assistBillQuery.dataUpload.label')}"/>
        <portlet:body withForm="true">
            <form:form action="index">
                <form:body>
                    <div class="row">
                        <b>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="col-md-2 control-label"><span class="required">*</span>${message(code: "assistBillQuery.dataUploadDescription.label")}<g:message code="dashBoard.system.colon"></g:message>

                                    </label>
                                    <div class="col-md-10">
                                        <span>
                                            <p style="margin-left: 5px">1、如果有签购单，请提供签购单照片。</p>

                                            <p style="margin-left: 5px">2、如果没有签购单，可提供持银行协查表、持卡人不拒付声明、持卡人身份证正反面照片、交易银行卡正反面照片、录像、商户资料等交易有力证据。</p>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </b>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-md-2 control-label">${message(code: "assistBillQuery.templateFileDownload.label")}<g:message code="dashBoard.system.colon"></g:message>

                                </label>

                                <div class="col-md-10">
                                    <g:link controller="download" params='[filePath: "excelTemplate/${message(code:'assistBillQuery.bankInvestigationTable.templete.file')}",
                                            fileName: "${message(code:'assistBillQuery.bankInvestigationTable.file')}", isAbsolutePath: ""]' >
                                        ${message(code: 'assistBillQuery.bankInvestigationTable.label')}
                                    </g:link>
                                    <g:link style="margin-left:150px" controller="download" params='[filePath: "excelTemplate/${message(code:'assistBillQuery.cardholderIsNotStatement.templete.file')}",
                                            fileName: "${message(code:'assistBillQuery.cardholderIsNotStatement.file')}", isAbsolutePath: ""]' >
                                        ${message(code: 'assistBillQuery.cardholderIsNotStatement.label')}
                                    </g:link>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-md-2 control-label">${message(code: "assistBillQuery.dataUpload.label")}<g:message code="dashBoard.system.colon"></g:message>

                                </label>
                                <div class="col-md-10" >
                                    <g:if test="${allFiles!= null}">
                                        <g:link controller="assistBillQuery" action="downLoadZip"
                                                params='[flowNo: "${assistBillQueryInstance.flowNo}", launchTime: "${assistBillQueryInstance.launchTime}"]' >
                                            ${message(code: 'assistBillQuery.file.downloadZip.label')}
                                        </g:link>
                                    </g:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                </label>
                                <div class="col-md-10" class="files">
                                    <g:each var="file" status="i" in="${allFiles}" >
                                    %{--<g:if test="${i!=0 && (i+1)%4==0}"><hr/></g:if>--}%
                                        <a class="col-md-3 grouped_elements" rel="group1" href="/assistBillQuery/viewImage?title=${file.path}"><img width="150px" height="150px" src="<g:createLink controller="assistBillQuery" action="viewImage" params='[title: "${file.path}"]'/>" alt=""/></a>
                                        %{--<div class="col-md-3"><img width="150px" height="150px" src="<g:createLink controller="assistBillQuery" action="viewImage" params='[title: "${file.path}"]'/>"/></div>--}%
                                    </g:each>
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
                title="${message(code: 'assistBillQuery.operationHistory.label')}"/>
        <portlet:body withForm="true">
            <div class="table-scrollable">
                <table class="table table-striped table-bordered table-hover dataTable no-footer">
                    <thead>
                    <tr>
                        <domainSearchResult:header domain="assistBillQuery" property="stepName"/>
                        <domainSearchResult:header domain="assistBillQuery" property="handlePerson"/>
                        <domainSearchResult:header domain="assistBillQuery" property="handleTime"/>
                        <domainSearchResult:header domain="assistBillQuery" property="handleSuggestion"/>
                    </tr>
                    </thead>
                    <tbody><g:each var="assistBillQueryInstance"
                                   in="${operationList}">
                        <tr>

                            <domainSearchResult:rowData textAlign="center" type="text" domain="assistBillQuery" property="stepName"
                                                        domainInstance="${assistBillQueryInstance}"/>
                            <domainSearchResult:rowData textAlign="center" type="text" domain="assistBillQuery" property="handlePerson"
                                                        domainInstance="${assistBillQueryInstance}"/>
                            <domainSearchResult:rowData textAlign="center" type="text" domain="assistBillQuery" property="handleTime"
                                                        domainInstance="${assistBillQueryInstance}"/>
                            <domainSearchResult:rowData textAlign="center" type="text" domain="assistBillQuery" property="handleSuggestion"
                                                        domainInstance="${assistBillQueryInstance}"/>
                        </tr></g:each>
                    </tbody>
                </table>
            </div>

        </portlet:body>

    </component:portlet>
    <button type="button" class="btn btn-close" data-dismiss="modal"><g:message
            code="assistBillQuery.close.label"/></button>
</div>
<div class="modal-footer"></div>