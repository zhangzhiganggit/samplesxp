<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>

<body>
	<c:forEach items="${noticeList}" var="nl" >
			<div class="itemdiv dialogdiv">
				<div class="body">
	                <div class="time">
	                     <i class="ace-icon fa fa-clock-o"></i>
	                     <span class="green"><fmt:formatDate value="${nl.beginDate}" pattern="yyyy-MM-dd"/></span>
	                </div>
					<div class="name">
		            	<a href="javascript:countDown('${nl.noticeId}')">${nl.noticeTitle}</a>
		            	&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${nl.noticeType}
		            </div>
		            <div class="text">${nl.noticeCruces}</div>
	            </div>
	       </div>
   </c:forEach>
</body>

<script type="text/javascript">


function countDown(noticeId){
	   $.fancybox.open({
			href : '<%=request.getContextPath()%>/notice/see.do?noticeId='+noticeId
					+'&entry=main',
			type: 'iframe',
        padding: 5,
        scrolling: 'no',
        fitToView: true,
        width: 900,
        height: 400,
        autoSize: false,
        closeClick: false,
			afterClose:function(){
			}
		});
	   
	   
}
</script>


