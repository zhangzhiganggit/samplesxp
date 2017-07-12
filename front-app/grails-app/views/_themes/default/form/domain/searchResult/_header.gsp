<g:if test="${value==null}">
    <tk:view domain="${domain}" property="${property}" includes="${includes}" excludes="${excludes}">
        <g:if test="${sortable && sortable.toBoolean() == false}">
            <th property="${property}" scope="col"${dataSimpleColumn ? ' data-sample-column' : ''} ${width?' style=width:'+width+'px' : ''} title="<message:property domain="${domain}" property="${property}"/>">
                <g:if test="${popoverMessage}"><i class="fa fa-question-circle show-pop" data-popover-message="${popoverMessage}"></i></g:if><message:property domain="${domain}" property="${property}"/>
            </th>
        </g:if>
        <g:else>
            <th property="${property}" scope="col"${dataSimpleColumn ? ' data-sample-column' : ''} ${width?' style=width:'+width+'px' : ''} title="<message:property domain="${domain}" property="${property}"/>">
                <g:if test="${popoverMessage}"><i class="fa fa-question-circle show-pop" data-popover-message="${popoverMessage}"></i></g:if><message:property domain="${domain}" property="${property}"/>
            </th>
        </g:else>
    </tk:view>

</g:if>
<g:else>
    <th scope="col"${dataSimpleColumn ? ' data-sample-column' : ''} ${width?' style=width:'+width+'px' : ''} title="${value}">
        <g:if test="${popoverMessage}"><i class="fa fa-question-circle show-pop" data-popover-message="${popoverMessage}"></i></g:if>${value}
    </th>
</g:else>