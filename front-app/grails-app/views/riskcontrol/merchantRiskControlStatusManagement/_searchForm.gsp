
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'merchantRiskControlStatusManagement.searchCondition.label', args: message.domain(domain: 'merchantRiskControlStatusManagement'))}"
            iconCssClass="fa fa-filter" popHelper="${message(code:"merchantRiskControlStatusManagement.popHelper.label")}"/>
    <portlet:body withForm="true">
        <form:form controller="merchantRiskControlStatusManagement" action="index"
                   name="scaffold-search-merchantRiskControlStatusManagement" id="scaffoldSearchForm">
            <form:scaffoldSearchProperties/>
            <form:body>
                <formCommon:hiddenField id="isAdmin" name="isAdmin" value="${isAdmin}"/>
                <formCommon:hiddenField id="salesman" name="salesman" value="${params['q_salesman']}"/>
                <input type="hidden"  id="hiddenSalesMan" value="${hiddenSalesMan}"/>
                <input type="hidden" id="hiddenUserCode" value="${hiddenUserCode}"/>
                <input type="hidden" id="hiddenCurrentOrgNo" value="${hiddenCurrentOrgNo}"/>
                <input type="hidden" id="hiddenCurrentOrgName" value="${hiddenCurrentOrgName}"/>
                <domainSearch:textField domain="merchantRiskControlStatusManagement" property="merchantCode"/>
                <domainSearch:textField domain="merchantRiskControlStatusManagement" property="merchantSalesSlipName"/>
                <domainSearch:select2 property="merchantStatus" domain="merchantRiskControlStatusManagement" class="form-control" name="q_merchantStatus" from="${com.suixingpay.ssp.front.riskcontrol.MerchantRiskControlStatusManagement.getConstraintsMap()['merchantStatus'].inList}" valueMessagePrefix="merchantRiskControlStatusManagement.merchantStatus" value="${params ? params['q_merchantStatus'] : ''}" noSelection="['':'--请选择--']" />

                <g:if test="${isAdmin}">
                    <domainSearch:orgTree domain="merchantRiskControlStatusManagement" property="belongtoOrg" directly="true"/>
                    %{--<domainSearch:select property="belongtoOrg" domain="merchantRiskControlStatusManagement" class="form-control" name="q_belongtoOrg" from="${com.suixingpay.ssp.front.riskcontrol.MerchantRiskControlStatusManagement.getConstraintsMap()['belongtoOrg'].inList}" valueMessagePrefix="merchantRiskControlStatusManagement.belongtoOrg" value="${params ? params['q_belongtoOrg'] : ''}" noSelection="['':'--请选择--']" />--}%
                    %{--<domainSearch:select2 property="salesman" domain="merchantRiskControlStatusManagement" class="form-control" name="q_salesman" from="${com.suixingpay.ssp.front.riskcontrol.MerchantRiskControlStatusManagement.getConstraintsMap()['merchantStatus'].inList}" valueMessagePrefix="merchantRiskControlStatusManagement.merchantStatus" value="${params ? params['q_merchantStatus'] : ''}" noSelection="['':'--请选择--']" />--}%

                    <domainSearch:select2 domain="merchantRiskControlStatusManagement" property="salesman" class="form-control"
                                          from=""
                                          value="${params ? params['q_salesman'] : ''}" noSelection="['': '--请选择--']"/>
                </g:if>
                <g:else>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="merchantTerminalManagement" property="belongtoOrganization" />
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenCurrentOrgName}" readonly id="readonlyOrgNm"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-4 col-sm-4">
                        <div class="form-group">
                            <label class="control-label col-md-4">
                                <message:property domain="merchantTerminalManagement" property="salesMan" />
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="${hiddenRemarkName}" readonly id="readonlyRemarkName"/>
                            </div>
                        </div>
                    </div>
                </g:else>
                <domainSearch:select2 property="payStatus" domain="merchantRiskControlStatusManagement" class="form-control" name="q_payStatus" from="${com.suixingpay.ssp.front.riskcontrol.MerchantRiskControlStatusManagement.getConstraintsMap()['payStatus'].inList}" valueMessagePrefix="merchantRiskControlStatusManagement.payStatus" value="${params ? params['q_payStatus'] : ''}" noSelection="['':'--请选择--']" />
                <domainSearch:select2 property="tradeStatus" domain="merchantRiskControlStatusManagement" class="form-control" name="q_tradeStatus" from="${com.suixingpay.ssp.front.riskcontrol.MerchantRiskControlStatusManagement.getConstraintsMap()['tradeStatus'].inList}" valueMessagePrefix="merchantRiskControlStatusManagement.tradeStatus" value="${params ? params['q_tradeStatus'] : ''}" noSelection="['':'--请选择--']" />
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-modify"/>

            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <g:javascript>
        $(function () {
            $("input[name='q_merchantSalesSlipName']").keyup(function () {
                this.value=this.value.replace(/\s/g,'');
            });
            $("input[name='q_merchantCode']").keyup(function () {
                this.value=this.value.replace(/\s/g,'');
            });

            $("#orgInput").bind('change',function () {
                var orgNo = $("#orgInputId").val();
                var currentEmpNo= $("#salesman").val();
                getOrgUserNameList(orgNo,currentEmpNo);
            }).change();

            $("#q_salesman").change(function(){
                $("#salesman").val(this.value);
            });

            $(".btn-modify").click(function (e) {
                e.preventDefault();
                $("input:text").not("[readonly]").val("");
                $("select").prop('selectedIndex', 0);
                $(".select2-hidden-accessible").val("").trigger("change");
                $("#orgInputId").val($("#hiddenCurrentOrgNo").val());
                $("#orgInput").val($("#hiddenCurrentOrgName").val());
            });

        });

        //获取当前机构下业务员
        function getOrgUserNameList(orgNo,currentEmp){
            $.ajax({
                url: '/cardManagement/getOrgUserNameList',
                data:{
                    orgNo:orgNo
                }
            }).done(function(data) {
                if (data != "") {
                    $('#q_salesman').empty();
                    var optionList = "";
                    if(currentEmp == ""){
                        optionList='<option value="" selected="selected" >--请选择--</option>';
                    }else{
                        optionList='<option value="" >--请选择--</option>';
                    }
                    for (var i = 0; i < data.length; i++) {
                        if(currentEmp != "" && currentEmp== data[i].userCode){
                            optionList += "<option selected='selected'  value='" + data[i].userCode + "'>" + data[i].userName + "</option>";
                        }else{
                            optionList += "<option  value='" + data[i].userCode + "'>" + data[i].userName + "</option>";
                        }
                    }
                    $("#q_salesman").append(optionList);
                }else{
                    $('#q_salesman').empty();
                }
            });
        }
    </g:javascript>
</content>