<li class="heading" id="systemSideBar">
    <h3 class="uppercase">系统</h3>
</li>

<sec:access expression="hasRole('ROLE_AUTH_ORGANIZATION')">
    <menu:rootMenu controller="organization" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_SALESMAN_MANAGEMENT')">
    <menu:rootMenu controller="salesmanManagement" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_STAFF_MANAGEMENT')">
    <menu:rootMenu controller="staffManagement" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_MARGIN_QUERY')">
    <menu:rootMenu controller="bondOrder" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_CHECK_CARD')">
    <menu:rootMenu controller="checkCard" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_CHECK_CARD_TRADELIST')">
    <menu:rootMenu controller="checkCard" action="tradeList"/>
</sec:access>

<li class="nav-item">
    <a href="javascript:;" class="nav-link nav-toggle">
        <i class="icon-info"></i>
        <span class="title">个人信息</span>
        <span class="arrow"></span>
    </a>
    <ul class="sub-menu">
        <sec:access expression="hasRole('ROLE_AUTH_ORG_INFO')">
            %{--
            <g:set var="isCreatePerson" value="${sec.loggedInUserInfo(field: 'isCreatePerson')}"/>
            <g:if test="${isCreatePerson == '1'}">
                <menu:rootMenu controller="systemUserProfile" action="show"/>
            </g:if>
            --}%
        </sec:access>
        <sec:access expression="hasRole('ROLE_AUTH_USER_PROFILE')">
            <menu:rootMenu controller="systemUserProfile" action="index"/>
        </sec:access>
        <sec:access expression="hasRole('ROLE_AUTH_USER_PHONE')">
            <menu:rootMenu controller="systemUserPhone" action="index"/>
        </sec:access>
        <sec:access expression="hasRole('ROLE_AUTH_SALESMAN_AUTHENTICATION')">
            <menu:rootMenu controller="salesmanAuthentication" action="index"/>
        </sec:access>
        <sec:access expression="hasRole('ROLE_AUTH_USER_ADDRESS')">
            <menu:rootMenu controller="systemReceiptAddress" action="index"/>
        </sec:access>
        <sec:access expression="hasRole('ROLE_AUTH_USER_PASSWORD')">
            <menu:rootMenu controller="systemUserPassword" action="index"/>
        </sec:access>
    </ul>
</li>
<sec:access expression="hasRole('ROLE_AUTH_FILE')">
    <menu:rootMenu controller="file" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_SYSTEM_APPRAISAL')">
    <menu:rootMenu controller="systemAppraisal" action="create"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_SYSTEM_SUGGESTION')">
    <menu:rootMenu controller="systemSuggestion" action="create"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_SYSTEM_NOTICE')">
    <menu:rootMenu controller="systemAnnouncement" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_SYSTEM_NOTIFICATION')">
    <menu:rootMenu controller="systemNotice" action="index"/>
</sec:access>
<sec:access expression="hasRole('ROLE_AUTH_SYSTEM_FILE_OUT')">
    <menu:rootMenu controller="systemFileNotice" action="index"/>
</sec:access>
%{--<menu:rootMenu controller="homePanel" action="index"/>--}%
<sec:access expression="hasRole('ROLE_AUTH_HOME_USER_PANELS')">
    <menu:rootMenu controller="homeUserPanels" action="index"/>
</sec:access>


%{--<menu:rootMenu controller="excelFile" action="index"/>--}%
