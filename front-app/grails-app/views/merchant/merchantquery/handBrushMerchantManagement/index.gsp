
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'handBrushMerchantManagement')]"/></title>
</head>

<body>
    
    <layout:flashMessage/>
    <g:render template="/merchant/merchantquery/handBrushMerchantManagement/searchForm"/>
    %{--<g:if test="${handBrushMerchantManagementInstanceList}">--}%
        <g:render template="/merchant/merchantquery/handBrushMerchantManagement/searchResult" model="[handBrushMerchantManagementInstanceList]"/>

    %{--</g:if>--}%
</body>
<content tag="takin-footer">
<asset:javascript src="userNameList.js"/>
<asset:javascript src="merchant/merchant-query.js"/>
<asset:javascript src="merchant/provinceList.js"/>
<g:javascript>
        $(function(){
           initLoading();
           SspMerchantQuery.init();
           $("input").keyup(function(){this.value=this.value.replace(/\s/g,'')});
           startPCA("provincespan","cityspan","areaspan", "bindAddressProvince", "bindAddressCity", "bindAddressArea","bindAddrProvinceHidden", "bindAddrCityHidden",  "bindAddrAreaHidden");
        });
    </g:javascript>
</content>
</html>
