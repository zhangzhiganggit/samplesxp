<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html"%>
<%@ include file="../common/taglib.jsp" %>
<html>
<head>
	<title>编辑 note</title>
	<%@include file="/commons/include/form.jsp" %>
	<%@include file="../layout/common.jsp"%>
	<script type="text/javascript" src="${ctx}/js/fanda/CustomValid.js"></script>
	<script type="text/javascript" src="${ctx}/js/fanda/formdata.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#formInfo").ligerTab();
			$("a.save").click(function() {
				$("#noteForm").attr("action","save.ht");
				submitForm();
			});
		});
		//提交表单
		function submitForm(){
			var options={};
			if(showResponse){
				options.success=showResponse;
			}
			var frm=$('#noteForm').form();
			frm.setData();
			frm.ajaxForm(options);
			if(frm.valid()){
				form.submit();
			}
		}
		
		function showResponse(responseText) {
			var obj = new com.fanda.form.ResultMessage(responseText);
			if (obj.isSuccess()) {
				$.ligerDialog.success(obj.getMessage(),"提示信息", function(rtn) {
					if(rtn){
						if(window.opener){
							window.opener.location.reload();
							window.close();
						}else{
							this.close();
							window.location.href="list.ht";
						}
					}
				});
			} else {
				$.ligerDialog.error(obj.getMessage(),"提示信息");
			}
		}
		
	</script>
</head>
<body>
<div class="panel">
	<div class="panel-top">
		<div class="tbar-title">
		    <c:choose>
			    <c:when test="${note.id !=null}">
			        <span class="tbar-label">编辑note</span>
			    </c:when>
			    <c:otherwise>
			        <span class="tbar-label">添加note</span>
			    </c:otherwise>			   
		    </c:choose>
		</div>
		<div class="panel-toolbar">
			<div class="toolBar">
				<div class="group"><a class="link save" id="dataFormSave" href="#">保存</a></div>
				<div class="l-bar-separator"></div>
				<div class="group"><a class="link back" href="list.ht">返回</a></div>
			</div>
		</div>
	</div>
	<div class="panel-body" type="custform">
		<form id="noteForm" method="post" action="save.ht">
			<div id="formInfo" >
				<div title="note主表明细">
					<table class="table-detail" cellpadding="0" cellspacing="0" border="0" type="main">
						<input type="hidden" name="id" value="${note.id}" />   <!-- id放到主表TABLE里面,生成的内容才能获取主表提交的数据的ID ??? -->
						<tr>
							<th width="20%">body: </th>
							<td><input type="text" id="body" name="body" value="${note.body}"  class="inputText" validate="{required:false,maxlength:765}"  /></td>
						</tr>
						<tr>
							<th width="20%">title: </th>
							<td><input type="text" id="title" name="title" value="${note.title}"  class="inputText" validate="{required:false,maxlength:765}"  /></td>
						</tr>
					</table>
				</div>
			</div>		
		</form>
		
	</div>
</div>
</body>
</html>
