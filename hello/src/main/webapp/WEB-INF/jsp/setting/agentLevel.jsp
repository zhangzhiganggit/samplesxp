<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.css.jsp"%>
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
                            <div class="widget-box widget-color-normal3" >
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        查询条件
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


                                            <form class="form-inline form-horizontal" action="/org/searchAgentLever.do" method="post" id="searchForm">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="orgProp" value="${org.orgProp }">
												<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" name="total" value="${pageInfo.getTotal()}" >
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="agentNumber" value="${org.agentNumber }" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" onkeyup="this.value=this.value.replace(/\D/g,'')" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgUuid" value="${org.orgUuid }" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="orgNm" value="${org.orgNm }" class="form-control input-small width-200px " data-placement="bottom" title=""  id="form-field-6" data-rel="tooltip" data-original-title="Hello Tooltip!">
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经营城市:</label>

                                                        <div class="col-sm-8  no-padding">
															<select id="prov" name="prov"
																class="chosen-select form-control width-48"
																onchange="fillCitySelect('prov','cityCd','');">
																<option value="0">请选择省份</option>
																<c:forEach items="${provs }" var="prov">
																	<option value="${prov.areaId }">${prov.areaNm}</option>
																</c:forEach>
															</select> <select id="cityCd" name="cityCd"
																class="chosen-select form-control width-48">
																<option value="0">请选择城市</option>
															</select>

														</div>
                                                    </div>


                                                </div>

                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <%@include file="../common/resetForm.jsp"%>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        查询结果
                                    </h5>


                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table style="word-break:break-all; word-wrap:break-all; " class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th width="5%" >  代理商编号 </th>
                                                <th width="9%" >  机构编号 </th>
                                                <th width="12%" >  机构名称 </th>
                                                <th width="12%" >所属分公司</th>
                                                <th width="12%" >创建时间</th>
                                                <th width="7%" >状态</th>
                                                <th width="7%" >代理商等级</th>
                                                <th width="8%" >直属机构数量</th>
                                                <th width="8%" >直属部门数量</th>
                                                <th width="8%" >直属人员数量</th>
                                                <th   >操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach items="${orgList }" var="org">
                                            <tr>
                                                <td align="center">${org.agentNumber }</td>
                                                <td align="center">${org.orgUuid }</td>
                                                <td> ${org.orgNm } </td>
                                                <td >${org.branchAttributionName }</td>
                                                <td align="center">${org.dateCreatedStr }</td>
                                                <td align="center">${org.orgStsStr }</td>
                                                <td align="center" >${org.agentLeverStr }</td>
                                                <td align="right">${org.orgChildNum }</td>
                                                <td align="right" >${org.deptNum }</td>
                                                <td align="right" >${org.empNum }</td>
                                                <td  >
                                                    <div class="   action-buttons">
                                                        <a href="/org/getNextOrg.do?orgUuid=${org.orgUuid }" class="blue">直属机构</a>
                                                        <a href="/dept/list.do?orgUuid=${org.orgUuid }" class="blue">直属部门</a>
                                                        <a href="/employee/list.do?orgUuid=${org.orgUuid }&isFirstLoad=true" class="blue">直属人员</a>
                                                    </div>
                                                </td>
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
                                <label class="dataTables_info " id="dynamic-table_info" role="status" aria-live="polite"></label>
                            </div>
							<div class="col-sm-8 right">
								<%@include file="../layout/pagination.jsp" %>
							</div>

                        </div>
                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%@include file="../layout/common.alljs.jsp"%>
    <script type="text/javascript">
    function myResetForm(){
   	 	$("#prov").val('');
		$("#prov").trigger("chosen:updated");
		fillCitySelect('prov','cityCd','');
	}

    $(document).ready(function(){
    	if('${org.prov}' != ''){
    		$("#prov").val('${org.prov}');
    		$("#prov").trigger("chosen:updated");
    		fillCitySelect('prov','cityCd','');
    		$("#cityCd").val(${org.cityCd});
    		$("#cityCd").trigger("chosen:updated");
    	}
    })
        $('.chosen-select').chosen({});
</script>
</body>
</html>











