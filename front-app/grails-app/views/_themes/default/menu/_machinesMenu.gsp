<li class="heading" id="machinesSideBar">
    <h3 class="uppercase">机具</h3>

</li>
<sec:access expression="hasRole('ROLE_AUTH_DEVICE_ORDER')">
    <menu:rootMenu controller="deviceOrder" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_ORDER_QUERY')">
    <menu:rootMenu controller="ordersQuery" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_INVENTORY')">
    <menu:rootMenu controller="inventoryManagement" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_CARD_QUERY')">
    <menu:rootMenu controller="cardManagement" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_TERMINAL_QUERY')">
    <menu:rootMenu controller="terminalQuery" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_ATTACHED_QUERY')">
    <menu:rootMenu controller="attachedQuery" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_PAY_COST_MANAGEMENT')">
    <menu:rootMenu controller="payCostManagement" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_CREDITINFO')">
    <menu:rootMenu controller="creditInfo" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AURH_HAPPY_SONG_EQUIPMENT')">
    <menu:rootMenu controller="happyToSendDevice" action="index"/>
</sec:access>
