<%@ page import="com.suixingpay.ssp.front.merchant.merchantIncome.MerchantAudit" %>

<component:portlet cssClass="scaffold-search">
    %{--<portlet:title--}%
            %{--title="${message(code: 'default.search.label', args: message.domain(domain: 'merchantAudit'))}"--}%
            %{--iconCssClass="fa fa-filter"/>--}%
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-filter"></i>
            <span class="caption-subject bold uppercase">查询条件</span>
            <span class="caption-helper"></span>
        </div>
        <div class="tools">
            <a target="_blank" href="${sms_front_url}/fromSspToHomePage.do?userName=${userName}&password=${passWord}&url=/task/list.do?isFirstLoad=true&taskSts=3"><span class="caption-subject bold uppercase" style="color: red;text-decoration:underline">查看历史工单</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href=":;" class="collapse" data-original-title="" title=""> </a>

            <a href=":;" class="fullscreen" data-original-title="" title=""> </a>

        </div>
    </div>
    <portlet:body withForm="true">
        <form:form controller="merchantAudit" action="index"
                   name="scaffold-search-merchantAudit">
            <form:scaffoldSearchProperties/>
            <form:body>
                <domainSearch:textField domain="merchantAudit" property="taskCode"/>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"><message:property domain="merchantAudit" property="taskStatus" /></label>
                        <div class="col-md-8">
                            <g:select style="margin-bottom: 0.5rem;" class="form-control" name="taskStatus"
                                      from="${com.suixingpay.ssp.front.merchant.merchantIncome.MerchantAudit.getConstraintsMap()['taskStatus'].inList}"
                                      value="${params ? params['taskStatus'] : ''}"
                                      valueMessagePrefix="merchantAudit.taskStatus" noSelection="['':'全部']" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label col-md-4"><message:property domain="merchantAudit" property="taskType" /></label>
                        <div class="col-md-8">
                            <g:select style="margin-bottom: 0.5rem;" class="form-control" name="taskType"
                                      from="${com.suixingpay.ssp.front.merchant.merchantIncome.MerchantAudit.getConstraintsMap()['taskType'].inList}"
                                      value="${params ? params['taskType'] : ''}"
                                      valueMessagePrefix="merchantAudit.taskType" />
                        </div>
                    </div>
                </div>
                <domainSearch:datePicker domain="merchantAudit" property="startFlowTime" dataDateFormat="yyyy-mm-dd"/>

                <domainSearch:select domain="merchantAudit" property="jinjianType" class="form-control"
                                     from="${com.suixingpay.ssp.front.merchant.merchantIncome.MerchantAudit.getConstraintsMap()['jinjianType'].inList}"
                                     name="q_jinjianType" valueMessagePrefix="MerchantAudit.jinjianType"
                                     value="${params ? params['q_jinjianType'] : ''}" noSelection="['': '--全部--']"/>

                <domainSearch:select domain="merchantAudit" property="equipType" class="form-control"
                                     from="${com.suixingpay.ssp.front.merchant.merchantIncome.MerchantAudit.getConstraintsMap()['equipType'].inList}"
                                     name="q_equipType" valueMessagePrefix="MerchantAudit.equipType"
                                     value="${params ? params['q_equipType'] : ''}" noSelection="['': '--全部--']"/>





            </form:body>
            <form:actions>


                <formActions:submit value="${message(code: 'default.button.search.label')}" btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"  btnCssClass="btn btn-reset"/>
            </form:actions>

        </form:form>
      %{--  <g:link class="" controller="merchantSmallAndMicro" action="edit" id="461E942876E93D5BE053FC8810ACD8CA">
            <g:message code="default.button.edit.label"/>
        </g:link>--}%
    </portlet:body>
</component:portlet>
