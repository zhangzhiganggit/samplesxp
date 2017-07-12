<div class=" form-group btn-group pull-right bootstro" data-bootstro-title="" data-bootstro-content="${message(code:"suiYiTongAgent.queryAgentAmountUsed.pageGuide.label")}<div class='input-view'><input id='suiYiTongAgent.index' type='checkbox' class='popCheck'  onclick='neverShow();'/>下次不要显示<div>" data-bootstro-width="400px" data-bootstro-placement="left" data-bootstro-step="0">
    <g:link controller="suiYiTongAgent" action="queryAgentAmountUsed" class="btn btn-pay"><g:message code="suiYiTongAgent.showAgentAmount.label"/> </g:link>
</div>
<component:portlet cssClass="scaffold-search ">
    <portlet:body withForm="true">
        <form:form controller="suiYiTongAgent" action="submitNext"
                   name="scaffold-search-suiYiTongAgent" cssClass="form-bordered ">
            <form:scaffoldSearchProperties/>
            <form:body>
                %{----}%
                <g:if test="${returnMessage != null && returnMessage != ''}">
                    <g:hiddenField name="mess" id="mess" value="${returnMessage}"/>
                    <g:hiddenField id="flag" name="flag" value="${returnFlag}"/>
                </g:if>
                %{--代理商基本信息--}%
                        <component:portlet cssClass="scaffold-search">
                            <portlet:title
                                    title="${message(code: 'suiYiTongAgent.agentInfo.label', args: message.domain(domain: 'suiYiTongAgent'))}" popHelper="${message(code:"suiYiTongAgent.popHelper.label")}"/>
                            <portlet:body withForm="true">


                                <div class="form-group" style="overflow-y:auto;">
                                    <div class="form-group text-nowrap">
                                        <div class="col-md-12">
                                        <div class="col-xs-12 col-md-4 col-sm-4">
                                            <label class="col-md-4 form-control-static text-right">
                                                <message:property domain="suiYiTongAgent" property="agentOrgNo"/>
                                            </label>
                                            <div class="col-md-8 text-left">
                                                <g:textField name="agentOrgNo" value="${suiYiTongAgentInstance?.agentOrgNo}" class="form-control" readonly="true"></g:textField>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-md-4 col-sm-4">
                                            <label class="col-md-4 form-control-static text-right">
                                                <message:property domain="suiYiTongAgent" property="agentName"/>
                                            </label>
                                            <div class="col-md-8 text-left">
                                                <g:textField name="agentName" value="${suiYiTongAgentInstance?.agentName}" class="form-control" readonly="true"></g:textField>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-md-4 col-sm-4">
                                            <label class="col-md-4 form-control-static text-right">
                                                <message:property domain="suiYiTongAgent" property="city"/>
                                            </label>
                                            <div class="col-md-8 text-left">
                                                <g:textField name="city" value="${suiYiTongAgentInstance?.city}" class="form-control" readonly="true"></g:textField>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                    <br/>
                                </div>
                            </portlet:body>
                        </component:portlet>



            %{--当前随意通业务信息--}%
                <component:portlet cssClass="scaffold-search">
                    <portlet:title
                            title="${message(code: 'suiYiTongAgent.infoNow.label', args: message.domain(domain: 'suiYiTongAgent'))}"/>
                    <portlet:body withForm="true">
                        <div class="form-group" style="overflow-y:auto;">
                            <div class="form-group text-nowrap">
                                <div class="col-md-12">
                                    <div class="col-xs-12 col-md-4 col-sm-4">
                                        <label class="col-md-4 form-control-static text-right">
                                            <message:property domain="suiYiTongAgent" property="businessScaleNow"/>
                                        </label>
                                        <div class="col-md-8 text-left">
                                            <g:textField name="businessScaleNow" value="每日${suiYiTongAgentInstance?.businessScaleNow}" class="form-control" readonly="true"></g:textField>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-4 col-sm-4">
                                        <label class="col-md-4 form-control-static text-right">
                                            <message:property domain="suiYiTongAgent" property="investmentProportionNow"/>
                                        </label>
                                        <div class="col-md-8 text-left">
                                            <g:textField name="investmentProportionNow" value="${suiYiTongAgentInstance?.investmentProportionNow}%" class="form-control" readonly="true"></g:textField>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-4 col-sm-4">
                                        <label class="col-md-4 form-control-static text-right">
                                            <message:property domain="suiYiTongAgent" property="investmentAmountNow"/>
                                        </label>
                                        <div class="col-md-8 text-left">
                                            <g:textField name="investmentAmountNow" value="${suiYiTongAgentInstance?.investmentAmountNow}" class="form-control" readonly="true"></g:textField>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-4 col-sm-4">
                                        <label class="col-md-4 form-control-static text-right">
                                            <message:property domain="suiYiTongAgent" property="yieldNow"/>
                                        </label>
                                        <div class="col-md-8 text-left">
                                            <g:textField name="yieldNow" value="${suiYiTongAgentInstance.yieldNow}%" class="form-control" readonly="true"></g:textField>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br/>
                        </div>
                    </portlet:body>
                </component:portlet>


            %{--修改后随意通业务信息--}%
                <component:portlet cssClass="scaffold-search">
                    <portlet:title
                            title="${message(code: 'suiYiTongAgent.infoAlter.label', args: message.domain(domain: 'suiYiTongAgent'))}"/>
                    <portlet:body withForm="true">
                        <div class="form-group" style="overflow-y:auto;">
                            <div class="form-group text-nowrap">
                                <div class="col-md-12">
                                    <div class="col-xs-12 col-md-4 col-sm-4">
                                        <label class="col-md-4 form-control-static text-right">
                                            <span style="color: red">*</span><message:property domain="suiYiTongAgent" property="businessScaleNow"/>
                                        </label>
                                        <div class="col-md-8 text-left">
                                            <g:select class="form-control" name="businessScale" id="businessScale" from="[[key:'10000000',value:'每日10,000,000'],[key:'5000000',value:'每日5,000,000'],[key:'2000000',value:'每日2,000,000'],[key:'1000000',value:'每日1,000,000']]"  optionKey="key" optionValue="value"
                                                      noSelection="${['':'--请选择--']}"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-4 col-sm-4">
                                        <label class="col-md-4 form-control-static text-right">
                                            <span style="color: red">*</span><message:property domain="suiYiTongAgent" property="investmentProportionNow"/>
                                        </label>
                                        <div class="col-md-8 text-left">
                                            <g:select class="form-control" name="investmentProportion" id="investmentProportion" from="[[key:'1',value:'100%'],[key:'0.5',value:'50%'],[key:'0.2',value:'20%'],[key:'0.1',value:'10%']]" optionKey="key" optionValue="value" noSelection="${['':'--请选择--']}"/>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-4 col-sm-4">
                                        <label class="col-md-4 form-control-static text-right">
                                            <message:property domain="suiYiTongAgent" property="investmentAmountNow"/>
                                        </label>
                                        <div class="col-md-8 text-left">
                                            <g:textField name="investmentAmount" class="form-control" readonly="true"></g:textField>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-4 col-sm-4">
                                        <label class="col-md-4 form-control-static text-right">
                                            <message:property domain="suiYiTongAgent" property="yieldNow"/>
                                        </label>
                                        <div class="col-md-8 text-left">
                                            <g:textField name="yield" class="form-control" readonly="true"></g:textField>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br/>
                        </div>
                    </portlet:body>
                </component:portlet>

            %{--增/减资信息--}%

                <component:portlet cssClass="scaffold-search">
                    <portlet:title
                            title="${message(code: 'suiYiTongAgent.updownInfo.label', args: message.domain(domain: 'suiYiTongAgent'))}"/>
                    <portlet:body withForm="true">
                        <div class="form-group" style="overflow-y:auto;">
                            <div class="form-group text-nowrap">
                                <div class="col-md-12">
                                    <div class="col-xs-12 col-md-4 col-sm-4">
                                        <label class="col-md-4 form-control-static text-right">
                                            <message:property domain="suiYiTongAgent" property="increaseAmount"/>
                                        </label>
                                        <div class="col-md-8 text-left">
                                            <g:textField name="increaseAmount" class="form-control text-right" readonly="true"></g:textField>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-4 col-sm-4">
                                        <label class="col-md-4 form-control-static text-right">
                                            <message:property domain="suiYiTongAgent" property="decreaseAmount"/>
                                        </label>
                                        <div class="col-md-8 text-left">
                                            <g:textField name="decreaseAmount" class="form-control" readonly="true"></g:textField>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br/>
                        </div>
                    </portlet:body>
                </component:portlet>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'suiYiTongAgent.submit.label')}"
                                    btnCssClass="btn btn-submit" id="suiYiTongAgentSubMit"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}" id="suiYiTongAgentReset"
                                   btnCssClass="btn btn-primary"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
<asset:stylesheet src="global/plugins/bootstro/css/bootstro.css"/>
<content tag="takin-footer">
    <asset:javascript src="global/plugins/bootstro/js/bootstro.js"/>
    <asset:javascript src="/products/suiYiTongAgent.js"/>
    <script type="text/javascript">
        $(function(){
            if($("#flag").val()!="0"){
                checkIsShowStro("suiYiTongAgent.index");
            }
            var message = $("#mess").val();
            console.log(message);
            if('允许修改' == message){
                return false;
            }
            bootbox.alert({
                buttons: {
                    ok: {
                        label: '确定',
                    }
                },
                message: message,
                callback: function() {
                    console.log("跳转到审核页面啦！！！！！！！！！！")
                    location.href='/suiYiTongAuditDataQuery/index';
                },
                title: "",
            });
        })
    </script>
</content>