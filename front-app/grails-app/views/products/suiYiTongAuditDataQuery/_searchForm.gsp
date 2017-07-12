
<component:portlet cssClass="scaffold-search">
    <portlet:title
            title="${message(code: 'suiYiTongAuditDataQuery.search.label', args: message.domain(domain: 'suiYiTongAuditDataQuery'))}"
            iconCssClass="fa fa-filter"/>
    <portlet:body withForm="true">
        <form:form controller="suiYiTongAuditDataQuery" action="index"
                   name="scaffold-search-suiYiTongAuditDataQuery">
            <form:scaffoldSearchProperties/>
            <form:body>
                <g:if test="${returnMessage != null && returnMessage != ''}">
                    <g:hiddenField name="mess" id="mess" value="${returnMessage}"/>
                </g:if>
                <div class="form-group">
                    <div class="col-md-12">
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <lable class="col-md-4 control-label"><message:property domain="suiYiTongAuditDataQuery" property="taskCode"/><g:message code="dashBoard.system.colon"></g:message>
                            </lable>
                            <div class="col-md-8 "><g:textField name="taskCode"  class="form-control" value="${suiYiTongAuditDataQueryInstance.taskCode}"></g:textField></div>
                        </div>
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <lable class="col-md-4 control-label"><message:property domain="suiYiTongAuditDataQuery" property="taskType"/><g:message code="dashBoard.system.colon"></g:message>
                            </lable>
                            <div class="col-md-8">
                            <g:select value="${suiYiTongAuditDataQueryInstance.taskType}" id="taskType" onchange="switchFlowType()" class="form-control" required="required" name="taskType" from="[[key:'00',value:'商户随意通调额'],[key:'01',value:'代理商修改随意通业务']]" optionKey="key" optionValue="value"/>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <lable class="col-md-4 control-label"><message:property domain="suiYiTongAuditDataQuery" property="taskStatus"/><g:message code="dashBoard.system.colon"></g:message>
                            </lable>
                            <div class="col-md-8 " id="agentSel">
                                <g:select value="${suiYiTongAuditDataQueryInstance.taskStatus}" class="form-control" name="taskStatus" from="[[key:'',value: '--请选择--'],[key:'1,5,11',value:'待审核'],[key:'4,10,12',value:'审核通过'],[key:'-5,-4,-3,-2,-1',value: '审核驳回'],[key:'3,6,7,8',value:'审核中'],[key:'2,9',value:'待办理']]" optionKey="key" optionValue="value"/>
                            </div>
                            <div class="col-md-8 " id="merchantSel">
                                <g:select value="${suiYiTongAuditDataQueryInstance.mtaskStatus}" class="form-control" id="mtaskStatus" name="mtaskStatus" from="[[key:'',value: '--请选择--'],[key:'1',value:'待审核'],[key:'3',value:'审核通过'],[key:'2',value:'审核不通过']]" optionKey="key" optionValue="value"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-12">
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4 control-label"><message:property domain="suiYiTongAuditDataQuery" property="merchantCode"/><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8"><g:textField name="merchantCode" class="form-control" value="${suiYiTongAuditDataQueryInstance.merchantCode}"></g:textField></div>
                        </div>
                        %{--<div class="col-md-4">--}%
                            %{--<label class="col-md-4 control-label">更新日期：</label>--}%
                            %{--<div class="col-md-8">--}%
                                %{--<div class="input-group date-picker input-daterange" data-date-format="yyyy-mm-dd">--}%
                                    %{--<input class="form-control" name="q_updateDate_from" value="" type="text">--}%
                                    %{--<span class="input-group-addon"> to </span>--}%
                                    %{--<input class="form-control" name="q_updateDate_to" value="" type="text">--}%
                                %{--</div>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4 control-label"><message:property domain="suiYiTongAuditDataQuery" property="launchDate"/><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-8">
                                <div class="input-group date-picker input-daterange" data-date-format="yyyy-mm-dd">
                                    <input class="form-control" name="q_launchDate_from" value="${suiYiTongAuditDataQueryInstance.launchDateFrom}" type="text">
                                    <span class="input-group-addon"> to </span>
                                    <input class="form-control" name="q_launchDate_to" value="${suiYiTongAuditDataQueryInstance.launchDateTo}" type="text">
                                </div>
                            </div>
                        </div>
                        %{--<domainSearch:datePicker domain="suiYiTongAuditDataQuery" property="launchDate" dataDateFormat="yyyy-mm-dd"/>--}%
                    </div>
                </div>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.search.label')}"
                                    btnCssClass="btn btn-search"/>
                <formActions:reset value="${message(code: 'default.button.reset.label')}"
                                   btnCssClass="btn btn-reset"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="/products/suiYiTongAuditDataQuery.js"/>
    <script type="text/javascript">
        $(function(){
            var message = $("#mess").val();
            console.log(message);
            bootbox.alert(message);
//            bootbox.alert({
//                buttons: {
//                    ok: {
//                        label: '确定',
//                    }
//                },
//                message: message,
//                callback: function() {
//                    console.log("跳转到审核页面啦！！！！！！！！！！")
//                    location.href='/suiYiTongAuditDataQuery/index';
//                },
//                title: "",
//            });
        })
    </script>
</content>
