<%@ page import="com.suixingpay.ssp.front.riskcontrol.AssistBillQuery" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title">${message(code: 'assistBillQuery.dispatchTicketDetails.label')}</h4>
</div>

<div class="modal-body">
    <component:portlet>
        <portlet:title
                title="${message(code: 'assistBillQuery.baseInformation.label')}"/>
        <portlet:body withForm="true">
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
                                            code="assistBillQuery.status.${assistBillQueryInstance.orderStatus}"/></p><g:message code="dashBoard.system.colon"></g:message>

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
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><span class="required">*</span>
                                <message:property domain="assistBillQuery"
                                                                                    property="merchantCode"/><g:message code="dashBoard.system.colon"></g:message>

                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static" readonly="true">${assistBillQueryInstance?.merchantCode}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">

                            <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                    property="businessName"/><g:message code="dashBoard.system.colon"></g:message>

                                <span class="required"></span>
                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static" readonly="true">${assistBillQueryInstance?.businessName}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">

                            <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                    property="receiptsName"/><g:message code="dashBoard.system.colon"></g:message>

                                <span class="required"></span>
                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static" readonly="true">${assistBillQueryInstance?.receiptsName}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">

                            <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                    property="belongtodoBusinessBranchCompany"/><g:message code="dashBoard.system.colon"></g:message>

                                <span class="required"></span>
                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static"
                                   readonly="true">${assistBillQueryInstance?.belongtodoBusinessBranchCompany}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">

                            <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                    property="belongtoOrg"/><g:message code="dashBoard.system.colon"></g:message>

                                <span class="required"></span>
                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static" readonly="true">${assistBillQueryInstance?.belongtoOrg}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">

                            <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                    property="directlyOrg"/><g:message code="dashBoard.system.colon"></g:message>

                                <span class="required"></span>
                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static" readonly="true">${assistBillQueryInstance?.directlyOrg}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">

                            <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                    property="salesmanName"/><g:message code="dashBoard.system.colon"></g:message>

                                <span class="required"></span>
                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static" readonly="true">${assistBillQueryInstance?.salesmanName}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">

                            <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                    property="salesmanCode"/><g:message code="dashBoard.system.colon"></g:message>

                                <span class="required"></span>
                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static" readonly="true">${assistBillQueryInstance?.salesmanCode}</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">

                            <label class="control-label col-md-4"><message:property domain="assistBillQuery"
                                                                                    property="doBusinessAddress"/><g:message code="dashBoard.system.colon"></g:message>

                                <span class="required"></span>
                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static"
                                   readonly="true">${assistBillQueryInstance?.doBusinessAddress}</p>
                            </div>
                        </div>
                    </div>

                </form:body>

            </form:form>
        </portlet:body>
    </component:portlet>
    <component:portlet>
        <portlet:title
                title="${message(code: 'assistBillQuery.tradeInformation.label')}"/>
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
                            <domainSearchResult:rowData type="inList" textAlign="center" domain="assistBillQuery" property="tradeType"
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
                    <formCommon:hiddenField name="id" value="${assistBillQueryInstance?.id}"/>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label col-md-4"><span class="required">*</span><message:property domain="assistBillQuery"
                                                                                    property="recoveryTime"/><g:message code="dashBoard.system.colon"></g:message>


                            </label>

                            <div class="col-md-8">
                                <p class="form-control-static">${assistBillQueryInstance?.recoveryTime}</p>
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
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-md-2 control-label"><span class="required">*</span>${message(code: "assistBillQuery.documentRetrieval.label")}<g:message code="dashBoard.system.colon"></g:message>

                                </label>


                                <div class="col-md-10">

                                    <span>针对此类交易，可提供如下材料申请退持卡人或者申请结算：<br>
                                        • 申请结算：则需商户提供持卡人不拒付声明、持卡人正反面身份证复印件和持卡人银行卡正反面复印件；<br>
                                        • 申请退还持卡人：则需商户提供银行协查表。<br></span>

                                </div>
                            </div>
                        </div>
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
                        <div class="col-md-2">
                        </div>
                        <g:if test="${assistBillQueryInstance?.handleWay=='01'}">
                            <input type="radio" name="handleWay" value="01" checked>${message(code:'assistBillQuery.applicationSettlement.label')}
                            <input type="radio" name="handleWay" style="margin-left: 200px"
                                   value="02" >${message(code: 'assistBillQuery.applicationRefundCardholder.label')}
                        </g:if>
                        <g:elseif test="${assistBillQueryInstance?.handleWay=='02'}">
                            <input type="radio" name="handleWay" value="01" >${message(code:'assistBillQuery.applicationSettlement.label')}
                            <input type="radio" name="handleWay" style="margin-left: 200px"
                                   value="02" checked>${message(code: 'assistBillQuery.applicationRefundCardholder.label')}
                        </g:elseif>
                        <g:else>
                            <input type="radio" name="handleWay" value="01" >${message(code:'assistBillQuery.applicationSettlement.label')}
                            <input type="radio" name="handleWay" style="margin-left: 200px"
                                   value="02" >${message(code: 'assistBillQuery.applicationRefundCardholder.label')}
                        </g:else>

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
        <portlet:body>
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
%{--<form:actions>--}%
    <button type="button" class="btn btn-close" data-dismiss="modal"><g:message
            code="assistBillQuery.close.label"/></button>
%{--</form:actions>--}%
</div>
<div class="modal-footer"></div>