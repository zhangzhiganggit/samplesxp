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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/contextmenu/jquery.contextmenu.css">
    
	<style type="text/css">
		.suspend{
			position: fixed;
			left:25%;
			top:19%; 
			width:"550px";
			height:"400px";
		}
		.buttonsDiv{
			position: fixed; 
			left:25%; 
			top:0;
			width:550px;
			background-color:#CDCDCD;
			z-index: 9999;
		}
		#imgDiv{
			background-color:white;
		}
	</style>
</head>

<body class="no-skin " >
    <div class="main-container" id="main-container">
    	<script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>

        <div class="main-content ">
            <div class="main-content-inner ">

             <div class="page-content ">

            <div class="row" >

			<div class=" widget-container-col ui-sortable"   >
			    <div class="widget-box widget-color-normal3" style="opacity: 1;">
			<div class="widget-header">
			    <h5 class="widget-title bigger lighter">
			        <i class="ace-icon fa fa-table"></i>
			     	二代手刷实名认证信息
			    </h5>
			
			</div>
			
	<div class="widget-body">
	    <div class="widget-main no-padding ">
	        <div class="widget-main ">
   	<form id="formA" class="form-inline form-horizontal" action="<%=request.getContextPath() %>/mobMercAuthAdmin/realNamCheckCommit" method="post" target="_blank">
       <div class="col-sm-12">
		<input type="hidden" name="countRole" id="countRole" value="0"> <!--记录行数 增加减少-->
		<input type="hidden" name="countRole" id="onlyForAdd" value="0"> <!--作为ID使用 ，只增加不减少-->
		<input type="hidden" name="rolerowOneFlag" id="rolerowOneFlag" value="0"> <!--第一行flag-->
		<input type="hidden" name="posApplyTotalContInt" id="posApplyTotalContInt" value="${posNum.unInstall}">
		<input type="hidden" name="installGprs" id="installGprs" value="${installGprs}" ><!-- 是否安装无线   -->
		<input type="hidden" name="mercOldId" id="mercOldId" value="${mercSn}" ><!-- 老商编   -->
		<input type="hidden" id="ctxPath" name="ctxPath" value="<%=request.getContextPath() %>"/>
		<input type="hidden" name="checkIdCardR" id="checkIdCardR" value="0">
		<input type="hidden" name="mercT0Flag" id="mercT0Flag" value="${mercT0Flag}" >
		<input type="hidden" value="" name="checkCard" id="checkCard" />
       <h3 class="header smaller lighter green">基本信息</h3>
       <div class="form-group form-group-sm width-300px">
           <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册时间:</label>

           <div class="col-sm-8  no-padding"  >
               <input type="text" name="mercId" id="mercId" class="form-control input-small width-200px " disabled="disabled"    title=""  value="${mobMercAuthList[0].creteDte}" />
           </div>
       </div>
       <div class="form-group form-group-sm  width-300px">

        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户类型:</label>
           <div class="col-sm-8  no-padding">
               <input type="text" name="mercAbbr" id="mercAbbr" class="form-control input-small width-200px  " disabled="disabled" title="" 
               <c:choose>
	           	<c:when test="${mobMercAuthList[0].authStatus == '01'}">value = "实名认证商户"</c:when>
	           	<c:when test="${mobMercAuthList[0].authStatus == '02'}">value = "实名认证驳回商户"</c:when>
	           	<c:when test="${mobMercAuthList[0].authStatus == '00'}">value = "未实名认证商户"</c:when>
	           	</c:choose>
               />
           	
           </div>
       </div>
       
       <div class="form-group form-group-sm  width-300px">

           <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户编号:</label>
           <div class="col-sm-8  no-padding">
               <input type="text" name="mno" id="mno" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="${mobMercAuthList[0].mno }"  >
               <input type="hidden" name="uuid" id="uuid" value="${mobMercAuthList[0].uuid }">
               <input type="hidden" name="inMno" id="inMno" value="${mobMercAuthList[0].inMno }">
           </div>
       </div>
       <div class="form-group form-group-sm width-300px">
           <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >手机号:</label>

           <div class="col-sm-8  no-padding "  >
               <input type="text" name="busAddr" id="busAddr" class="form-control input-small width-200px  " disabled="disabled" title="" value="${mobMercAuthList[0].telNO }"  >
           </div>
       </div>
       <div class="form-group form-group-sm  width-300px">

        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户来源:</label>
           <div class="col-sm-8  no-padding">
               <input type="text" name="mobileSource" id="mobileSource" class="form-control input-small width-200px  " disabled="disabled" title="" 
               <c:choose>
	           	<c:when test="${mobMercAuthList[0].mobileSource == '01'}">value = "手刷商户"</c:when>
	           	<c:when test="${mobMercAuthList[0].mobileSource == '02'}">value = "mPos商户"</c:when>
	           	</c:choose>
               />
           </div>
       </div>
   </div>
                                  
      <div class="col-sm-12">
          <h3 class="header smaller lighter green">实名认证申请上传信息</h3>
          <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
              <thead class="thin-border-bottom">
                  <tr>
                  	  <th>申请次数</th>
                      <th>身份证号</th>
                      <th>姓名</th>
                      <th>申请实名认证时间</th>
                      <th>电子签名图片</th>
                      <th>身份证照片</th>
                      <th>信用卡照片</th>
                      <th>营业执照正面照</th>
                      <c:if test='${flag!=1 }'>
                      	<th>操作</th>
                      </c:if>
                      <th>公安验证结果</th>
                  </tr>
              </thead>
              <div class="docs-galley">
              <c:forEach items="${mobMercAuthList2}" var="mobMercAuth" varStatus="status" >
                 <input  type="hidden" name="idCardNo" id="idCardNo" value="${mobMercAuth.idCardNo }">
              <tr class="docs-pictures">
              <td style="border:1px solid  #969696;">${fn:length(mobMercAuthList)-status.count+1 }</td>
              <td style="border:1px solid  #969696;">${mobMercAuth.idCardNo }</td>
              <td style="border:1px solid  #969696;">${mobMercAuth.usrName }</td>
              <td style="border:1px solid  #969696;">${mobMercAuth.applyAuthDte }</td>
              <td style="border:1px solid  #969696;">
					<%-- <a href="#" class="menuitem"><img src="${mobMercAuth.authPath}"></a> --%>
					<a href="#" class="menuitem"><img class="${status.count} contentmenu" name='1' src="<%=request.getContextPath() %>/mobMercAuthAdmin/loadimg?pic=${mobMercAuth.authPath}" ></a>                                                       
              </td>
              <td style="border:1px solid  #969696;">
              	<%-- <a href="#" class="menuitem"><img src="${mobMercAuth.frontPath}"></a>
              	<a href="#" class="menuitem"><img src="${mobMercAuth.backPath}"></a>
              	<a href="#" class="menuitem"><img src="${mobMercAuth.holdingPath}"></a> --%>
              	<a href="#" class="menuitem"><img class="${status.count} contentmenu" name='2' src="<%=request.getContextPath() %>/mobMercAuthAdmin/loadimg?pic=${mobMercAuth.frontPath}" ></a>
              	<a href="#" class="menuitem"><img class="${status.count} contentmenu" name='3' src="<%=request.getContextPath() %>/mobMercAuthAdmin/loadimg?pic=${mobMercAuth.backPath}" ></a>
              	<a href="#" class="menuitem"><img class="${status.count} contentmenu" name='4' src="<%=request.getContextPath() %>/mobMercAuthAdmin/loadimg?pic=${mobMercAuth.holdingPath}" ></a>
              	              	
              </td>
              <%--信用卡照片 --%>
              <td style="border:1px solid  #969696;">
					<%-- <a href="#" class="menuitem"><img src="${mobMercAuth.authPath}"></a> --%>
					<a href="#" class="menuitem"><img class="${status.count} contentmenu" name='5'  onclick="enlargeImg('<%=request.getContextPath() %>/mobMercAuthAdmin/loadimg?pic=${mobMercAuth.creditCardPath}','${status.count}','5')"  src="<%=request.getContextPath() %>/mobMercAuthAdmin/loadimg?pic=${mobMercAuth.creditCardPath}"></a>                                                       
              </td>
              <%--个人在门店照片 --%>
              <td style="border:1px solid  #969696;">
              	<a href="#" class="menuitem"><img class="${status.count} contentmenu" name='6' src="<%=request.getContextPath() %>/mobMercAuthAdmin/loadimg?pic=${mobMercAuth.storePath}" ></a>
              </td>
              <c:if test='${flag!=1 }'>
	              <td style="border:1px solid  #969696;">
	              	<button class="btn btn-minier btn-purple" type="button" id="authN" onclick='checkIdCard("${mobMercAuth.usrName }","${mobMercAuth.idCardNo }","${status.count}","${status.count}")' <c:if test="${mobMercAuth.authStatus !='00'}"> disabled="disabled"</c:if> >公安验证</button>
	              </td>
              </c:if>
              <td style="border:1px solid  #969696;">
				 <a href="#" class="menuitem">
				 <c:if test="${mobMercAuth.authStatus == '00'}">
				 <a href='#' class='menuitem' id="auth${status.count}"><label id="ICfail${status.count}">待审核</label></a>                                                 
                 </c:if>
                 <c:if test="${mobMercAuth.authStatus == '02'}">
				 <label id="ICfail${status.count}" >审核驳回</label>                                                 
                 </c:if>
                 <c:if test="${mobMercAuth.authStatus == '01'}">
                       <img id="idCardImg" class="${status.count}" name='7' src="<%=request.getContextPath() %>/mercIncome/generateImage?idCard=${mobMercAuth.idCardNo }&key=auth" ></c:if></a>      
              </td>
              </tr>
              </c:forEach>
              </div>
        </table>
            </div>
            <div class="col-sm-12">
                <h3 class="header smaller lighter green">审核历史</h3>
                <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable" style="table-layout:fixed;">
                    <thead class="thin-border-bottom">
                        <tr>
                        	<th>申请次数</th>
                            <th>审核时间</th>
                            <th>审核人</th>
                            <th>驳回原因</th>
                            <th>会签意见</th>
                        </tr>
                    </thead>
                  <c:forEach items="${mobMercAuthList }" var="mobMercAuth" varStatus="status">
                  <c:if test="${mobMercAuth.authStatus !='00'}">
                  	<tr >
                  	<td style="border:1px solid  #969696;">${fn:length(mobMercAuthList)-status.count+1 }</td>
                    <td style="border:1px solid  #969696;">${mobMercAuth.applyAuthDte }</td>
                    <td style="border:1px solid  #969696;">${mobMercAuth.authUsrNm }</td>
				    <td style="border:1px solid  #969696;">
				    	<c:if test="${mobMercAuth.authStatus == '01'}">无</c:if>
				        <c:if test="${mobMercAuth.authStatus == '02'}">${mobMercAuth.rejectReason }</c:if>
				    </td>
                    <td style="border:1px solid  #969696;">${mobMercAuth.remark }</td> 
                    </tr>
                  </c:if>
                  </c:forEach>
                </table>
            </div>
         <c:if test="${flag==2 }">
         <h3 class="header smaller lighter green">审核信息</h3>
         <table>
			<div>
		        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >资料不合格:</label>
                <div id="dataNotQualified"></div> 
		    </div>
		    <div>
		       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >资料缺失:</label>
               <div id="dataMissing"></div> 
		    </div>
		    <div>
		       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >信息有误:</label>
              <div id="inputError"></div> 
            </div>
            <div>
		      <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >营业执照:</label>
              <div id="businessLicence"></div> 
            </div>
			</table>
		<table class=" table table-condensed">
			<tr>
				<td>会签意见：</td>
				<td><textarea  rows="10" cols="100" <c:if test='${flag!=2 }'>disabled="disabled"</c:if>
						id="checkRemark" name="checkRemark"  style="resize: none"></textarea>
				</td>
			</tr>
		</table>
		</c:if>
		
		
		<br/><br/><br/>
        <div class="form-actions center widget-color-normal5">
        <c:if test="${flag==2 }">
        	<button class="btn btn-danger btn-sm" type="button" id="btnCommit" onclick="checkCommit('01')">
            <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                      审核通过                                                                                                
         	</button>
        </c:if> 
         
        <button class="btn btn-default btn-sm"  type="button" onclick="closeWin()">
        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
         	 关闭
        </button>
        
        <c:if test="${flag==2 }">
        	<button  class="btn btn-danger btn-sm" type="button" id="btnCommit" onclick="checkCommit('02')">
           <span class="ace-icon fa fa-gear icon-on-right bigger-110"></span>
                                      审核驳回                                                                                                
         	</button>
        </c:if> 
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
<div id='add'>
	<div id="buttonsDiv" class="buttonsDiv" hidden="hidden">
		<div style="float: left;">
			<button class="btn btn-sm" type="button" onclick="toLast()">
            <span class="ace-icon fa icon-on-right bigger-110"></span>
                                      上一张                                                                                              
         	</button>
         	<button class="btn btn-sm" type="button" onclick="toNext()">
            <span class="ace-icon fa icon-on-right bigger-110"></span>
                                      下一张                                                                                              
         	</button>
		</div>
		<div style="float:right;">
			<button class="btn btn-sm" type="button" onclick="closeImgDiv()">
            <span class="ace-icon fa icon-on-right bigger-110"></span>
                                      关闭图片                                                                                              
         	</button>
		</div>
	</div>
	<div class="suspend" id="imgDiv" hidden="hidden">
		<img id='img'/>
	</div> 
