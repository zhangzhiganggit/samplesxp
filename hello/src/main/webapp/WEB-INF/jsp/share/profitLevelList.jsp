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
   <div class="main-container" id="main-container">
        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal2"  >
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        级别列表
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;">  等级 </th>
                                                <th style="text-align: center;">  分润比例 </th>

                                                <th  style="text-align: center;">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach  items="${levelList }" var="lev">
                                              <tr>
                                              <td style="text-align: center;">${lev.levelName }</td>
                                              <td style="text-align: center;">${lev.scaleStr }%</td>
                                              <td style="text-align: center;">
                                              <c:if test="${loginUserPermission.SMSA_PROFIT_002!=null }">
								                 <div class="   action-buttons">
	                                                        <a href="#" class="green" id="edit" onclick="editLevel('${lev.levelId }');" >
	                                                            <i class="ace-icon fa fa-edit blue bigger-130"><font size="2"> 修改</font></i>
	                                                        </a>
	                                             </div>
                                             </c:if>
							                 </td>
							                 </tr>
                                              </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">
    function editLevel(levelId){
    	$.fancybox.open({
			href : '<%=request.getContextPath() %>/profitLevel/showEditView.do?levelId='+levelId,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            fitToView: true,
            width: 300,
            height: 400,
            autoSize: false,
            closeClick: false,
			afterClose:function(){
				location.href='<%=request.getContextPath()%>/profitLevel/list.do';
			}
		});
    }

</script>
</body>
</html>











