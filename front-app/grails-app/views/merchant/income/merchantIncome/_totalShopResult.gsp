<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.TotalShop" %>
<g:if test="${totalShopList}">
    <g:each var="shop" in="${totalShopList}">
        <tr>
            <domainSearchResult:rowData type="text" domain="totalShop" property="merchantCodeTotalShop"  domainInstance="${shop }"/>
            <domainSearchResult:rowData type="text" domain="totalShop" property="receiptsNameTotalShop" domainInstance="${shop }"/>
            <domainSearchResult:rowData type="text" domain="totalShop" property="registNameTotalShop" domainInstance="${shop }"/>
            <td class="tk-actions" align="center">
                <g:link data-dismiss="modal" onclick="chooseTotalShop('${shop?.merchantCodeTotalShop}','${shop?.merchantCodeTotalShop}','${shop?.registNameTotalShop}');return false;" id="${shop?.merchantCodeTotalShop}">确认</g:link>
            </td>
        </tr>
    </g:each>
</g:if>

