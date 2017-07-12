<%@ page import="com.suixingpay.ssp.front.products.SecondsReceived" %>
<div class="modal-header ">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title">结算限额查看</h4>
</div>
<component:portlet cssClass="scaffold-show">
    <div class="modal-body ">
        <portlet:title title="单笔限额"></portlet:title>
        <portlet:body withForm="true">
            <form:form action="index" params="[]">
                <form:body>
                    <domainShow:displayString domain="secondsReceived" property="mgDdSingleLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                    <domainShow:displayString domain="secondsReceived" property="mgCdSingleLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                    <domainShow:displayString domain="secondsReceived" property="icDdSingleLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                    <domainShow:displayString domain="secondsReceived" property="icCdSingleLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                </form:body>
            </form:form>
        </portlet:body>
    </div>
</component:portlet>
<component:portlet cssClass="scaffold-show">
    <div class="modal-body ">
        <portlet:title title="单卡单日限额"></portlet:title>
        <portlet:body withForm="true">
            <form:form action="index" params="[]">
                <form:body>
                    <domainShow:displayString domain="secondsReceived" property="mgDdSingleCardLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                    <domainShow:displayString domain="secondsReceived" property="mgCdSingleCardLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                    <domainShow:displayString domain="secondsReceived" property="icDdSingleCardLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                    <domainShow:displayString domain="secondsReceived" property="icCdSingleCardLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                </form:body>
            </form:form>
        </portlet:body>
    </div>
</component:portlet>
<component:portlet cssClass="scaffold-show">
    <div class="modal-body ">
        <portlet:title title="日累计限额"></portlet:title>
        <portlet:body withForm="true">
            <form:form action="index" params="[]">
                <form:body>
                    <domainShow:displayString domain="secondsReceived" property="mgDdDayLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                    <domainShow:displayString domain="secondsReceived" property="mgCdDayLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                    <domainShow:displayString domain="secondsReceived" property="icDdDayLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                    <domainShow:displayString domain="secondsReceived" property="icCdDayLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                </form:body>
            </form:form>
        </portlet:body>
    </div>
</component:portlet>
<component:portlet cssClass="scaffold-show">
    <div class="modal-body ">
        <portlet:title title="月累计限额"></portlet:title>
        <portlet:body withForm="true">
            <form:form action="index" params="[]">
                <form:body>
                    <domainShow:displayString domain="secondsReceived" property="mgDdMonthLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                    <domainShow:displayString domain="secondsReceived" property="mgCdMonthLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                    <domainShow:displayString domain="secondsReceived" property="icDdMonthLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                    <domainShow:displayString domain="secondsReceived" property="icCdMonthLimit"
                                              domainInstance="${secondsReceivedInstance}"/>
                </form:body>
            </form:form>
        </portlet:body>
    </div>
</component:portlet>
<button type="button" class="btn btn-cancle center-block" data-dismiss="modal"><g:message code="secondsReceived.return.label"></g:message> </button>