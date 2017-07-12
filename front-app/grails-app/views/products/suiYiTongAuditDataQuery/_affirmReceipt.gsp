<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title"><g:message code="suiYiTongAuditDataQueryInstance.afirmAmount.label"/> </h4>
</div>
<div class="modal-body">
<component:portlet>
    <portlet:body>
        <component:portlet cssClass="scaffold-search">
            <portlet:body withForm="true">
                <input type="hidden" id="hiddenCurrentStep" value="${suiYiTongAuditDataQueryInstance?.currentStep}"/>
                <input type="hidden" id="hiddenFlowVersion" value="${suiYiTongAuditDataQueryInstance?.flowVersion}"/>
                <input type="hidden" id="hiddentaskCode" value="${suiYiTongAuditDataQueryInstance?.taskCode}"/>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-xs-12 col-md-6 col-sm-6">
                            <label class="col-md-4 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="taskCode"/></label>
                            <div class="col-md-8 text-left"><label>${suiYiTongAuditDataQueryInstance?.taskCode}</label></div>
                        </div>
                        <div class="col-xs-12 col-md-6 col-sm-6">
                            <label class="col-md-4 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="arriveStatus"/></label>
                            <div class="col-md-8 text-left">
                                <g:if test="${suiYiTongAuditDataQueryInstance?.currentStep == '-5'}"><g:message code="suiYiTongAuditDataQuery.currentStep.-5"></g:message></g:if>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '-4'}"><g:message code="suiYiTongAuditDataQuery.currentStep.-4"></g:message></g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '-3'}"><g:message code="suiYiTongAuditDataQuery.currentStep.-3"></g:message></g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '-2'}"><g:message code="suiYiTongAuditDataQuery.currentStep.-2"></g:message></g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '-1'}"><g:message code="suiYiTongAuditDataQuery.currentStep.-1"></g:message></g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '1'}"><g:message code="suiYiTongAuditDataQuery.currentStep.1"></g:message></g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '2'}"><g:message code="suiYiTongAuditDataQuery.currentStep.2"></g:message></g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '3'}"><g:message code="suiYiTongAuditDataQuery.currentStep.3"></g:message></g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '4'}"><g:message code="suiYiTongAuditDataQuery.currentStep.4"></g:message></g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '5'}"><g:message code="suiYiTongAuditDataQuery.currentStep.5"></g:message></g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '6'}"><g:message code="suiYiTongAuditDataQuery.currentStep.6"></g:message></g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '7'}"><g:message code="suiYiTongAuditDataQuery.currentStep.7"></g:message></g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '8'}"><g:message code="suiYiTongAuditDataQuery.currentStep.8"></g:message></g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '9'}"><g:message code="suiYiTongAuditDataQuery.currentStep.9"></g:message></g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '10'}"><g:message code="suiYiTongAuditDataQuery.currentStep.10"></g:message></g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '11'}"><g:message code="suiYiTongAuditDataQuery.currentStep.11"></g:message></g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.currentStep == '12'}"><g:message code="suiYiTongAuditDataQuery.currentStep.12"></g:message></g:elseif>
                            </div>
                        </div>
                    </div>
                </div>
            </portlet:body>
        </component:portlet>
        %{--代理商基本信息--}%
        <component:portlet cssClass="scaffold-search">
            <portlet:title
                    title="${message(code: 'suiYiTongAuditDataQueryInstance.agentBaseInfo.label', args: message.domain(domain: 'suiYiTongAuditDataQuery'))}"/>
            <portlet:body withForm="true">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="agentOrgNo"/></label>
                            <div class="col-md-8 text-left"><g:textField class="form-control" name="agentOrgNo" value="${suiYiTongAuditDataQueryInstance?.agentOrgNo}" readOnly="true"></g:textField></div>
                        </div>
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="agentName"/></label>
                            <div class="col-md-8 text-left"><g:textField class="form-control" name="agentName" value="${suiYiTongAuditDataQueryInstance?.agentName}" readOnly="true"></g:textField></div>
                        </div>
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4 text-right form-control-static text-right"><message:property domain="suiYiTongAuditDataQuery" property="city"/></label>
                            <div class="col-md-8 text-left"><g:textField class="form-control" name="city" value="${suiYiTongAuditDataQueryInstance?.city}" readOnly="true"></g:textField></div>
                        </div>
                    </div>
                </div>
            </portlet:body>
        </component:portlet>
        %{--当前随意通业务信息--}%
        <component:portlet cssClass="scaffold-search">
            <portlet:title
                    title="${message(code: 'suiYiTongAuditDataQueryInstance.nowSuiYiTongBusiness.label', args: message.domain(domain: 'suiYiTongAuditDataQuery'))}"/>
            <portlet:body withForm="true">
                <div class="row">
                    <div class="col-md-12 text-nowrap">
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4  text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="businessScaleNow"/></label>
                            <div class="col-md-8 text-left"><g:textField class="form-control" name="businessScaleNow" value="${suiYiTongAuditDataQueryInstance?.businessScaleNow}" readOnly="true"></g:textField></div>
                        </div>
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4  text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="investmentProportionNow"/></label>
                            <div class="col-md-8 text-left"><g:textField class="form-control" name="investmentProportionNow" value="${suiYiTongAuditDataQueryInstance?.investmentProportionNow}" readOnly="true"></g:textField></div>
                        </div>
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4  text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="investmentAmountNow"/></label>
                            <div class="col-md-8 text-left"><g:textField class="form-control" name="investmentAmountNow" value="${suiYiTongAuditDataQueryInstance?.investmentAmountNow}" readOnly="true"></g:textField></div>
                        </div>
                    </div>
                    <div class="col-md-12 margin-top-20"></div>
                    <div class="col-md-12">
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4 form-control-static text-nowrap text-right" ><message:property domain="suiYiTongAuditDataQuery" property="yieldNow"/></label>
                            <div class="col-md-8 text-left"><g:textField class="form-control" name="yieldNow" value="${suiYiTongAuditDataQueryInstance?.yieldNow}" readOnly="true"></g:textField></div>
                        </div>
                    </div>
                </div>
            </portlet:body>
        </component:portlet>

        %{--修改后随意通业务信息--}%
        <component:portlet cssClass="scaffold-search">
            <portlet:title
                    title="${message(code: 'suiYiTongAuditDataQueryInstance.alterSuiYiTongBusiness.label', args: message.domain(domain: 'suiYiTongAuditDataQuery'))}"/>
            <portlet:body withForm="true">
                <div class="row">
                    <div class="col-md-12 text-nowrap">
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4  text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="businessScaleNow"/></label>
                            <div class="col-md-8 text-left"><g:textField class="form-control" name="businessScale" value="${suiYiTongAuditDataQueryInstance?.businessScale}" readOnly="true"></g:textField></div>
                        </div>
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4  text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="investmentProportionNow"/></label>
                            <div class="col-md-8 text-left"><g:textField class="form-control" name="investmentProportion" value="${suiYiTongAuditDataQueryInstance?.investmentProportion}" readOnly="true"></g:textField></div>
                        </div>
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4  text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="investmentAmountNow"/></label>
                            <div class="col-md-8 text-left"><g:textField class="form-control" name="investmentAmount" value="${suiYiTongAuditDataQueryInstance?.investmentAmount}" readOnly="true"></g:textField></div>
                        </div>
                    </div>
                    <div class="col-md-12 margin-top-20"></div>
                    <div class="col-md-12">
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4 form-control-static text-nowrap text-right" ><message:property domain="suiYiTongAuditDataQuery" property="yieldNow"/></label>
                            <div class="col-md-8 text-left"><g:textField class="form-control" name="yield" value="${suiYiTongAuditDataQueryInstance?.yield}" readOnly="true"></g:textField></div>
                        </div>
                    </div>
                </div>
            </portlet:body>
        </component:portlet>
        %{--增/减资信息--}%
        <component:portlet cssClass="scaffold-search">
            <portlet:title
                    title="${message(code: 'suiYiTongAuditDataQueryInstance.Info.label', args: message.domain(domain: 'suiYiTongAuditDataQuery'))}"/>
            <portlet:body withForm="true">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4 text-right form-control-static" ><message:property domain="suiYiTongAuditDataQuery" property="increaseAmount"/></label>
                            <div class="col-md-8 text-left"><g:textField class="form-control" name="increaseAmount" value="${suiYiTongAuditDataQueryInstance?.increaseAmount}" readOnly="true"></g:textField></div>
                        </div>
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4 text-right form-control-static" ><message:property domain="suiYiTongAuditDataQuery" property="decreaseAmount"/></label>
                            <div class="col-md-8 text-left"><g:textField class="form-control" name="decreaseAmount" value="${suiYiTongAuditDataQueryInstance?.decreaseAmount}" readOnly="true"></g:textField></div>
                        </div>
                    </div>
                </div>
            </portlet:body>
        </component:portlet>
            %{--处理意见--}%
        <component:portlet cssClass="scaffold-search">
            <portlet:title
                    title="${message(code: 'suiYiTongAuditDataQueryInstance.opinion.label', args: message.domain(domain: 'suiYiTongAuditDataQuery'))}"/>
            <portlet:body withForm="true">
                <div class="row">
                    <div class="col-md-12">



                        <g:each in="${opinoinList}" var="opinoin">
                            <div class="form-group text-nowrap">
                                <div class="col-md-12">
                                    <div class="col-md-3">
                                        <label class="col-md-4 text-right">
                                            <message:property domain="suiYiTongAuditDataQuery" property="transactor"/>
                                        </label>
                                        <div class="col-md-8 text-left">
                                            ${opinoin.transactor}
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="col-md-4 text-right">
                                            <message:property domain="suiYiTongAuditDataQuery" property="processTime"/>
                                        </label>
                                        <div class="col-md-8">
                                            ${opinoin.processTime}
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label class="col-md-6 text-right">
                                            <g:message code="suiYiTongAuditDataQueryInstance.remark.label"/>
                                        </label>
                                        <div class="col-md-6">
                                            ${opinoin.opinion}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </g:each>



                    </div>
                </div>
            </portlet:body>
        </component:portlet>
