<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'inventoryManagement')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:render template="/machines/inventoryManagement/searchForm"/>
    <g:render template="/machines/inventoryManagement/searchResult" model="[inventoryManagementInstanceList]"/>
    %{--<component:paginate total="${inventoryManagementInstanceCount}"/>--}%
</body>
</html>

<content tag="takin-footer">
    <asset:javascript src="/machines/newInventoryManagement.js"/>
    <asset:javascript src="userNameList.js"/>
    <g:javascript>
        $(function () {
            //物品类型
            if($("#q_goodsType").val()!=""&&$("#q_goodsType").val()!=null) {
                getGoodsName($('#q_goodsType').val());
                checkCallBack();
            }
            $("#q_goodsType").on('change',function (){
                var q_goodsType=$('#q_goodsType').val();
                getGoodsName(q_goodsType);
            })
            //物品名称
            $("#q_goodsName").on('change',function () {
                var goodsNameCode=$('#q_goodsName').val();
                $('#hiddenGoodsNameCode').val(goodsNameCode);
                getFactShortName(goodsNameCode);
            })

        });
    </g:javascript>
</content>