
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'systemUser')]"/></title>
</head>

<body>

<layout:flashMessage/>
<g:render template="/system/staffManagement/searchForm"/>
%{--<g:if test="${systemUserInstanceList}">--}%
<g:render template="/system/staffManagement/searchResult" model="[systemUserInstanceList]"/>
<g:if test="${systemUserInstanceCount > 0 }">
<component:paginate total="${systemUserInstanceCount }"/>
</g:if>
%{--</g:if>--}%

<formCommon:hiddenField name="addFlag" id="addFlag" value="${addFlag}"/>
<formCommon:hiddenField name="addMessage" id="addMessage" value="${addMessage}"/>
<formCommon:hiddenField name="updateFlag" id="updateFlag" value="${updateFlag}"/>
<formCommon:hiddenField name="updateMessage" id="updateMessage" value="${updateMessage}"/>

</body>
</html>
<content tag="takin-footer">

    <g:javascript>

        $(function(){



        if ("addSuccess"==$("#addFlag").val()){

            $("#addFlag").val(" ")
            bootboxAlert($("#addMessage").val())

        }
        if ("updateSuccess"==$("#updateFlag").val()){
            $("#updateFlag").val(" ")
            bootboxAlert($("#updateMessage").val())

        }


            $('#staffManagementForm').attr("onsubmit", "return checkForm()");

        })
        $(function () {
        $(".ssp-system-systemUser-stop").each(function(){
            $(this).click(function(e){
                 e.preventDefault();
                 var id= $(this).attr("id")

                bootbox.dialog({
                    message: "<div ><p style='margin:3px;font-size:10px;color:red'>注：办公人员停用后，该办公人员无法登陆系统，启用后可正常使用系统。</p></div>" +
                     "" +
                      "你确定停用该办公人员？",
                    title: '停用办公人员',
                    buttons: {
                        success: {
                            label: '${message(code: 'default.button.cancel.label')}',
                            className: "green",
                            callback: function () {
                            }
                        },
                        danger: {
                            label:  '${message(code: 'default.button.enter.label')}',
                            className: "red",
                            callback: function () {

                                $.ajax({
                                        url: "${g.createLink(controller: "staffManagement", action: "disable")}",
                                        data: {q_userId: id},
                                       }).done(function(data) {
                                          location.reload();
                                       }).fail(function (e, data)   {
                                            console.log("error");
                                       }).always(function() {
                                            console.log("complete");
                                       });

                            }
                        }
                    }
                });
            })
         });

         //启用
        $('.ssp-system-systemUser-enable').each(function(){
             $(this).click(function(e){
                e.preventDefault();
                var id= $(this).attr("id")

                bootbox.dialog({
                    message: "<div ><p style='margin:3px;font-size:10px;color:red'>注：办公人员启用后可正常使用系统。</p></div>" +
                     "" +
                      "你确定启用该办公人员？",
                    title: '启用办公人员',
                    buttons: {
                        success: {
                            label: '${message(code: 'default.button.cancel.label')}',
                            className: "green",
                            callback: function () {
                            }
                        },
                        danger: {
                            label:  '${message(code: 'default.button.enter.label')}',
                            className: "red",
                            callback: function () {
                                $.ajax({
                                        url: "${g.createLink(controller: "staffManagement", action: "enable")}",
                                        data: {q_userId:id},
                                       }).done(function(data) {
                                          location.reload();
                                       }).fail(function (e, data)   {
                                            console.log("error");
                                       }).always(function() {
                                            console.log("complete");
                                       });

                            }
                        }
                    }
                });
             })

        })

        })
        function checkForm(){

            var q_loginName=$("[name='q_loginName']").val().replace(/\s/g,"");

            var q_idCardName=$("[name='q_idCardName']").val().replace(/\s/g,"");

            var q_remarkName=$("[name='q_remarkName']").val().replace(/\s/g,"");

            var q_phone=$("[name='q_phone']").val().replace(/\s/g,"");


            $("[name='q_loginName']").val(q_loginName);
            $("[name='q_idCardName']").val(q_idCardName);
            $("[name='q_remarkName']").val(q_remarkName);
            $("[name='q_phone']").val(q_phone);

            return true;
        }
    </g:javascript>

</content>
