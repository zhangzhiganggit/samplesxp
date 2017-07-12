<%@ page import="com.suixingpay.ssp.front.machines.TerminalQuery" %>
<component:portlet cssClass="scaffold-search">
    <portlet:title title="${formTitle}"/>
    <portlet:body withForm="true">
        <form:form controller="terminalQuery"
                   action="${formAction}"
                   name="scaffold-${formAction}-terminalQuery">
            <form:scaffoldSearchProperties/>
            <g:if test="${ formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${terminalQueryInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${terminalQueryInstance?.version}"/>
            </g:if>
            <form:body>
                
                 <!-- communicationType with type(class java.lang.Integer) has no template. -->
                
                 <!-- signa with type(class java.lang.Integer) has no template. -->
                
                 <!-- status with type(class java.lang.Integer) has no template. -->
                
                 <!-- assistMachineNet with type(class java.lang.Integer) has no template. -->
                
                 <!-- nopasswordKeyboardModel with type(class java.lang.Integer) has no template. -->
                
                 <!-- applyPOSQuantity with type(class java.lang.Integer) has no template. -->
                
                
                <domainEdit:textField domain="terminalQuery" property="bindAddress"
                                      domainInstance="${terminalQueryInstance}" required="true"/>
                
                
                 <!-- bindingPOSQuantity with type(class java.lang.Integer) has no template. -->
                
                
                <domainEdit:textField domain="terminalQuery" property="code"
                                      domainInstance="${terminalQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="terminalQuery" property="contactNumber"
                                      domainInstance="${terminalQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="terminalQuery" property="factShortName"
                                      domainInstance="${terminalQueryInstance}" required="true"/>
                
                
                
                <domainEdit:textField domain="terminalQuery" property="goodsName"
                                      domainInstance="${terminalQueryInstance}" required="true"/>
                
                
                 <!-- installDate with type(class java.util.Date) has no template. -->
                
                 <!-- keyboardSn with type(class java.lang.Integer) has no template. -->
                
                
                <domainEdit:textField domain="terminalQuery" property="linkman"
                                      domainInstance="${terminalQueryInstance}" required="true"/>
                
                
                 <!-- merchantCode with type(class java.lang.Integer) has no template. -->
                
                 <!-- merchantName with type(class java.lang.Integer) has no template. -->
                
                
                <domainEdit:textField domain="terminalQuery" property="model"
                                      domainInstance="${terminalQueryInstance}" required="true"/>
                
                
                 <!-- posSn with type(class java.lang.Integer) has no template. -->
                
                 <!-- putInStorageDate with type(class java.util.Date) has no template. -->
                
                
                <domainEdit:textField domain="terminalQuery" property="remark"
                                      domainInstance="${terminalQueryInstance}" required="true"/>
                
                
                 <!-- sim with type(class java.lang.Integer) has no template. -->
                
                 <!-- sn with type(class java.lang.Integer) has no template. -->
                
                 <!-- terminalCode with type(class java.lang.Integer) has no template. -->
                
                
                <domainEdit:textField domain="terminalQuery" property="terminalModel"
                                      domainInstance="${terminalQueryInstance}" required="true"/>
                
                
                 <!-- whetherSelfServed with type(class java.lang.Integer) has no template. -->
                
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"
                                    btnIconClass="fa fa-${formAction}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
