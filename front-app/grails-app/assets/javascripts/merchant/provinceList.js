/**
 * Created by hanshishang on 2016/11/25.
 */

/**
 * 加载省、市、区 数据并支持回显数据
 * @param provincespan 省份显示位置的div的ID
 * @param cityspan 市显示位置的div的ID
 * @param areaspan 区显示位置的div的ID
 *
 * @param name_province_val 省份的name属性
 * @param name_city_val 市的name属性
 * @param name_area_val 区的name属性
 *
 * @param provinceHidden 省的隐藏域ID
 * @param cityHidden 市的隐藏域ID
 * @param areaHidden 区的隐藏域ID
 */
function startPCA(provincespan,cityspan,areaspan,name_province_val,name_city_val,name_area_val,provinceHidden,cityHidden,areaHidden){
    $.ajax({
        url: '/common/findProvince',
        data: {nameParam:""+name_province_val+"",q_province:$('[name='+provinceHidden+']').val()},
    }).done(function(data) {
        $("#"+provincespan+"").html(data);
        $("#"+name_province_val+"").select2(); }).fail(function (e, data)   {
        console.log("error:findProvince");
    }).always(function() {
        //console.log("complete:findProvince");
    });

    var cityHidden = $('[name='+cityHidden+']').val();
    var areaHidden = $('[name='+areaHidden+']').val();
    if(cityHidden){
        getCity($('[name='+provinceHidden+']').val(),cityHidden,cityspan,name_city_val);
        if(areaHidden){
            getArea(cityHidden,areaHidden,areaspan,name_area_val);
        }
    }

    $("#"+provincespan+"").on('change',function () {
        var province = $("#"+name_province_val+"").val();
        $('#'+provinceHidden+'').val(province);
 /*       if(!province){
            return false;
        }*/
        //初始化市、区下拉框
        initCityArea(cityspan,areaspan);
        getCity(province,'',cityspan,name_city_val);
    });

    $("#"+cityspan+"").on('change',function () {
        var city = $("#"+name_city_val+"").val();
        $('#'+cityHidden+'').val(city);
        if(!city){
            return false;
        }
        //初始化市、区下拉框
        initCityArea('',areaspan);
        getArea(city,'',areaspan,name_area_val);
    });

    $("#"+areaspan+"").on('change',function () {
        var area = $("#"+name_area_val+"").val();
        $('#'+areaHidden+'').val(area);
    });

    //窗口加载时，就初始化市、区下拉框
    initCityArea(cityspan,areaspan);
}

////窗口加载时，就初始化市、区下拉框
function initCityArea(cityspan,areaspan){
    if(cityspan!=''){
        $("#"+cityspan+"").html("<select class='form-control select2'  id='q_city' name='q_city'><option>请选择</option></select>");
    }
    if(areaspan!=''){
        $("#"+areaspan+"").html("<select class='form-control select2' name='q_aera'><option>请选择</option></select>");
    }
}

function getCity(province,q_city,showDivID,name_val) {
    $.ajax({
        url: '/common/findCity',
        data: {nameParam:""+name_val+"",province:province,q_city:q_city},
    }).done(function(data) {
        $("#"+showDivID+"").html(data);
        $("#"+name_val+"").select2();
    }).fail(function (e, data)   {
        console.log("error");
    }).always(function() {
        //console.log("complete");
    });
}
function getArea(city,q_area,showDivID,name_val) {
    $.ajax({
        url: '/common/findArea',
        data: {nameParam:""+name_val+"",city:city,q_area:q_area},
    }).done(function(data) {
        $("#"+showDivID+"").html(data);
        $("#"+name_val+"").select2();
    }).fail(function (e, data)   {
        console.log("error");
    }).always(function() {
        //console.log("complete");
    });
}

//*********End*********************************************************