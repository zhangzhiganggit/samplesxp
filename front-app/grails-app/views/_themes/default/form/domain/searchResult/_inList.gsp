<tk:view domain="${domain }" property="${property }" includes="${includes }" excludes="${excludes }">
    <td align="center" ${width?' style=width:'+width+'px;' : ''}  title=" <g:message code="${domain}.${property}.${domainInstance ? domainInstance[property] : '' }" default="${domainInstance ? domainInstance[property] : '' }" />">
        <g:message code="${domain}.${property}.${domainInstance ? domainInstance[property] : '' }" default="${domainInstance ? domainInstance[property] : '' }" />
    </td>
</tk:view>
%{--未使用--}%