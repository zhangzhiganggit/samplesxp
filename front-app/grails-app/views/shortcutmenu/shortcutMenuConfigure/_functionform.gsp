<div id="tree_menu" class="tree-demo">
    <ul>
<sec:ifAnyGranted roles="ROLE_RECORD,ROLE_MERCHANT_MANAGER,ROLE_SALESMAN,ROLE_SYSTEM_ONE,ROLE_SYSTEM_NOT_ONE,ROLE_AUTH_POS_MERCHANT,ROLE_AUTH_HAND_MERCHANT,ROLE_AUTH_OTHER_MERCHANT,ROLE_AUTH_POS_TRADE,ROLE_AUTH_HAND_TRADE,ROLE_AUTH_OTHER_TRADE,ROLE_AUTH_POS_SETTLE,ROLE_AUTH_HAND_SETTLE,ROLE_AUTH_OTHER_SETTLE,ROLE_AUTH_HAND_VALID">
        <li data-jstree='{"disabled" : true }'> 商户
            <ul>
            <sec:access expression="hasRole('ROLE_AUTH_MERCHANT_COME_IN')">
                <li data-jstree='{"type" : "file" }' id="function_merchantIncome_create" data-menucontroller="merchantIncome" data-menuaction="create"> <message:controllerAction controller="merchantIncome" action="create"/> </li>
            </sec:access>
            <sec:access expression="hasRole('ROLE_AUTH_MERCHANT_COME_IN')">
                <li data-jstree='{"type" : "file" }' id="function_merchantSmallAndMicro_create" data-menucontroller="merchantSmallAndMicro" data-menuaction="create"> <message:controller controller="merchantSmallAndMicro" action="create"/> </li>
            </sec:access>
            %{--<li data-jstree='{"type" : "file" }' id="function_merchantIncomeModify_edit" data-menucontroller="merchantIncomeModify" data-menuaction="edit"> <message:controllerAction controller="merchantIncomeModify" action="edit"/> </li>--}%
            <sec:ifAnyGranted
                    roles="ROLE_AUTH_POS_MERCHANT,ROLE_AUTH_HAND_MERCHANT,ROLE_AUTH_OTHER_MERCHANT,ROLE_AUTH_POS_TRADE,ROLE_AUTH_HAND_TRADE,ROLE_AUTH_OTHER_TRADE,ROLE_AUTH_POS_SETTLE,ROLE_AUTH_HAND_SETTLE,ROLE_AUTH_OTHER_SETTLE,ROLE_AUTH_HAND_VALID">
                <li data-jstree='{ "disabled" : true }'> 商户修改
                    <ul>
                        <sec:access expression="hasRole('ROLE_AUTH_POS_MERCHANT')">
                            <li data-jstree='{"type" : "file" }' id="function_merchantIncomeModify_edit" data-menucontroller="merchantIncomeModify" data-menuaction="edit"> <message:controllerAction controller="merchantIncomeModify" action="edit"/> </li>
                        </sec:access>
                        <sec:access expression="hasRole('ROLE_AUTH_HAND_MERCHANT')">
                            <li data-jstree='{"type" : "file" }' id="function_merchantSmallTransPos_edit" data-menucontroller="merchantSmallTransPos" data-menuaction="index"> <message:controllerAction controller="merchantSmallTransPos" action="index"/> </li>
                        </sec:access>
                    </ul>
                </li>
                <li data-jstree='{ "disabled" : true }'> 商户管理
                    <ul>
                <sec:access expression="hasRole('ROLE_AUTH_POS_MERCHANT')">
                    <li data-jstree='{"type" : "file" }' id="function_merchantManagement_index" data-menucontroller="merchantManagement" data-menuaction="index"> <message:controller controller="merchantManagement"/> </li>
                </sec:access>
                <sec:access expression="hasRole('ROLE_AUTH_HAND_MERCHANT')">
                    <li data-jstree='{"type" : "file" }' id="function_handBrushMerchantManagement_index" data-menucontroller="handBrushMerchantManagement" data-menuaction="index"> <message:controller controller="handBrushMerchantManagement"/> </li>
                </sec:access>
                <sec:access expression="hasRole('ROLE_AUTH_OTHER_MERCHANT')">
                    <li data-jstree='{"type" : "file" }' id="function_otherConsumeMerchantManagement_index" data-menucontroller="otherConsumeMerchantManagement" data-menuaction="index"> <message:controller controller="otherConsumeMerchantManagement"/> </li>
                </sec:access>
                <sec:access expression="hasRole('ROLE_AUTH_HAND_VALID')">
                    <li data-jstree='{"type" : "file" }' id="function_MPosValidMerchantManagement_index" data-menucontroller="MPosValidMerchantManagement" data-menuaction="index"> <message:controller controller="MPosValidMerchantManagement"/> </li>
                </sec:access>
                    </ul>
                </li>
                <li data-jstree='{ "disabled" : true }'> 交易管理
                    <ul>
                <sec:access expression="hasRole('ROLE_AUTH_POS_TRADE')">
                        <li data-jstree='{"type" : "file" }' id="function_posTrade_index" data-menucontroller="posTrade" data-menuaction="index"> <message:controller controller="posTrade"/> </li>
                </sec:access>
                <sec:access expression="hasRole('ROLE_AUTH_HAND_TRADE')">
                        <li data-jstree='{"type" : "file" }' id="function_MPosTrade_index" data-menucontroller="MPosTrade" data-menuaction="index"> <message:controller controller="MPosTrade"/> </li>
                </sec:access>
                <sec:access expression="hasRole('ROLE_AUTH_OTHER_TRADE')">
                        <li data-jstree='{"type" : "file" }' id="function_otherConsumeTrade_index" data-menucontroller="otherConsumeTrade" data-menuaction="index"> <message:controller controller="otherConsumeTrade"/> </li>
                </sec:access>
                    </ul>
                </li>
                <li data-jstree='{ "disabled" : true }'> 结算管理
                    <ul>
                <sec:access expression="hasRole('ROLE_AUTH_POS_SETTLE')">
                        <li data-jstree='{"type" : "file" }' id="function_posSettle_index" data-menucontroller="posSettle" data-menuaction="index"> <message:controller controller="posSettle"/> </li>
                </sec:access>
                <sec:access expression="hasRole('ROLE_AUTH_HAND_SETTLE')">
                        <li data-jstree='{"type" : "file" }' id="function_MPosSettle_index" data-menucontroller="MPosSettle" data-menuaction="index"> <message:controller controller="MPosSettle"/> </li>
                </sec:access>
                <sec:access expression="hasRole('ROLE_AUTH_OTHER_SETTLE')">
                        <li data-jstree='{"type" : "file" }' id="function_otherConsumeSettle_index" data-menucontroller="otherConsumeSettle" data-menuaction="index"> <message:controller controller="otherConsumeSettle"/> </li>
                </sec:access>
                    </ul>
                </li>
                <sec:access expression="hasRole('ROLE_AUTH_MERCHANT_AUDIT')">
                     <li data-jstree='{"type" : "file" }' id="function_merchantAudit_index" data-menucontroller="merchantAudit" data-menuaction="index"> <message:controller controller="merchantAudit"/> </li>
                </sec:access>
                <sec:access expression="hasRole('ROLE_AUTH_MERCHANT_TERMINAL')">
                    <li data-jstree='{"type" : "file" }' id="function_merchantTerminalManagement_index" data-menucontroller="merchantTerminalManagement" data-menuaction="index"> <message:controller controller="merchantTerminalManagement"/> </li>
                </sec:access>
                <sec:access expression="hasRole('ROLE_AUTH_CUSTOMER_SERVICE')">
                    <li data-jstree='{"type" : "file" }' id="function_customerServiceWorkOrder_index" data-menucontroller="customerServiceWorkOrder" data-menuaction="index"> <message:controller controller="customerServiceWorkOrder"/> </li>
                </sec:access>
                </sec:ifAnyGranted>
            </ul>
        </li>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_RISK_MANAGER,ROLE_SALESMAN,ROLE_SYSTEM_ONE,ROLE_SYSTEM_NOT_ONE,ROLE_AUTH_MERCHANT_RISK_STATUS_1,ROLE_AUTH_ASSIST_BILL_QUERY,ROLE_AUTH_RISK_CLUE_PROVIDE,ROLE_AUTH_RECOVERY_QUERY,ROLE_AUTH_COMPLIANCE_RECTIFICATION">
        <li data-jstree='{"disabled" : true }'>风控
            <ul>
    <sec:access expression="hasRole('ROLE_AUTH_MERCHANT_RISK_STATUS_1')">
                <li data-jstree='{"type" : "file" }' id="function_merchantRiskControlStatusManagement_index" data-menucontroller="merchantRiskControlStatusManagement" data-menuaction="index"> <message:controller controller="merchantRiskControlStatusManagement"/> </li>
    </sec:access>
    <sec:access expression="hasRole('ROLE_AUTH_ASSIST_BILL_QUERY')">
                <li data-jstree='{"type" : "file" }' id="function_assistBillQuery_index" data-menucontroller="assistBillQuery" data-menuaction="index"> <message:controller controller="assistBillQuery"/> </li>
    </sec:access>
    <sec:access expression="hasRole('ROLE_AUTH_RISK_CLUE_PROVIDE')">
                <li data-jstree='{"type" : "file" }' id="function_riskClueProvide_index" data-menucontroller="riskClueProvide" data-menuaction="index"> <message:controller controller="riskClueProvide"/> </li>
    </sec:access>
    <sec:access expression="hasRole('ROLE_AUTH_RECOVERY_QUERY')">
                <li data-jstree='{"type" : "file" }' id="function_recoveryQuery_index" data-menucontroller="recoveryQuery" data-menuaction="index"> <message:controller controller="recoveryQuery" /> </li>
    </sec:access>
    <sec:access expression="hasRole('ROLE_AUTH_COMPLIANCE_RECTIFICATION')">
                <li data-jstree='{"type" : "file" }' id="function_complianceRectificationMerchant_index" data-menucontroller="complianceRectificationMerchant" data-menuaction="index"> <message:controller controller="complianceRectificationMerchant"/> </li>
    </sec:access>
            </ul>
        </li>
