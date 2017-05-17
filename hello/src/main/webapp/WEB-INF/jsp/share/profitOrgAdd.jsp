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
                                        机构分润设置
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="list.html">
                                             <input type="hidden" name="minOrder" value="${minOrder }" id="minOrder">
                                             <input type="hidden" id="orgNo" name="orgNo" value="${orgNo}">
                                                <input type="hidden" name="maxOrder" value="${maxOrder }" id="maxOrder">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text"  name=""   readonly="readonly" value="${orgNm}">
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >激活个性设置:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                        <input type="hidden" name="switchFlag" id="switchFlag" value="${switchFlag }">
                                                            <input type="checkbox"
                                                            class="ace ace-switch ace-switch-6 btn-flat"
                                                            name="switch-field-1" value="${switchFlag }" 
                                                            <c:if test="${switchFlag == 1 }">checked</c:if>
                                                            onchange="switchFunc();"><span class="lbl">&nbsp;</span>
                                                        </div>
                                                        
                                                    </div>
                                                    
                                                </div>
                                                <c:forEach items="${levelList }" var="lv">
                                                 <input type="hidden" id="levelId" name="levelId" value="${lv.levelId }">
                                                   <div class="col-sm-12">

                                                    <h5 class="header smaller lighter green">${lv.levelName }</h5>

                                           <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >金额下限:</label>

                                                         <div class="col-sm-8  no-padding"  >
                                                            <c:if test="${lv.levelOrder==lv.minOrder }">
                                                               <input type="text" id="low_${lv.levelOrder}"  name="lowMoney" readonly="readonly" value="0">
                                                            </c:if>
                                                           <c:if test="${lv.levelOrder!=lv.minOrder }">
                                                               <input type="text" id="low_${lv.levelOrder}" name="lowMoney" value=${lv.lowMoney}  readonly="readonly" class="numberFormat">
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >金额上限:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                             <c:if test="${lv.levelOrder==lv.maxOrder }">
                                                            <input type="text" id="up_${lv.levelOrder}" name="upMoney"  readonly="readonly" value="无限制">
                                                           </c:if>
                                                           <c:if test="${lv.levelOrder!=lv.maxOrder }">
                                                            <input type="text" id="up_${lv.levelOrder}" name="upMoney" readonly="readonly" value="${lv.upMoney}" onblur="setLowMoney('${lv.levelOrder}')" onchange="setLowMoney('${lv.levelOrder}')" class="numberFormat">
                                                           </c:if>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >分润比例:</label>

                                                        <div class="col-sm-4  no-padding"  >
                                                            <%-- <label class="form-control input-small width-200px   view-control  "  >${lv.scaleStr}</label> --%>
                                                            <input type="text"  name=""   readonly="readonly" value="${lv.scaleStr}">
                                                        </div>
                                                    </div>
                                                  </div>
                                                </c:forEach>
                                                <div class="row"></div>
                                               <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="button" onclick="addArea();">
                                                        <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
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
    function setLowMoney(order){
     var id = "up_"+order;
     var upMoney = $("#"+id).val();
    // var ex=/^\+?[1-9][0-9]*$/;
     var ex = /^([1-9]{1}[0-9]{0,2}(\,[0-9]{3})*(\.[0-9]{0,2})?|[1-9]{1}\d*(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|(\.[0-9]{1,2})?)$/;
     var x = ex.test(upMoney);
     if(x){}else{
    	 alert("请填写大于0的整数");
    	 $("#"+id).val("");
	     return;
     }
     
     
     var i = parseInt(upMoney.replace(/,/g,''));
	 if (isNaN(i))
	   {
	      alert('请填写大于0的整数');
	      $("#"+id).val("");
	      return;
	   }
	 
	 var lowID = "low_"+order;
	 var lowMoney = $("#"+lowID).val();
	 var f = parseInt(lowMoney);
	 if(i<f){
		 alert('上限金额不能低于下限金额');
	      $("#"+id).val("");
	      return;
	 }
	 
     var j = parseInt(order);
     j=j+1;
     var upId = "low_"+j;
     $("#"+upId).val(i+1);
   }
   
    
   String.prototype.trim=function() {  
	    return this.replace(/(^\s*)|(\s*$)/g,'');  
	};  
	
	
		 function t(){
			 var ex = /^(100|[1-9]?\d(\.\d)?)$/;
			 var x = ex.test(document.getElementById("c").value);
			 var r = x?"匹配":"不匹配";
			 alert(r);
			 }
	
   
   function sub(){
	   var maxOrder = $("#maxOrder").val();
	   alert(maxOrder)
	   var minOrder = $("#minOrder").val();
	   var min = parseInt(minOrder);
	   var max = parseInt(maxOrder);
	   for (var i=min;i<=max;i++)
	   {
	      var lowMoney = $("#low_"+i).val();
	      var upMoney = $("#up_"+i).val();
	      if(lowMoney==""||lowMoney==null||lowMoney==undefined ||upMoney==""||upMoney==null||upMoney==undefined){
	    	 alert("上限金额或者下限金额不能为空");
	    	 return false;
	      }
	      var m = i+1;
	      var upMoneyB = $("#up_"+m).val();
	      var upint=parseInt(upMoney);
	      var upintb=parseInt(upMoneyB);
	      if(upintb<upint){
	    	  alert("等级"+m+"的上限金额不能低于等级"+i+"的上限金额");
	    	  return;
	      }
	      
	   }
	   return true;
   }
   
   
   
   function addArea(){
	    var maxOrder = $("#maxOrder").val();
	   var minOrder = $("#minOrder").val();
	   var min = parseInt(minOrder);
	   var max = parseInt(maxOrder);
	   for (var i=min;i<=max;i++)
	   {
	      var lowMoney = $("#low_"+i).val();
	      var upMoney = $("#up_"+i).val();
	      if(lowMoney==""||lowMoney==null||lowMoney==undefined ||upMoney==""||upMoney==null||upMoney==undefined){
	    	 alert("上限金额或者下限金额不能为空");
	    	 return ;
	      }
	      
	      var m = i+1;
	      var upMoneyB = $("#up_"+m).val();
	      var upmint = parseInt(upMoney.replace(/,/g,''));
	      var upmintb ;
	      if(upMoneyB != "无限制" && typeof(upMoneyB) != "undefined") {
	    	  var upmintb = parseInt(upMoneyB.replace(/,/g,''));
	      } else {
	    	  var upmintb = parseInt(upMoneyB);
	      }
	     
	      if(upmintb<upmint){
	    	  alert("等级"+m+"的上线金额不能低于等级"+i+"的上限金额");
	    	  return;
	      }
	      var lowint = parseInt(lowMoney.replace(/,/g,''));
	      if(upmint<=lowint){
	    	  alert("等级"+i+"的上线金额必须大于等级"+i+"的下限金额");
	    	  return;
	      }
	      
	   } 
	   
			$.ajax({
			    	cache: true,
			        type: "POST",
			        url:'/profitArea/addOrg',
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




	<script type="text/javascript">
		function switchFunc() {
			$("#switchFlag").val($("input[name='switch-field-1']").prop("checked") ? 1 : 0);
			//激活时金额可修改，未激活时不可修改
			if($("#switchFlag").val()=='1') {
				var maxOrder = $("#maxOrder").val();
				var minOrder = $("#minOrder").val();
				var min = parseInt(minOrder);
				var max = parseInt(maxOrder);
				for (var i=min;i<max;i++) {
					$("#up_"+i).removeAttr("readonly");
				}
			} else {
				var maxOrder = $("#maxOrder").val();
				var minOrder = $("#minOrder").val();
				var min = parseInt(minOrder);
				var max = parseInt(maxOrder);
				for (var i=min;i<max;i++) {
					//不可修改时金额设置为默认
					$("#up_"+i).val(i+"00,000,000");
					$("#up_"+i).attr("readOnly",true);
				}
			}
		}
	</script>
</body>
</html>











