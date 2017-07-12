<%@ page import="com.suixingpay.ssp.front.system.SystemReceiptAddress" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form  id="systemReceiptAddressForm"
                    controller="systemReceiptAddress"
                    action="${formAction}"
                     name="scaffold-${formAction}-systemReceiptAddress">
            <form:scaffoldSearchProperties/>
            <g:if test="${formAction == 'update'}">
            <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
            <formCommon:hiddenField name="id" value="${systemReceiptAddressInstance?.id}"/>
            <formCommon:hiddenField name="version" value="${systemReceiptAddressInstance?.version}"/>
            <formCommon:hiddenField name="provinceHidden" value="${systemReceiptAddressInstance?.province?.id}"/>
            <formCommon:hiddenField name="cityHidden" value="${systemReceiptAddressInstance?.city?.id}"/>
            <formCommon:hiddenField name="areaHidden" value="${systemReceiptAddressInstance?.area?.id}"/>
        </g:if>
            <g:if test="${formAction == 'save'}">
                <formCommon:hiddenField name="id" value="${systemReceiptAddressInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${systemReceiptAddressInstance?.version}"/>
                <formCommon:hiddenField name="provinceHidden" value="${systemReceiptAddressInstance?.province?.id}"/>
                <formCommon:hiddenField name="cityHidden" value="${systemReceiptAddressInstance?.city?.id}"/>
                <formCommon:hiddenField name="areaHidden" value="${systemReceiptAddressInstance?.area?.id}"/>
            </g:if>
            <form:body>

                <row>
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label class="col-md-3 col-sm-3 col-xs-12 control-label">
                                <span class="required">*</span> 收货人
                            </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" class="form-control" name="systemReceiptAddressInstance.receiverName" value="${systemReceiptAddressInstance?.receiverName}" required="required" id="receiverName">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                        </div>

                         <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label class="col-md-3 col-sm-3 col-xs-12 control-label">
                            <span class="required">*</span> 手机号
                        </label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input type="text" class="form-control" name="systemReceiptAddressInstance.mobileNo" value="${systemReceiptAddressInstance?.mobileNo}" required="required" id="mobileNo">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </div>
                    </div>
                </row>

                  %{-- <domainEdit:textField domain="systemReceiptAddress" property="receiverName"
                                          domainInstance="${systemReceiptAddressInstance}" required="true"/>

                    <domainEdit:textField domain="systemReceiptAddress" property="mobileNo"
                                          domainInstance="${systemReceiptAddressInstance}" required="true"/>
--}%

                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label class="col-md-3 col-sm-3 col-sx-12 control-label">
                                <span class="required">*</span>${message(code: 'systemReceiptAddress.localarea.label')}
                            </label>

                            <div class="col-md-3 col-sm-3 col-sx-12${hasErrors(bean: systemReceiptAddressInstance, field: province, ' takin-input-errors')}">
                                <span id="provincespan"></span>
                                <span class="help-block"><g:fieldError bean="${systemReceiptAddressInstance}"
                                                                       field="province"/></span>
                            </div>

                            <div class="col-md-3 col-sm-3 col-sx-12${hasErrors(bean: systemReceiptAddressInstance, field: city, ' takin-input-errors')}">
                                <span id="cityspan"></span>
                                <span class="help-block"><g:fieldError bean="${systemReceiptAddressInstance}"
                                                                       field="city"/></span>
                            </div>

                            <div class="col-md-3 col-sm-3 col-sx-12${hasErrors(bean: systemReceiptAddressInstance, field: area, ' takin-input-errors')}">
                                <span id="areaspan"></span>
                                <span class="help-block"><g:fieldError bean="${systemReceiptAddressInstance}"
                                                                       field="area"/></span>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label class="col-md-3 col-sm-3 col-xs-12 control-label">
                                <span class="hide">*</span> 邮编


                            </label>
                            <div class="col-md-9 col-sm-9 col-xs-12">

                                <input type="text" class="form-control" name="systemReceiptAddressInstance.postcode" value="${systemReceiptAddressInstance?.postcode}" id="postcode">

                                <span class="help-block"></span>
                            </div>
                        </div>
                    </div>
                  %{--  <domainEdit:textField domain="systemReceiptAddress" property="postcode"
                                          domainInstance="${systemReceiptAddressInstance}"/>--}%
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            %{--<domainEdit:textField domain="systemReceiptAddress" property="address"
                                                  domainInstance="${systemReceiptAddressInstance}" required="true"/>--}%

                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label class="col-md-3 col-sm-3 col-xs-12 control-label">
                                        <span class="required">*</span>  详细地址


                                    </label>
                                    <div class="col-md-9 col-sm-9 col-xs-12">

                                        <input type="text" class="form-control" name="systemReceiptAddressInstance.address" value="${systemReceiptAddressInstance?.address}" required="required" id="address">

                                        <span class="help-block"></span>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-3 col-sm-3 col-sx-12">
                                <g:if test="${!systemReceiptAddressInstance.defaultFlag}">
                                    <g:checkBox
                                            checked="${systemReceiptAddressInstance['defaultFlag'] ? 'true' : 'false'}"
                                            name="systemReceiptAddressInstance.defaultFlag"
                                            value="${systemReceiptAddressInstance ? systemReceiptAddressInstance['defaultFlag'] : ''}"
                                            class="md-check"/>设为默认
                                </g:if>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" value="${params.isFromOrder}" name="isFromOrder"/>
                <input type="hidden" value="${params.orderUrl}" name="orderUrl"/>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.' + formAction + '.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
                <g:if test="${params.isFromOrder}">
                    <g:link class="btn btn-primary" url="${params.orderUrl}">
                        <i class="fa fa-leaf"></i>
                        <g:message code="systemReceiptAddress.default.button.back.label"/></g:link>
                </g:if>
                <g:else>
                    <g:link class="btn btn-primary" controller="systemReceiptAddress" action="index">
                        <i class="fa fa-leaf"></i>
                        <g:message code="systemReceiptAddress.default.button.back.label"/></g:link>
                </g:else>

            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <asset:javascript src="jquery.validate.min.js"/>
    <asset:javascript src="system/systemReceiptAddress/form-validation.js"/>
    %{--<asset:javascript src="system/salesmanManagenment/form-validation.js"/>--}%
    <g:javascript>
