
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'MPosValidMerchantManagement')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:render template="/merchant/merchantquery/MPosValidMerchantManagement/searchForm"/>
%{--<g:if test="${MPosValidMerchantManagementInstanceList}">--}%
<g:render template="/merchant/merchantquery/MPosValidMerchantManagement/searchResult" model="[MPosValidMerchantManagementInstanceList]"/>

%{--</g:if>--}%
</body>
<content tag="takin-footer">
    <asset:javascript src="userNameList.js"/>
    <g:javascript>
        $(function() {
            initLoading();
            $("input").keyup(function () {
                this.value = this.value.replace(/\s/g, '');
            })
            if("01"==$("select[name='q_whetherValidMerchant']").val()){
                $("#may").hide();
            }else{
                $("#may").show();
            }
            $("select[name='q_whetherValidMerchant']").change(function () {
                if ($("#q_whetherValidMerchant").val() == "01") {
                    $("#may").hide();
                }else{
                    $("#may").show();
                }
            })
        })
    </g:javascript>
</content>
</html>
