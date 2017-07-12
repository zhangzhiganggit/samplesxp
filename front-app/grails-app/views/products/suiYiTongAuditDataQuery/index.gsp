
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'suiYiTongAuditDataQuery')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/products/suiYiTongAuditDataQuery/searchForm"/>
    %{--<g:if test="${suiYiTongAuditDataQueryInstanceList}">--}%
    %{--<div id="amountDiv">--}%
    <g:render template="/products/suiYiTongAuditDataQuery/searchResult" model="[suiYiTongAuditDataQueryInstanceList]"/>
    %{--</div>--}%
    %{--<div hidden="hidden" id="alterDiv">--}%
        %{--<g:render template="/products/suiYiTongAuditDataQuery/searchResultAlter" model="[suiYiTongAuditDataQueryInstanceList]"/>--}%
    %{--</div>--}%
    %{--</g:if>--}%

%{--<content tag="takin-footer">--}%
    %{--<g:javascript>--}%
        %{--function typeChange(){--}%
            %{--$('#alterDiv').hide();--}%
            %{--var taskType = $("#taskType").val();--}%
            %{--if(taskType == '00'){--}%
                %{--$('#amountDiv').show();--}%
                %{--return;--}%
            %{--}--}%
            %{--else{--}%
                %{--$('#amountDiv').hide();--}%
                %{--$('#alterDiv').show();--}%
                %{--return;--}%
            %{--}--}%

        %{--}--}%
    %{--</g:javascript>--}%
%{--</content>--}%
</body>
</html>