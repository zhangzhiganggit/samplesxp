<%@ page import="com.suixingpay.ssp.front.riskcontrol.MerchantRiskControlStatusManagement" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${merchantRiskControlStatusManagement.frozenTradeManagementFronzen.label}"/>
    <portlet:body withForm="true">
        <form:form controller="merchantRiskControlStatusManagement"
                   action="${formAction}"
                   name="scaffold-${formAction}-merchantRiskControlStatusManagement">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${merchantRiskControlStatusManagementInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${merchantRiskControlStatusManagementInstance?.version}"/>
            </g:if>
            <form:body>
                <div class="row">

                    <domainShow:displayString domain="merchantRiskControlStatusManagement" property="frozenSeaon"
                                              domainInstance="${merchantRiskControlStatusManagementInstance}"/>
                </div>
                <div class="row">

                 <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">${message(code:"merchantRiskControlStatusManagement.remark.label")}</label>
                                <div class="col-md-8">
                                    <textarea class="form-control" domain="merchantRiskControlStatusManagement"    property="remark" rows="7"></textarea>
                                </div>
                                </div>
                            </div>
                </div>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'merchantRiskControlStatusManagement.canle.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
            <form:actions>
                <formActions:submit value="${message(code: 'merchantRiskControlStatusManagement.sure.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
