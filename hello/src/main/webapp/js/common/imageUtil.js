function initImageInput(fileNames,fileDescs){
	fileNames = fileNames.replace('[','').replace(']','').split(',');
	fileDescs = fileDescs.replace('[','').replace(']','').split(',');
	if(fileNames.length == fileDescs.length && fileNames.length > 0){
		for(var i =0;i<fileNames.length;i++){
			$("[name='"+fileNames[i].trim()+"']").ace_file_input({
	            style:'well',
	            btn_choose:fileDescs[i],
	            btn_change:null,
	            /* allowMime : ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"], */
	            no_icon:'ace-icon fa fa-cloud-upload',
	            droppable:true,
	            height:350,
	            thumbnail:'small',//large | fit |small
	            before_change:function(files,dropped){
	            	var fileName = files[0].name;
	            	var fileSize = files[0].size;
	            	var pointIndex = fileName.lastIndexOf('.');
	            	if(pointIndex == -1){
	            		alert('请上传图片文件(jpg、jpeg、png、gif、bmp)！');
	            		return false;
	            	}
	            	var fileType = fileName.substr(pointIndex+1);
	            	var allowMime = ['jpg','jpeg','png','gif','bmp'];
	            	var flag = false;
	            	for(var i = 0;i<allowMime.length;i++){
	            		if(allowMime[i] == fileType)
	            			flag = true;
	            	}
	            	if(!flag){
	            		alert('请上传图片文件(jpg、jpeg、png、gif、bmp)！');
	            	}
	            	if(flag && parseInt(fileSize/1024) > 300){
	            		alert('单张图片大小不可超过300K');
	            		flag = false;
	            	}
	            	return flag;
	            },
	            preview_error : function(filename, error_code) {
	                //do nothing
	            }
	        }).on('change', function(){
	        	
	        });
		}
	}
}
$('.id-file-format').removeAttr('checked').on('change', function() {
    var whitelist_ext, whitelist_mime;
    var btn_choose
    var no_icon
    if(this.checked) {
        btn_choose = "Drop images here or click to choose";
        no_icon = "ace-icon fa fa-picture-o";
        whitelist_ext = ["jpeg", "jpg", "png", "gif" , "bmp"];
        whitelist_mime = ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"];
    }
    else {
        btn_choose = "Drop files here or click to choose";
        no_icon = "ace-icon fa fa-cloud-upload";
        whitelist_ext = null;//all extensions are acceptable
        whitelist_mime = null;//all mimes are acceptable
    }
    var file_input = $('#id-input-file-3');
    file_input
            .ace_file_input('update_settings',
            {
                'btn_choose': btn_choose,
                'no_icon': no_icon,
                'allowExt': whitelist_ext,
                'allowMime': whitelist_mime
            })
    file_input.ace_file_input('reset_input');
    file_input
            .off('file.error.ace')
            .on('file.error.ace', function(e, info) {
                //console.log(info.file_count);//number of selected files
                //console.log(info.invalid_count);//number of invalid files
                //console.log(info.error_list);//a list of errors in the following format
                //info.error_count['ext']
                //info.error_count['mime']
                //info.error_count['size']
                //info.error_list['ext'] = [list of file names with invalid extension]
                //info.error_list['mime'] = [list of file names with invalid mimetype]
                //info.error_list['size'] = [list of file names with invalid size]
                /**
                 if( !info.dropped ) {
//perhapse reset file field if files have been selected, and there are invalid files among them
//when files are dropped, only valid files will be added to our file array
e.preventDefault();//it will rest input
}
                 */
                //if files have been selected (not dropped), you can choose to reset input
                //because browser keeps all selected files anyway and this cannot be changed
                //we can only reset file field to become empty again
                //on any case you still should check files with your server side script
                //because any arbitrary file can be uploaded by user and it's not safe to rely on browser-side measures
            });
});
$("#downloadAll").bind("click", function(){
	debugger;
	/*if($("#downloadAll").attr("disabled")=="disabled"){
		return false;
	}
	$("#downloadAll").attr("disabled","disabled");*/
	var orderNo = $("[name='orderNo']").val();
	var mercId = $("#mercId").val();
	if(mercId == '' || mercId == undefined){
		mercId = orderNo+'Temp';
	}
	
	var path = '';
	var rootContent = $("#rootContent").val();
	if(rootContent=='' || rootContent==undefined){
		path = "/imageUpload/downloadAllImages.do?orderNo="+orderNo;
	}else{
		var day = '';
		$.ajax({
			url: "/imageUpload/getNowPlusUploadTime",
			type: "post",
			data: "orderNo="+orderNo,
			dataType: "json",
			async: false,
			success: function(message){
				day = message.day;
			}
		});
		if(parseInt(day) > 15){
			rootContent = $("#readImageUrlExpiredBasePath").val();
			path = rootContent+"imageUpload/downloadAllImages.do?orderNo="+orderNo;
		}else{
			var downLoadPath = "";
			$.ajax({
				url: "/imageUpload/getDownLoadPath",
				type: "post",
				data: "orderNo="+orderNo,
				dataType: "json",
				async: false,
				success: function(message){
					downLoadPath = message.remotePath;
				}
			});
			path = rootContent+"photos/downloadAllImages.do?orderNo="+orderNo+"&mercId="+mercId+"&downLoadPath="+downLoadPath;
		}
	
	}
	location.href=path;
});