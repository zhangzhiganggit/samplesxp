$(function () {

    var to = false;
    /**
     * 机构检索
     */
    $('#orgInput').keyup(function () {
        if (to) {
            clearTimeout(to);
        }
        to = setTimeout(function () {
            var v = $('#orgInput').val();
            $('#orgTree').jstree(true).search(v);
        }, 250);
    });

    /**
     * 显示机构树
     */
    $('#orgInput').focus(function () {
        $('#orgTree').show();
        //$('#orgTree').css({position: absolute, z-index: 1;  : 9999});
    });

    /**
     * 失去焦点
     */
    $('#orgInput').blur(function () {
        $('#orgTree').hide();
    });

    $('#orgTree').jstree({
        'core': {
            'data': {
                'url': function (node) {
                    return node.id === '#' ?
                        '/organization/ajaxRoots?directly='+$('#directly').val() :
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
    $('#orgTree').on('select_node.jstree', function (e, data) {
        $('#orgInput').val(data.node.text);
        $('#orgInputId').val(data.node.id);
        $('#orgInput').trigger("change");
    })

    $('#orgTree').hide();
});