<%@ page import="com.suixingpay.ssp.front.machines.CreditInfo" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="creditInfo"
                   action="${formAction}"
                   name="scaffold-${formAction}-creditInfo">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${creditInfoInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${creditInfoInstance?.version}"/>
            </g:if>
            <form:body>


                <domainEdit:textField domain="creditInfo" property="creditId"
                                      domainInstance="${creditInfoInstance}" required="true"/>



                <domainEdit:textField domain="creditInfo" property="creditMonth"
                                      domainInstance="${creditInfoInstance}" required="true"/>


                 <!-- highLimitAmount with type(class java.math.BigDecimal) has no template. -->


                <domainEdit:textField domain="creditInfo" property="orgNo"
                                      domainInstance="${creditInfoInstance}" required="true"/>


                 <!-- remainAmount with type(class java.math.BigDecimal) has no template. -->

                 <!-- repayAmount with type(class java.math.BigDecimal) has no template. -->

                 <!-- shouldRepayAmount with type(class java.math.BigDecimal) has no template. -->

                 <!-- usedAmount with type(class java.math.BigDecimal) has no template. -->

            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
