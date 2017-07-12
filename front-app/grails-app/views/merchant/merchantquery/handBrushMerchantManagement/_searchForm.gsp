<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.HandBrushMerchantManagement" %>

<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'default.search.label', args: message.domain(domain: 'handBrushMerchantManagement'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="handBrushMerchantManagement" action="index"
                   name="scaffold-search-handBrushMerchantManagement">
            <form:scaffoldSearchProperties/>
            <form:body>
                <input type="hidden" name="hiddenSalesMan" id="hiddenSalesMan" value="${hiddenSalesMan}"/>
                <input type="hidden" id="isAdmin" value="${isAdmin}"/>
                <input type="hidden" id="hiddenUserCode" value="${hiddenUserCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <domainSearch:textField domain="handBrushMerchantManagement" property="merchantCode" />
                <domainSearch:textField domain="handBrushMerchantManagement" property="businessName"/>
                <domainSearch:select2 property="merchantSource" domain="handBrushMerchantManagement" class="form-control" name="q_merchantSource" from="${com.suixingpay.ssp.front.merchant.merchantquery.HandBrushMerchantManagement.getConstraintsMap()['merchantSource'].inList}" valueMessagePrefix="merchantRiskControlStatusManagement.merchantSource" value="${params ? params['q_merchantSource'] : ''}"  noSelection="['':'请选择']" />
                %{--<domainSearch:select2 property="businessWay" domain="handBrushMerchantManagement" class="form-control" name="q_status" from="${com.suixingpay.ssp.front.merchant.merchantquery.HandBrushMerchantManagement.getConstraintsMap()['businessWay'].inList}" valueMessagePrefix="handBrushMerchantManagement.businessWay" value="${params ? params['q_businessWay'] : ''}"  noSelection="['':'请选择']" />--}%

                <!--省市区使用-->
                <input type="hidden" id="bindAddrProvinceHidden" name="bindAddrProvinceHidden" value="${bindAddrProvinceHidden}"/>
                <input type="hidden" id="bindAddrCityHidden" name="bindAddrCityHidden" value="${bindAddrCityHidden}"/>

                <g:if test="${isAdmin}">
                    <domainSearch:orgTree domain="handBrushMerchantManagement" popoverMessage="${message(code:"merchantManagement.belongToOrg.show-pop.label")}" property="belongToOrg" name="q_belongToOrg"  directly="true" class="belongToOrg"/>
                    <domainSearch:select2 domain="handBrushMerchantManagement" popoverMessage="${message(code:"merchantManagement.salesMan.show-pop.label")}" property="salesMan" class="form-control belongtoEmp"
                                          name="q_salesMan" valueMessagePrefix="handBrushMerchantManagement.salesMan"
                                          from="${com.suixingpay.ssp.front.merchant.merchantquery.HandBrushMerchantManagement.getConstraintsMap()['salesMan'].inList}"
                                          value="${params ? params['q_salesMan'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="merchantManagement.belongToOrg.show-pop.label"></g:message>"></i><message:property domain="handBrushMerchantManagement" property="belongToOrg" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenCurrentOrgName}" readonly id="readonlyOrgNm"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <i class="fa fa-question-circle show-pop" data-popover-message="<g:message
                                        code="merchantManagement.salesMan.show-pop.label"></g:message>"></i><message:property domain="handBrushMerchantManagement" property="salesMan" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenRemarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>
                <domainSearch:textField domain="handBrushMerchantManagement" property="mobileNo"/>

                <domainSearch:datePicker domain="handBrushMerchantManagement" property="createDate" dataDateFormat="yyyy-mm-dd"/>
                <domainSearch:select2 property="merchantGrade" domain="handBrushMerchantManagement" class="form-control" name="q_status" from="${com.suixingpay.ssp.front.merchant.merchantquery.HandBrushMerchantManagement.getConstraintsMap()['merchantGrade'].inList}" valueMessagePrefix="handBrushMerchantManagement.merchantGrade" value="${params ? params['q_merchantGrade'] : ''}"  noSelection="['':'请选择']" />

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="col-md-4 control-label">
                            %{--装机地址省(市)--}%
                            <message:property domain="handBrushMerchantManagement" property="localarea" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-4">
                                <span id="provincespan"></span>
                            </div>

                            <div class="col-md-4">
                                <span id="cityspan"></span>
                            </div>

                        </div>
                    </div>
                </div>


                %{--<domainSearch:textField domain="handBrushMerchantManagement" property="localarea"/>--}%

                <domainSearch:select2 property="merchantStatus" domain="handBrushMerchantManagement" class="form-control" name="q_merchantStatus" from="${com.suixingpay.ssp.front.merchant.merchantquery.HandBrushMerchantManagement.getConstraintsMap()['merchantStatus'].inList}" valueMessagePrefix="handBrushMerchantManagement.merchantStatus" value="${params ? params['q_merchantStatus'] : ''}"  noSelection="['':'请选择']" />






            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}" btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"  btnCssClass="btn btn-modify"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
%{--<content tag="takin-footer">--}%
%{--<g:javascript>--}%
    %{--$(function(){--}%

         %{--$("#province").on('change',function () {--}%
              %{--// alert($("#province").val());--}%
             %{--$.ajax({--}%
                 %{--url: "${g.createLink(controller: "handBrushMerchantManagement", action: "getCity")}",--}%
                    %{--data: {--}%
                            %{--province:$("#province").val()--}%
                           %{--},--}%
                    %{--}).done(function(data) {--}%
                         %{--// alert(data);--}%
                        %{--$("#city").html(data)--}%

                     %{--}).fail(function (e, data)   {--}%
                         %{--console.log("error");--}%
                     %{--}).always(function() {--}%
                         %{--console.log("complete");--}%
                     %{--});--}%
         %{--});--}%
        %{--});--}%
%{--</g:javascript>--}%
%{--</content>--}%
