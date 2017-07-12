<li class="heading" id="merchantSideBar">
    <h3 class="uppercase">商户</h3>
</li>



<li class="nav-item">
    <a href="javascript:;" class="nav-link nav-toggle">
        <i class="icon-users"></i>
        <span class="title">新增商户</span>
        <span class="arrow"></span>
    </a>
    <ul class="sub-menu">
        <sec:access expression="hasRole('ROLE_ADMIN')">
            <menu:rootMenu controller="merchantIncome" action="index"/>
        </sec:access>
        <sec:access expression="hasRole('ROLE_ADMIN')">
            <menu:rootMenu controller="merchantSmallAndMicro" action="create"/>
        </sec:access>
    </ul>
</li>

<li class="nav-item">
    <a href="javascript:;" class="nav-link nav-toggle">
        <i class="icon-users"></i>
        <span class="title">商户修改</span>
        <span class="arrow"></span>
    </a>

    <ul class="sub-menu">
        <sec:access expression="hasRole('ROLE_ADMIN')">
            <menu:rootMenu controller="merchantIncomeModify" action="edit"/>
        </sec:access>
        %{--
            2017-3-1 modify by anwenchu
            BUG--OPERATION-23321
            标签写错,不用改数据　商户管理员有商户修改权限　没有进件权限　所以不改用　ROLE_AUTH_MERCHANT_COME_IN　进行筛选
        --}%
        %{--<sec:access expression="hasRole('ROLE_AUTH_MERCHANT_COME_IN')">--}%
        <sec:access expression="hasRole('ROLE_ADMIN')">
            <menu:rootMenu controller="merchantSmallTransPos" action="index"/>
        </sec:access>
        <sec:access expression="hasRole('ROLE_ADMIN')">
            <menu:rootMenu controller="merchantSmallAndMicroModify" action="index"/>
        </sec:access>
    </ul>
</li>
%{--<sec:access expression="hasRole('ROLE_AUTH_MERCHANT_UPdATE')">
    <menu:rootMenu controller="merchantIncomeModify" action="edit"/>
</sec:access>--}%
<sec:ifAnyGranted
        roles="ROLE_ADMIN">
    <li class="nav-item">
        <a href="javascript:;" class="nav-link nav-toggle">
            <i class="icon-users"></i>
            <span class="title">商户管理</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">
            <sec:access expression="hasRole('ROLE_ADMIN')">
                <menu:rootMenu controller="merchantManagement" action="index"/>
            </sec:access>
            <sec:access expression="hasRole('ROLE_ADMIN')">
                <menu:rootMenu controller="handBrushMerchantManagement" action="index"/>
            </sec:access>
            <sec:access expression="hasRole('ROLE_ADMIN')">
                <menu:rootMenu controller="otherConsumeMerchantManagement" action="index"/>
            </sec:access>
            <sec:access expression="hasRole('ROLE_ADMIN')">
                <menu:rootMenu controller="MPosValidMerchantManagement" action="index"/>
            </sec:access>
            <sec:access expression="hasRole('ROLE_ADMIN')">
                <menu:rootMenu controller="happyToSendMerchantQuery" action="index"/>
            </sec:access>
            <sec:access expression="hasRole('ROLE_ADMIN')">
                <menu:rootMenu controller="otherConsumeRate" action="index"/>
            </sec:access>

        </ul>
    </li>
    <li class="nav-item">
        <a href="javascript:;" class="nav-link nav-toggle">
            <i class="icon-wallet"></i>
            <span class="title">交易管理</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">
            <sec:access expression="hasRole('ROLE_ADMIN')">
                <menu:rootMenu controller="posTrade" action="index"/>
            </sec:access>
            <sec:access expression="hasRole('ROLE_ADMIN')">
                <menu:rootMenu controller="MPosTrade" action="index"/>
            </sec:access>
            <sec:access expression="hasRole('ROLE_ADMIN')">
                <menu:rootMenu controller="otherConsumeTrade" action="index"/>
            </sec:access>

        </ul>
    </li>
    <li class="nav-item">
        <a href="javascript:;" class="nav-link nav-toggle">
            <i class="icon-layers"></i>
            <span class="title">结算管理</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">
            <sec:access expression="hasRole('ROLE_ADMIN')">
                <menu:rootMenu controller="posSettle" action="index"/>
            </sec:access>
            <sec:access expression="hasRole('ROLE_ADMIN')">
                <menu:rootMenu controller="MPosSettle" action="index"/>
            </sec:access>
            <sec:access expression="hasRole('ROLE_ADMIN')">
                <menu:rootMenu controller="otherConsumeSettle" action="index"/>
            </sec:access>
        </ul>
    </li>
    <sec:access expression="hasRole('ROLE_ADMIN')">
        <menu:rootMenu controller="merchantAudit" action="index"/>
    </sec:access>
    <sec:access expression="hasRole('ROLE_ADMIN')">
        <menu:rootMenu controller="merchantTerminalManagement" action="index"/>
    </sec:access>
    <sec:access expression="hasRole('ROLE_ADMIN')">
        <menu:rootMenu controller="customerServiceWorkOrder" action="index"/>
    </sec:access>
    </sec:ifAnyGranted>
