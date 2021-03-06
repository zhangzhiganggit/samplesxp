<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantSmallAndMicroModify" %>
<component:portlet cssClass="scaffold-show">
    <g:if test="${option == "add"}">
        <portlet:title  title="新增商户"/>
    </g:if>
    <g:elseif test="${option == "edit"}">
        <portlet:title  title="编辑商户"/>
    </g:elseif>
    <g:else>
        <portlet:title  title="修改商户"/>
    </g:else>
    <portlet:body withForm="true">
        <form:form id="restltForm">
            <form:body>
                <formCommon:hiddenField name="id" value="${merchantSmallAndMicroModifyInstance?.id}"/>
                <div class="row" style="margin-bottom: 3rem; font-size: large">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label class="control-label col-md-1 col-sm-1 col-xs-12"></label>
                            <div class="col-md-9 col-sm-9 col-xs-12 caption font-red-sunglo bold">
                                <g:if test="${option == "add" || option == "edit"}">
                                    <message:property domain="merchantSmallAndMicroModify" property="editSuccess" />
                                </g:if>
                                <g:else>
                                    <message:property domain="merchantSmallAndMicroModify" property="editSuccess" />
                                </g:else>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <domainShow:displayString domain="merchantSmallAndMicroModify" property="taskCode"  domainInstance="${merchantSmallAndMicroModifyInstance}"/>
                </div>
                <div class="row">
                    <domainShow:displayString domain="merchantSmallAndMicroModify" property="receiptsName"  domainInstance="${merchantSmallAndMicroModifyInstance}"/>
                </div>
                <div class="row">
                    <domainShow:displayString domain="merchantSmallAndMicroModify" property="salesmanName"  domainInstance="${merchantSmallAndMicroModifyInstance}"/>
                </div>
            </form:body>
            <form:actions>
                <g:if test="${option == "add" || option == "edit"}">
                    <formActions:button id="btnAdd" value="继续录入"/>
                    <formActions:button id="btnDraft" value="查看草稿(${merchantSmallAndMicroModifyInstanceCount})"/>
                </g:if>
                <g:else>
                    <formActions:button id="btnMod" value="继续修改"/>
                </g:else>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <script>
        $(function(){
            $('#btnAdd').click(function(){
                window.location.href="/merchantSmallAndMicroModify/index?ifNew=1";
            });

            $('#btnDraft').click(function(){
                window.location.href="/merchantSmallAndMicroModify/index";
            });
            $('#btnMod').click(function(){
                window.location.href="/merchantSmallAndMicroModify/index";
            });
        })
    </script>
</content>

