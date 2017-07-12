/**
 *
 * @param obj  input对象
 * @param type 上传类型（1.pic，2.zip）
 * @param flag 是否开启空文件校验(false：不校验,true:校验)
 * @returns {object}
 */
function validateFile(obj,type,flag){
    var fileObj = $(obj).val(); //file对象的值
    if(fileObj != "") //如果上传文件不为空
    {
        var postfix = fileObj.substr(fileObj.indexOf("."));
        postfix=postfix.toLowerCase();
        if(type == 'pic'){
            if(postfix != ".jpg" && postfix != ".jpeg" && postfix != ".png"  && postfix != ".gif" && postfix != ".bmp")
            {
                bootbox.alert ('不支持' + postfix + '的文件格式');
                return 2;
            }
        }else{
            if(postfix != ".zip")
            {
                bootbox.alert ('只能上传zip文件,其它格式暂不支持');
                return 2;
            }
        }

        var fileInput = $(obj)[0];
        var byteSize  = fileInput.files[0].size;
        var size = Math.ceil(byteSize / 1024) ;

        if(type == 'pic'){
            if(size>300)            {
                bootbox.alert ("图片大小超出300K!");
                return 1;
            }
        }else{
            if(size>5120)            {
                bootbox.alert ("文件大小超出5M!");
                return 1;
            }
        }
    }else{
        if(flag){
            bootbox.alert ("请选择需要的上传文件");
            return 0;
        }
    }
    return -1;
}

/**
 *适用于-利用组件fileupload
 * @param obj  文件对象file
 * @returns {boolean}
 */
function validateFileByFileupload(file){
    var fileName = file.name;
        var postfix = fileName.substr(fileName.indexOf("."));
            postfix=postfix.toLowerCase();
            if(postfix != ".jpg" && postfix != ".jpeg" && postfix != ".png"  && postfix != ".gif" && postfix != ".bmp" && postfix != ".zip")
            {
                bootbox.alert ('不支持' + postfix + '的文件格式');
                return false;
            }else{
                var byteSize  = file.size;
                var size = Math.ceil(byteSize / 1024) ;
                if(postfix != ".zip")  // 文件格式不是压缩文件zip
                {
                    if(size>300)            {
                        bootbox.alert ("图片大小超出300K!");
                        return false;
                    }
                }else{
                    if(size>5120)            {
                        bootbox.alert ("文件大小超出5M!");
                        return false;
                    }
                }
            }
            return true;
}


function validataAllImg() {
    var validationFlag  = true ;
    $('.fileinput.fileinput-exists').each(function (i, n) {
        var fileObj = $(this).find(':file');//file对象
        var span = $(fileObj).parent().parent().find("span[name='outSize']");
        if (span != null)$(span).remove();
        var flag = validateFile(fileObj, 'pic', false);
        if (flag != -1) {
            var message = "";
            if (flag == 1) {
                message = "</br>超过300k";
            }
            if (flag == 2) {
                message = "</br>格式不支持";
            }
            $(fileObj).parent().parent().append($("<span style='color:red' name='outSize'>" + message + "</span>"));
            validationFlag = false;
            return ;
        }
    })
    return validationFlag;
}


function validateImgsDiv(id){
    $('#'+id).find(':file').each(function(){
        $(this).on("change",function(){
            var span = $(this).parent().parent().find("span[name='outSize']");
            if (span != null)$(span).remove();
            var flag =  validateFile($(this),'pic',false);
            if(flag != -1){
                var message = "";
                if(flag == 1){
                    message = "</br>超过300k";
                }
                if(flag == 2){
                    message = "</br>格式不支持";
                }
                $(this).parent().parent().append($("<span style='color:red' name='outSize'>"+message+"</span>"));
            }
        })
    })
}