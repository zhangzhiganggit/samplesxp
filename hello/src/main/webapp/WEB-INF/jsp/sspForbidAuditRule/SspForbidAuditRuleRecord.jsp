<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>禁审规则操作记录</title>

<%@include file="../layout/common.jsp"%>
<%@include file="../common/taglib.jsp"%>
<script src="<%=request.getContextPath()%>/js/common/common.js"></script>
</head>

<body class="no-skin ">
	<div class="main-container" id="main-container">
		<div class="widget-box widget-color-normal2" style="opacity: 1;">
			<div class="widget-header">
				<h5 class="widget-title bigger lighter">
					<i class="ace-icon fa fa-table"></i> 禁审规则操作记录
				</h5>
			</div>
			<div class="widget-body">
				<div class="widget-main no-padding ">
					<div class="list-div" id="listDiv">
							<table class=" table table-condensed">
								<tr>
									<td>归属分公司：</td>
									<td>${baseInfo.attrBution}</td>
									<td>机构编号：</td>
									<td>${baseInfo.orgNo}</td>
									<td>机构名称：</td>
									<td>${baseInfo.orgNm}</td>
								</tr>
							</table>
							<table class=" table table-condensed">
								<tr>
								    <td width="150px">操作时间</td>
									<td width="150px">操作类型</td>
									<td width="150px">工单类型</td>
									<td width="150px">操作人</td>
									<td width="300px">原因</td>
								</tr>
								<c:forEach items="${recordList}" var="item" varStatus="status">
									<tr>
										<td>${item.operatedDate}</td>
										<td><c:if test="${item.operatedTyp=='0'}">新增 </c:if>
											<c:if test="${item.operatedTyp=='1'}">修改 </c:if>
											<c:if test="${item.operatedTyp=='2'}">删除 </c:if>
										</td>
										<td><c:if test="${item.orderTyp=='0'}">全部工单 </c:if>
											<c:if test="${item.orderTyp=='1'}">录入工单 </c:if>
											<c:if test="${item.orderTyp=='2'}">修改工单 </c:if>
										</td>
										<td>${item.operatedPerson}</td>
										<td>${item.reason}</td>
								    </tr>
								</c:forEach>
							</table>
							<div class="form-actions center widget-color-normal5">
								<button class="btn  btn-sm" type="button" onclick="closeWin()">
									<span class="ace-icon fa 	 icon-on-right bigger-110"></span> 关闭
								</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../layout/common.js.jsp"%>
	<script type="text/javascript" src="${ctx}/ckfinder/ckfinder.js"></script>
	<script type="text/javascript" src="${ctx}/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		function closeWin() {
			parent.$.fancybox.close();
		}
	</script>
</body>
</html>