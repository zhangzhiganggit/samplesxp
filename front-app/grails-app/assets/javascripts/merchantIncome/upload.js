//是否保存图片的操作历呀
var MerchantIncomeUtils={
    isSavePictureHistory:false
};


function removeDisabled(){
    $("#uploadPictures").removeAttr("disabled");
    $("#uploadPictures").val('批量上传附件');
}

function  uploadZip(){
    $("#uploadPictures").attr({"disabled":"disabled"});
    $("#uploadPictures").val('文件正在上传中......');
    // var fileVal = $('#cy123').val() ;
    // if(fileVal == "")
    // {
    //     bootbox.alert("请上传文件!");
    //     removeDisabled();
    //     return false;
    // }
    // var postfix = fileVal.substr(fileVal.indexOf("."));
    // if(postfix != ".zip")
    // {
    //     bootbox.alert('只能上传zip文件,其它格式暂不支持');
    //     removeDisabled();
    //     return false;
    // }
    // var fileInput = $('#cy123')[0];
    // var byteSize  = fileInput.files[0].size;
    // var size = Math.ceil(byteSize / 1024) ;
    // if(size>5200)
    // {
    //     bootbox.alert("文件大小超出5M!");
    //     removeDisabled();
    //     return false;
    // }
    var result = validateFile($('#cy123'),'zip',true);
    if(result != -1){
        removeDisabled();
        return false;
    }
    $('.progress-bar').css("width",'0%');
    loading();
    $.ajaxFileUpload({
        type : 'POST',
        secureuri : false,
        async:false,
        fileElementId:['cy123'],
        dataType: 'json',
        data:{"notMatchedNum":$('#notMatchedNum').val()},
        url : '/MerchantIncome/uploadZip',
        success : function(data){
            $('#notMatchedNum').val($('#notMatchedNum').val() + data["notMatchedNum"]);
            if($('#notMatchedNum').val() > 22){
                clearTimeout(timer);
                $('.progress-bar').css("width",'100%');
                bootbox.alert("照片不正确数量过多不予保存，最多保存22张。");
                removeDisabled();
                return false;
            }
            $("[id$='Base64']").each(function(i,n){
                var id = $(this).attr("id");
                var img = $("#templateDiv").find("img");
                if(data[id] != null && data[id]!= ""){
                    $(this).find('img').remove();
                    img.clone().attr("src","data:image/jpeg;base64,"+data[id].imgInfo).appendTo($(this));
                    $(this).parent().addClass('fileinput-exists').removeClass('fileinput-new');
                    $(this).parent().find('#'+id+'Img').val(data[id].oldPath);
                }
            });
            $.each(data.notMatchedList,function(i,n){
                var divId = "notMatch" + Math.ceil((i+1)/4);
                var imgDiv =$("#templateDiv").find("div").clone();
                $(imgDiv).find("img").attr('src','data:image/jpeg;base64,'+n.imgInfo);
                $(imgDiv).find("img").attr('id','notMatchImg'+i);
                $(imgDiv).find("input").val(n.oldPath);
                $('#'+divId).append($(imgDiv));
            })
            clearTimeout(timer);
            $('.progress-bar').css("width",'100%');
            alert(data.message);
            //设置保存历史
            MerchantIncomeUtils.isSavePictureHistory=true;
            removeDisabled();
        },
        failure : function(data){
            clearTimeout(timer);
            $('.progress-bar').css("width",'100%');
            bootbox.alert('文件上传失败!');
            //设置保存历史
            MerchantIncomeUtils.isSavePictureHistory=false;
            removeDisabled();
        }
    });
}

