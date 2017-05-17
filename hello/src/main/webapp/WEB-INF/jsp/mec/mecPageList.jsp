<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../layout/common.jsp"%>
</head>
<body>
<div class="widget-main no-padding ">
            <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                <thead class="thin-border-bottom">
                <tr>
                    <th align="center">序号</th>
				<th align="center">商户编号</th>
				<th align="center">注册名称</th>
				<th align="center">经营名称</th>
				<th align="center">归属部门名称</th>
				<th align="center">签约费率</th>
				<th align="center">创建时间</th>
				<th align="center">商户状态</th>
				<th align="center">商户结算状态</th>
				<th align="center">所属业务员</th>
				<th align="center">行业大类</th>
                <th  >操作</th>
                </tr>
                </thead>

                <tbody>
                
                
         <c:forEach items="${mecIfList}" var="de"  varStatus="status">
			<tr>
				<td style="border:1px solid  #969696;">${status.index+1 }</td>
				<td style="border:1px solid  #969696;">
				${de.mno }
				</td>
				<td style="border:1px solid  #969696;">${de.cprRegNmCn }</td>
				<td style="border:1px solid  #969696;">${de.cprOperNmCn }</td>
				<td style="border:1px solid  #969696;">${de.deptNm }</td>
				<td style="border:1px solid  #969696;">${de.rat1 }%</td>
				<td style="border:1px solid  #969696;">${de.dtCte }</td>
				<td style="border:1px solid  #969696;">${de.mecSts }</td>
				<td style="border:1px solid  #969696;">${de.pasStlFlg }</td>
				<td style="border:1px solid  #969696;">${de.empNo }</td>
				<td style="border:1px solid  #969696;">${de.idtTypOa }</td>
				<td  >
                     <div class="   action-buttons">
                         <a href="<%=request.getContextPath() %>/mec/get.do?mno=${de.mno }" class="blue fancybox-manual-b">
                             <i class="ace-icon fa fa-search-plus bigger-130"></i>
                         </a>

                         <a href="<%=request.getContextPath() %>/mec/edit.do?mno=${de.mno }" class="green">
                             <i class="ace-icon fa fa-pencil bigger-130"></i>
                         </a>

                         <a href="<%=request.getContextPath() %>/mec/del.do?mno=${de.mno }" class="red">
                             <i class="ace-icon fa fa-trash-o bigger-130"></i>
                         </a>
                     </div>
                 </td>
			</tr>
		</c:forEach> 
                </tbody>
            </table>
</div>
</body>
</html>