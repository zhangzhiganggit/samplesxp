<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.HandBrushMerchantManagement" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title"><g:message code="handBrushMerchantManagement.unbindDetails.label"/></h4>
</div>
<div class="modal-body text-nowrap">
    <div class="row ">
        <component:portlet cssClass="scaffold-show ">
            <portlet:title title="${message(code: 'handBrushMerchantManagement.merchantInfo.label', args: message.domain(domain: 'handBrushMerchantManagement'))}"/>
            <portlet:body withForm="true">
                <form:form>
                <form:body>
                    <input type="hidden" id="merchantCode" value="${handBrushMerchantManagementInstance?.merchantCode}"/>
                    <input type="hidden" id="posNum" value=""/>

                    <domainShow:displayString domain="handBrushMerchantManagement" property="merchantCode"
                                              domainInstance="${handBrushMerchantManagementInstance}"/>
                    <domainShow:displayString domain="handBrushMerchantManagement" property="businessName"
                                              domainInstance="${handBrushMerchantManagementInstance}"/>
                    <domainShow:displayString domain="handBrushMerchantManagement" property="idCardName"
                                              domainInstance="${handBrushMerchantManagementInstance}"/>
                    <domainShow:displayString domain="handBrushMerchantManagement" property="mobileNo"
                                              domainInstance="${handBrushMerchantManagementInstance}"/>
                    <domainShow:displayString domain="handBrushMerchantManagement" property="registAddress"
                                              domainInstance="${handBrushMerchantManagementInstance}"/>
                </form:body>
                </form:form >
            </portlet:body>

        </component:portlet>

        <component:portlet cssClass="scaffold-show ">
            <portlet:title title="${message(code: 'handBrushMerchantManagement.installInfo.label', args: message.domain(domain: 'handBrushMerchantManagement'))}"/>

            <portlet:body withForm="true">
                <form:form >
                <form:body>
                    <div class="col-xs-12 col-md-6 col-sm-6">
                        <div class="form-group">
                            <label class="control-label col-md-3"><g:if test="handBrushSn"></g:if><message:property domain="handBrushMerchantManagement" property="handBrushSn" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-6">
                                <g:select class="form-control select2" id="q_handBrushSn" name="q_handBrushSn" from="${listTerminal}" value="${params ? params['handBrushSn'] : ''}" valueMessagePrefix="handBrushMerchantManagement.handBrushSn" noSelection="['': '--请选择--']" />
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-6 col-sm-6">
                        <div class="form-group">
                            <label class="control-label col-md-3"><g:if test="factShortName"></g:if><message:property domain="handBrushMerchantManagement" property="factShortName" /><g:message code="dashBoard.system.colon"></g:message>
                            </label>
                            <div class="col-md-6">
                                <g:select class="form-control select2" id="q_factShortName" name="q_factShortName" from="${com.suixingpay.ssp.front.merchant.merchantquery.HandBrushMerchantManagement.getConstraintsMap()['factShortName'].inList}" value="${params ? params['q_factShortName'] : ''}" valueMessagePrefix="handBrushMerchantManagement.factShortName" noSelection="['': '--请选择--']" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12"><message:property domain="handBrushMerchantManagement" property="model" /><g:message code="dashBoard.system.colon"></g:message></label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <p class="form-control-static" id="mode"></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                   <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12"><message:property domain="handBrushMerchantManagement" property="terminalNumber" /><g:message code="dashBoard.system.colon"></g:message></label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <p class="form-control-static" id="terminalNumber"></p>
                            </div>
                        </div>
                    </div>
%{--                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12"><message:property domain="handBrushMerchantManagement" property="model" /><g:message code="dashBoard.system.colon"></g:message></label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                               --}%%{-- <p class="form-control-static" id="mode"></p>--}%%{--
                                <input type="text" class="form-control" id="mode" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12"><message:property domain="handBrushMerchantManagement" property="terminalNumber" /><g:message code="dashBoard.system.colon"></g:message></label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                               --}%%{-- <p class="form-control-static" id="terminalNumber"></p>--}%%{--

                                <input type="text" class="form-control" id="terminalNumber"  value=""/>
                            </div>
                        </div>
                    </div>--}%
                </form:body>
                </form:form >
            </portlet:body>
        </component:portlet>

    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-ok " id="unBindSubmit" data-dismiss="modal">解绑</button>
        <button type="button" class="btn btn-cancle" data-dismiss="modal">取消</button>
    </div>

</div>
<g:javascript>
    $(function(){
        $("#q_handBrushSn").on('change',function () {
            getFactName();
        });
        $("#q_factShortName").on('change',function () {
            getPosNum();
        });
        $("#unBindSubmit").on('click',function () {
            //手刷序列号
            var q_handBrushSn=$("#q_handBrushSn").val();
            //厂商名称
            var q_factShortName=$("#q_factShortName").val();
            //终端号
            var posNum=$("#posNum").val();
            if(null!=q_handBrushSn&&""!=q_handBrushSn&&null!=q_factShortName&&""!=q_factShortName&&null!=posNum&&""!=posNum){
                unbind();
            }else{
                bootbox.dialog({
                    message: "提示信息：安装信息不能为空",
                    buttons: {
                        success: {
                            label: '关闭',
                            className: "green"
                        }
                    }
                });
            }
        });

    });
    //获取厂商名称
    function getFactName() {
        var handBrushSn = $("#q_handBrushSn").val();
        var insideMerchantCode = $("#merchantCode").val();
        $.ajax({
            url: '/handBrushMerchantManagement/getFactoryName',
            data: {
                handBrushSn: handBrushSn,
                insideMerchantCode: insideMerchantCode
            }
        }).done(function (data) {
            if (data != "") {
                $('#q_factShortName').empty();
                var optionList = '<option value="" selected="selected" >--请选择--</option>';
                for (var i = 0; i < data.length; i++) {
                    optionList += "<option  value='" + data[i].factId + "'>" + data[i].factName + "</option>";

                }
                $("#q_factShortName").append(optionList);
            }
        });
    }
    //获取终端号 型号
    function getPosNum(){
        var handBrushSn=$("#q_handBrushSn").val();
        var insideMerchantCode=$("#merchantCode").val();
        var factId=$("#q_factShortName").val();
        $.ajax({
            url: '/handBrushMerchantManagement/getPosNum',
            data:{
                handBrushSn:handBrushSn,
                insideMerchantCode:insideMerchantCode,
                factId:factId
            }
        }).done(function(data) {
            $("#mode").text(data.posModel);
            $("#terminalNumber").text(data.posNumber);
            $("#posNum").val(data.posNumber);

        });
    }
    //手刷解绑
    function unbind(){
        var merchantCode=$("#merchantCode").val();
        var posNum=$("#posNum").val();
        $.ajax({
            url: '/handBrushMerchantManagement/unbind',
            data:{
                merchantCode:merchantCode,
                posNum:posNum
            }
        }).done(function(data) {
            if (data != "") {
                bootbox.dialog({
                    message: "提示信息："+data,
                    onEscape: function() {
                        $("div.scaffold-search form").submit();
                    },
                    buttons: {
                        success: {
                            label: '关闭',
                            className: "green",
                            callback: function () {
                                $("div.scaffold-search form").submit();
                            }
                        }
                    }
                });

            }
        });
    }

</g:javascript>

