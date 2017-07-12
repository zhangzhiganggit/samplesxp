<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantIncome" %>
<component:portlet cssClass="scaffold-show">
    <portlet:body>
    <div class="row">
        <domainShow:displayString domain="merchantIncome" property="taskCode"  domainInstance="${merchantIncomeInstance}"/>
    </div>
    <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
            <div class="form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12">提示：</label>
                <div class="col-md-9 col-sm-9 col-xs-12">
                    <p class="form-control-static">请尽快前往［商户终端管理］进行装机绑定！&nbsp;</p>
                </div>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-0 col-md-12">
                <div style="margin-left:2.8%">
                    <button id="btnAdd" class="btn">继续录入</button>
                </div>
            </div>
        </div>
    </div>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <script>
        $(function(){
            $('#btnAdd').click(function(){
                window.location.href="/merchantSmallAndMicro/create";
            });


        })
    </script>
</content>