</sec:ifAnyGranted>
<sec:ifAnyGranted
        roles="ROLE_SYSTEM_ONE,ROLE_AUTH_HISTORY_PROFIT,ROLE_AUTH_THIS_MONTH_PROFIT,ROLE_AUTH_MENTHOD_PROFIT_DETAIL">
        <li data-jstree='{"disabled" : true }'>分润
             <ul>
            <sec:access expression="hasRole('ROLE_AUTH_THIS_MONTH_PROFIT')">
                <li data-jstree='{"type" : "file" }' id="function_thisMonthProfit_index" data-menucontroller="thisMonthProfit" data-menuaction="index"> <message:controller controller="thisMonthProfit"/> </li>
            </sec:access>
            <sec:access expression="hasRole('ROLE_AUTH_HISTORY_PROFIT')">
                <li data-jstree='{"type" : "file" }' id="function_historyProfit_index" data-menucontroller="historyProfit" data-menuaction="index"> <message:controller controller="historyProfit"/> </li>
            </sec:access>
            <sec:access expression="hasRole('ROLE_AUTH_MENTHOD_PROFIT_DETAIL')">
                <li data-jstree='{"type" : "file" }' id="function_menthodProfitDetail_index" data-menucontroller="menthodProfitDetail" data-menuaction="index"> <message:controller controller="menthodProfitDetail"/> </li>
            </sec:access>
             </ul>
        </li>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_MACHINES_MANAGER,ROLE_SYSTEM_ONE,ROLE_SYSTEM_NOT_ONE,ROLE_AUTH_DEVICE_ORDER,ROLE_AUTH_ORDER_QUERY,ROLE_AUTH_TERMINAL_QUERY,ROLE_AUTH_INVENTORY,ROLE_AUTH_ATTACHED_QUERY,ROLE_AUTH_CREDITINFO,ROLE_AUTH_PAY_COST_MANAGEMENT">
        <li data-jstree='{"disabled" : true }'>机具
            <ul>
    <sec:access expression="hasRole('ROLE_AUTH_DEVICE_ORDER')">
                <li data-jstree='{"type" : "file" }' id="function_deviceOrder_index" data-menucontroller="deviceOrder" data-menuaction="index"> <message:controller controller="deviceOrder"/> </li>
    </sec:access>
    <sec:access expression="hasRole('ROLE_AUTH_ORDER_QUERY')">
                <li data-jstree='{"type" : "file" }' id="function_ordersQuery_index" data-menucontroller="ordersQuery" data-menuaction="index"> <message:controller controller="ordersQuery"/> </li>
    </sec:access>
    <sec:access expression="hasRole('ROLE_AUTH_INVENTORY')">
        <li data-jstree='{"type" : "file" }' id="function_inventoryManagement_index" data-menucontroller="inventoryManagement" data-menuaction="index"> <message:controller controller="inventoryManagement" /> </li>
    </sec:access>
    <sec:access expression="hasRole('ROLE_AUTH_CARD_QUERY')">
        <li data-jstree='{"type" : "file" }' id="function_cardManagement_index" data-menucontroller="cardManagement" data-menuaction="index"> <message:controller controller="cardManagement"/> </li>
    </sec:access>
    <sec:access expression="hasRole('ROLE_AUTH_TERMINAL_QUERY')">
                <li data-jstree='{"type" : "file" }' id="function_terminalQuery_index" data-menucontroller="terminalQuery" data-menuaction="index"> <message:controller controller="terminalQuery"/> </li>
    </sec:access>
    <sec:access expression="hasRole('ROLE_AUTH_ATTACHED_QUERY')">
                <li data-jstree='{"type" : "file" }' id="function_attachedQuery_index" data-menucontroller="attachedQuery" data-menuaction="index"> <message:controller controller="attachedQuery"/> </li>
    </sec:access>
    <sec:access expression="hasRole('ROLE_AUTH_PAY_COST_MANAGEMENT')">
        <li data-jstree='{"type" : "file" }' id="function_payCostManagement_index" data-menucontroller="payCostManagement" data-menuaction="index"> <message:controller controller="payCostManagement"/> </li>
    </sec:access>
    <sec:access expression="hasRole('ROLE_AUTH_CREDITINFO')">
                <li data-jstree='{"type" : "file" }' id="function_creditInfo_index" data-menucontroller="creditInfo" data-menuaction="index"> <message:controller controller="creditInfo" /> </li>
    </sec:access>
            </ul>
        </li>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="ROLE_PRODUCT_MANAGER,ROLE_SYSTEM_ONE,ROLE_SYSTEM_NOT_ONE,ROLE_AUTH_SUIYITONG_MERCHANT,ROLE_AUTH_SUIYITONG_AGENT,ROLE_AUTH_SUIYITONG_AUDITDATAQUERY,ROLE_AUTH_SUIYITONG_MERCHANT_AMOUNT_USED,ROLE_AUTH_MAINTENANCE_FEE_MERCHANT,ROLE_AUTH_MAINTENANCE_COST_ORDER,ROLE_AUTH_HOLIDAY_PAY,ROLE_AUTH_INTRADAY_PAY,ROLE_SALESMAN">
        <li data-jstree='{"disabled" : true }'>产品
            <ul>
    <sec:access expression="hasRole('ROLE_AUTH_HOLIDAY_PAY')">
                <li data-jstree='{"type" : "file" }' id="function_holidayPay_index" data-menucontroller="holidayPay" data-menuaction="index"> <message:controller controller="holidayPay"/> </li>
    </sec:access>
    <sec:access expression="hasRole('ROLE_AUTH_INTRADAY_PAY')">
                <li data-jstree='{"type" : "file" }' id="function_intradayPay_index" data-menucontroller="intradayPay" data-menuaction="index"> <message:controller controller="intradayPay"/> </li>
    </sec:access>
    <sec:ifAnyGranted roles="ROLE_PRODUCT_MANAGER,ROLE_SYSTEM_ONE,ROLE_SYSTEM_NOT_ONE,ROLE_AUTH_SUIYITONG_MERCHANT,ROLE_AUTH_SUIYITONG_AGENT,ROLE_AUTH_SUIYITONG_AUDITDATAQUERY,ROLE_AUTH_SUIYITONG_MERCHANT_AMOUNT_USED">
        <secMenu:canViewSuiYiTong>
        <li data-jstree='{ "disabled" : true }'> 随意通管理
            <ul>
                <sec:access expression="hasRole('ROLE_AUTH_SUIYITONG_MERCHANT')">
                    <li data-jstree='{"type" : "file" }' id="function_suiYiTongMerchant_index" data-menucontroller="suiYiTongMerchant" data-menuaction="index"> <message:controller controller="suiYiTongMerchant"/> </li>
                </sec:access>
                <sec:access expression="hasRole('ROLE_AUTH_SUIYITONG_AGENT')">
                    <li data-jstree='{"type" : "file" }' id="function_suiYiTongAgent_index" data-menucontroller="suiYiTongAgent" data-menuaction="index"> <message:controller controller="suiYiTongAgent"/> </li>
                </sec:access>
                <sec:access expression="hasRole('ROLE_AUTH_SUIYITONG_AUDITDATAQUERY')">
                    <li data-jstree='{"type" : "file" }' id="function_suiYiTongAuditDataQuery_index" data-menucontroller="suiYiTongAuditDataQuery" data-menuaction="index"> <message:controller controller="suiYiTongAuditDataQuery"/> </li>
                </sec:access>
                <sec:access expression="hasRole('ROLE_AUTH_SUIYITONG_MERCHANT_AMOUNT_USED')">
                    <li data-jstree='{"type" : "file" }' id="function_merchantAmountUsed_index" data-menucontroller="merchantAmountUsed" data-menuaction="index"> <message:controller controller="merchantAmountUsed"/> </li>
                </sec:access>
            </ul>
        </li>
        </secMenu:canViewSuiYiTong>
    </sec:ifAnyGranted>
    <sec:ifAnyGranted roles="ROLE_PRODUCT_MANAGER,ROLE_SYSTEM_ONE,ROLE_SYSTEM_NOT_ONE,ROLE_AUTH_MAINTENANCE_FEE_MERCHANT,ROLE_AUTH_MAINTENANCE_COST_ORDER">
                <li data-jstree='{ "disabled" : true }'> 维护费管理
                    <ul>
        <sec:access expression="hasRole('ROLE_AUTH_MAINTENANCE_FEE_MERCHANT')">
                        <li data-jstree='{"type" : "file" }' id="function_maintenanceFeeMerchant_index" data-menucontroller="maintenanceFeeMerchant" data-menuaction="index"> <message:controller controller="maintenanceFeeMerchant"/> </li>
        </sec:access>
        <sec:access expression="hasRole('ROLE_AUTH_MAINTENANCE_COST_ORDER')">
                        <li data-jstree='{"type" : "file" }' id="function_maintenanceCostOrder_index" data-menucontroller="maintenanceCostOrder" data-menuaction="index"> <message:controller controller="maintenanceCostOrder"/> </li>
        </sec:access>
                    </ul>
                </li>
    </sec:ifAnyGranted>
    <sec:access expression="hasRole('ROLE_AUTH_SECONDS_RECEIVED')">
                <li data-jstree='{"type" : "file" }' id="function_secondsReceived_index" data-menucontroller="secondsReceived" data-menuaction="index"> <message:controller controller="secondsReceived"/> </li>
    </sec:access>
           </ul>
        </li>
