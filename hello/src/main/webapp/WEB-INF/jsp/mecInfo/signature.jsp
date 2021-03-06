<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付Admin </title>

    <%@include file="../layout/common.css.jsp"%>
</head>

<body class="no-skin ">

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">

                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                <!-- 准备信息 -->
									<input type="text" name="message" id="message" value="${message} " style="display:none">
									<input type="text" name="success" id="success" value="${success} " style="display:none">
									<input type="text" name="xp" id="xp" value="${xp} " style="display:none">
									<input type="text" name="tranUuid" id="tranUuid" value="${tranUuid} " style="display:none">
                                <!-- 准备信息结束 -->
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        电子签名详情
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                             <!-- 显示校验结果 -->
                                                <div id="identifyInfo" style="width:800px;height:485px;padding:10px;background:#fafafa;" > 
														<div class="easyui-panel" style="width:465px;height:50px;overflow-x:hidden;background:#fafafa;" title="签名信息">
																<center style="margin-top: 10px"><span id="identifyMessage" style="font-size: medium;font-weight: bold;"></span></center>
														</div>
														<br/><br/><br/>
														<div class="easyui-panel" style="overflow-x:hidden;width:800px;height:300px;background:#fafafa;" title="照片信息">
																<center style="margin-top: 10px"><img src="" id="identifyImg" style="display:none;width:800px;"/>
																	<span id="identifyImgDiv" style="font-size: medium;font-weight: bold;"></span>
																</center>
														</div>
												</div>
                                             <!-- 显示完毕 -->
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>



            </div>
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->

    <%@include file="../layout/common.alljs.jsp"%>
    <script type="text/javascript">
    function closeWin(){
    		parent.$.fancybox.close();
    }
    
    $('.chosen-select').chosen({});
	<!--回显信息-->
	window.onload = function() { 
		var message = $("#message").val();
		var success = $("#success").val();
		var xp = $("#xp").val();
		if(success!='' && success!=null){
			$("#identifyMessage").text(message);
			if(success!=undefined && success!='' && success!=null && success==1){
				if(xp == '' || xp == null || xp == undefined || xp.length==2){
					//$("#identifyImgDiv").text("交易不成功无法加载签名图片");
				}else{
					$("#identifyImg").show();
					$("#identifyImg").attr("src","<%=request.getContextPath()%>/posHandTrade/imgShow?xp=${xp}&tranUuid=${tranUuid}");
				}
			}else{
				$("#identifyImgDiv").text("签名损坏无法加载签名图片");
			}
		}else{
			$("#identifyMessage").text("签名损坏无法加载签名图片！");
			$("#identifyImgDiv").text("签名损坏无法加载签名图片")
		}
		
		 $('#identifyInfo').show();
	}
</script>
</body>
</html>