<li class="heading" id="riskcontrolSideBar">
    <h3 class="uppercase">风控</h3>
</li>
<sec:access expression="hasRole('ROLE_AUTH_MERCHANT_RISK_STATUS_1')">
    <menu:rootMenu controller="merchantRiskControlStatusManagement" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_ASSIST_BILL_QUERY')">
    <menu:rootMenu controller="assistBillQuery" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_RISK_CLUE_PROVIDE')">
    <menu:rootMenu controller="riskClueProvide" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_RECOVERY_QUERY')">
    <menu:rootMenu controller="recoveryQuery" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_COMPLIANCE_RECTIFICATION')">
    <menu:rootMenu controller="complianceRectificationMerchant" action="index"/>
</sec:access>