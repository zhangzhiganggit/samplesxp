<%@ page import="com.suixingpay.ssp.front.system.SystemReceiptAddress" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="deviceOrder"
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
            <form:body>

                <domainEdit:textField domain="systemReceiptAddress" property="receiverName"
                                      domainInstance="${systemReceiptAddressInstance}" required="true"/>

                <domainEdit:textField domain="systemReceiptAddress" property="mobileNo"
                                      domainInstance="${systemReceiptAddressInstance}" required="true"/>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-3 control-label">
                            <message:property domain="handBrushMerchantManagement" property="localarea"/><span class="required">*</span>
                        </label>
                        <div class="col-md-3">
                            <span id="provincespan"></span>
                            %{-- <g:select style="margin-bottom: 0.5rem;" class="form-control" name="q_province" id="province"
                                       from="${provinceList}"
                                       optionKey="areaId" optionValue="areaNm"
                                       value="${params ? params['q_province'] : '' }"
                                       valueMessagePrefix="handBrushMerchantManagement.merchantGrade"
                                       noSelection="['':'请选择']"/>--}%
                        </div>

                        <div class="col-md-3">
                            <span id="cityspan"></span>
                        </div>
                        <div class="col-md-3">
                            <span id="areaspan"></span>
                        </div>
                        <span class="help-block"><g:fieldError bean="${systemReceiptAddressInstance }" field="${province }" /></span>
                    </div>
                </div>

                <domainEdit:textField domain="systemReceiptAddress" property="postcode"
                                      domainInstance="${systemReceiptAddressInstance}"/>

                <div class="col-md-12">
                    <div class="form-group">
                        <domainEdit:textField domain="systemReceiptAddress" property="address"
                                                  domainInstance="${systemReceiptAddressInstance}" required="true"/>
                        <div class="col-md-3">
                            <g:checkBox checked="${systemReceiptAddressInstance['defaultFlag'] ? 'true' : 'false'}" name="defaultFlag"
                                        value="${systemReceiptAddressInstance ? systemReceiptAddressInstance['defaultFlag'] : ''}"
                                        class="md-check" />设为默认
                        </div>

                    </div>
                </div>

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.' + formAction + '.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
<g:javascript>
$(function(){
  $.ajax({
       url: "${g.createLink(controller: "common", action: "getProvince")}",
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
}

$("#provincespan").on('change',function () {
   var province = $("#province").val();
   if(!province){
      return false;
   }
    getCity(province,'');
  });
$("#cityspan").on('change',function () {
   var city = $("#city").val();
   if(!city){
      return false;
   }
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
</g:javascript>
</content>