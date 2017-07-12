<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="false" ></button>
    <h4 class="modal-title"><g:message code="suiYiTongAuditDataQueryInstance.agentSuiYiTongAlter.label"/> </h4>
</div>
<div class="modal-body">
<component:portlet cssClass="form-bordered form-horizontal">
    <portlet:body >


        <component:portlet cssClass="scaffold-search">
            <portlet:body withForm="true">
                <div class="form-group text-nowrap">
                    <div class="col-md-12">
                        <div class="col-xs-12 col-md-6 col-sm-6">
                            <label class="col-md-4  text-right"><message:property domain="suiYiTongAuditDataQuery" property="taskCode"/></label>
                            <div class="col-md-8 text-left">${suiYiTongAuditDataQueryInstance?.taskCode}</div>
                        </div>
                        <div class="col-xs-12 col-md-6 col-sm-6">
                            <label class="col-md-4 text-right"><message:property domain="suiYiTongAuditDataQuery" property="arriveStatus"/></label>
                            <div class="col-md-8 text-left">
                                <g:if test="${suiYiTongAuditDataQueryInstance?.arriveStatus == '1'}">
                                    <g:message code="suiYiTongAuditDataQuery.arriveStatus.1"/>
                                </g:if>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.arriveStatus == '2'}">
                                    <g:message code="suiYiTongAuditDataQuery.arriveStatus.2"/>
                                </g:elseif>
                                <g:elseif test="${suiYiTongAuditDataQueryInstance?.arriveStatus == '3'}">
                                    <g:message code="suiYiTongAuditDataQuery.arriveStatus.3"/>
                                </g:elseif>
                            </div>
                        </div>
                        %{--<div class="col-xs-12 col-md-4 col-sm-4">--}%
                            %{--<label class="col-md-4 text-right"><message:property domain="suiYiTongAuditDataQuery" property="auditResult"/></label>--}%
                            %{--<div class="col-md-8 text-left">--}%
                                %{--<g:if test="${suiYiTongAuditDataQueryInstance?.arriveStatus == '1'}">--}%
                                    %{--<g:message code="suiYiTongAuditDataQuery.arriveStatus.1"/>--}%
                                %{--</g:if>--}%
                                %{--<g:elseif test="${suiYiTongAuditDataQueryInstance?.arriveStatus == '2'}">--}%
                                    %{--<g:message code="suiYiTongAuditDataQuery.arriveStatus.2"/>--}%
                                %{--</g:elseif>--}%
                                %{--<g:elseif test="${suiYiTongAuditDataQueryInstance?.arriveStatus == '3'}">--}%
                                    %{--<g:message code="suiYiTongAuditDataQuery.arriveStatus.3"/>--}%
                                %{--</g:elseif>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    </div>
                </div>
            </portlet:body>
        </component:portlet>
    %{--商户随意通信息--}%
        <component:portlet cssClass="scaffold-search">
            <portlet:title
                    title="${message(code: 'suiYiTongAuditDataQueryInstance.agentSuiYiTongInfo.label', args: message.domain(domain: 'suiYiTongAuditDataQuery'))}"/>
            <portlet:body withForm="true">
                <div class="form-group text-nowrap">
                    <div class="col-md-12">
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="merchantCode"/></label>
                            <div class="col-md-8 text-left"><g:textField  name="merchantCode"  value="${suiYiTongAuditDataQueryInstance?.merchantCode}" class="form-control" readOnly="true"></g:textField></div>
                        </div>
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="receiptsName"/></label>
                            <div class="col-md-8 text-left"><g:textField  name="receiptsName" value="${suiYiTongAuditDataQueryInstance?.receiptsName}" class="form-control" readOnly="true"></g:textField></div>
                        </div>
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="currentAmount"/></label>
                            <div class="col-md-8 text-left"><g:textField  name="currentAmount"  value="${suiYiTongAuditDataQueryInstance?.currentAmount}" class="form-control" readOnly="true"></g:textField></div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="applyQuota"/></label>
                            <div class="col-md-8 text-left"><g:textField  class="form-control" name="applyQuota" value="${suiYiTongAuditDataQueryInstance?.applyQuota}" readOnly="true"></g:textField></div>
                        </div>
                    </div>
                </div>
            </portlet:body>
        </component:portlet>
    %{--会签意见--}%
        <g:if test="${suiYiTongAuditDataQueryInstance.arriveStatus != '1' }">
        <component:portlet cssClass="scaffold-search">
            <portlet:title
                    title="${message(code: 'suiYiTongAuditDataQueryInstance.opinion.label', args: message.domain(domain: 'suiYiTongAuditDataQuery'))}"/>
            <portlet:body withForm="true">
                <div class="form-group text-nowrap">
                    <div class="col-md-12">
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="transactor"/></label>
                            <div class="col-md-8 text-left"><g:textField  name="transactor"  value="${suiYiTongAuditDataQueryInstance?.transactor}" class="form-control" readOnly="true"></g:textField></div>
                        </div>
                        <div class="col-xs-12 col-md-4 col-sm-4">
                            <label class="col-md-4 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="processTime"/></label>
                            <div class="col-md-8 text-left"><g:textField  name="processTime" value="${suiYiTongAuditDataQueryInstance?.processTime}" class="form-control" readOnly="true"></g:textField></div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-xs-12 col-md-1 col-sm-4" style="margin-left: 3.5rem;">
                            <label class="col-md-12 text-right form-control-static"><g:message code="suiYiTongAuditDataQueryInstance.remark.label"/></label>
                        </div>
                        <div class="col-md-8" style="margin-left: -1.3rem;">
                            <div class="col-md-12 text-left"><g:textArea  name="opinion" class="form-control" value="${suiYiTongAuditDataQueryInstance?.opoinion}" readOnly="true"></g:textArea></div>
                        </div>
                    </div>
                </div>
            </portlet:body>
        </component:portlet>
        </g:if>
    </portlet:body>
</component:portlet>
</div>
<div class="modal-footer">
    %{--<button type="button" class="btn default" data-dismiss="modal">Close</button>
    <button type="button" class="btn blue">Save changes</button>--}%
</div>