<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付</title> 
    <%@include file="../layout/common.css.jsp"%>
    <!-- 图片预览css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/viewer/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/viewer/assets/css/viewer.min.css">
</head>

<body class="no-skin " >
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
			     	MPOS商户二级认证审核信息
			    </h5>
			
			</div>
			
	<div class="widget-body">
	    <div class="widget-main no-padding ">
	        <div class="widget-main ">
   	<form id="formA" class="form-inline form-horizontal" action="<%=request.getContextPath() %>/mposMercIncomeList/submitAuthTwo.do" method="post" target="_blank">
       <div class="col-sm-12">
		<input type="hidden" id="ctxPath" name="ctxPath" value="<%=request.getContextPath() %>"/>
		<input type="hidden" name="checkIdCardR" id="checkIdCardR" value="0">
		<input type="hidden" value="" name="checkCard" id="checkCard" />
		<input type="hidden" value="${flowNo }" name="flowNo" id="flowNo" />
		<input type="hidden" name="version" id="version" value="${version }"/>
		<input type="hidden" name="bussinessName" id="bussinessName" value="${mposCheck.userName }"/>
       <h3 class="header smaller lighter green">基本信息</h3>
       <div class="form-group form-group-sm  width-300px">

           <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户编号:</label>
           <div class="col-sm-8  no-padding">
               <input type="text" name="inMno" id="inMno" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="${mposCheck.inMno }"  >
           </div>
       </div>
       <div class="form-group form-group-sm width-300px">
           <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册时间:</label>

           <div class="col-sm-8  no-padding"  >
               <input type="text" name="dtCte" id="dtCte" class="form-control input-small width-200px " disabled="disabled"    title=""  value="${mposCheck.dtCte} ${mposCheck.tmCte}" />
           </div>
       </div>
      
       <div class="form-group form-group-sm width-300px">
           <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >手机号:</label>

           <div class="col-sm-8  no-padding "  >
               <input type="text" name="mercOprMbl" id="mercOprMbl" class="form-control input-small width-200px  " disabled="disabled" title="" value="${mposCheck.mercOprMbl }"  >
           </div>
       </div>
       <div class="form-group form-group-sm  width-300px">

        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户来源:</label>
           <div class="col-sm-8  no-padding">
               <input type="text" name="mobileSource" id="mobileSource" class="form-control input-small width-200px  " disabled="disabled" title="" 
               <c:choose>
	           	<c:when test="${mposCheck.mobileSource == '01'}">value = "手刷商户"</c:when>
	           	<c:when test="${mposCheck.mobileSource == '02'}">value = "mPos商户"</c:when>
	           	</c:choose>
               />
           </div>
       </div>  
       <div class="form-group form-group-sm width-300px">
           <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >认证等级:</label>

           <div class="col-sm-8  no-padding "  >
               <input type="text" name="flowType" id="flowType" class="form-control input-small width-200px  " disabled="disabled" title="" value="二级"  >
           </div>
       </div>                                                            
       
   </div>                             
      <div class="col-sm-12">
          <h3 class="header smaller lighter green">申请上传信息</h3>
          <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
              <thead class="thin-border-bottom">
                  <tr>
                      <th>结算人身份证号</th>
                      <th>结算人姓名</th>
                      <th>结算人电子签名图片</th>
                      <th>结算人身份证照片</th>
                      <th>操作</th>
                      <th>结算人公安验证结果</th>
                  </tr>
              </thead>
              <tbody>
	              <tr class="docs-pictures">
	              <td style="border:1px solid  #969696;" id = "idCard">${mposCheck.idCardNo }</td>
		          <td style="border:1px solid  #969696;" id = "name">${mposCheck.userName }</td>
	              <td style="border:1px solid  #969696;">
						<a href="#" class="menuitem"><img name='1' src="<%=request.getContextPath() %>/mposMercIncomeList/loadimg?pic=${mposCheck.authPath}" ></a>                                                       
		          </td>
		          <td style="border:1px solid  #969696;">
		              	<a href="#" class="menuitem"><img name='2' src="<%=request.getContextPath() %>/mposMercIncomeList/loadimg?pic=${mposCheck.frontPath}" ></a>
		              	<a href="#" class="menuitem"><img name='3' src="<%=request.getContextPath() %>/mposMercIncomeList/loadimg?pic=${mposCheck.backPath}" ></a>
		              	<a href="#" class="menuitem"><img name='4' src="<%=request.getContextPath() %>/mposMercIncomeList/loadimg?pic=${mposCheck.holdPath}" ></a>
		          </td>
		          <td style="border:1px solid  #969696;">
		              	<button class="btn btn-minier btn-purple" type="button" id="idCardButton" onclick="showIdCardImage()" >公安验证</button>
		          </td>
	              <td style="border:1px solid  #969696;">
	              		<a href="#" class="menuitem" id='checkIdCard' style="display:none ">
							<img name="8" >
						</a>
		          </td>
	              </tr>
              </tbody>
        </table>
            </div>
            <div class="col-sm-12">
                <h3 class="header smaller lighter green">审核历史</h3>
                <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable" style="table-layout: fixed;">
					<thead class="thin-border-bottom">
						<tr>
							<th style="text-align:center;width: 5%">申请次数</th>
							<th style="text-align:center;width: 15%">审核时间</th>
							<th style="text-align:center;width: 10%">审核人</th>
							<th style="text-align:center;width: 40%">驳回原因</th>
							<th style="text-align:center;width: 30%">会签意见</th>
						</tr>
					</thead>
					<c:set var="queryFlowHisSize" value="${fn:length(queryFlowHis)}"/>
					<c:forEach items="${queryFlowHis }" var="queryFlowHis" varStatus="s">
			            <tr >
			                <td style="text-align:center;border:1px solid  #969696;">${queryFlowHisSize- s.index}</td>
			                <td style="text-align:center;border:1px solid  #969696;">${queryFlowHis.checkDate }</td>
			                <td style="text-align:center;border:1px solid  #969696;">${queryFlowHis.checkName }</td>
							<td style="border:1px solid  #969696;">${queryFlowHis.backRemark}</td>
			                <td style="border:1px solid  #969696;">${queryFlowHis.talkRemark }</td> 
			            </tr>
			        </c:forEach>
				</table>
            </div>
			<h3 class="header smaller lighter green">审核信息</h3>
			<table>
				<div>
					<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">资料不合格:</label>
					<div id="dataNotQualified"></div>
				</div>
				<br />
				<div>
					<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">资料缺失:</label>
					<div id="dataMissing"></div>
				</div>
				<br />
				<div>
					<label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">信息有误:</label>
					<div id="inputError"></div>
				</div>
			</table>
			
			<br />
			<br />
			<table class=" table table-condensed">
				<tr>
					<td>会签意见：</td>
					<td><textarea  rows="10" cols="100" id="remark" name="remark">${remark }</textarea>
					</td>
				</tr>
			</table>
		
		
		<br/><br/><br/>
        <div class="form-actions center widget-color-normal5">
        	<button class="btn btn-danger btn-sm" type="button" id="btnCommit" onclick="checkCommit('2')">
            <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                      审核通过                                                                                                
         	</button>
         
        <button class="btn btn-default btn-sm"  type="button" onclick="closeWin()">
        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
         	 关闭
        </button>
        	<button  class="btn btn-danger btn-sm" type="button" id="btnCommit" onclick="checkCommit('3')">
           <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                      审核驳回                                                                                                
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

    <%@include file="../layout/common.alljs.jsp"%>
