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
                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        分润等级修改
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="list.html">
                                                <input type="hidden" value="${profitLevel.levelId }" id="levelId" name="levelId">
                                                <input type="hidden" id="lastValue" name="lastValue" value="${lastValue}">
                                                <input type="hidden" id="nextValue" name="nextValue" value="${nextValue}">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >名称*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" name="levelName" value="${profitLevel.levelName }"  data-placement="bottom" title=""   >
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >比例*:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" id="scaleStr" name="scaleStr" value="${profitLevel.scaleStr }" 
                                                               data-placement="bottom" title=""   > <font color="red" size="2">%</font>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="button" onclick="editLevel()">
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
    function editLevel(){
     	var lastValue = $("#lastValue").val();
    	var nextValue = $("#nextValue").val();
    	var scaleStrs = $("#scaleStr").val();
    	if(scaleStrs==null||scaleStrs==''){
    		alert("分润比例不能为空");
			return;
    	}
		var scale = scaleStrs*1;
    	if(lastValue!=null&&lastValue!=''&&lastValue!=undefined){
    		var last = lastValue*1;
    		if(scale<=lastValue){
    			alert("不能低于等于上级分润比例");
    			return;
    		}
    	}
    	if(nextValue!=null&&nextValue!=''&&nextValue!=undefined){
    		var next = nextValue*1;
    		if(scale>=next){
    			alert("不能高于等于下级分润比例");
    			return;
    		}
    	} 
    	
		$.ajax({
		    	cache: true,
		        type: "POST",
		        url:'/profitLevel/editLevel.do',
				data : $('#searchForm').serialize(),// 你的formid
				async : false,
				error : function(data) {
					alert(data.msg);
				},
				success : function(data) {
					alert(data.msg);
					if(data.msgCode=='00'){
						parent.$.fancybox.close();
					}
				}
		});
    }
</script>
</body>
</html>











