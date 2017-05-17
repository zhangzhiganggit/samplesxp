<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付微信平台</title>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<style type="text/css">
body
{
font-family : 微软雅黑,宋体;
font-size : 1em;

}
</style>
</head>
<body class="no-skin ">
	<div class="main-container" id="main-container">
		<script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

		<div class="main-content ">
			<div class="main-content-inner ">

				<div class="page-content ">
					<div class="row">
						<div class=" widget-container-col ui-sortable  ">
							<div class="widget-box widget-color-normal3" style="opacity: 1;">
								<div class="widget-header">
									<h5 class="widget-title bigger lighter">
										<i class="ace-icon fa fa-table"></i> 流动广告排序
									</h5>
								</div>
							</div>
							<div class="widget-box widget-color-normal2" style="opacity: 1;">
                                     <p align="center"><b><font size="5">广告名称</font></b></p>
                                     
								 <div class="widget-body">
                                    <div class="widget-main no-padding  table-responsive">
                                    	<ul class="sortable" id="test">
                                    		<c:forEach var="adver" items="${adverList}">
                                    			<li style="font-size:16px;" class="ui-state-default"  id="${adver.sid}">${adver.adverName }</li>
                                    		</c:forEach>	
                                    		
                                    	</ul>
                                    <input type="hidden" name="sortedIDs" id="sortedIDs" value=""/>
                                    </div>
                                </div> 
							</div>
									<div class="form-actions center widget-color-normal5">
												   <button id="save" class="btn btn-danger btn-sm" type="button" onclick="savePosition()">
														<span
															class="ace-icon fa fa-floppy-o icon-on-right bigger-110">确认</span>
													</button>
													<button class="btn btn-default btn-sm" type="button"
														onclick="closeWin()">
														<span
															class="ace-icon fa fa-floppy-o icon-on-right bigger-110">关闭</span>
													</button>

													
									</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript">
        $('.chosen-select').chosen({});

        
        $(function() {
            $( ".sortable" ).sortable({
            cursor: "move",
            items :"li",                        
            opacity: 0.6,                       
            revert: true,                       
            update : function(event, ui){       
                $("#sortedIDs").val($("#test").sortable("toArray"));
//                 alert($("#sortedIDs").val());
            }
           });
         });
        
        function closeWin(){
        	
        	parent.$.fancybox.close();
        }
        
        function savePosition() {
        	$.ajax({  
                type:'post',       
                url:'<%=request.getContextPath() %>/flow/savePosition',
                cache:false,
                async:false,
                data : {
                	sortedIDs : $("#sortedIDs").val()
     	        },
                success:function(data){
                	
                	if(data=='操作成功'){
                		alert("操作成功!");
                		window.parent.location.reload();
                	}else{
                		alert("操作失败!");
                	}
                }
 		});
        }
</script>
</body>
</html>