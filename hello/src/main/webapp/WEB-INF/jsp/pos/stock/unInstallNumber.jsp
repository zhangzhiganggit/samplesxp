<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付</title>

    <%@include file="../../common/taglib.jsp"%>
    <%@include file="../../layout/common.jsp"%>
</head>

<body class="no-skin ">

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">

                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                       未安装数查看
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/stockManage/unInstallNumberList.do" id="searchForm" method="post" >
                                        <input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">
                                        <input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}" >
                                        <input type="hidden" name="belongtoOrg" value="${stockInfo.belongtoOrg}" >
                                        <input type="hidden" name="modelCode" value="${stockInfo.modelCode}" >
                                        <input type="hidden" name="status" value="${stockInfo.status}" >
                                    </form>
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width:8%">序列号</th>
                                                <th style="text-align:center;width:7%">物品名称</th>
                                                <th style="text-align:center;width:7%">厂商简称</th>
                                                <th style="text-align:center;width:7%">型号</th>
                                                <th style="text-align:center;width:7%">通讯方式</th>
                                                <th style="text-align:center;width:7%">电签</th>
                                                <th style="text-align:center;width:7%">状态</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${unInstallList}" var="unIn"  varStatus="status">
                                                    <tr>
                                                        <td style="text-align:center;">${unIn.sn}</td>
                                                        <td style="text-align:center;">${unIn.goodsName}</td>
                                                        <td style="text-align:center;">${unIn.factShortName}</td>
                                                        <td style="text-align:center;">${unIn.model}</td>
                                                        <td style="text-align:center;">${unIn.communicationType}</td>
                                                        <td style="text-align:center;">${unIn.signa}</td>
                                                        <td style="text-align:center;">${unIn.status}</td>
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
            
        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%@include file="../../layout/common.js.jsp"%>
        
</script>
</body>
</html>
