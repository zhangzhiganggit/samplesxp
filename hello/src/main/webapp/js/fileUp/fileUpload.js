
function delFile(fileId,fileName){
	var result = confirm("确定要删除吗?");
	if(result){
		$.ajax({
			type:'post',
			url:"/file/delFile.do",
			data:'fileId='+fileId+'&fileName='+fileName,
			async:false,
			success:function(data){
				if(data!=null){
					alert(data.msg);
					if(data.msgCode=='00'){
						window.location.href='/file/fileList.do' 
					}
				}
				//$("#mecCityCd").attr("class","col-sm-6 width-48  chosen-select width-45  ");
			},
			error:function(){
				$.messager.alert('提示信息','文件删除失败');
			}
		});	
		
	}
}