</sec:ifAnyGranted>
        %{--<li data-jstree='{"disabled" : true }'>报表--}%
        %{--</li>--}%
        <li data-jstree='{"disabled" : true }'>系统
            <ul>
<sec:access expression="hasRole('ROLE_AUTH_ORGANIZATION')">
                <li data-jstree='{"type" : "file" }' id="function_organization_index" data-menucontroller="organization" data-menuaction="index"> <message:controller controller="organization"/> </li>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_SALESMAN_MANAGEMENT')">
                <li data-jstree='{"type" : "file" }' id="function_salesmanManagement_index" data-menucontroller="salesmanManagement" data-menuaction="index"> <message:controller controller="salesmanManagement"/> </li>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_STAFF_MANAGEMENT')">
                <li data-jstree='{"type" : "file" }' id="function_staffManagement_index" data-menucontroller="staffManagement" data-menuaction="index"> <message:controller controller="staffManagement"/> </li>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_MARGIN_QUERY')">
            <li data-jstree='{"type" : "file" }' id="function_bondOrder_index" data-menucontroller="bondOrder" data-menuaction="index"> <message:controller controller="bondOrder"/> </li>
</sec:access>

<sec:access expression="hasRole('ROLE_AUTH_CHECK_CARD')">
    <li data-jstree='{"type" : "file" }' id="function_checkCard_index" data-menucontroller="checkCard" data-menuaction="index"> <message:controller controller="checkCard"/> </li>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_CHECK_CARD_TRADELIST')">
    <li data-jstree='{"type" : "file" }' id="function_checkCard_tradeList" data-menucontroller="checkCard" data-menuaction="tradeList"> <message:controllerAction controller="checkCard" action="tradeList"/> </li>
