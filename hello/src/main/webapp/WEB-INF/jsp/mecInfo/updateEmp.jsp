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

        <%@include file="../layout/menu.jsp"%>
        <div class="main-content ">
            <div class="main-content-inner ">

                <div class="page-content ">

                    <div class="row" >

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        修改关联
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="list.html">
                                            
                                                <div class=" col-xs-12">

                                                    <h4>将下列商户的销售员修改为：</h4>

                                                </div>
                                                <div class="col-sm-12">

                                                    <div class="form-group form-group-sm  width-300px ">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >所属机构:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select data-placeholder="请选择" id="checkedOrg"  onchange="getEmp()" class="chosen-select form-control width-200px">
                                                                <option value="">请选择</option>
                                                                <c:forEach items="${orgList }" var="org">
                                                                	<option value="${org.orgUuid }">${org.orgNm }</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>


                                                    <div class="form-group form-group-sm  width-300px  " style="padding-left: 20px">

                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >销售人员:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <select data-placeholder="请选择" id="checkedEmp" class="chosen-select form-control width-200px">
                                                                
                                                            </select>
                                                        </div>
                                                    </div>


                                                </div>
                                                <div class="col-sm-12">
                                                    <table class="table">
                                                        <tr>
                                                            <th>商编</th>
                                                            <th>商户名称</th>
                                                            <th>联系人</th>
                                                            <th>原所属销售</th>
                                                            <th>开通日期</th>
                                                            <th>商户状态</th>
                                                        </tr>
                                                        
                                                        
                                                        <c:forEach items="${mecList }" var="mec">
	                                                        <tr>
	                                                            <td align="center">${mec.mno }</td>
	                                                            <td>${mec.cprRegNmCn }</td>
	                                                            <td>${mec.contNmCn }</td>
	                                                            <td>${mec.empNm }</td>
	                                                            <td align="center">${mec.signDtStr }</td>
	                                                            <td align="center">${mec.mercStss }</td>
	                                                        </tr>
                                                        </c:forEach>

                                                    </table>
                                                </div>


                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="button" onclick="updateEmp()">
                                                        <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                                        修改
                                                    </button>
                                                    <button class="btn btn-default btn-sm" type="button" onclick="window.parent.$.fancybox.close();">
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
                                                        关闭
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
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->

<!-- basic scripts -->

    <%@include file="../layout/common.alljs.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">
    function getEmp(){
    	var orgUuid = $("#checkedOrg").val();
    	if(orgUuid!=""){
    		$.ajax({
		    	cache: true,
		        type: "POST",
		        url:'<%=request.getContextPath() %>/employee/getEmp.do',
				data : {
					"orgUuid":orgUuid
				},// 你的formid
				async : false,
				error : function(data) {
					alert("提交失败");
				},
				success : function(data) {
					var options = "<option value=''>请选择</option>";
		             for(var i=0;i<data.length;i++){
	            		 options+="<option value=\""+data[i].userCode+"\">"+data[i].remarkName+"</option>";
		             }
		             $("#checkedEmp").html(options);
		             $("#checkedEmp").trigger("chosen:updated");
				}
			});
    	}else{
    		var options = "<option selected value='请选择'>请选择</option>";
    		$("#checkedEmp").html(options);
            $("#checkedEmp").trigger("chosen:updated");
    	}
    }
function updateEmp(){
	$.ajax({
    	cache: true,
        type: "POST",
        url:'<%=request.getContextPath() %>/mecIf/saveEmp.do',
		data : {
			mecIf:'${mecIf}',
			org:$("#checkedOrg").val(),
			emp:$("#checkedEmp").val()
		},// 你的formid
		async : false,
		error : function(data) {
			alert("提交失败");
		},
		success : function(data) {
			data = eval("(" + data + ")")
			if (data.result == 1) {
				alert(data.message);
				window.parent.$.fancybox.close();
				window.parent.location.href="<%=request.getContextPath() %>/mecIf/listSearch.do?isFirstLoad=false"
			} else {
				alert(data.message);
				$("#addButton").attr("class","btn btn-danger btn-sm")
				document.getElementById("addButton").disabled = undefined;
			}
		}
	});
}

    $('.chosen-select').chosen({});
    
</script>
</body>
</html>











