<%@ page import="com.suixingpay.ssp.front.merchant.merchantquery.OtherConsumeMerchantManagement" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title">VV商户费率修改</h4>
</div>
<div class="modal-body">

    <div class="row text-nowrap">
        <component:portlet cssClass="scaffold-show">


            <portlet:body withForm="true">
                <form:form action="#" id="updateRete">
                    <form:body>

                        <formCommon:hiddenField name="insideMerchantCode" value="${otherConsumeMerchantManagementInstance?.insideMerchantCode}"/>
                        <formCommon:hiddenField name="status" id="status" value="${otherConsumeMerchantManagementInstance?.status}"/>
                        <input type="hidden" id="rate" name="rate" value="${otherConsumeMerchantManagementInstance?.rate }"/>
                        <formCommon:hiddenField name="merchantCode" id="merchantCode" value="${otherConsumeMerchantManagementInstance?.merchantCode }"/>
                        <formCommon:hiddenField name="merchantName" id="merchantName" value="${otherConsumeMerchantManagementInstance?.merchantRegistName }"/>
                        %{--<input type="text" hidden  id="currentLeverNo" value="${LeverNo}"/>--}%

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="col-md-3 col-sm-3 col-xs-12 control-label">商户编号：
                                    </label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <p class="form-control-static">${otherConsumeMerchantManagementInstance?.merchantCode }&nbsp;</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="col-md-3 col-sm-3 col-xs-12 control-label">商户名称：
                                    </label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <p class="form-control-static">${otherConsumeMerchantManagementInstance?.merchantRegistName }&nbsp;</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <label class="col-md-3 col-sm-3 col-xs-12 control-label">当前费率(%)：
                                    </label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <p class="form-control-static">${otherConsumeMerchantManagementInstance?.rate }&nbsp;</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-sm-12">
                                <div class="form-group">
                                    <label class="col-md-3 col-sm-3 col-xs-12 control-label">新费率(%)：
                                    </label>
                                    <div class="col-md-2 col-sm-2 col-xs-12">
                                        <select class="form-control" name="newRate" id="newRate" required="required">
                                            <option value="0.38">0.38</option>
                                            <option value="0.3">0.3</option>
                                            <option value="0.5">0.5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </form:body>

                </form:form>
            </portlet:body>
            <div class="col-md-12 text-center">
                <button class="btn btn-modify Editor" id="updateRate" >修改</button>
                <button class="btn btn-cancle" data-dismiss="modal" id="closed">关闭</button>
            </div>
        </component:portlet>
            <g:javascript>
                $("#updateRate").on('click', function () {
                    if($("#status").val()!="正常"){
                        bootbox.alert("只允许正常状态商户修改");
                        $("#closed").trigger('click')
                    }else if($("#rate").val()==$("#newRate").val()){
                        bootbox.alert("新费率不允许与当前生效费率一致");
                    }else {
                        $.ajax({
                            url: '/otherConsumeMerchantManagement/updataRate2',
                            data: $('#updateRete').serialize(),
                            dataType:'json',
                            error:function(rep)
                            {
                                if(rep.code==0){
                                    bootbox.alert(rep.message);
                                }
                                else{
                                    bootbox.alert(rep.message);
                                }
                            },
                            success: function(rep) {
                                if(rep.code==0){
                                    bootbox.alert(rep.message);
                                    $("#closed").trigger('click')
                                    $(".btn-primary").click(function () {
                                         location.href="/otherConsumeMerchantManagement/index";
                                         /*location.reload()*/
                                    })
                                }
                                else{
                                    bootbox.alert({
                                        message : rep.message,
                                    });
                                    $("#closed").trigger('click')
                                }
                            }
                        })
                    }
                })
            </g:javascript>
    </div>


</div>

<div class="modal-footer"></div>
