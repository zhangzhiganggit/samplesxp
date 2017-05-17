<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.jsp"%>
    
<script src="<%=request.getContextPath() %>/js/fileUp/fileUpload.js"></script>
</head>

<body class="no-skin ">
  <%--   <%@include file="../layout/header.jsp"%> --%>
    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
     <%--    <%@include file="../layout/menu.jsp"%> --%>
     
        <div class="main-content ">
            <div class="main-content-inner ">

               
                <div class="page-content ">

                    <div class="row" >


                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       文件添加
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">

                                            <form class="form-inline form-horizontal" action="${ctx}/file/fileList.do" id="searchForm" method="post"  enctype="multipart/form-data">
   <input  type="hidden" name="ctx" value="${ctx }" id="ctx"/> 
                          <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                                 <input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >                       
                                                <div class=" col-xs-12" >
                                                    <div class="form-group form-group-sm width-300px">
                                                       <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >分类名称 :</label>
                                                       <select id="fileGroupId" name="fileGroupId" data-placeholder="请选择"     class="col-sm-8 width-48 chosen-select width-45">
                                                                <option value="">全部</option>
                                                                <c:forEach items="${fileTypeList }" var="typList">
																		<option value="${typList.fileGroupId }"  >${typList.groupName}</option>
															   </c:forEach>
                                                       </select>
                                                       
                                                    </div>
                                                    
                                                   
                                                  <!--   <div class="form-group form-group-sm width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >文件描述:</label>

                                                        <div class="col-sm-6  no-padding"  >
                                                            <input type="text" id="displayName" name="displayName" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div> -->
                                                   
                                                   <!--  <div class="form-group form-group-sm width-300px">
                                                    <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ></label>
                                                       <div class="col-sm-6  no-padding"  >
                                                            <input type="file" id="myfiles"  name="myfiles"></div>
                                                    </div> -->
                                                 </div>  
                                                  
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                                                                                                                                              检索
                                                </button>
											<c:if test="${loginUserPermission.SMSA_COMMON_017!=null }">
                                                <button class="btn btn-danger btn-sm" type="button" onclick="addView()">
                                                    	增加文件
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
                                      文件列表
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="display: none"></th>
                                                <th style="display: none"></th>
                                                <th style="display: none"></th>
                                                <th style="text-align: center;">  分类名称 </th>
                                                <th style="text-align: center;">  文件名称</th>
                                                <th style="text-align: center;">文件大小</th>
                                                <th style="text-align: center;">上传时间</th>
                                               <!--  <th style="text-align: center;">描述</th> -->
                                                <th style="text-align: center;" >操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach  items="${fileList }" var="fileDtail">
                                              <tr>
                                              <td style="display: none">${fileDtail.fileGroupId}</td>
                                              <td style="display: none">${fileDtail.fileDesc}</td>
                                              <td style="display: none">${fileDtail.fileId}</td>
                                              <td >${fileDtail.groupName }</td>
                                              <td >${fileDtail.viewName }</td>
                                              <td >${fileDtail.fileSizeAlias }</td>
                                              <td style="text-align: center;">${fileDtail.createTime }</td>
                                             <%--  <td >${fileDtail.fileDesc }</td> --%>
                                              <td style="text-align: center;">
							                    
							                     <div class="   action-buttons">
							                     <c:if test="${loginUserPermission.SMSA_COMMON_019!=null }">
                                                        <a href="#" class="green" id="edit" onclick="editType('${fileDtail.fileGroupId }','${fileDtail.fileDesc}','${fileDtail.fileId}');" >
                                                            <i class="ace-icon fa fa-pencil blue bigger-130"><font size="2"> 修改</font></i>
                                                        </a>
                                                 </c:if>
                                                 <c:if test="${loginUserPermission.SMSA_COMMON_021!=null }">
                                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <a href="#" onclick="delFiles('${fileDtail.fileId}','${fileDtail.fileName }');" class="red"  >
                                                            <i class="ace-icon fa fa-trash-o blue bigger-130"><font size="2">删除</font></i>
                                                        </a>
                                                 </c:if>
                                                 <c:if test="${loginUserPermission.SMSA_COMMON_022!=null }">
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <a href="${ctx }/file/downFile.do?fileId=${fileDtail.fileId}&fileName=${fileDtail.fileName}&displayName=${fileDtail.displayName}" class="red" id="del" >
                                                            <i class="ace-icon fa fa-arrow-circle-o-down blue bigger-130"><font size="2">下载</font></i>
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
                       <div class="row col-sm-12    ">
							<div class="col-sm-4 hidden-480 left">
								<label class="dataTables_info " id="dynamic-table_info"
									role="status" aria-live="polite"></label>
							</div>

							<div class="col-sm-8 right">
								<%@include file="../layout/pagination.jsp" %>
							</div>

						</div>
                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->
    
    
    
    <!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 800px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">修改文件信息</h4>
				</div>
				<div class="modal-body no-padding" style="height: 150px">
					<div class="widget-main ">
						<form class="form-inline form-horizontal" id="bnkLinkForm">
							<div class=" col-xs-12">
								
					 <div class="form-group form-group-sm width-300px">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">文件分类*:</label>

									<div class="col-sm-8  no-padding">
										<select data-placeholder="请选择" name="typeCd" id="typeCd">

											<option value="">全部</option>
                                        <c:forEach items="${fileTypeList }" var="typList">
									    <option value="${typList.fileGroupId }" >${typList.groupName}</option>
										</c:forEach>
										</select>
									</div>
									
									
									
								</div> 
								



								<div class="form-group form-group-sm width-300px">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">文件名称*:</label>

									<div class="col-sm-8  no-padding ">
										<input type="text" name="fileDesc" id="fileDesc"
											class="form-control input-small width-200px "
											data-placement="bottom" title="">
									</div>
								</div>

								<button class="btn btn-danger btn-sm" type="button"
									onclick="editFileDetail()">
									<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
								修改
								</button>


							</div>
							<input type="hidden" id="fid" name="fid">
						</form>

						<div class="col-sm-12 no-padding" id="bnkPage"></div>
					</div>
				</div>
				<div class="modal-footer">
					<%--<button type="button" class="btn btn-default"--%>
					<%--data-dismiss="modal">关闭--%>
					<%--</button>--%>
					<%--<button type="button" class="btn btn-primary">--%>
					<%--提交更改--%>
					<%--</button>--%>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
    

    <%-- <%@include file="../layout/footer.jsp"%> --%>
    <%@include file="../layout/common.js.jsp"%>
    <!-- inline scripts related to this page -->
 
    <script type="text/javascript">
    
 
    
 function delFiles(id,name){
	 var res = confirm("确定要删除此文件吗?");
	 if(res){
		 $.ajax({
				    	cache: true,
				        type: "POST",
				        url:'/file/delFile.do',
				        data:'fileId='+id+'&fileName='+name,
						async : false,
						error : function(data) {
							//data = eval("(" + data + ")")
							alert(data);
						},
						success : function(data) {
							//data = eval("(" + data + ")")
							alert(data.msg);
							if(data.msgCode=='00'){
								window.location.href='<%=request.getContextPath()%>/file/fileList.do' 
							}
						}
					});
	   	 

	 }
    	
 }
    
    
    
   function addView(){
	   $.fancybox.open({
			href : '<%=request.getContextPath()%>/file/upView.do',
			type: 'iframe',
       padding: 5,
       scrolling: 'no',
       fitToView: true,
       width: 900,
       height: 500,
       autoSize: false,
       closeClick: false,
			afterClose:function(){
				window.location.href='<%=request.getContextPath()%>/file/fileList.do' 
			}
		});
	 <%--  window.location.href='<%=request.getContextPath()%>/file/upView.do'; --%>
   }

        $('.chosen-select').chosen({});
        
        jQuery(function($) {
        	 
        	 
        	$("#fileGroupId").val('${gropName}');
        	$("#fileGroupId").trigger("chosen:updated");
        	
        })
        
        function editType(typeid,desc,id){
        
        	 $.fancybox.open({
     			href : '<%=request.getContextPath()%>/file/editView.do?typeids='+typeid+'&desc='+desc+'&ids='+id,
     			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            fitToView: true,
            width: 900,
            height: 350,
            autoSize: false,
            closeClick: false,
     			afterClose:function(){
     				window.location.href='<%=request.getContextPath()%>/file/fileList.do' 
     			}
     		});
        }
  
     /*  function editType(typeid,desc,id){
        	var t = document.getElementById("typeCd");   
            var selectValue=typeid;//获取select的值  
            for(i=0;i<t.length;i++){//给select赋值  
                if(selectValue==t.options[i].value){  
                    t.options[i].selected=true  
                }  
            }  
            $("#fileDesc").val(desc);
            $("#fid").val(id);
        	$('#myModal').modal({
 				keyboard : true
 			});
      }  */
        
     function editFileDetail(){
    	 $.ajax({
 			    	cache: true,
 			        type: "POST",
 			        url:'/file/detailUpdate.do',
 					data : $('#bnkLinkForm').serialize(),// 你的formid
 					async : false,
 					error : function(data) {
 						//data = eval("(" + data + ")")
 						alert(data.msg);
 					},
 					success : function(data) {
 						//data = eval("(" + data + ")")
 						alert(data.msg);
 					    parent.$.fancybox.close();
 					}
 				});
    	 
    	 
     }

  
</script>
</body>
</html>