</sec:access>
<li data-jstree='{ "disabled" : true }'> 个人信息
    <ul>
    %{--
        <g:set var="isCreatePerson" value="${sec.loggedInUserInfo(field: 'isCreatePerson')}"/>
        <g:if test="${isCreatePerson == '1'}">
            <li data-jstree='{"type" : "file" }' id="function_systemUserProfile_show" data-menucontroller="systemUserProfile" data-menuaction="show"> <message:controllerAction controller="systemUserProfile" action="show"/> </li>
        </g:if>
        --}%
        <sec:access expression="hasRole('ROLE_AUTH_USER_PROFILE')">
            <li data-jstree='{"type" : "file" }' id="function_systemUserProfile_index" data-menucontroller="systemUserProfile" data-menuaction="index"> <message:controller controller="systemUserProfile"/> </li>
        </sec:access>
        <sec:access expression="hasRole('ROLE_AUTH_USER_PHONE')">
            <li data-jstree='{"type" : "file" }' id="function_systemUserPhone_index" data-menucontroller="systemUserPhone" data-menuaction="index"> <message:controller controller="systemUserPhone"/> </li>
        </sec:access>
        <sec:access expression="hasRole('ROLE_AUTH_SALESMAN_AUTHENTICATION')">
            <li data-jstree='{"type" : "file" }' id="function_salesmanAuthentication_index" data-menucontroller="salesmanAuthentication" data-menuaction="index"> <message:controller controller="salesmanAuthentication"/> </li>
        </sec:access>
        <sec:access expression="hasRole('ROLE_AUTH_USER_ADDRESS')">
            <li data-jstree='{"type" : "file" }' id="function_systemReceiptAddress_index" data-menucontroller="systemReceiptAddress" data-menuaction="index"> <message:controller controller="systemReceiptAddress"/> </li>
        </sec:access>
        <sec:access expression="hasRole('ROLE_AUTH_USER_PASSWORD')">
            <li data-jstree='{"type" : "file" }' id="function_systemUserPassword_index" data-menucontroller="systemUserPassword" data-menuaction="index"> <message:controller controller="systemUserPassword"/> </li>
        </sec:access>
    </ul>
