/**
 * Created by jingxl on 2016/10/15.
 * 进件时，编辑商户初始化编辑数据使用
 */

$(function(){

    //业务员change 事件
    $('#salesmanCode').change(function () {
        var showName = $('#salesmanCode').find('option:selected').text();
        console.log(showName)
        $('#salesmanName').val(showName);
    });

});//end JQuery


