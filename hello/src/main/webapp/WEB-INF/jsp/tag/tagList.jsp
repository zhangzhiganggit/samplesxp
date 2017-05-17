<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
<%@include file="/commons/include/html_doctype.html" %>
<html>
<head>
<title>tag管理</title>
<%@include file="/commons/include/get.jsp" %>
<%@include file="../layout/common.jsp"%>
</head>
<body>
	<div class="panel">
		<div class="panel-top">
			<div class="tbar-title">
				<span class="tbar-label">tag管理列表</span>
			</div>
			<div class="panel-toolbar">
				<div class="toolBar">
					<div class="group"><a class="link search" id="btnSearch"><span></span>查询</a></div>
					<div class="l-bar-separator"></div>
					<div class="group"><a class="link add" href="edit.ht?defId=${defId}"><span></span>添加</a></div>
					<div class="l-bar-separator"></div>
					<div class="group"><a class="link update" id="btnUpd" action="edit.ht?defId=${defId}"><span></span>修改</a></div>
					<div class="l-bar-separator"></div>
					<div class="group"><a class="link del"  action="del.ht"><span></span>删除</a></div>
				</div>	
			</div>
			<div class="panel-search">
				<form id="searchForm" method="post" action="list.ht">
					<div class="row">
						<span class="label">name:</span><input type="text" name="Q_name_SL"  class="inputText" value="${param['Q_name_SL']}"/>
					</div>
				</form>
			</div>
		</div>
		<div class="panel-body">
	    	<c:set var="checkAll">
				<input type="checkbox" id="chkall"/>
			</c:set>
		    <display:table name="tagList" id="tagItem" requestURI="list.ht" sort="external" cellpadding="1" cellspacing="1" class="table-grid">
				<display:column title="${checkAll}" media="html" style="width:30px;">
			  		<input type="checkbox" class="pk" name="id" value="${tagItem.id}">
				</display:column>
				<display:column property="name" title="name" sortable="true" sortName="name" maxLength="80"></display:column>
				<display:column title="管理" media="html" style="width:220px" class="rowOps">
					<a href="del.ht?id=${tagItem.id}" class="link del">删除</a>
					<a href="edit.ht?id=${tagItem.id}&defId=${defId}" class="link edit">编辑</a>
					<a href="get.ht?id=${tagItem.id}" class="link detail">明细</a>
				</display:column>
			</display:table>
			<fanda:paging tableId="tagItem"/>
		</div><!-- end of panel-body -->				
	</div> <!-- end of panel -->
</body>
</html>


