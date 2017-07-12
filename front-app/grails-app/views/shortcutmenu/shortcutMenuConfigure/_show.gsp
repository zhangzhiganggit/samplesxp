<%@ page import="com.suixingpay.ssp.front.shortcutmenu.ShortcutMenuConfigure" %>
<component:portlet cssClass="scaffold-show">
    <portlet:title
            title="${message(code: 'default.show.label', args: message.domain(domain: 'shortcutMenuConfigure'))}"/>
    <portlet:body withForm="true">
        <form:form action="index">
            <form:body>
                <formCommon:hiddenField name="id" value="${shortcutMenuConfigureInstance?.id}"/>
                <formCommon:hiddenField name="menus" value="${shortcutMenuConfigureInstance?.menus}"/>
            </form:body>
            <form:actions>
                <formActions:submit value="${message(code: 'default.button.back.label')}"/>
            </form:actions>
        </form:form>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
    <g:javascript>
        $(function () {
            $.ajax({
                url: '/dashboard/showShortcutMenu',
                data: {},
            }).done(function (data) {
                parent.$("#dropdown-shortcutMenu").html(data);
                parent.$("#dropdown-shortcutMenu").trigger('shortcutMenuchanged');
            }).fail(function (e, data) {

            }).always(function () {

            });
        });
    </g:javascript>
</content>

