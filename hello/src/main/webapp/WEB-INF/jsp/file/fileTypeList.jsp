<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.jsp"%>
</head>

<body class="no-skin ">
    
  <%--   <%@include file="../layout/header.jsp"%>
 --%>
    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
      <%--   <%@include file="../layout/menu.jsp"%>
 --%>
        <div class="main-content ">
            <div class="main-content-inner ">

               
                <div class="page-content ">

                    <div class="row" >


                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       文件分类添加
                                    </h5>
                                  

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">


                                            <form  class="form-inline form-horizontal" action="${ctx}/file/fileTypeList" method="post" id="searchForm">
                                                <div class=" col-xs-12">
                                                   <!--  <div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >分类名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text"  id="groupName" name="groupName" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div> -->
                                                  

<!-- 
                                                    <div class="form-group form-group-sm width-300px ">
                                                  <button id="addType" class="btn btn-primary btn-sm" type="button">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                                                                                                                                                            添加
                                                 </button>
                                                 <span id="addMes"><font id="checkMes" style="color: red"></font></span>
                                                    </div> -->
       											
                                                </div>
                                              <c:if test="${loginUserPermission.SMSA_COMMON_011!=null }">
                                                <button class="btn btn-normal btn-sm" type="button"  id="addTypea" onclick="adtyp()">
                                                    <span class="ace-icon fa fa-add icon-on-right bigger-110"></span>
                                                                   		  添加
                                                </button>
                                              </c:if>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        分类列表
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center; ">  分类名称 </th>
                                                
                                                <th style="text-align: center;" >操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                              <c:forEach  items="${fileTypeList }" var="typList">
                                              <tr>
                                              <td style="text-align: center;width: 60%">${typList.groupName }</td>
                                              <td style="text-align: center;">
							                    
							                     <div class="   action-buttons">
							                            <c:if test="${loginUserPermission.SMSA_COMMON_013!=null }">
                                                        <a href="#" class="green"  onclick="editType('${typList.fileGroupId}','${typList.groupName }');" >
                                                            <i class="ace-icon fa fa-pencil blue bigger-130"><font size="2"> 修改</font></i>
                                                        </a>
                                                        </c:if>
                                                        <c:if test="${loginUserPermission.SMSA_COMMON_015!=null }">
                                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <a href="#" class="red"  onclick="delType('${typList.fileGroupId}');">
                                                            <i class="ace-icon fa fa-trash-o blue bigger-130"><font size="2">删除</font></i>
                                                        </a>
                                                        </c:if>
                                                    </div>
							                 </td>
							                 </tr>
                                              </c:forEach>

                                            </tbody>
                                        </table>


                                    </div>

                                </div>
                            </div>
                        </div>
                      <!--   <div class="row col-sm-12    ">
                            <div class="col-sm-4 hidden-480 left">
                                <label class="dataTables_info " id="dynamic-table_info" role="status" aria-live="polite">Showing 1 to 10 of 23 entries</label>
                            </div>

                                <div class="col-sm-8 right">
                                    <div class="dataTables_paginate paging_simple_numbers clearfix" id="dynamic-table_paginate">
                                        <ul class="pagination clearfix">
                                            <li class="paginate_button previous disabled" aria-controls="dynamic-table" tabindex="0" id="dynamic-table_previous">
                                                <a href="#">|<</a></li><li class="paginate_button active" aria-controls="dynamic-table" tabindex="0">
                                                <a href="#">1</a>
                                            </li>
                                            <li class="paginate_button " aria-controls="dynamic-table" tabindex="0"><a href="#">2</a></li>
                                            <li class="paginate_button " aria-controls="dynamic-table" tabindex="0"><a href="#">3</a></li>
                                            <li class="paginate_button next" aria-controls="dynamic-table" tabindex="0" id="dynamic-table_next"><a href="#">>|</a></li>
                                        </ul>
                                    </div>
                                </div>

                        </div> -->
                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

  <%--   <%@include file="../layout/footer.jsp"%> --%>
    <%@include file="../layout/common.js.jsp"%>
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    function delType(id){
   	 var conf = confirm("确定要删除此分类吗?");
   	 if(conf){
   		 $.ajax({
   			   type: "POST",
   			   url: "<%=request.getContextPath() %>/file/delType.do",
   			   data: "fileGroupId="+id,
   			   success: function(data){
   				   alert(data.msg);
   				   // alert(data)
   				   if(data.msgCode=='00'){
   					window.location.href="${ctx}/file/fileTypeList";
   				   }
   			   }
   			});
   	 }else{
   		 return;
   	 }
    }
    
    
    
    function adtyp(){
    	$.fancybox.open({
			href : '<%=request.getContextPath() %>/file/showHtypeView.do?',
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            fitToView: true,
            width: 500,
            height: 400,
            autoSize: false,
            closeClick: false,
			afterClose:function(){
				location.href='<%=request.getContextPath()%>/file/fileTypeList.do'; 
				
			}
		});
    	
    }
    
 
    function editType(id,name){
    	//alert(id+"///"+name)
    	$.fancybox.open({
			href : '<%=request.getContextPath() %>/file/showHtypeEditView.do?fileGroupId='+id,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            fitToView: true,
            width: 500,
            height: 400,
            autoSize: false,
            closeClick: false,
			afterClose:function(){
				location.href='<%=request.getContextPath()%>/file/fileTypeList.do'; 
			}
		});
    }
    
    	
    	 $(document).ready(function (){
    	    	
    	    	
    	   $("#addType").click(function (){
    		   var groupName = $("#groupName").val();
    		   if(groupName==""||$.trim(groupName) == ""){
    			   $("#checkMes").html("分类名称不能为空");
    		   }else{
    			   $("#checkMes").html("");
    			   $.ajax({
        			   type: "POST",
        			   url: "${ctx}/file/addType",
        			   data: "groupName="+groupName,
        			   success: function(data){
        				  // alert(data)
        				   var msg;
        				   if(data==0){
        					   msg = "系统异常，请稍后重试";
        				   }else if(data==1){
        					   msg = "新添分类成功";
        					   //$('#checkMes').attr("color","green");
        					 /*   $.ajax({
        	        			   type: "POST",
        	        			   url: "${ctx}/file/fileTypeList",
        	        			   data: "groupName="+groupName,
        	        			   success: function(data){
        	        				   
        	        			   }
        	        			}); */
        					   window.location.href="${ctx}/file/fileTypeList";
        				   }else if(data==2){
        					   msg = "此分类名称已经存在";
        				   }else{
        					   msg = "分类名称不能为空";
        				   }
        				   $("#checkMes").html(msg);
        			   }
        			});
    		   }
    	   });
    	 });
    

    
</script>
 
</body>
</html>











