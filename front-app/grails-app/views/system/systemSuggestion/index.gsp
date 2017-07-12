<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'suggestion')]"/></title>
</head>

<body>

<layout:flashMessage/>
%{--
<g:render template="/system/systemSuggestion/searchForm"/>
--}%
<g:render template="/system/systemSuggestion/searchResult" model="[systemSuggestionInstanceList]"/>
%{--
<component:paginate total="${SuggestionInstanceCount}"/>
--}%

</body>
</html>
