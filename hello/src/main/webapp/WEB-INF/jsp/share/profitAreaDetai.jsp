<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
     <%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.jsp"%>
         <script src="<%=request.getContextPath() %>/js/common/common.js"></script>
</head>
<body class="no-skin ">
    <div class="main-container" id="main-container">
        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        地区分润设置
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="list.html">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >地区:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text"  name=""   readonly="readonly" value="${areaNm}">
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:forEach items="${profitArea }" var="lv">
                                                   <div class="col-sm-12">
                                                    <h5 class="header smaller lighter green">${lv.levelName }</h5>
													<div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >金额下限:</label>
                                                         <div class="col-sm-8  no-padding"  >
                                                               <input type="text"    name="lowMoney" readonly="readonly" value="${lv.lowMoney}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >金额上限:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text"  name="upMoney"   readonly="readonly" value="${lv.upMoneyView }">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >分润比例:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text"  name=""   readonly="readonly" value="${lv.scaleStr}">
                                                        </div>
                                                    </div>
                                                  </div>
                                                </c:forEach>
                                                <div class="row"></div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>
    <%@include file="../layout/common.js.jsp"%>
</body>
</html>