%{--损失情况说明--}%
        <component:portlet cssClass="scaffold-search">
            <portlet:title
                    title="${message(code: 'suiYiTongAuditDataQueryInstance.lossCondition.label', args: message.domain(domain: 'suiYiTongAuditDataQuery'))}"/>
            <portlet:body withForm="true">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group text-nowrap">
                            <div class="col-md-12">
                                <div class="col-md-12">
                                    <ladel class="col-md-1 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="lossSituation"/></ladel>
                                    <div class="col-md-11 text-left"><g:textArea class="form-control" name="lossSituation" readonly="readonly">${suiYiTongAuditDataQueryInstance?.lossSituation}</g:textArea></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </portlet:body>
        </component:portlet>
%{--实际退款金额--}%
        <component:portlet cssClass="scaffold-search">
            <portlet:title
                    title="${message(code: 'suiYiTongAuditDataQuery.drawbackAmount.label', args: message.domain(domain: 'suiYiTongAuditDataQuery'))}"/>
            <portlet:body withForm="true">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="col-md-12">
                            <label class="col-md-12">综合代理商的各方面情况（包括但不限于所属商户的历史损失占比、本金账户余额），最终的实际退款金额为：<g:textField name="drawbackAmount" value="${suiYiTongAuditDataQueryInstance?.drawbackAmount}" readOnly="true"/>元</label>
                        </div>
                    </div>
                </div>
            </div>
            </portlet:body>
        </component:portlet>
        <form:actions>
                <button class="btn btn-ok" type="button" id="suiYiTongSubMit" href="javascript:;"><g:message code="suiYiTongAuditDataQueryInstance.submit.label"/></button>
                %{--<formActions:submit value="${message(code: 'suiYiTongAuditDataQueryInstance.submit.label')}" btnCssClass="btn btn-submit"/>--}%
                <button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message code="suiYiTongAuditDataQueryInstance.cancel.label"/> </button>
        </form:actions>
    </portlet:body>
</component:portlet>
</div>
<script type="text/javascript">
    $(function(){
        $("#suiYiTongSubMit").click(function(){
            var flowVersion = $("#hiddenFlowVersion").val();
            var taskCode = $("#hiddentaskCode").val();
            var businessScale = $("#businessScale").val();
            var investmentProportion = $("#investmentProportion").val();
            var investmentAmount = $("#investmentAmount").val();
            var yield = $("#yield").val();
            subNext(flowVersion,taskCode,businessScale,investmentProportion,investmentAmount,yield);
        });
    });

    function subNext(flowVersion,taskCode,businessScale,investmentProportion,investmentAmount,yield){
        $.ajax({
            type:'post',
            url:'/suiYiTongAuditDataQuery/subNext',
            dataType:'json',
            data:{flowVersion:flowVersion,taskCode:taskCode,businessScale:businessScale,investmentProportion:investmentProportion,investmentAmount:investmentAmount,yield:yield},
            success:function(data){
                bootbox.alert({
                    buttons: {
                        ok: {
                            label: '确定',
                        }
                    },
                    message: data.msg,
                    callback: function() {
                        window.close();
                        location.reload();
                    },
                    title: "",
                });
            }
        });
    }
</script>




