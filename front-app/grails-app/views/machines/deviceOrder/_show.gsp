<%@ page import="com.suixingpay.ssp.front.machines.DeviceOrder" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'deviceOrder'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${deviceOrderInstance?.id}"/>
                

                
                <domainShow:displayNumber domain="deviceOrder" property="bounty"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayString domain="deviceOrder" property="communicationMode"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayNumber domain="deviceOrder" property="discount"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayString domain="deviceOrder" property="factoryName"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayNumber domain="deviceOrder" property="freeLimitNum"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayString domain="deviceOrder" property="goodsName"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayNumber domain="deviceOrder" property="isBounty"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayNumber domain="deviceOrder" property="isCredit"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayNumber domain="deviceOrder" property="isDiscount"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayNumber domain="deviceOrder" property="isFree"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayNumber domain="deviceOrder" property="minimumOfPack"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayNumber domain="deviceOrder" property="minmumOfAmount"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayString domain="deviceOrder" property="model"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayString domain="deviceOrder" property="nonContact"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayNumber domain="deviceOrder" property="numberOfBegin"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayNumber domain="deviceOrder" property="numberOfEnd"
                                          domainInstance="${deviceOrderInstance}"/>
                

                
                <domainShow:displayNumber domain="deviceOrder" property="subPrice"
                                          domainInstance="${deviceOrderInstance}"/>
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
