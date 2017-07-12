<component:portlet>
    <div class="portlet-title">
        <div class="caption">
            <i class="icon-bubbles font-dark hide"></i>
            <span class="caption-subject font-dark bold uppercase">${formTitle}</span>
        </div>
    </div>
    <portlet:body withForm="true">
        <form:form id="shortcutMenuConfigure"
                   controller="shortcutMenuConfigure"
                   action="${formAction}"
                   name="scaffold-${formAction}-shortcutMenuConfigure">
            <g:if test="${formAction == 'update'}">
                <formCommon:hiddenField name="_method" value="PUT" id="_method"/>
                <formCommon:hiddenField name="id" value="${shortcutMenuConfigureInstance?.id}"/>
                <formCommon:hiddenField name="version" value="${shortcutMenuConfigureInstance?.version}"/>
                <formCommon:hiddenField name="userCode" value="${shortcutMenuConfigureInstance?.userCode}"/>
                <formCommon:hiddenField id="nestable_list_output" name="menus" value="${shortcutMenuConfigureInstance?.menus}"/>
            </g:if>
            <form:body>
                <div class="row">
                    <div class="col-md-5 col-sm-5 col-xs-12">
                        <div class="portlet light bordered">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="icon-bubbles font-dark hide"></i>
                                    <span class="caption-subject font-dark bold uppercase">功能菜单</span>
                                </div>
                            </div>

                            <div class="portlet-body">
                                <g:render template="/shortcutmenu/shortcutMenuConfigure/functionform" model=""/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-7 col-sm-7 col-xs-12">
                        <div class="portlet light bordered">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="icon-bubbles font-dark hide"></i>
                                    <span class="caption-subject font-dark bold uppercase">快捷菜单</span>
                                </div>
                            </div>

                            <div class="portlet-body">
                                <g:render template="/shortcutmenu/shortcutMenuConfigure/shortcutform" model=""/>
                            </div>
                            <br>
                            <form:actions>
                                <formActions:submit value="${message(code: 'shortcutMenuConfigure.button.' + formAction + '.label')}"
                                                    btnIconClass="fa fa-${formAction}" btnCssClass="btn btn-submit"/>
                            </form:actions>
                            <br>
                            功能说明：<br>
                            1、快捷菜单可以便捷您快速定位到系统功能。<br>
                            2、快捷菜单中最多可添加5个菜单。<br>
                            3、左侧的功能菜单勾选后便可加入快捷菜单。<br>
                            4、鼠标拖动快捷菜单可排列展示位置。<br>
                            5、点击提交按钮保存数据。<br><br>
                            %{--</pre>--}%
                        </div>
                    </div>
                </div>
            </form:body>
        %{--<form:actions>--}%
        %{--<formActions:submit value="${message(code: 'default.button.'+ formAction +'.label')}"--}%
        %{--btnIconClass="fa fa-${formAction}"/>--}%
        %{--</form:actions>--}%
        </form:form>
    </portlet:body>
</component:portlet>
<content tag="takin-footer">
%{--<asset:javascript src="pages/scripts/ui-tree.min.js"/>--}%
    <asset:stylesheet src="global/plugins/jquery-nestable/jquery.nestable.css"/>
    <asset:javascript src="global/plugins/jquery-nestable/jquery.nestable.js"/>
    <g:javascript>
        var isinit = true;
        var UITree = function () {
            var e = function () {
                $("#tree_menu").jstree({
                    core: {
                        themes: {
                            responsive: !1
                        },
                        check_callback: !0
                    },
                    types: {
                        "default": {
                            icon: "fa fa-folder icon-state-warning icon-lg"
                        },
                        file: {
                            icon: "fa fa-file icon-state-warning icon-lg"
                        }
                    },
                    plugins: ["wholerow", "checkbox", "types"]
                }),
                        $("#tree_menu").on("select_node.jstree",
                                function (e, data) {
                                    select_node_add(e, data);

                                }),
                        $("#tree_menu").on("deselect_node.jstree",
                                function (e, data) {
                                    deselect_node_delete(e, data);
                                })
            };

            return {
                init: function () {
                    e();
                    check();

                }
            }
        }();
        var UINestable = function () {
            return {
                init: function () {
                    $("#nestable_list").nestable({
                        maxDepth: 1
                    }).on("change", t),

                            t($("#nestable_list").data("output", $("#nestable_list_output")))
                }
            }
        }();

        function t(t) {
            var e = t.length ? t : $(t.target),
                    a = e.data("output");
            window.JSON ? a.val(window.JSON.stringify(e.nestable("serialize"))) : a.val("JSON browser support required for this demo.")
        };

        function check() {
            var json = eval($('#nestable_list_output').val());
            for (var i = 0; i < json.length; i++) {
                var id = "function_" + json[i].menucontroller + "_" + json[i].menuaction;
                $('#tree_menu').jstree(true).check_node(id);
            }
            isinit = false;
        };

        function select_node_add(e, data) {
            if (isinit) {
                shortcut_add(data);
                return;
            }
            var json = eval($('#nestable_list_output').val());
            if (json.length >= 5) {
                bootbox.alert("快捷菜单不多于5个");
                var id = "function_" + data.node.data.menucontroller + "_" + data.node.data.menuaction;
                $('#tree_menu').jstree(true).uncheck_node(id);
            } else {
                shortcut_add(data);
            }
        };

        function deselect_node_delete(e, data) {
            var json = eval($('#nestable_list_output').val());
            if (json.length <= 1) {
                bootbox.alert("快捷菜单不可为空");
                var id = "function_" + data.node.data.menucontroller + "_" + data.node.data.menuaction;
                $('#tree_menu').jstree(true).check_node(id);
            } else {
                shortcut_delete(data);
            }
        };

        function shortcut_add(data) {
            var menucontroller = data.node.data.menucontroller,
                    menuaction = data.node.data.menuaction,
                    id = "shortcut_" + data.node.data.menucontroller + "_" + data.node.data.menuaction,
                    value = data.node.text,
                    path = data.instance.get_path(data.node, '-');
            if ($('#' + id).length == 0) {
                $('#nestable_list > ol').append('<li class="dd-item" id="' + id + '" data-menucontroller="' + menucontroller + '" data-menuaction="' + menuaction + '"><div class="dd-handle">' + data.node.text + '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp' + path + '</div></li>');
                t($("#nestable_list").data("output", $("#nestable_list_output")));
            }
        };

        function shortcut_delete(data) {
            var id = "shortcut_" + data.node.data.menucontroller + "_" + data.node.data.menuaction;
            $('li[id="' + id + '"]').remove();
            t($("#nestable_list").data("output", $("#nestable_list_output")));
        };

        jQuery(document).ready(function () {
            UITree.init();
            UINestable.init()

            $('#shortcutMenuConfigure').submit(function (event) {
                event.preventDefault();
                var formData = new FormData($(this)[0]);
                var url = $(this).attr('action');
                $.ajax({
                    url: url,
                    type: "post",
                    cache: false,
                    data: formData,
                    processData: false,
                    contentType: false
                }).done(function (res) {
                    $.ajax({
                        url: '/dashboard/showShortcutMenu',
                        data: {},
                    }).done(function (data) {
                        parent.$("#dropdown-shortcutMenu").html(data);
                        parent.$("#dropdown-shortcutMenu").trigger('shortcutMenuchanged');
                        bootbox.alert("更新成功!", function () {
                            location.reload();
                        });
                    }).fail(function (e, data) {

                    });
                }).fail(function (res) {
                    bootbox.alert("更新失败!", function () {
                        location.reload();
                    });
                });
            });
        });

    </g:javascript>
</content>
