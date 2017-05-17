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
                <div id="breadcrumbs" class="breadcrumbs">
                    <script type="text/javascript">
                        try{
                            ace.settings.check('breadcrumbs' , 'fixed');
                            ace.settings.breadcrumbs_fixed(null, true);

                        }catch(e){}
                    </script>
                    <ul class="breadcrumb">
                        <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="#">Home</a>
                        </li>
                        <li>
                            <a href="#">分润管理</a>
                        </li>
                        <li class="active">分润考核设置</li>
                    </ul>
                </div>
                <div class="page-content ">

                    <div class="row" >

                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        分润考核设置
                                    </h5>

                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="<%=request.getContextPath()%>/agentExam/addAgentExam.do">
                                              <input type="hidden" id="orgUuid" name="orgUuid" value="${org.orgUuid }">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构编号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                    data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgUuid }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgNm }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >代理商等级:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                    data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.agentLeverStr }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >经营城市:</label>

                                                        <div class="col-sm-8  no-padding width-85"  >
                                                            <label class="form-control input-small width-100   view-control  "
                                                                   data-content="${listName}" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${listName}</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >分润折扣(%):</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" min="0" id="checkDiscount"  name="checkDiscount" value="${org.checkDiscount }"  class="form-control input-small width-200px " data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>

                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >分润折扣(元):</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text"  id="checkCut"  name="checkCut"  value="${org.checkCut }"   class="form-control input-small width-200px numberPointFormat" data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="button" onclick="subform()">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        保存
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
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>
    <%@include file="../layout/common.js.jsp"%>
    <script type="text/javascript">
 function amount(){
	    var ss = $("#checkDiscount").val();
    	var reg = /(^\d{1,2}(\.\d{1})?$)|(^\d{1,2}\.$)/g ;
    	if(!reg.test(ss)){
    		$("#checkDiscount").val('');
    	}
    }
 function bbb(){
	 var ss = $("#checkDiscount").val();
 	var reg = /(^\d{1,2}(\.\d{1})?$)|(^\d{1,2}\.$)/g ;
 	if(!reg.test(ss)){
 		$("#checkDiscount").val('');
 	}
 }
 
 function amountb(){
	 //以下是验证整数的正则
	 var checkCut=$("#checkCut").val();
    var reg =/^(\+|-)?\d{0,9}?$/ ;
     if(!reg.test(checkCut)){
    	 $("#checkCut").val('');
 	}
 }
 
 window.setInterval("amount()",100)
 window.setInterval("amountb()",100)

    function subform(){
	   var ss =  $("#checkCut").val();
	   if(ss=='+'||ss=='-'){
		   $("#checkCut").val('');
	   }
    	$.ajax({
			    	cache: true,
			        type: "POST",
			        url:'<%=request.getContextPath()%>/agentExam/addAgentExam.do',
					data : $('#searchForm').serialize(),// 你的formid
					async : false,
					error : function(data) {
						alert(data.msg);
					},
					success : function(data) {
						alert(data.msg);
						parent.$.fancybox.close();
					}
				});
    }

</script>
</body>
</html>











