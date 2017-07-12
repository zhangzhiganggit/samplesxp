<div class="portlet-title">
    <div class="caption">
        <i class="${iconCssClass}"></i>
        <span class="caption-subject bold uppercase">${title}<g:if test="${popHelper}"><i class="fa fa-question-circle show-pop" data-popover-message="${popHelper}"></i></g:if></span>
        <span class="caption-helper">${titleHelper}</span>
        <span class="caption-helper" style="color: red">${titleRedHelper}</span>
    </div>
    <div class="tools">
        <g:each var="action" in="${actions}">
            <a href=":;" class="${action}" data-original-title="" title=""> </a>
        </g:each>
    </div>
</div>
