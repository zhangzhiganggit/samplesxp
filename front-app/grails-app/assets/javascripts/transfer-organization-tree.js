$(function () {
    var to = false;
    /**
     * 机构检索
     */
    $('#transferOrgInput').keyup(function () {
        if (to) {
            clearTimeout(to);
        }
        to = setTimeout(function () {
            // var v = $('#transferOrgInput').val();
            $('#transferOrgTree').jstree(true).search(v);
        }, 250);
    });

    /**
     * 显示机构树
     */
    $('#transferOrgInput').focus(function () {
        $('#transferOrgTree').show();
        //$('#transferOrgTree').css({position: absolute, z-index: 1;  : 9999});
    });

    /**
     * 失去焦点
     */
    $('#transferOrgInput').blur(function () {
        $('#transferOrgTree').hide();
    });

    $('#transferOrgTree').jstree({
        'core': {
            'data': {
                'url': function (node) {
                    return node.id === '#' ?
                        '/organization/ajaxRoots?directly='+$('#transferDirectly').val() :
                        '/demo/ajaxChildren';
                },
                'data': function (node) {
                    return {
                        'id': node.id
                    };
                }
            }
        },
        "types": {
            "#": {
                "max_children": 1, "max_depth": 4, "valid_children": ["root"]
            },
            "root": {
                "icon": "fa fa-folder icon-state-info", "valid_children": ["default"]
            },
            "default": {
                "valid_children": ["default", "file"],
                icon: "fa fa-folder icon-state-info"
            },
            "file": {
                "icon": "fa fa-folder icon-state-info", "valid_children": []
            }
        },
        // "plugins": ["contextmenu", "dnd", "search", "state", "types", "wholerow"]
        "plugins": ["dnd", "search", "types", "wholerow"]
    });

    /**
     * 选中
     */
    $('#transferOrgTree').on('select_node.jstree', function (e, data) {
        $('#transferOrgInput').val(data.node.text);
        $('#transferOrgInputId').val(data.node.id);
        $('#transferOrgInput').trigger("change");
    })

    $('#transferOrgTree').hide();
});