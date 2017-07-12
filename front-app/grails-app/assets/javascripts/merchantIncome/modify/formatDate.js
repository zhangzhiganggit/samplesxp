/**
 * Created by krupp on 16/12/2.
 */

$(function(){
    function formatDate(str){
        var da = new Date(str);
        return da.getFullYear()+"-"+(da.getMonth()+1)+"-"+da.getDate();
    }
    if($("#reLicenseStartTime").val() != null && $("#reLicenseStartTime").val() != ''){
        $("#licenseStartTime").val(formatDate($("#reLicenseStartTime").val()));
    }
    if($("#reLicenseEndTime").val() != null && $("#reLicenseEndTime").val() != ''){
        $("#licenseEndTime").val(formatDate($("#reLicenseEndTime").val()));
    }
    if($("#reCardStartTime").val() != null && $("#reCardStartTime").val() != ''){
        $("#cardStartTime").val(formatDate($("#reCardStartTime").val()));
    }
    if($("#reCardEndTime").val() != null && $("#reCardEndTime").val() != ''){
        $("#cardEndTime").val(formatDate($("#reCardEndTime").val()));
    }
});
