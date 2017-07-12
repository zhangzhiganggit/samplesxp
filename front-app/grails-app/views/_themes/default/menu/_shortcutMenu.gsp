<g:if test="${params.sidebar}">
<li class="heading" id="shortcutSideBar">
    <h3 class="uppercase">快捷菜单</h3>
</li>
</g:if>
<g:if test="${menus}">
    <g:set var="menusList" value="${new groovy.json.JsonSlurper().parseText("${menus}")}"/>
    <g:each var="menu" in="${menusList}">
            <g:if test="${menu}">
                <menu:rootMenu controller="${menu['menucontroller']}" action="${menu['menuaction']}"/>
            </g:if>
    </g:each>
</g:if>
<menu:rootMenu controller="shortcutMenuConfigure" action="index"/>