<!-- inline scripts related to this page -->
<script type="text/javascript" src="../../../js/jquery.rotate.min.js"></script>
<!-- 图片预览js -->
<script src="${ctx}/js/viewer/dist/viewer.js"></script>
<script src="${ctx}/js/viewer/main.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
	    //动态获取驳回原因
		var useType="06";
		//填写上审核登记信息（首先先清空里面的信息）
		//填写上审核登记信息（首先先清空里面的信息）
		$("#dataMissing").find("option").remove();
		$("#dataNotQualified").find("option").remove();
		$("#inputError").find("option").remove();
		$.ajax({
		    cache: true,
		    type: "POST",
		    url:"/enregisterInfo/getOpenEnregisterInfoRule?useType="+useType,
		    async: false,
		    success: function(data) {
	    		var dataMissing='';
	    		var dataNotQualified='';
	    		var inputError='';
	    		var businessLicence='';
	    		var j=0;
	    		var l=0;
	    		var m=0;
	    		var n=0;
	    		var tr= "<tr>";
				var tr2= "</tr>";
		    	jQuery.each(data, function(i,item){
		    		if(item.bigItems=='26'){
		    			j++;
		    			if(j%4==1){
		    				dataNotQualified += tr+'<td width="300px"><label><input type="checkbox" name="remark2" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
		    			}else if(j%4==0){
		    				dataNotQualified += '<td width="300px"><label><input type="checkbox" name="remark2" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
		    			}else{
		    				dataNotQualified += '<td width="300px"><label><input type="checkbox" name="remark2" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
		    			}
		    		}else if(item.bigItems=='27'){
		    			l++;
		    			if(l%4==1){
		    				dataMissing += tr+'<td width="300px"><label><input type="checkbox" name="remark2" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
		    			}else if(l%4==0){
		    				dataMissing += '<td width="300px"><label><input type="checkbox" name="remark2" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
		    			}else{
		    				dataMissing += '<td width="300px"><label><input type="checkbox" name="remark2" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
		    			}
		    		}else if(item.bigItems=='28'){
		    			m++;
		    			if(m%4==1){
		    				inputError += tr+'<td width="300px"><label><input type="checkbox" name="remark2" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
		    			}else if(m%4==0){
		    				inputError += '<td width="300px"><label><input type="checkbox" name="remark2" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
		    			}else{
		    				inputError += '<td width="300px"><label><input type="checkbox" name="remark2" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
		    			}
		    		}
	            }); 
		    	if(j%4!=0){
		    		dataNotQualified +=tr2;
		    	}
		    	if(l%4!=0){
		    		dataMissing +=tr2;
		    	}
		    	if(m%4!=0){
		    		inputError +=tr2;
		    	}
		    	$("#dataNotQualified").html(dataNotQualified).trigger("chosen:updated");
		    	$("#dataMissing").html(dataMissing).trigger("chosen:updated");
		    	$("#inputError").html(inputError).trigger("chosen:updated");
		    }
		});
		$(".chosen-container-multi").attr("style","width: 220px;");
		
		checkIdCard();
		
		$('.menuitem img').animate({width: 80,height:48}, 0);
		$('.menuitem')
		.mouseout(function(){
				gridimage = $(this).find('img');
				gridimage.stop().animate({width: 80,height:48}, 60);}); 
	}); 
	</script>
    <script type="text/javascript">
    /* for(var i=1;i<=18;i++){
    	$("#"+i).attr('checked', true);;
    } */
    function getLen(obj){
    	var char = obj.replace(/[^\x00-\xff]/g, '**');
        return char.length;
    }
    function closeWin(){
    	parent.$.fancybox.close();
    }
    
    $('.chosen-select').chosen({});
   

    
    //-----------------------------------------
    
    //--审核信息提交-------------
     function checkCommit(checkResult){
    	if(checkResult==2){
    		if(!$("#idCardButton").attr("disabled")){
        		alert("请先进行身份校验!");
        		return;
        	}
    	}
    	var rebutReason=0;
    	var remark=$("#remark").val();
    	var rejectReason="";
        $("input[name='remark2']:checkbox").each(function(){ 
            if($(this).prop("checked")){
            	rejectReason += $(this).val()+",";
            	rebutReason += 1;
            }
        })
        if(checkResult=='2'){//审核通过
        	if(rebutReason !=0){
        		alert("审核结果为通过，驳回原因应为空!");
        		return;
        	}
        }
        if(checkResult=='3'){//审核驳回
        	if(rebutReason==0){
        		alert("审核结果为驳回，驳回原因不能为空!");
        		return;
        	}
        	
        }
    	 var flowNo = $("#flowNo").val();
    	 var inMno = $("#inMno").val();
    	 var version = $("#version").val();
    	 var bussinessName=$("#bussinessName").val();
    	/*  //逻辑变更：会签意见为必填
    	 if(checkRemark==""||checkRemark==null){
    		 alert("会签意见不得为空！");
    		 return;
    	 }  */
		 if(getLen(remark)>300){
			 alert("备注信息超长,请最多输入150个汉字!");
    		 return;
		 }
    	 $.ajax({
 			    	cache:true,
 			        type:"POST",
 			        url:'/mposMercIncomeList/submitAuthTwo.do',
 					data : {
 						flowNo:flowNo,
 						inMno:inMno,
 						currentStatus:checkResult,
 						remark2:remark,
 						remark:rejectReason,
 						version : version,
 						bussinessName:bussinessName
 					},
 					async : false,
 					error : function(data) {
 						alert(data.message);
 					},
 					success : function(data) {
 						alert(data.message);
 						parent.$.fancybox.close();
 					}
 				}); 
    	 
     }
    
    
     /**校验身份证信息*/
     function checkIdCard(){
        var name = $("#name").html();
     	var idCard = $("#idCard").html();
     	//显示等待验证
     	if(name == '' || idCard == ''){
     		$("#checkIdCard").html('公安验证不通过');
     	}
     	var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
         if(reg.test(idCard) === false){  
         	$("#checkIdCard").html('公安验证不通过');
     	}
         //encode 参数信息
         name =  encodeURI(name);
         name =  encodeURI(name);
         //先调用验证接口生成验证图片  然后填充验证图片
         var url = '<%=request.getContextPath() %>/mposMercIncomeList/checkIdCard?name='+name+'&idCard='+idCard+'&source='+2;
         $.ajax({ 
         	url:url, 
 			type: 'POST',
 			async:false,
 			success: function(data){
 				if(data == "1"){
 				}else{
 					$("#checkIdCard").html('公安验证不通过');
 				}
 	        }
         });
     }
     
     function showIdCardImage(){
    	 $("img[name='8']").attr('src','<%=request.getContextPath() %>/mposMercIncomeList/generateImage?idCard=${mposCheck.idCardNo }&name=${mposCheck.userName }');
    	 $("#checkIdCard").show();
    	 $("#idCardButton").attr("disabled","disabled");
     }
	
    function sleep(numberMillis) { 
    	   var now = new Date();
    	   var exitTime = now.getTime() + numberMillis;  
    	   while (true) { 
    	       now = new Date(); 
    	       if (now.getTime() > exitTime)    return;
    	    }
    	}
</script>
</body>
</html>