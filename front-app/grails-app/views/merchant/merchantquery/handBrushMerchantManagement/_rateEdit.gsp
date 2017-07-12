<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.HandBrushMerchantManagement" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title"><g:message code="handBrushMerchantManagement.rateEditDetails.label"/></h4>
</div>
<div class="modal-body text-nowrap">
    <div class="row ">
        <component:portlet cssClass="scaffold-show ">
            <portlet:body withForm="true">
                <form:form action="index">
                    <form:body>
                        <input type="hidden" id="purPoseType" value="${purPoseType}"/>
                        <input type="hidden" id="businessName" value="${handBrushMerchantManagementInstance?.businessName}"/>
                        <input type="hidden" id="merchantCode" value="${handBrushMerchantManagementInstance?.merchantCode}"/>
                        <input type="hidden" id="merchantLevel" value="${handBrushMerchantManagementInstance?.merchantGrade}"/>
                        <input type="hidden" id="insideMerchantCode" value="${handBrushMerchantManagementInstance?.insideMerchantCode}"/>

                        <div class="row">
                            <formCommon:hiddenField name="id" value="${handBrushMerchantManagementInstance?.id}"/>

                            <domainShow:displayString domain="handBrushMerchantManagement" property="merchantCode"
                                                      domainInstance="${handBrushMerchantManagementInstance}"/>
                            <domainShow:displayString domain="handBrushMerchantManagement" property="businessName"
                                                      domainInstance="${handBrushMerchantManagementInstance}"/>
                            <domainShow:displayString domain="handBrushMerchantManagement" property="merchantGrade"
                                                      domainInstance="${handBrushMerchantManagementInstance}"/>
                            <domainShow:displayString domain="handBrushMerchantManagement" property="rate"
                                                      domainInstance="${handBrushMerchantManagementInstance}"/>
                        </div>
                        <g:if test="${comboType.contains('PB01')}">
                            <div class="row">
                                 <div class="col-md-6 col-sm-6 col-xs-12">
                                     <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">费率设置<g:message code="dashBoard.system.colon"></g:message></label>
                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="PB01" checked="">套餐一：非秒到+0.65%费率
                                      </div>
                                 </div>

                            </div>
                        </g:if>
                        <g:if test="${comboType.contains('PB02')}">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="PB02" checked="">套餐二：秒到+等级费率
                                </div>
                            </div>
                        </div>
                        </g:if>
                        <g:if test="${comboType.contains('PB03')}">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios3" value="PB03" checked="">套餐三：秒到+0.6%费率
                                </div>
                            </div>
                        </div>
                        </g:if>
                        <g:if test="${comboType.contains('PB04')}">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios4" value="PB04" checked="">套餐四：秒到+0.65%费率
                                </div>
                            </div>
                        </div>
                        </g:if>
                        <g:if test="${comboType.contains('PB05')}">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios5" value="PB05" checked="">套餐五：秒到+0.64%费率
                                </div>
                            </div>
                        </div>
                        </g:if>
                        <g:if test="${comboType.contains('PB06')}">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios6" value="PB06" checked="">套餐六：秒到+0.63%费率
                                </div>
                            </div>
                        </div>
                        </g:if>
                        <g:if test="${comboType.contains('PB07')}">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios7" value="PB07" checked="">套餐七：秒到+0.62%费率
                                </div>
                            </div>
                        </div>
                        </g:if>
                        <g:if test="${comboType.contains('PB08')}">
                        <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                <input type="radio" name="optionsRadios" id="optionsRadios8" value="PB08" checked="">套餐八：秒到+0.61%费率
                            </div>
                        </div>
                        </div>
                        </g:if>
                        <g:if test="${comboType.contains('PB09')}">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios9" value="PB09" checked="">套餐九：秒到+0.59%费率
                                </div>
                            </div>
                        </div>
                        </g:if>
                        <g:if test="${comboType.contains('PB10')}">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios10" value="PB10" checked="">套餐十：秒到+0.58%费率
                                </div>
                            </div>
                        </div>
                        </g:if>
                    </form:body>
                    <form:actions>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-ok " id="editSubmit" data-dismiss="modal">确认</button>
                        <button type="button" class="btn btn-cancle" data-dismiss="modal">取消</button>
                    </div>
                </form:actions>
                </form:form>
            </portlet:body>
        </component:portlet>
    </div>


</div>
%{--<div class="modal-footer">
    <button type="button" class="btn btn-ok " id="editSubmit" data-dismiss="modal">确认</button>
    <button type="button" class="btn btn-cancle" data-dismiss="modal">取消</button>
</div>--}%

<g:javascript>
    $(function(){
        checkComboType();
        $("#editSubmit").on('click',function () {
           // e.preventDefault();
            btnSubmit();
        });
    });
    function checkComboType(){
        debugger;
        var purPoseType=$("#purPoseType").val();
        if(purPoseType=='PB01'){
            $('#optionsRadios1').prop('checked',true);
        }else if(purPoseType=='PB02'){
            $('#optionsRadios2').prop('checked',true);
        }else if(purPoseType=='PB03'){
            $('#optionsRadios3').prop('checked',true);
        }else if(purPoseType=='PB04'){
            $('#optionsRadios4').prop('checked',true);
        }else if(purPoseType=='PB05'){
            $('#optionsRadios5').prop('checked',true);
        }else if(purPoseType=='PB06'){
            $('#optionsRadios6').prop('checked',true);
        }else if(purPoseType=='PB07'){
            $('#optionsRadios7').prop('checked',true);
        }else if(purPoseType=='PB08'){
            $('#optionsRadios8').prop('checked',true);
        }else if(purPoseType=='PB09'){
            $('#optionsRadios9').prop('checked',true);
        }else if(purPoseType=='PB10'){
            $('#optionsRadios10').prop('checked',true);
        }
    }

    function btnSubmit(){
        var purPoseType=$("input[type='radio']:checked").val();
        var merchantCode=$("#merchantCode").val();
        var businessName=$("#businessName").val();
        var merchantLevel=$("#merchantLevel").val();
        var insideMerchantCode=$("#insideMerchantCode").val();
        $("#purPoseType").val(purPoseType);
        $.ajax({
            url: '/handBrushMerchantManagement/rateEditSubmit',
            data:{
                purPoseType:purPoseType,
                merchantCode:merchantCode,
                insideMerchantCode:insideMerchantCode,
                businessName:businessName,
                merchantLevel:merchantLevel
            }
        }).done(function(data){
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
