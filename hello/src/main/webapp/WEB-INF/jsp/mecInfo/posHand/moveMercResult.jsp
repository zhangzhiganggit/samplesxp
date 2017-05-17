<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>随行付 Admin</title>
<%@include file="../../layout/common.jsp"%>
</head>
<body class="no-skin ">
    <div class="main-container" id="main-container">
        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                            <c:if test="${null != errorMessage && errorMessage != ''}">${errorMessage}</c:if>
                                                <br/>
                                            <c:if test="${null == showCount || showCount != false}">
                                            <span style ="display: block;float: right;">
                                                总计：读取${count}个，导入
                                                <c:if test="${null != errorMessage && errorMessage == '转移完成'}">
                                                ${count-errCount}个，失败
                                                </c:if>
                                                <c:if test="${null != errorMessage && errorMessage != '转移完成'}">
                                                0个，错误
                                                </c:if>
                                               ${errCount}个&nbsp;&nbsp;&nbsp;&nbsp;
                                                <button class="btn btn-minier btn-sm" type="button" onclick="downloadError()" >失败列表导出</button>
                                            </span>
                                            </c:if>
                                    </h5>
                                </div>
                                  <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align: center;width: 8%">代理商编号</th>
                                                <th style="text-align: center;width: 6%">直属机构编号</th>
                                                <th style="text-align: center;width: 7%">业务员编号</th>
                                                <th style="text-align: center;width: 5%">商户编号</th>
                                                <th style="text-align: center;width: 6%">原因</th> 
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${mercMap}" var="de" >
                                                    <tr>
                                                        <td style="text-align: center;">${de.topAgentNo }</td>
                                                        <td style="text-align: center;">${de.agentNo }</td>
                                                        <td style="text-align: center;">${de.empNo }</td>
                                                        <td style="text-align: center;">${de.mno }</td>
                                                        <td style="text-align: center;">${de.messageStr }</td>
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
                                <%@include file="../../layout/pagination.jsp" %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
    
    <%@include file="../../layout/common.js.jsp"%>
    <script type="text/javascript">
    function downloadError(){
        window.location.href='<%=request.getContextPath() %>/mecIfHandPos/downloadError';
    }
    </script>
</body>
</html>











