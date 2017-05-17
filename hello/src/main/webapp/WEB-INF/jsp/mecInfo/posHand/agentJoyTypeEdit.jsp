<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>
    <%@include file="../../layout/common.css.jsp"%>
</head>
<body class="no-skin ">
    <div class="main-container" id="main-container">
        <div class="main-content ">
            <div class="main-content-inner ">
                <div class="page-content ">
                    <div class="row" >
                        <div class=" widget-container-col ui-sortable  "  >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        代理商欢乐送类型管理
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/agentJoyType/saveEdit.do" id="searchForm" method="post" >
                                                <div class=" col-xs-12">
                                                	<input type="hidden" name="entry" value="${entry }"/>
	                                                <c:if test="${entry=='1' }">
	                                                    <div class="form-group form-group-sm width-300px ">
															<label class="col-sm-3 control-label  widget-color-normal5 width-100px ">机构编号:</label>
															<div class="col-sm-5 no-padding">
																<input type="text" name="orgUuid" id="orgUuid" value="${agentJoyType.orgUuid}" 
																	class="form-control input-small width-200px" data-placement="bottom" readonly="readonly">
															</div>
														</div>
														<div class="form-group form-group-sm width-300px ">
															<label class="col-sm-3 control-label  widget-color-normal5 width-100px ">机构名称:</label>
															<div class="col-sm-5 no-padding">
																<input type="text" name="orgNm" id="orgNm" value="${agentJoyType.orgNm}" 
																	class="form-control input-small width-200px" data-placement="bottom" readonly="readonly">
															</div>
														</div>
													</c:if>
													<c:if test="${entry=='2' }">
														<div hidden="hidden">
															<c:forEach items="${agentJoyType.orgUuids}" var="orgUuids">
																<input type="hidden" value="${orgUuids}" name ="orgUuids">
															</c:forEach>
														</div>
													</c:if>
													<br/><br/>
													<div class="form-group form-group-sm width-300px">
														<label for="form-field-6"
															class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-right">欢乐送类型:</label>
														<div class="col-sm-8  no-padding">
															<table style="width: 600px; height: 100px;">
																<c:forEach items="${joyTypeList}" var="de"
																	varStatus="status">
																	<tr>
																		<td><input type="checkbox" class="ace " id="joyType" name="joyType" value="${de.typeName}"
																			<c:if test="${fn:contains(agentJoyType.joyType,de.typeName)}">checked="checked"</c:if>>
																			<span class="lbl middle"></span></td>
																		<td>${de.typeName}:</td>
																		<td>${de.typeDes}</td>
																	</tr>
																</c:forEach>
															</table>
														</div>
													</div>
												</div>
                                                <div class="form-actions center widget-color-normal5">
													<button class="btn btn-danger btn-sm" type="submit" onclick="return notice()" name="savebtn"  id="savebtn" style="margin-top: 30px">
														<span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
														确认开通
													</button>
													<button class="btn btn-default btn-sm" type="button" style="margin-top: 30px" onclick="closeWindow();">
														<span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
														取消
													</button>
												</div>
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
    </div>

    <%@include file="../../layout/common.alljs.jsp"%>
    <script type="text/javascript">
	    $('.chosen-select').chosen({});
	    function closeWindow(){
			window.parent.$.fancybox.close();
		}
	    
	    function notice(){
	    	var type=0;
	    	$('input[type=checkbox]').each(function(){
	    		if($(this).prop('checked')){
	    			type += 1;
	    		}
			});
	    	if(type==0){
	    		if(confirm("您未选择欢乐送类型，是否确认此操作？")){
	    			return true;
	    		}else{
	    			return false;
	    		}
	    	}else{
	    		return true;
	    	}
	    }
	</script>
</body>
</html>











