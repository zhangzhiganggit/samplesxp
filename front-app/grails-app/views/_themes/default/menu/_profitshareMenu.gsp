<sec:ifAnyGranted
        roles="ROLE_SYSTEM_ONE,ROLE_AUTH_HISTORY_PROFIT,ROLE_AUTH_THIS_MONTH_PROFIT,ROLE_AUTH_MENTHOD_PROFIT_DETAIL">
    <li class="heading" id="profitshareSideBar">
        <h3 class="uppercase">分润</h3>
    </li>
</sec:ifAnyGranted>
<sec:access expression="hasRole('ROLE_AUTH_THIS_MONTH_PROFIT')">
    <menu:rootMenu controller="thisMonthProfit" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_HISTORY_PROFIT')">
    <menu:rootMenu controller="historyProfit" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_MENTHOD_PROFIT_DETAIL')">
    <menu:rootMenu controller="menthodProfitDetail" action="index"/>
</sec:access>