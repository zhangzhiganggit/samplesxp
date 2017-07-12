<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.HandBrushMerchantManagement" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'handBrushMerchantManagement.baseInformation.label', args: message.domain(domain: 'handBrushMerchantManagement'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${handBrushMerchantManagementInstance?.id}"/>

                <domainShow:displayString domain="handBrushMerchantManagement" property="merchantCode"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                <domainShow:displayString domain="handBrushMerchantManagement" property="businessName"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                <domainShow:displayString domain="handBrushMerchantManagement" property="mobileNo"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>



                <domainShow:displayString domain="handBrushMerchantManagement" property="idCardName"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                <domainShow:displayString domain="handBrushMerchantManagement" property="idCardNo"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                <domainShow:displayString domain="handBrushMerchantManagement" property="realnameAuthenticationStatus"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>

                <domainShow:displayString domain="handBrushMerchantManagement" property="merchantExpandType"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                <domainShow:displayString domain="handBrushMerchantManagement" property="businessWay"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                <domainShow:displayString domain="handBrushMerchantManagement" property="longitude"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                <domainShow:displayString domain="handBrushMerchantManagement" property="latitude"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                <domainShow:displayString domain="handBrushMerchantManagement" property="merchantStatus"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>

                <domainShow:displayString domain="handBrushMerchantManagement" property="tradeStatus"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                <domainShow:displayString domain="handBrushMerchantManagement" property="payStatus"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                <domainShow:displayString domain="handBrushMerchantManagement" property="immediatelyPushImmediatelyReachStatus"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>

                <domainShow:displayString domain="handBrushMerchantManagement" property="createTime"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                <domainShow:displayString domain="handBrushMerchantManagement" property="merchantSource"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                <domainShow:displayString domain="handBrushMerchantManagement" property="localarea"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                <div class="row"
                <domainShow:displayString domain="handBrushMerchantManagement" property="registAddress"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                </div>
            </form:body>
        %{--<form:actions>--}%
        %{--<formActions:submit value="${message(code: 'default.button.back.label')}"/>--}%
        %{--</form:actions>--}%
        </form:form>
    </portlet:body>

    <portlet:title
            title="${message(code: 'handBrushMerchantManagement.rateInformation.label', args: message.domain(domain: 'handBrushMerchantManagement'))}"/>
    <portlet:body withForm="true">


        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${handBrushMerchantManagementInstance?.id}"/>

                <domainShow:displayString domain="handBrushMerchantManagement" property="rate"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                <domainShow:displayString domain="handBrushMerchantManagement" property="whetherCap"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
                <domainShow:displayString domain="handBrushMerchantManagement" property="capAmt"
                                          domainInstance="${handBrushMerchantManagementInstance}"/>
            </form:body>
        %{--<form:actions>--}%
        %{--<formActions:submit value="${message(code: 'default.button.back.label')}"/>--}%
        %{--</form:actions>--}%
        </form:form>
    </portlet:body>



    <portlet:title title="${message(code: 'default.searchResult.label', args: message.domain(domain: 'handBrushMerchantManagement'))}"
                   iconCssClass="fa fa-filter"/>
    <portlet:body>
        <domainShow:displayString domain="handBrushMerchantManagement" property="bindingEquipment"
                                  domainInstance="${handBrushMerchantManagementInstance}"/>

        <div class="table-scrollable">

            <table class="table table-striped table-bordered table-hover dataTable no-footer">
                <thead>

                <tr>

                    <domainSearchResult:header domain="handBrushMerchantManagement" property="model"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="terminalNumber"/>
                    <domainSearchResult:header domain="handBrushMerchantManagement" property="sn"/>

                </tr>
                </thead>
                <tbody><g:each var="handBrushMerchantManagementInstance"
                               in="${handBrushMerchantManagementInstanceList }">
                    <tr>

                        <domainSearchResult:rowData type="text" domain="handBrushMerchantManagement" property="model"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData type="text" domain="handBrushMerchantManagement" property="terminalNumber"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                        <domainSearchResult:rowData type="text" domain="handBrushMerchantManagement" property="sn"
                                                    domainInstance="${handBrushMerchantManagementInstance }"/>
                    </tr></g:each>
                </tbody>
            </table>
            <form:actions>
                <formActions:submit value="${message(code: 'handBrushMerchantManagement.close.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </div>
    </portlet:body>

</component:portlet>
