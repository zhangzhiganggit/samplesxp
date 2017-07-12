<style>
.thumbnail img{width:200px; height: 120px;}
</style>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" ></button>
    <h4 class="modal-title"><g:message code="suiYiTongAuditDataQueryInstance.agentUploadAudit.label"/> </h4>
</div>
<div class="modal-body">
    <component:portlet>
        <portlet:body withForm="true" class="text-nowrap">
            <g:uploadForm controller="suiYiTongAuditDataQuery" action="submitPic"
                       name="scaffold-search-suiYiTongAuditDataQuery" cssClass="form-bordered form-horizontal" enctype="multipart/form-data">
                <form:scaffoldSearchProperties/>
                <form:body>
                    <g:hiddenField name="flowVersion" value="${suiYiTongAuditDataQueryInstance?.flowVersion}"/>
                    <component:portlet cssClass="scaffold-search">
                        <portlet:body withForm="true">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-xs-12 col-md-6 col-sm-6">
                                        <label class="col-md-4 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="taskCode"/></label>
                                        <div class="col-md-8 text-left"><label>${suiYiTongAuditDataQueryInstance?.taskCode}</label></div>
                                        <g:hiddenField name="taskCode" value="${suiYiTongAuditDataQueryInstance?.taskCode}"></g:hiddenField>
                                    </div>
                                    %{--<div class="col-xs-12 col-md-4 col-sm-4">--}%
                                    %{--<label class="col-md-4 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="auditResult"/></label>--}%
                                    %{--<div class="col-md-8 text-left"><g:textField class="form-control" name="auditResult" value="${suiYiTongAuditDataQueryInstance}"></g:textField></div>--}%
                                    %{--</div>--}%
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
                                        <g:hiddenField name="currentStep" value="${suiYiTongAuditDataQueryInstance?.currentStep}"></g:hiddenField>
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
                    <g:if test="${suiYiTongAuditDataQueryInstance?.currentStep == '2' || suiYiTongAuditDataQueryInstance?.currentStep == '-2'}">
                    <component:portlet cssClass="scaffold-search">
                        <portlet:title
                                title="${message(code: 'suiYiTongAuditDataQueryInstance.evidence.label', args: message.domain(domain: 'suiYiTongAuditDataQuery'))}"/>
                        <portlet:body withForm="true">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-xs-12 col-md-4 col-sm-4">
                                        <label class="col-md-4 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="ownerName"/><span style="color: red">*</span></label>
                                        <div class="col-md-8 text-left"><g:textField class="form-control" name="ownerName" value="${suiYiTongAuditDataQueryInstance?.ownerName}"></g:textField></div>
                                    </div>
                                    <div class="col-xs-12 col-md-4 col-sm-4">
                                        <label class="col-md-4 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="accountNo"/><span style="color: red">*</span></label>
                                        <div class="col-md-8 text-left"><g:textField class="form-control" name="accountNo" value="${suiYiTongAuditDataQueryInstance?.accountNo}"></g:textField></div>
                                    </div>
                                    <div class="col-xs-12 col-md-4 col-sm-4">
                                        <label class="col-md-4 text-right form-control-static"><message:property domain="suiYiTongAuditDataQuery" property="bankType"/><span style="color: red">*</span></label>
                                        <div class="col-md-8 text-left"><g:textField class="form-control" name="bankType" value="${suiYiTongAuditDataQueryInstance?.bankType}"></g:textField></div>
                                    </div>
                                </div>
                            </div>
                        </portlet:body>
                    </component:portlet>

                    %{--处理意见--}%
                        <g:if test="${opinoinList != null}">
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
                        </g:if>

                    <component:portlet cssClass="scaffold-search">
                        <portlet:title
                                title="${message(code: 'suiYiTongAuditDataQueryInstance.uploadEvidence.label', args: message.domain(domain: 'suiYiTongAuditDataQuery'))}"/>
                            <div class="col-md-12">
                                <dib class="pull-right">
                                    %{--用于增加上传控件的按钮--}%
                                    <button type="button" id="button" onclick="check();" class="btn btn-p-m">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                    %{--用于减少上传控件的按钮--}%
                                    <button type="button" id="button" onclick="minus();" class="btn btn-p-m">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </dib>
                            </div>
                        <portlet:body withForm="true">
                            <div class="form-group" style="overflow-y:auto;overflow-x:hidden;">


                            <div class="form-group last">
                            <div class="col-md-12">
                            %{--<g:if test="${suiYiTongAuditDataQueryInstance?.rePics != null}">--}%
                                %{--<g:each in="${suiYiTongAuditDataQueryInstance?.rePics}" var="picss">--}%
                                    %{--<g:set var="picPath" value="${picss}"/>--}%
                                    %{--<img style="width: 200px;height: 150px" src="<g:createLink controller="suiYiTongAuditDataQuery" action="viewImage" params="[title: picPath]"/>"/>--}%
                                %{--</g:each>--}%
                            %{--</g:if>--}%

                        %{--这个是用于每次增加上传文件的控件时用的克隆控件--}%
                            <div id="myDiv_1" class="form-group" style="display: none">
                                <div class="col-md-3" id="divID">
                                    <div class="fileinput fileinput-new " data-provides="fileinput" title="<g:message code="suiYiTongAuditDataQueryInstance.uploadEvidence.label"/>">
                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 120px;">
                                        <div style="margin-top: 30%;color: #2a4d6c"><g:message code="suiYiTongAuditDataQueryInstance.uploadEvidence.label"/> </div>
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 120px;"> </div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"><g:message code="suiYiTongAuditDataQueryInstance.upLoad.label"/></span>
                                                <span class="fileinput-exists"><g:message code="suiYiTongAuditDataQueryInstance.modify.label"/></span>
                                                <input type="file" name="pics" onchange="checkfile(this);">
                                            </span>
                                            <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><g:message code="suiYiTongAuditDataQueryInstance.delete.label"/></a>
                                        </div>
                                    </div>
                                </div>
                            </div>



                        %{--页面默认第一个控件，第一个控件的name为file_1,后面用按钮点出来的控件依次增加，name依次为file_2,file_3,file_4........--}%
                            <div id="myDiv" class="form-group">
                                <div class="col-md-3" id="div_0">
                                    <div class="fileinput fileinput-new " data-provides="fileinput" title="<g:message code="suiYiTongAuditDataQueryInstance.uploadEvidence.label"/>">
                                        <div class="fileinput-new thumbnail" style="width: 200px; height: 120px;">
                                            <div style="margin-top: 30%;color: red"><span>*</span><g:message code="suiYiTongAuditDataQueryInstance.uploadEvidence.label"/> </div>
                                        </div>
                                        <div class="fileinput-preview fileinput-exists thumbnail" style="width: 200px; height: 120px;"> </div>
                                        <div>
                                            <span class="btn default btn-file">
                                                <span class="fileinput-new"><g:message code="suiYiTongAuditDataQueryInstance.upLoad.label"/></span>
                                                <span class="fileinput-exists"><g:message code="suiYiTongAuditDataQueryInstance.modify.label"/></span>
                                                <input type="file" name="file_0" id="input" onchange="checkfile(this);" mc="file_0">
                                            </span>
                                            <a id="file_0" href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"><g:message code="suiYiTongAuditDataQueryInstance.delete.label"/></a>
                                        </div>
                                    </div>
                                </div>


                                <div class="col-md-3" id="addUploadFile"></div>

                            </div>


                            </div>
                            </div>
                        </portlet:body>
                    </component:portlet>
                    </g:if>
                </form:body>
                <form:actions>
                <formActions:submit value="${message(code: 'suiYiTongAuditDataQueryInstance.ok.label')}" btnCssClass=" btn btn-ok" id="submitPic"/>
                    <button type="button" class="btn  btn-modify" data-dismiss="modal"><g:message code="suiYiTongAuditDataQueryInstance.cancel.label"/> </button>
                </form:actions>
            </g:uploadForm>
        </portlet:body>
    </component:portlet>
<script>

        $(function(){
            console.log("=====oyea====")
             $("input[name='bankType']").keyup(function(){
                 this.value=this.value.replace(/\s/g,'');
                 WidthCheck(this, 30)
             });

             $("input[name='ownerName']").keyup(function(){
                 this.value=this.value.replace(/\s/g,'');
                 WidthCheck(this, 30)
             });

             $("input[name='accountNo']").attr('maxlength',32);
             $("input[name='accountNo']").keyup(function () {
                 this.value=this.value.replace(/[^+\d]/g,'');
             });

            $("#submitPic").click(function(){
//                e.preventDefault();
                console.log("====in===");
                var ownerName = $("#ownerName").val();
                var accountNo = $("#accountNo").val();
                var bankType = $("#bankType").val();
                var subpicValue = $("input[name='file_0']").val();
                console.log(subpicValue);
                if(ownerName == null || ownerName == '' || ownerName == undefined){
                    bootbox.alert("户名不能为空！");
                    return false;
                }
                if(accountNo == null || accountNo == '' || accountNo == undefined){
                    bootbox.alert("账号不能为空！");
                    return false;
                }
                if(bankType == null || bankType == '' || bankType == undefined){
                    bootbox.alert("银行行别不能为空！");
                    return false;
                }
                if(subpicValue == null || subpicValue == '' || subpicValue == undefined){
                    bootbox.alert("汇款凭证不能为空！");
                    return false;
                }
            })


         });


        var i = 1;
        function check(){
            var detail = $("#divID").clone();
            detail.children().eq(0).children().children().children().eq(2).attr('name',"file_"+i);
            detail.children().eq(0).children().children().children().eq(2).attr('mc',"file_"+i);
            detail.children().eq(0).children().children().eq(2).attr('id',"file_"+i);
            detail.attr("id","div_"+i);
            detail.css('display','block')
            $("#addUploadFile").before(detail);
            i++;
        };

        function minus(){
            console.log($("#addUploadFile").prev().attr("id"));
            var divv = $("#addUploadFile").prev().attr("id");
            if(divv != 'div_0'){
                console.log(divv);
                $("#"+divv).remove();
            }else{
                return false;
            }
        }


        function WidthCheck(str, maxLen){
            var w = 0;
            var tempCount = 0;
            //length 获取字数数，不区分汉子和英文
            for (var i=0; i<str.value.length; i++) {
                //charCodeAt()获取字符串中某一个字符的编码
                var c = str.value.charCodeAt(i);
                //单字节加1
                if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) {
                    w++;
                }
                else {
                    w+=2;
                }
                if (w > maxLen) {
                    str.value = str.value.substr(0,i);
                    break;
                }
            }
        }

        /**
         *  判断上传文件的格式是否正确
         * @param sender
         * @returns {boolean}
         */
        function checkfile(sender) {
            var validExts = new Array(".jpg", ".jpeg",".png",".gif",".JPG",".JPEG",".PNG",".GIF");
            var fileExt = sender.value;
            fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
            if(fileExt == ''){
                return true;
            }
            console.log(sender);
            var selectFileName = $(sender).attr('mc');
            console.log(selectFileName);
            if (validExts.indexOf(fileExt) < 0) {
                bootbox.alert("文件格式错误！");
                console.log('#'+selectFileName);
                $('#'+selectFileName).click();
                return false;
            }
            var flag = validateImg(sender);
            if(flag == false){
                $('#'+selectFileName).click();
                return false;
            }
            return true;
        }
        /**
         * 判断上传的图片大小
         * @param fileUpLoadId
         * @param imgSrcId
         * @returns {*}
         */
        function validateImg(fileUpLoadId){
            var maxsize = 300*1024;//300kb
            var errMsg = "单个上传的图片不能超过300k！！！";
            var tipMsg = "您的浏览器暂不支持计算上传文件的大小，确保上传文件不要超过300k，建议使用IE、火狐、谷歌浏览器。";
            var obj_file = fileUpLoadId;
            var filesize = 0;
            filesize = obj_file.files[0].size;
            if(filesize==-1){
                bootbox.alert(tipMsg);
                return '-1';
            }else if(filesize>maxsize){
                bootbox.alert(errMsg);
                return false;
            }else{
                return true;
            }
        }
</script>
</div>