function saveImg(url){
    var dataInfo = "";  //传递的data数据
    var postfix = "Base64Img";
    if($('.fileinput.fileinput-exists').length==0){
        return false;
    }
    var ids = new Array();
    $('.fileinput.fileinput-exists').each(function(i,n){
        var fileObj = $(this).find(':file'); //file对象
        var file = fileObj.val(); //file的值
        var id = fileObj.attr('id');//file的id
        ids.push(id);
        // if(file != undefined && file.length!=0)//校验是否上传了文件。
        var base64Str = $(this).find('#'+id+"Base64Img").val();
        if(i==0){
            dataInfo+=id+postfix+":"+"\'"+encodeURI(base64Str)+"\'";
        }else{
            dataInfo+=","+id+postfix+":"+"\'"+encodeURI(base64Str)+"\'";
        }
    })
    dataInfo+=","+"taskCode"+":"+"\'"+$('#taskCode').val()+"\'"; //追加taskCode字段
    dataInfo="{"+dataInfo+"}";
    console.log("dataInfo"+ dataInfo);
    $('#loadImgFlag').val(-1);
    $.ajaxFileUpload({
        type : 'POST',
        secureuri : false,
        fileElementId:ids,
        dataType: 'json',
        data:eval("("+dataInfo+")"),
        async: false,
        url : url,
        success : function(data){
            // $('#imgload').stop(true).prop('class', 'bootbox.alert bootbox.alert-danger').text(data.message).css({
            //     'margin-left': -$tip.outerWidth() / 2,
            //     "margin-top": -$tip.outerHeight() / 2
            // }).fadeIn(500).delay(500).fadeOut(500);
             $('#loadImgFlag').val(0);
            //保存历史图片成功后，不在保存当前未操作的图片
            if(url=="/MerchantIncome/savePictureHistoryImg"){
                MerchantIncomeUtils.isSavePictureHistory=false;
            }
            console.log("图片上传成功!");
        },
        failure : function(data){
            // $('#imgload').stop(true).prop('class', 'bootbox.alert bootbox.alert-danger').text('图片保存失败').css({
            //     'margin-left': -$tip.outerWidth() / 2,
            //     "margin-top": -$tip.outerHeight() / 2
            // }).fadeIn(500).delay(500).fadeOut(500);
            $('#loadImgFlag').val(0);
            console.log("图片上传失败!");
        },
        complete: function (XHR, TS) { XHR = null ;$('#loadImgFlag').val(0);}
    });
}


function autoSaveImg(){
    //saveImg("/MerchantIncome/autoSaveImg");
}
/**
 * 保存图片操作的历史记录
 */
function  saveHistoryImg() {
    //要保存记录
    saveImg("/MerchantIncome/savePictureHistoryImg");
    //判断是否要保存记录
    // if(MerchantIncomeUtils.isSavePictureHistory){
    //     saveImg("/MerchantIncome/savePictureHistoryImg");
    // }
}


var  speed = 100 ;
var percent = 0 ;
var timer ;
function loading(){
    timer = setTimeout(function(){
        percent += Math.random() * 5;
        percent = parseFloat(percent.toFixed(1));
        if(percent >= 96){
            percent = 96;
        }else{
            // speed = Math.floor(Math.random() * 900);
            loading();
        }
        $('.progress-bar').css("width",percent+'%');
        $('.progress-bar').find('span').text(percent+'%'+'已完成');
    },speed)
}


function uploadFileSize(){
    return validataAllImg();

}

function up(){
    // uploadFileTotalSize();
    uploadZip();
}

function doUpload() {
    var formData = new FormData($("#scaffold-save-merchantIncome")[0]);
    $('#loadImgFlag').val(-1);
    $.ajax({
        url: '/MerchantIncome/autoSaveImg',
        type: 'POST',
        data: formData,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success: function (returndata) {
            $('#loadImgFlag').val(0);
            console.log("图片上传成功!");
        },
        error: function (returndata) {
            $('#loadImgFlag').val(0);
            console.log("图片上传失败!");
        },
        complete: function (XHR, TS) { XHR = null ;$('#loadImgFlag').val(0);}
    });
}

function dragStart(event) {
    event.dataTransfer.dropEffeet = "copy";
    event.dataTransfer.setData("Text", event.target.id);
    // alert(event.dataTransfer.getData("Text"));
}

// function bondDragover(id){
//     $('#'+id).find('.col-sm-3').each(function(){
//         $(this).on("dragover",function(event){
//             event.preventDefault();
//         })
//     })
// }


// function bondDrop(id){
//     $('#'+id).find('.col-sm-3').each(function(){
//         $(this).on("drop",function(event){
//             alert('cc');
//             event.preventDefault();
//             var data = event.dataTransfer.getData("Text");
//             alert(data);
//             // event.target.appendChild(data);
//         })
//     })
// }

function allowDrop(event) {
    event.preventDefault();
}
function drop(event) {
    event.preventDefault();
    var data = event.dataTransfer.getData("Text");
    // alert(data);
    var src = $('#'+data).attr("src");
    // event.target.appendChild(document.getElementById(data));

    var targetInfo = event.target;
    var target = $(targetInfo).parents('.col-sm-3');

    $(target).find('img').remove();
    var img = $("#templateDiv").find("img");
    img.clone().attr("src",src).appendTo($(target).find("[id$='Base64']"));
    $(target).find("div:first").addClass('fileinput-exists').removeClass('fileinput-new');
    $(target).find('input:last').val($('#'+data).next().val());
}