</li>
<sec:access expression="hasRole('ROLE_AUTH_FILE')">
                <li data-jstree='{"type" : "file" }' id="function_file_index" data-menucontroller="file" data-menuaction="index"> <message:controller controller="file"/> </li>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_SYSTEM_APPRAISAL')">
                <li data-jstree='{"type" : "file" }' id="function_systemAppraisal_create" data-menucontroller="systemAppraisal" data-menuaction="create"> <message:controllerAction controller="systemAppraisal" action="create"/> </li>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_SYSTEM_SUGGESTION')">
                <li data-jstree='{"type" : "file" }' id="function_systemSuggestion_create" data-menucontroller="systemSuggestion" data-menuaction="create"> <message:controllerAction controller="systemSuggestion" action="create"/> </li>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_SYSTEM_NOTICE')">
                <li data-jstree='{"type" : "file" }' id="function_systemAnnouncement_index" data-menucontroller="systemAnnouncement" data-menuaction="index"> <message:controller controller="systemAnnouncement" /> </li>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_SYSTEM_NOTIFICATION')">
                <li data-jstree='{"type" : "file" }' id="function_systemNotice_index" data-menucontroller="systemNotice" data-menuaction="index"> <message:controller controller="systemNotice"/> </li>
</sec:access>
 <sec:access expression="hasRole('ROLE_AUTH_SYSTEM_FILE_OUT')">
                <li data-jstree='{"type" : "file" }' id="function_systemFileNotice_index" data-menucontroller="systemFileNotice" data-menuaction="index"> <message:controller controller="systemFileNotice"/> </li>
</sec:access>
                %{--<li data-jstree='{"type" : "file" }' id="function_homePanel_index" data-menucontroller="homePanel" data-menuaction="index"> <message:controller controller="homePanel"/> </li>--}%
<sec:access expression="hasRole('ROLE_AUTH_HOME_USER_PANELS')">
                <li data-jstree='{"type" : "file" }' id="function_homeUserPanels_index" data-menucontroller="homeUserPanels" data-menuaction="index"> <message:controller controller="homeUserPanels"/> </li>
</sec:access>
                %{--<li data-jstree='{"type" : "file" }' id="function_excelFile_index" data-menucontroller="excelFile" data-menuaction="index"> <message:controller controller="excelFile"/> </li>--}%
            </ul>
        </li>
    </ul>
</div>