</div>

    <%@include file="../layout/common.alljs.jsp"%>
<!-- inline scripts related to this page -->
<script type="text/javascript" src="../../../js/jquery.rotate.min.js"></script>
<!-- 图片预览js -->
<script src="${ctx}/js/viewer/dist/viewer.js"></script>
<script src="${ctx}/js/viewer/main.js"></script>
<script src="<%=request.getContextPath() %>/js/contextmenu/jquery.contextmenu.js" ></script>

    <script type="text/javascript">
		$(document).ready(function(){
			
			//图片另存为
	        $('.contentmenu').contextPopup({
				title: '',
				items: [
					{label:'另存为', action:function(e) {
						var target=e.target;
						
						var path=$(target).children("img").attr("src");
						if(!path){
							path=$(target).parent().children("img").attr("src");
						}
						
						 location.href="${ctx}/mercIncome/downloadHistoryImage?imagePath="+path;
						} 
					},
				]

	          });
			
			$('.menuitem img').animate({width: 80,height:48}, 0);
			$('.menuitem')
			.mouseout(function(){
					gridimage = $(this).find('img');
					gridimage.stop().animate({width: 80,height:48}, 60);}); 
		    //动态获取驳回原因
			var useType="04";
			console.info('x-admin:二代手刷实名认证......');
			//填写上审核登记信息（首先先清空里面的信息）
			$("#dataMissing").find("option").remove();
			$("#dataNotQualified").find("option").remove();
			$("#inputError").find("option").remove();
			$("#businessLicence").find("option").remove();
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
			    		if(item.bigItems=='18'){
			    			j++;
			    			if(j%4==1){
			    				dataNotQualified += tr+'<td width="250px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}else if(j%4==0){
			    				dataNotQualified += '<td width="250px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
			    			}else{
			    				dataNotQualified += '<td width="250px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}
			    		}else if(item.bigItems=='19'){
			    			l++;
			    			if(l%4==1){
			    				dataMissing += tr+'<td width="250px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}else if(l%4==0){
			    				dataMissing += '<td width="250px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
			    			}else{
			    				dataMissing += '<td width="250px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}
			    		}else if(item.bigItems=='20'){
			    			m++;
			    			if(m%4==1){
			    				inputError += tr+'<td width="250px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}else if(m%4==0){
			    				inputError += '<td width="250px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
			    			}else{
			    				inputError += '<td width="250px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}
			    		}
			    		else if(item.bigItems=='21'){
			    			n++;
			    			if(n%4==1){
			    				businessLicence += tr+'<td width="250px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
			    			}else if(n%4==0){
			    				businessLicence += '<td width="250px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
			    			}else{
			    				businessLicence += '<td width="250px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
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
			    	if(n%4!=0){
			    		businessLicence +=tr2;
			    	}
			    	$("#dataNotQualified").html(dataNotQualified).trigger("chosen:updated");
			    	$("#dataMissing").html(dataMissing).trigger("chosen:updated");
			    	$("#inputError").html(inputError).trigger("chosen:updated");
			    	$("#businessLicence").html(businessLicence).trigger("chosen:updated");
			    }
			});
			$(".chosen-container-multi").attr("style","width: 220px;");
			
			
			
			
		}); 
		function enlargeImg(address,row,col){//点击图片查看大图
			value=0;
			$("#imgDiv").remove();
			if(col != '7'){
				$("#add").append("<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='550px' height='400px'  onclick='clickImgFunction()'/></div>");
				$(".suspend").prop("style","width:550px;height:400px;top:19%");
				$(".buttonsDiv").prop("style","width:550px;");
			}else{
				$("#add").append("<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='400px' height='550px'  onclick='clickImgFunction()'/></div>");
				$(".suspend").prop("style","width:400px;height:550px;top:6%");
				$(".buttonsDiv").prop("style","width:400px;");
			}
			$("#img").attr("src",address);
			$("#img").attr("class",row);//将小图的信息，即第几行存于大图信息中
			$("#img").attr("name",col);//将小图的信息，即第几列存于大图信息中
			$("#buttonsDiv").show();
			$("#imgDiv").show();
		} 
		function closeImgDiv(){//点击关闭
			$("#imgDiv").hide();
			$("#buttonsDiv").hide();
		}
		
 		function toNext(){//点击下一张
 			debugger
			//首先先获得当前图片的行数row（第几行，存于class）以及列数col（第几张，存于name）
			var row=$("#img").attr("class");
			var col=$("#img").attr("name");
			col=parseInt(col);
			//查找有没有第六张（公安验证结果）
			var result=0;
			$("."+row).each(function(){
				if($(this).attr("name")=='7'){
					result=1;
				}
			});
			if(result==1){//有第六张
				if(col==7){
					col=0;
				}
			}else{
				if(col==6){
					col=0;
				}
			}
			$("#imgDiv").remove();
			if((col+1) != '7'){
				$("#add").append("<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='550px' height='400px'  onclick='clickImgFunction()'/></div>");
				$(".suspend").prop("style","width:550px;height:400px;top:19%");
				$(".buttonsDiv").prop("style","width:550px;");
			}else{
				$("#add").append("<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='400px' height='550px'  onclick='clickImgFunction()'/></div>");
				$(".suspend").prop("style","width:400px;height:550px;top:6%");
				$(".buttonsDiv").prop("style","width:400px;");
			}	
			$("#buttonsDiv").show();
			$("#imgDiv").show();
			//查找下一张图片，查找方法，行数相同，列数加一
			$("."+row).each(function(){//将与当前大图行数相同的对像遍历
				if($(this).attr("name")==((col+1)+"")){//如果这个对像的name等于当前图片的name+1,则为下一张
					$("#img").attr("src",$(this).attr("src"));//给大图重新定义地址，行数，列数
					$("#img").attr("class",$(this).attr("class"));
					$("#img").attr("name",$(this).attr("name"));
				}
			});
		}
 		function toLast(){//点击上一张
 			debugger
			//首先先获得当前图片的行数row（第几行，存于class）以及列数col（第几张，存于name）
			var row=$("#img").attr("class");
			var col=$("#img").attr("name");
			col=parseInt(col);
			//查找有没有第六张（公安验证结果）
			var result=0;
			$("."+row).each(function(){
				if($(this).attr("name")=='7'){
					result=1;
				}
			});
			if(result==1){
				if(col==1){
					col=8;
				}
			}else{
				if(col==1){
					col=7;
				}
			}
			$("#imgDiv").remove();
			if((col-1) != '7'){
				$("#add").append("<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='550px' height='400px'  onclick='clickImgFunction()'/></div>");
				$(".suspend").prop("style","width:550px;height:400px;top:19%");
				$(".buttonsDiv").prop("style","width:550px;");
			}else{
				$("#add").append("<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='400px' height='550px'  onclick='clickImgFunction()'/></div>");
				$(".suspend").prop("style","width:400px;height:550px;top:6%");
				$(".buttonsDiv").prop("style","width:400px;");
			}	
			$("#buttonsDiv").show();
			$("#imgDiv").show();
			//查找下一张图片，查找方法，行数相同，列数加一
			$("."+row).each(function(){//将与当前大图行数相同的对像遍历
				if($(this).attr("name")==((col-1)+"")){//如果这个对像的name等于当前图片的name-1,则为上一张
					$("#img").attr("src",$(this).attr("src"));//给大图重新定义地址，行数，列数
					$("#img").attr("class",$(this).attr("class"));
					$("#img").attr("name",$(this).attr("name"));
				}
			});
		}
 		var value=0;
		function clickImgFunction(obj){
			value +=90;
			$("#imgDiv").rotate({ animateTo:value});
		}
	</script>
    <script type="text/javascript">
    /* for(var i=1;i<=18;i++){
    	$("#"+i).attr('checked', true);;
    } */
    function closeWin(){
    	parent.$.fancybox.close();
    }
    
    $('.chosen-select').chosen({});
   

    
    //-----------------------------------------
    
    //--审核信息提交-------------
     function checkCommit(checkResult){
	   	 var checkCard=$("#checkCard").val();
	   		if(checkCard!="true"){
	   			alert("未进行公安验证校验，请校验");
	   			return;
	   		}
    	var rebutReason=0;
    	var checkRemark=$("#checkRemark").val();
    	var flag='${flag}';
    	var rejectReason="";
        $("input[name='rejectReason']:checkbox").each(function(){ 
            if($(this).prop("checked")){
            	rejectReason += $(this).val()+",";
            	rebutReason += 1;
            }
        })
        if(checkResult=='01'){//审核通过
        	if(rebutReason !=0){
        		alert("审核结果为通过，驳回原因应为空!");
        		return;
        	}
        }
        if(checkResult=='02'){//审核驳回
        	if(rebutReason==0){
        		alert("审核结果为驳回，驳回原因不能为空!");
        		return;
        	}
        	
        }
    	 var idCardNo = $("#idCardNo").val();
    	/*  //逻辑变更：会签意见为必填
    	 if(checkRemark==""||checkRemark==null){
    		 alert("会签意见不得为空！");
    		 return;
    	 }  */
		 if(checkRemark.length>300){
			 alert("备注信息超长请重新输入300位以内的字符!");
    		 return;
		 }
    	 $.ajax({
 			    	cache:true,
 			        type:"POST",
 			        url:'/mobMercAuthAdmin/realNamCheckCommit.do',
 					data : {idCardNo:idCardNo,mno:$("#mno").val(),checkResult:checkResult,checkRemark:checkRemark,uuid:$("#uuid").val(),inMno:$("#inMno").val(),rejectReason:rejectReason},
 					async : false,
 					error : function(data) {
 						//data = eval("(" + data + ")")
 						alert(data);
 					},
 					success : function(data) {
 						//data = eval("(" + data + ")")
 						alert(data);
 						parent.$.fancybox.close();
 					}
 				}); 
    	 
     }
    
    
    /**校验身份证信息*/
    function checkIdCard(name,idCard,index,row){
        /* var name = $("#legalNm").val();
    	var idCard = $("#legalCredentialsNo").val(); */
    	//显示等待验证
    	$("#ICfail"+index+"").show();
    	if(name == '' || idCard == ''){
    		alert('姓名和证件号码不能为空');
    		//$("#checkIdCard").linkbutton('enable');
    		return false;
    	}
    	
    	var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
        if(reg.test(idCard) === false){  
           alert("证件号码不合法");  
          // $("#checkIdCard").linkbutton('enable');
           return false;  
    	}
        //encode 参数信息
        name =  encodeURI(name);
        name =  encodeURI(name);
        //先调用验证接口生成验证图片  然后填充验证图片
        var url = '<%=request.getContextPath() %>/mobMercAuthAdmin/checkIdCard?legalNm='+name+'&legalCredentialsNo='+idCard+'&source='+2;
        var span =  $(this).parent().prev('td:eq(6)').find(':span');
        var addr = "/mercIncome/generateImage?idCard="+idCard+"&name="+name;
        $.ajax({ url:url, 
			   type: 'POST',
			   async:false,
			   success: function(data){
				   if(data == "1"){
					   $("#ICfail"+index+"").hide();
					   $("#checkIdCardR").val("1");
					   $("#auth"+index+"").append("<img src='"+addr+"' class='"+row+"' name='7'/></a>");
					   $("#auth"+index+" img").attr("onclick","enlargeImg('"+addr+"','"+row+"','7')");
					   $("#auth"+index+"").trigger("select:updated");
					   $("#authN").attr("disabled", true);
				       //$("#idCardImg"+index+"").attr("src",'/mercIncome/generateImage?idCard='+idCard+"&name="+name);
				   }else{
					   $("#checkIdCardR").val("2");
					   //隐藏图片显示结果
					   //$("#idCardImg"+index+"").attr('style','display:block');
					   $("#ICfail"+index+"").html("验证不通过!");
					   //$("#ICfail").show();
				   }
			       
	        }});
        $("#checkCard").val("true");
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