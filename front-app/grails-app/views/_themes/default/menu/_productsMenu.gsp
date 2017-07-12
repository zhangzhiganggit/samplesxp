<li class="heading" id="productsSideBar">
    <h3 class="uppercase">产品</h3>
</li>
<sec:access expression="hasRole('ROLE_AUTH_HOLIDAY_PAY')">
    <menu:rootMenu controller="holidayPay" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_INTRADAY_PAY')">
    <menu:rootMenu controller="intradayPay" action="index"/>
</sec:access>
<sec:ifAnyGranted roles="ROLE_PRODUCT_MANAGER,ROLE_SYSTEM_ONE,ROLE_SYSTEM_NOT_ONE,ROLE_AUTH_SUIYITONG_MERCHANT,ROLE_AUTH_SUIYITONG_AGENT,ROLE_AUTH_SUIYITONG_AUDITDATAQUERY,ROLE_AUTH_SUIYITONG_MERCHANT_AMOUNT_USED">
    <secMenu:canViewSuiYiTong>
    <li class="nav-item">
        <a href="javascript:;" class="nav-link nav-toggle">
            <i class="icon-credit-card"></i>
            <span class="title">随意通管理</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">
            <sec:access expression="hasRole('ROLE_AUTH_SUIYITONG_MERCHANT')">
                <menu:rootMenu controller="suiYiTongMerchant" action="index"/>
            </sec:access>
            <sec:access expression="hasRole('ROLE_AUTH_SUIYITONG_AGENT')">
                <menu:rootMenu controller="suiYiTongAgent" action="index"/>
            </sec:access>
            <sec:access expression="hasRole('ROLE_AUTH_SUIYITONG_AUDITDATAQUERY')">
                <menu:rootMenu controller="suiYiTongAuditDataQuery" action="index"/>
            </sec:access>
            <sec:access expression="hasRole('ROLE_AUTH_SUIYITONG_MERCHANT_AMOUNT_USED')">
                <menu:rootMenu controller="merchantAmountUsed" action="index"/>
            </sec:access>
        </ul>
    </li>
    </secMenu:canViewSuiYiTong>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_PRODUCT_MANAGER,ROLE_SYSTEM_ONE,ROLE_SYSTEM_NOT_ONE,ROLE_AUTH_MAINTENANCE_FEE_MERCHANT,ROLE_AUTH_MAINTENANCE_COST_ORDER">
    <li class="nav-item">
        <a href="javascript:;" class="nav-link nav-toggle">
            <i class="icon-wallet"></i>
            <span class="title">维护费管理</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">
            <sec:access expression="hasRole('ROLE_AUTH_MAINTENANCE_FEE_MERCHANT')">
                <menu:rootMenu controller="maintenanceFeeMerchant" action="index"/>
            </sec:access>
            <sec:access expression="hasRole('ROLE_AUTH_MAINTENANCE_COST_ORDER')">
                <menu:rootMenu controller="maintenanceCostOrder" action="index"/>
            </sec:access>
        </ul>
    </li>
</sec:ifAnyGranted>
<sec:access expression="hasRole('ROLE_AUTH_SECONDS_RECEIVED')">
    <menu:rootMenu controller="secondsReceived" action="index"/>
</sec:access>
