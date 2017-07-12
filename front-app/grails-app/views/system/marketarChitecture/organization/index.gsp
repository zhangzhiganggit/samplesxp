
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="scaffold">
    <title><g:message code="default.list.label" args="[message.domain(domain: 'organization')]"/></title>
</head>

<body>

<g:render template="/system/marketarChitecture/organization/searchForm"/>
<g:render template="/system/marketarChitecture/organization/searchResult" model="[systemOrganizationResultInstanceList]"/>

<g:if test="${systemOrganizationResultInstanceCount > 0 }">
    <component:paginate total="${systemOrganizationResultInstanceCount }"/>
</g:if>

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
            console.log("1111111")
            $("#updateFlag").val(" ")
            bootboxAlert($("#updateMessage").val())

        }
            $('#organizationForm').attr("onsubmit", "return checkForm()");

        })
        $(function () {

            $('.ssp-system-organization-stop').each(function(){
             $(this).click(function(e){
                var id= $(this).attr("id")
                var name=$(this).attr("name")
                e.preventDefault();
                bootbox.dialog({
                    message: "<div ><p style='margin:3px;font-size:10px;color:red'>注：机构停用后机构下所有业务员（包括机构的所有下级机构业务员）无法登陆系统，启用后可正常使用系统。</p></div>" +
                     "" +
                      "你确定停用机构【"+name+"】？",
                    title: '停用机构',
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
                                        url: "${g.createLink(controller: "organization", action: "stop")}",
                                        data: {q_orgId:id},
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
        $('.ssp-system-organization-enable').each(function(){
             $(this).click(function(e){
                var id= $(this).attr("id")
                var name=$(this).attr("name")
                e.preventDefault();
                bootbox.dialog({
                    message: "<div ><p style='margin:3px;font-size:10px;color:red'>注：机构停用后机构下所有业务员（包括机构的所有下级机构业务员）无法登陆系统，启用后可正常使用系统。</p></div>" +
                     "" +
                      "你确定启用机构【"+name+"】？",
                    title: '启用机构',
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
                                        url: "${g.createLink(controller: "organization", action: "enable")}",
                                        data: {q_orgId:id},
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

            $('.ssp-system-organization-logout').each(function(){
             $(this).click(function(e){
                var id= $(this).attr("id")
                var name=$(this).attr("name")
                e.preventDefault();
                bootbox.dialog({
                    message: "<div ><p style='margin:3px;font-size:10px;color:red'>注：请确认当前机构下无商户，无业务热源，机构注销后不可恢复，系统内数据全部删除。</p></div>" +
                     "" +
                      "你确定注销当前机构【"+name+"】？",
                    title: '注销机构',
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
                                        url: "${g.createLink(controller: "organization", action: "logout")}",
                                        data: {q_orgId:id},
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




            var q_id=$("[name='q_id']").val().replace(/\s/g,"");

            var q_loginName=$("[name='q_loginName']").val().replace(/\s/g,"");
            var q_idCardName=$("[name='q_idCardName']").val().replace(/\s/g,"");

            var q_orgName=$("[name='q_orgName']").val().replace(/\s/g,"");
            var q_idCardNameLength = q_idCardName.length;
            for(var i = 0; i < q_idCardName.length; i++){
                if(q_idCardName.charCodeAt(i) > 127){
                    q_idCardNameLength++;
                }
            }

            if(q_idCardNameLength>20) {
                 bootbox.alert('机构管理者不能超过20字符！');
                return false;
            }

            $("[name='q_id']").val(q_id);
            $("[name='q_loginName']").val(q_loginName);
            $("[name='q_idCardName']").val(q_idCardName);
            $("[name='q_orgName']").val(q_orgName);

            return true;
        }
    </g:javascript>
</content>