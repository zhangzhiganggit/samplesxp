<%@ page import="com.suixingpay.ssp.front.products.IntradayPay" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${alterTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="intradayPay"
                   action="${alterAction}"
                   name="scaffold-${alterAction}-intradayPay">
            <form:scaffoldSearchProperties/>
            <g:if test="${ alterAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${intradayPayInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${intradayPayInstance?.version}"/>
            </g:if>
            <form:body>


                <domainShow:displayString domain="intradayPay" property="merchantCode"
                                      domainInstance="${intradayPayInstance}" required="true"/>
                <domainShow:displayString domain="intradayPay" property="merchantSalesSlipName"
                                      domainInstance="${intradayPayInstance}" required="true"/>
                <domainShow:displayNumber domain="intradayPay" property="availableAmount"
                                      domainInstance="${intradayPayInstance}" required="true"/>
                <domainEdit:textField domain="intradayPay" property="newApplyAmount"
                                      domainInstance="${intradayPayInstance}" required="true"/>
                <domainShow:displayNumber domain="intradayPay" property="intradayPayRate"
                                      domainInstance="${intradayPayInstance}" required="true"/>
                <domainEdit:textField domain="intradayPay" property="newRate"
                                      domainInstance="${intradayPayInstance}" required="true"/>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ alterAction +'.label')}"
                                    btnIconClass="fa fa-${alterAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
