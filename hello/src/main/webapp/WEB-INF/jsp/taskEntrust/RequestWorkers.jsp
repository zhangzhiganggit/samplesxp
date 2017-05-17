<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
<script type="text/javascript">

</script>
<c:if test="${taskEntrustInfoList.size() >0 }">
          <h4 class="smaller lighter green">工单委托记录</h4>
           <div class="form-group form-group-sm width-900px">
          <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
          <thead class="thin-border-bottom">
           <tr>
                <th style="text-align:center;width: 20%">操作人账号</th>
                <th style="text-align:center;width: 20%">操作时间</th>
                <th style="text-align:center;width: 20%">接收人账号</th>
                <th style="text-align:center;width: 40%">委托原因</th>
           </tr>
          </thead>

          <tbody>
             <c:forEach items="${taskEntrustInfoList}" var="taskEntrust" varStatus="status">
				<tr>
					<td style="text-align:center" >${taskEntrust.startPerson}</td>
					<td style="text-align:center" ><fmt:formatDate value="${taskEntrust.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td style="text-align:center" >${taskEntrust.receivedPerson}</td>
					<td style="text-align:left" >${taskEntrust.delegateReason}</td>
				</tr>
			</c:forEach>
          </tbody>
        </table>
    </div>
</c:if>