/**
 * Demo Controller
 *
 * @author xujingbao@suixingpay.com
 */
sspFrontApp.controller('treeTableCtrl', ["$scope", "$q", "ngTreetableParams",function ($scope, $q, ngTreetableParams) {

    $scope.testStr = "111";
    /*
     $scope.names = ["Google", "Runoob", "Taobao"];
     $scope.showType = 'Google';
     $scope.changeType = function(){
     $.ajax({
     url:'/menthodProfitDetail/showType',
     success:function (data) {
     alert(data.status);
     }
     })
     }*/


    var data = [ {
        name: 'Some Folder',
        type: 'folder',
        size: ''}];
    $.ajax({
        dataType: "json",
        url:'/menthodProfitDetail/showType',
        async:false,
        success:function (result) {
            data = result
            check()
        }
    })



    /*    var data = [
     {
     name: 'Some Folder',
     type: 'folder',
     size: '',
     children: [
     {
     name: 'some file.pdf',
     type: 'file',
     size: '500KB',

     }
     ]
     }
     ];*/
    function check() {
        $scope.dynamic_params = new ngTreetableParams({
            getNodes: function (parent) {
                return parent ? parent.children : data;
            },
            getTemplate: function (node) {
                return 'tree_node';
            },
            options: {
                onNodeExpand: function () {
                    console.log('A node was expanded!');
                }
            }
        });

        $scope.expanded_params = new ngTreetableParams({
            getNodes: function (parent) {
                return parent ? parent.children : data;
            },
            getTemplate: function (node) {
                return 'tree_node';
            },
            options: {
                initialState: 'expanded'
            }
        });
    }

}]);
