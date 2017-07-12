<div class="modal-header ">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title"><g:message code="secondsReceived.openRate.label"></g:message> </h4>
</div>
<component:portlet>
    <portlet:body withForm="true">
        <g:uploadForm controller="secondsReceived" action="openRate"
                      name="scaffold-search-secondsReceived" id="closebut" onSubmit=" return closebut()">
            <form:scaffoldSearchProperties/>
            <form:body>
            %{--商户编号--}%
                <formCommon:hiddenField name="merchantCode" value="${secondsReceivedInstance?.merchantCode}"/>
            %{--签购单名称--}%
                <formCommon:hiddenField name="receiptsName" value="${secondsReceivedInstance?.receiptsName}"/>
            %{--posMd费率信息--}%
                <formCommon:hiddenField name="posMdStr" id="posMdStr" value="${secondsReceivedInstance?.posMdStr}"/>
            %{--对公对私判断--}%
                <formCommon:hiddenField name="settleFlag" value="${settleFlag}" id="settleFlag"/>
            %{--是否上传图片判断--}%
                <formCommon:hiddenField name="handIdcardNum" value="${picMap.handIdcardNum}" id="handIdcardNum"/>
            %{--是否上传图片判断--}%
                <formCommon:hiddenField name="idcardPositiveNum" value="${picMap.idcardPositiveNum}" id="idcardPositiveNum"/>
            %{--是否上传图片判断--}%
                <formCommon:hiddenField name="idcardOppositeNum" value="${picMap.idcardOppositeNum}" id="idcardOppositeNum"/>
                <input type="hidden" name="param" value="${param}"/>
            %{--附件信息--}%
                <component:portlet>
                    <portlet:body withForm="false">
                        <div id="posMdRateInfo" class="row">
                            <div id="newPosMdInfoDiv" class="col-md-5"></div>
                        </div>
                    </portlet:body>
                </component:portlet>

                <g:if test="${settleFlag != 0 && (picMap.handIdcardNum == 1 || picMap.idcardPositiveNum == 1 || picMap.idcardOppositeNum == 1)}">
                <component:portlet cssClass="scaffold-search">

                    <portlet:body withForm="true">
                        <div class="form-group" style="overflow-y:auto;overflow-x:hidden;">


                        <div class="form-group">
                            <div class="col-md-12">

                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 120px;">
                                            <div style="margin-top: 30%;" id="handIdTitle"><g:message code="secondsReceived.handIdcardPic.label"/> </div>
                                        </div>

                                        <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 120px;" id="handIdcardPicBase64"> </div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"> <g:message code="secondsReceived.upLoad.label"/> </span>
                                                <span class="fileinput-exists"> <g:message code="secondsReceived.alter.label"/> </span>
                                                <img id="handIdcardPicTempimg" dynsrc="" src="" style="display:none" />
                                                <input type="file" name="handIdcardPic" id="handIdcardPic" onchange="checkfile(this,'3','handIdcardPicTempimg');"> </span>
                                            <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput" id="thirdImg"> <g:message code="secondsReceived.delete.label"/> </a>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 120px;">
                                            <div style="margin-top: 30%;" id="cardPositiveTitle"><g:message code="secondsReceived.cardPositive.label"/> </div>
                                        </div>

                                        <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 120px;" id="idCardPositiveBase64"> </div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"> <g:message code="secondsReceived.upLoad.label"/> </span>
                                                <span class="fileinput-exists"> <g:message code="secondsReceived.alter.label"/> </span>
                                                <img id="idCardPositiveTempimg" dynsrc="" src="" style="display:none" />
                                                <input type="file" name="idCardPositive" id="idCardPositive" onchange="checkfile(this,'1','idCardPositiveTempimg');"> </span>
                                            <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput" id="firstImg"> <g:message code="secondsReceived.delete.label"/> </a>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 120px;">
                                            <div style="margin-top: 30%;" id="cardOppositeTitle"><g:message code="salesmanAuthentication.cardOpposite.label"/> </div>
                                        </div>

                                        <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 120px;" id="idcardOppositeBase64"> </div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"> <g:message code="secondsReceived.upLoad.label"/> </span>
                                                <span class="fileinput-exists"> <g:message code="secondsReceived.alter.label"/> </span>
                                                <img id="idcardOppositeTempimg" dynsrc="" src="" style="display:none" />
                                                <input type="file" name="idcardOpposite" id="idcardOpposite" onchange="checkfile(this,'2','idcardOppositeTempimg');"> </span>
                                            <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput" id="secondImg"><g:message code="secondsReceived.delete.label"/>  </a>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>

                    </portlet:body>
                </component:portlet>
                </g:if>
            </form:body>
            <form:actions>
                <div class="form-actions">
                    <div class="col-md-12 text-center">
                        <div class="col-md-6 text-right">
                            %{--<button name="subButton" class="btn btn-submit" onclick="return validateForm();">--}%
                                %{--${message(code: 'secondsReceived.ok.label')}--}%
                            %{--</button>--}%
                            <formActions:submit class="btn btn-submit" id="commitButton" value="${message(code: 'secondsReceived.ok.label')}"/>
                        </div>
                        <div class="col-md-6 text-left"><button type="button" class="btn btn-cancle" data-dismiss="modal"><g:message code="secondsReceived.cancle.label"></g:message> </button></div>
                    </div>

                </div>
            </form:actions>
        </g:uploadForm>
    </portlet:body>
</component:portlet>
<script type="text/javascript">
    $(function () {
        $('#commitButton').on('click', function () {
            //拼接posMdStr字符串
            porcPosMdStr();
            //debugger
            var posStr=$("#posMdStr").val();
            if(posStr == "" || posStr == null){
                OKDialog("费率信息填写不完整!");
                return false;
            }
            var settleFlag = $("#settleFlag").val();
            //验证必填图片
            var flag = true;
            if(settleFlag != 0){
                var handIdcardNum = $("#handIdcardNum").val();
                var idcardPositiveNum = $("#idcardPositiveNum").val();
                var idcardOppositeNum = $("#idcardOppositeNum").val();
                flag=checkImage(handIdcardNum,idcardPositiveNum,idcardOppositeNum);
            }
            if(flag){
                var selectedGoods3 = $("#selectedGoods3").val();
                if(selectedGoods3 == '' || selectedGoods3 == null || selectedGoods3 == undefined){
                    OKDialog("请选择秒到产品!");
                    return false;
                }else{
                    return checkForm();
                }
            }else{
                return false;
            }
        });
    });
</script>
