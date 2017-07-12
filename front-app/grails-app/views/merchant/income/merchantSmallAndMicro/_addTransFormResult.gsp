<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantIncome" %>
<component:portlet cssClass="scaffold-show">
    <portlet:body>
        <form:form id="restltForm">
            <form:body>
        <div class="row" style="margin-bottom: 2rem; font-size: large">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="form-group">
                    <label class="control-label col-md-1 col-sm-1 col-xs-12"></label>
                    <div class="col-md-9 col-sm-9 col-xs-12 caption font-red-sunglo bold">
                            <message:property domain="merchantSmallAndMicro" property="editSuccess" />
                    </div>
                </div>
            </div>

        </div>

     <div class="row">
         <domainShow:displayString domain="merchantIncome" property="taskCode"  domainInstance="${merchantIncomeInstance}"/>
     </div>
                <div class="row" style="margin-bottom:10%">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12">进度可在商户审核数据管理中查询</label>
                </div>
                </br>
            </form:body>
            </form:form>
    </portlet:body>
</component:portlet>