$(function(){

            $('#systemReceiptAddressForm').attr("onsubmit","return CheckForm()");

          $.ajax({
               url: "${g.createLink(controller: "co" +
                    "mmon", action: "getProvince")}",
               data: {q_province:$('[name=provinceHidden]').val()},
           }).done(function(data) {
               $("#provincespan").html(data);
           }).fail(function (e, data)   {
               console.log("error");
           }).always(function() {
               console.log("complete");
           });

        var cityHidden = $('[name=cityHidden]').val();
        var areaHidden = $('[name=areaHidden]').val();
        if(cityHidden){
            getCity($('[name=provinceHidden]').val(),cityHidden);
            if(areaHidden){
                getArea(cityHidden,areaHidden);
            }
        }else{
        getCity('','');
        getArea('','');
        }

        $("#provincespan").on('change',function () {
           var province = $("#province").val();
           if(!province){
              return false;
           }
            getCity(province,'');
            getArea('','');

          });
        $("#cityspan").on('change',function () {
           var city = $("#city").val();

         /*  if(!city){
                console.log("false返回");

              return false;
           }*/
            getArea(city,'');
          });




        });

        function getCity(province,q_city) {
            $.ajax({
                url: "${g.createLink(controller: "common", action: "getCity")}",
                data: {province:province,q_city:q_city},
             }).done(function(data) {
                   $("#cityspan").html(data);
                }).fail(function (e, data)   {
                   console.log("error");
                }).always(function() {
                   console.log("complete");
                });
        }

        function getArea(city,q_area) {
            //没有区的市list 区隐藏
            var areaNullList=",3702,3706,3704,3664,3665,3705,3701,3700,3949,4283,4364,4479,4480,4481,4483,"
            if (areaNullList.indexOf((","+city.toString()+",").trim())>-1 &&''!=city){
                $("#areaspan").html("");
            }else {
                $.ajax({
                url: "${g.createLink(controller: "common", action: "getArea")}",
                data: {city:city,q_area:q_area},
             }).done(function(data) {

                   $("#areaspan").html(data);
                }).fail(function (e, data)   {
                   console.log("error");
                }).always(function() {
                   console.log("complete");
                });
            }

        }
        function CheckForm(){
                                 //校验省市区是否为空　包含区的市，区下拉框才做空校验
                 var city = $("#city").val();



                 //areaNullList是没有区的市

                 var areaNullList=",3702,3706,3704,3664,3665,3705,3701,3700,3949,4283,4364,4479,4480,4481,4483,"
                 //如果选择的　市　不在areaNullList中，对区下拉框做空校验　
                 if (areaNullList.indexOf(","+(city.toString()+",").trim())<0){
                     if (null==$("#areaspan option:selected").val() || ""==$("#areaspan option:selected").val()|| "null"==$("#areaspan option:selected").val()){
                        bootboxAlert("请完整填写所在地区")
                        return false
                    }
                }


                if (null==$("#provincespan option:selected").val() || ""==$("#provincespan option:selected").val()|| "null"==$("#provincespan option:selected").val()){
                    bootboxAlert("请完整填写所在地区")
                    return false
                }
                if (null==$("#cityspan option:selected").val() || ""==$("#cityspan option:selected").val()|| "null"==$("#cityspan option:selected").val()){

                    bootboxAlert("请完整填写所在地区")
                    return false
                }

                $("#provincespan option:selected").val()
                $("#cityspan option:selected").val()
                $("#areaspan option:selected").val()

                //自动去空格
               var address =$("[name='systemReceiptAddressInstance.address']").val().replace(/\s/g,"");
               $("[name='systemReceiptAddressInstance.address']").val(address);
               return true;
        }
    </g:javascript>
</content>