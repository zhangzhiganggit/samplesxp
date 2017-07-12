<%@ page import="com.suixingpay.ssp.front.shareProfit.MenthodProfitDetail" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title">
        <div class="widget-header">
            <h5 class="widget-title bigger">
            导出结果
            </h5>
        </div>
    </h4>
</div>

<div class="modal-body">
    <form:form>
        <div class="row">
            %{--      <label class="control-label col-md-5 ">
                      <message:property domain="cardManagement" property="subordinateOrg"/>
                  </label>
                  <div class="text-center">
                      <div class="col-md-4">
                          <g:select class="form-control q_showLevel"
                                    from="${com.suixingpay.ssp.front.shareProfit.MenthodProfitDetail.getConstraintsMap()['showLevel'].inList}"
                                    name="q_showLevel" valueMessagePrefix="menthodProfitDetail.showLevel"
                                    value="${params ? params['q_showLevel'] : ''}" noSelection="['': '--请选择--']"/>
                      </div>
                  </div>--}%

            <label class="control-label col-md-5 ">
            导出结果至
            </label>

            <div class="text-center">
                <div class="col-md-4">
                    <select class="form-control" name="q_showLevel" id="q_showLevel1">
                        <option value="">--请选择--</option>
                    </select>
                </div>
            </div>

            <input type="hidden" value="${level}" id="levelID">

        </div>
    </form:form>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-transfer transferButton" onclick="selectCheck();">确认</button>
    <button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message
            code="cardManagement.cancle.label"></g:message></button>
</div>
<asset:javascript src="/shareProfit/shareProfit.js"/>

