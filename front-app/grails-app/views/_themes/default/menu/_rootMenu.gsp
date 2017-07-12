<% def activeControllerNames = [controller].plus(activeController ?: []) %>
<li class="tooltips${activeControllerNames.contains(controllerName) ? ' active' : '' }" data-html="true" data-placement="right" data-container="body">
    <g:link controller="${controller }" action="${action }">
        <i class="${message.controllerIcon(controller: controller) }"></i>
        <span class="title">
            <g:if test="${action == 'index'}">
                <message:controller controller="${controller }" />
            </g:if>
            <g:else>
                <message:controllerAction controller="${controller }" action="${action}" />
            </g:else>
        </span>
        <span class="selected"></span>
    </g:link>
</li>
