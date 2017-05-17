<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>
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
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">

                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        风险线索详情
                                    </h5>
                                    <span class="widget-toolbar">
                                        <a data-action="collapse" href="#">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>
                                    </span>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath() %>/riskClueProvide/show.do" id="showForm" method="post">
                                            	<input type="hidden" id="id" name="id" value="${riskClueProvide.id }">
                                                <div class=" col-sm-12">
                                                	<h3 class="header smaller lighter green">风险线索详情</h3>
                                                	<div class="form-group form-group-sm width-300px">
                                                        <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><span style="color: red;">*</span>标题:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                        	<label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${riskClueProvide.title}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >提出时间:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='createTime' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${riskClueProvide.createTime }" type="time" pattern="yyyy-MM-dd HH:mm:ss"/></label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >提出人:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${riskClueProvide.userName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm " style="width: 100%">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  ><span style="color: red;">*</span>内容:</label>
                                                        <div class=" no-padding"  >
                                                            <textarea name="content" id="content" style='height:60px;width:80%;' disabled="disabled" data-placement="bottom" data-trigger="hover" data-rel="popover">${riskClueProvide.content}</textarea>
                                                        </div>
                                                    </div>
                                                    
                                                    <br/>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >附件:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<c:if test="${null != riskClueProvide.fileName && riskClueProvide.fileName != ''}">
                                                        		<a href="/riskClueProvide/downFile.do?id=${riskClueProvide.id}" class="blue" id="fileName" >
                                                            	<i class="ace-icon fa fa-arrow-circle-o-down blue bigger-130"><font size="2">${riskClueProvide.fileName}</font></i>
                                                        	</a></c:if>
                                                        </div>
                                                    </div>
                                                    <br/>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" ><span style="color: red;">*</span>联系人:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${riskClueProvide.linkman}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" ><span style="color: red;">*</span>联系方式:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${riskClueProvide.contactTel}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >归属分公司:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${riskClueProvide.belongTo}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >一级代理商:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${riskClueProvide.firstMerchant}</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:if test="${riskClueProvide.clueStatus != 1}">
                                                <div class="col-sm-12">
                                                    <h3 class="header smaller lighter green">审核</h3>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >核实时间:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        <label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" id='createTime' data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    ><fmt:formatDate value="${riskClueProvide.checkTime }" type="time" pattern="yyyy-MM-dd HH:mm:ss"/></label>
                                                     	</div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >核实人:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >${riskClueProvide.empName}</label>
                                                        </div>
                                                    </div>
                                                  	</br>
                                                    <div class="form-group form-group-sm  width-300px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >反馈意见:</label>
                                                        <div class="col-sm-8  no-padding">
                                                        	<label class="form-control input-small width-200px   view-control  "
                                                                                   data-content="" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                                    >
                                                            <c:if test="${riskClueProvide.clueStatus == 1}">待核实</c:if>
                                                            <c:if test="${riskClueProvide.clueStatus == 2}">已采纳</c:if>
                                                            <c:if test="${riskClueProvide.clueStatus == 3}">已忽略</c:if>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    </br>
                                                    <div class="form-group form-group-sm " style="width: 100%">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >备注:</label>
                                                        <div class=" no-padding" >
                                                            <textarea name="remark" id="remark" style="height:100px;width:80%;" data-placement="bottom" disabled="disabled" data-trigger="hover" data-rel="popover">${riskClueProvide.remark}</textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                </c:if>
                                              <div class="form-actions center widget-color-normal5">

                                                    <button class="btn  btn-sm" type="button"  onclick="closeWin()">
                                                        <span class="ace-icon fa fa-power-off  icon-on-right bigger-110"></span>
                                                        关闭
                                                    </button>
                                                </div>
                                            </form>
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
    <!-- inline scripts related to this page -->
    <script type="text/javascript">
    
    function closeWin(){
    	parent.$.fancybox.close();
    }
   
    function reloadParent(){
       document.getElementById("searchForm").submit();
    }
       
</script>
</body>
</html>