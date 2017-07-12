
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'menthodProfitDetail')]"/></title>
</head>

<body>
<div ng-app="ssp-front">
    <div ng-controller="treeTableCtrl">
        <g:render template="/shareProfit/menthodProfitDetail/searchForm"/>
   %{-- <layout:flashMessage/>
    <g:render template="/shareProfit/menthodProfitDetail/searchForm"/>

    <g:if test="${menthodProfitDetailInstanceList}">--}%
        <g:render template="/shareProfit/menthodProfitDetail/searchResult" model="[menthodProfitDetailInstanceList]"/>
        %{--<component:paginate total="${menthodProfitDetailInstanceCount }"/>
    </g:if>--}%
    </div>
</div>
</body>
</html>
