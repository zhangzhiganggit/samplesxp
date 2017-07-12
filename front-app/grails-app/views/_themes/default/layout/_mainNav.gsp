<div class="page-header navbar navbar-fixed-top">
    <div class="page-header-inner ">
        <div class="page-logo">
            <a href="${createLink(uri: '/')}">
                <asset:image src="layouts/layout/img/logo.png" alt="${message(code: 'global.site.logo.title')}"
                             title="${message(code: 'global.site.logo.title')}" class="logo-default"/></a>
        </div>
        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse"
           data-target=".navbar-collapse">
            <span></span>
        </a>

        <div class="top-menu">
            <ul class="nav navbar-nav pull-left">
                <div class="button-group">

                    <sec:access expression="hasRole('ROLE_ADMIN')">
                        <button name="firstMenu" id="homeMenu" class="icon-btn bg-default">
                            <i class="icon-home"></i>

                            <span>首页</span>
                        </button>
                    </sec:access>
                    <sec:access expression="hasRole('ROLE_ADMIN')">
                        <div class="dropdown" style="display:inline-block;">
                            <button class="icon-btn btn-default dropdown-toggle" data-toggle="dropdown"
                                    data-hover="dropdown" data-close-others="true">
                                <i class="icon-energy"></i>
                                <span>快捷菜单</span>
                            </button>
                            <ul class="dropdown-menu" id="dropdown-shortcutMenu">

                            </ul>
                        </div>
                    </sec:access>
                    <sec:ifAnyGranted
                            roles="ROLE_ADMIN">
                        <button name="firstMenu" id="merchantMenu" class="icon-btn bg-default">
                            <i class="icon-support"></i>
                            <span>商户</span>
                        </button>
                    </sec:ifAnyGranted>
                    <sec:ifAnyGranted
                            roles="ROLE_ADMIN">
                        <button name="firstMenu" id="riskcontrolMenu" class="icon-btn bg-default">
                            <i class="icon-umbrella"></i>

                            <span>风控</span>
                        </button>
                    </sec:ifAnyGranted>
                    <sec:ifAnyGranted
                            roles="ROLE_ADMIN">
                        <button name="firstMenu" id="profitshareMenu" class="icon-btn bg-default">
                            <i class="fa fa-cny"></i>

                            <span>分润</span>
                        </button>
                    </sec:ifAnyGranted>
                    <sec:ifAnyGranted
                            roles="ROLE_ADMIN">
                        <button name="firstMenu" id="machinesMenu" class="icon-btn bg-default">
                            <i class="icon-credit-card"></i>

                            <span>机具</span>
                        </button>
                    </sec:ifAnyGranted>
                    <sec:ifAnyGranted
                            roles="ROLE_ADMIN">
                        <button name="firstMenu" id="productsMenu" class="icon-btn bg-default">
                            <i class="icon-grid"></i>

                            <span>产品</span>
                        </button>
                    </sec:ifAnyGranted>
                %{--<button name="firstMenu" id="reportsMenu" class="icon-btn bg-default">
                    <i class="fa fa-bar-chart"></i>

                    <span>报表</span>
                </button>--}%

                <sec:ifNotGranted roles="ROLE_CHECK">
                    <button name="firstMenu" id="systemMenu" class="icon-btn bg-default">
                        <i class="icon-settings"></i>

                        <span>系统</span>
                    </button>
                </sec:ifNotGranted>
                </div>
            </ul>
            <ul class="nav navbar-nav pull-right ">

                %{--这是通知啊通知--}%
                <g:include controller="systemFileNotice" action="systemFileNotice" params="[max: 10]" />
                <g:include controller="systemNotice" action="systemNotice" params="[max: 10]" />
                <g:include controller="dashboard" action="showGtasksCount" params="[max: 10]"/>

                %{--用户信息--}%
                <li class="dropdown dropdown-user">
                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                       data-close-others="true">
                        %{--<asset:image alt="" class="img-circle" src="layouts/layout/img/avatar3_small.jpg"/>--}%
                    <span class="username username-hide-on-mobile">
                        %{--
                                               <g:set var="userIdentity" value="${sec.loggedInUserInfo(field:'userIdentity')}" />

                                               <g:if test="${userIdentity == 'ROLE_IDENTITY_ADMIN'}">
                                                   办公人员：<sec:loggedInUserInfo field='remarkName'/></span>
                                               </g:if>
                                               <g:else>
                                                   业务员：<sec:loggedInUserInfo field='remarkName'/></span>
                                               </g:else>

                                           %{--<span class="username username-hide-on-mobile">--}%
                    %{--登录人：<sec:loggedInUserInfo field='remarkName'/></span>--}%
                    %{--<span class="username username-hide-on-mobile">--}%
                    %{--机构名称：<sec:loggedInUserInfo field='currentOrgName'/></span>--}%
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-default">
                        %{--
                    <g:set var="isCreatePerson" value="${sec.loggedInUserInfo(field: 'isCreatePerson')}"/>
                    <g:if test="${isCreatePerson == '1'}">

                    <sec:ifNotGranted roles="ROLE_CHECK">
                    <li>
                    <a href="/systemUserProfile/show">
                    <i class="icon-badge"></i><span class="title"><message:controllerAction controller="systemUserProfile" action="show"/></span></a>
                    </li>
                    </sec:ifNotGranted>

                    </g:if>
                    --}%
                    <sec:access expression="hasRole('ROLE_ADMIN')">
                    <li>
                    <a href="/systemUserProfile/index">
                    <i class="icon-user"></i><span class="title"><message:controller controller="systemUserProfile"/></span></a>
                    </li>
                    </sec:access>
                    <sec:access expression="hasRole('ROLE_ADMIN')">
                    <li>
                    <a href="/systemUserPhone/index">
                    <i class="icon-call-end"></i><span class="title"><message:controller controller="systemUserPhone"/></span></a>
                    </li>
                    </sec:access>
                    <sec:access expression="hasRole('ROLE_ADMIN')">
                    <li>
                    <a href="/salesmanAuthentication/index">
                    <i class="icon-check"></i><span class="title"><message:controller controller="salesmanAuthentication"/></span></a>
                    </li>
                    </sec:access>
                        <sec:access expression="hasRole('ROLE_ADMIN')">
                            <li>
                                <a href="/systemReceiptAddress/index">
                                    <i class="icon-pointer"></i><span class="title"><message:controller controller="systemReceiptAddress"/></span></a>
                            </li>
                        </sec:access>
                    <sec:access expression="hasRole('ROLE_ADMIN')">
                    <li>
                    <a href="/systemUserPassword/index">
                    <i class="icon-lock"></i><span class="title"><message:controller controller="systemUserPassword"/></span></a>
                    </li>
                    </sec:access>
                    %{--<li>
                        <a href="/lock">
                            <i class="icon-lock"></i>锁定帐号</a>
                    </li>--}%
                        <li>
                            <a href="#" onclick="top.location = '/logout';">
                                <i class="icon-key"></i><span class="title">退出系统</span></a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>