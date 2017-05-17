<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp"%>
<%
	String base = request.getContextPath()+"/";
%>
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=base%>js/common/common.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/font.css" />
<link href="<%=request.getContextPath() %>/css/datepicker.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/bootstrap-timepicker.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/daterangepicker.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrapValidator.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css" class="ace-main-stylesheet" id="main-ace-style" />
<script src="<%=request.getContextPath() %>/js/main.extra.js"></script>
<script src="<%=request.getContextPath() %>/js/fileUpload.js"></script>
<%-- <script src="<%=request.getContextPath() %>/js/jquery.ajaxfileupload.js"></script> --%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/docsupport/prism.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/chosen.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/js/fancy/jquery.fancybox.css">
<style type="text/css">
    th{
    text-align: center;
    }
</style>