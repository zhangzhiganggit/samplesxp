<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/taglib.jsp" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付</title> 
    <%@include file="../layout/common.css.jsp"%>
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
			     	大POS自动秒到审核信息
			    </h5>
			
			</div>
			
	<div class="widget-body">
	    <div class="widget-main no-padding ">
	        <div class="widget-main ">
   	<form id="formA" class="form-inline form-horizontal" action="<%=request.getContextPath() %>/mobMercAuthAdmin/realNamCheckCommit" method="post" target="_blank">
       <div class="col-sm-12">
		<input type="hidden" name="publicCheck" id="publicCheck" value="00" >
		
       <h3 class="header smaller lighter green">基本信息</h3>
       
       
       <div class="form-group form-group-sm  width-300px">

           <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户编号:</label>
           <div class="col-sm-8  no-padding">
               <input type="text" name="mno" id="mno" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="${mobMercAuthList[0].mno }"  >
               <input type="hidden" name="uuid" id="uuid" value="${mobMercAuthList[0].uuid }">
           </div>
       </div>
       <div class="form-group form-group-sm  width-300px">

           <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >商户注册名称:</label>
           <div class="col-sm-8  no-padding">
               <input type="text" name="regNm" id="regNm" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="${mobMercAuthList[0].regNm }"  >
           </div>
       </div>
      <div class="form-group form-group-sm  width-300px">

           <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >结算人名称:</label>
           <div class="col-sm-8  no-padding">
               <input type="text" name="usrName" id="usrName" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="${mobMercAuthList[0].usrName }"  >
           </div>
       </div>
       <div class="form-group form-group-sm  width-300px">

           <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >结算人身份证:</label>
           <div class="col-sm-8  no-padding">
               <input type="text" name="idCardNo" id="idCardNo" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="${mobMercAuthList[0].idCardNo }"  >
           </div>
       </div>
       <div class="form-group form-group-sm  width-300px">

          <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >数据来源:</label>
           <div class="col-sm-8  no-padding">
           <c:choose>
           <c:when test="${mobMercAuthList[0].dataSource=='01'}">
               <input type="text" name="dataSource" id="dataSource" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="代理商前台"  >
           </c:when>
           <c:when test="${mobMercAuthList[0].dataSource=='02'}">
               <input type="text" name="dataSource" id="dataSource" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="微信端"  >
           </c:when>
           <c:otherwise>
               <input type="text" name="dataSource" id="dataSource" class="form-control input-small width-200px disabled" disabled="disabled" title="" value=""  >
           </c:otherwise>
           </c:choose>
           </div>
       </div>
       <div class="form-group form-group-sm  width-300px">

          <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >渠道:</label>
           <div class="col-sm-8  no-padding">
           <c:choose>
           <c:when test="${mobMercAuthList[0].channel=='01'}">
               <input type="text" name="channel" id="channel" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="进件-PC"  >
           </c:when>
           <c:when test="${mobMercAuthList[0].channel=='02'}">
               <input type="text" name="channel" id="channel" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="APP"  >
           </c:when>
           <c:otherwise>
               <input type="text" name="channel" id="channel" class="form-control input-small width-200px disabled" disabled="disabled" title="" value=""  >
           </c:otherwise>
           </c:choose>
           </div>
       </div>
  
                                  
      <div class="col-sm-12">
          <h3 class="header smaller lighter green">结算人认证上传信息</h3>
          <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
              <thead class="thin-border-bottom">
                  <tr>
                  	  <!-- <th>申请次数</th> -->
                      <th>申请认证时间</th>
                      <th>结算人姓名</th>
                      <th>结算人身份证号</th>
                      <th align="center">商户是否已通过二要素或三要素验证</th>
                      <th>手持身份证照片样式要求</th>
                      <th>身份证照片</th>
                      
                       <c:if test='${flag!=1 }'> 
                      	<th>操作</th>
                       </c:if> 
                      <th>公安验证结果</th>
                  </tr>
              </thead>
              <c:forEach items="${mobMercAuthList2}" var="mobMercAuth" varStatus="status" >
                 <input  type="hidden" name="idCardNo" id="idCardNo" value="${mobMercAuth.idCardNo }">
              <tr >
              <td style="border:1px solid  #969696;">${mobMercAuth.applyAuthDte }</td>
              <td style="border:1px solid  #969696;">${mobMercAuth.usrName }</td>
              <td style="border:1px solid  #969696;">${mobMercAuth.idCardNo }</td>
              <input type="hidden" name="isCheck" id="isCheck" value="${mobMercAuth.isCheck }" />
              <c:if test="${mobMercAuth.isCheck=='00'}">
                   <td style="border:1px solid  #969696;"align="center">否</td>
              </c:if>
              <c:if test="${mobMercAuth.isCheck=='01'}">
                   <td style="border:1px solid  #969696;"align="center">是</td>
              </c:if>
              <c:choose>
              <c:when test="${mobMercAuth.dataSource=='01' && mobMercAuth.channel=='01'}">
              <td style="border:1px solid  #969696;"></td>
              </c:when>
              <c:otherwise>
              <td style="border:1px solid  #969696;">${mobMercAuth.describe }</td>
              </c:otherwise>
              </c:choose>
              <td style="border:1px solid  #969696;">
              	<a href="#" class="menuitem"><img class="${status.count}" name='1' src="<%=request.getContextPath() %>/posOpenAuth/loadimg?pic=${mobMercAuth.frontPath}&channel=${mobMercAuth.channel}" onclick='enlargeImg("<%=request.getContextPath() %>/mobMercAuthAdmin/loadimg?pic=${mobMercAuth.frontPath}&channel=${mobMercAuth.channel}","${status.count}","1")'></a>
              	<a href="#" class="menuitem"><img class="${status.count}" name='2' src="<%=request.getContextPath() %>/posOpenAuth/loadimg?pic=${mobMercAuth.backPath}&channel=${mobMercAuth.channel}" onclick='enlargeImg("<%=request.getContextPath() %>/mobMercAuthAdmin/loadimg?pic=${mobMercAuth.backPath}&channel=${mobMercAuth.channel}","${status.count}","2")'></a>
              	<a href="#" class="menuitem"><img class="${status.count}" name='3' src="<%=request.getContextPath() %>/posOpenAuth/loadimg?pic=${mobMercAuth.holdingPath}&channel=${mobMercAuth.channel}" onclick='enlargeImg("<%=request.getContextPath() %>/mobMercAuthAdmin/loadimg?pic=${mobMercAuth.holdingPath}&channel=${mobMercAuth.channel}","${status.count}","3")'></a>
              </td>
              <c:if test='${flag!=1 }'> 
	              <td style="border:1px solid  #969696;">
	              	<button class="btn btn-minier btn-purple" type="button" id="authN" onclick='checkIdCard("${mobMercAuth.usrName }","${mobMercAuth.idCardNo }","${status.count}","${status.count}")' <c:if test="${mobMercAuth.isCheck =='01'}"> disabled="disabled"</c:if> >公安验证</button>
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
                       <img id="idCardImg" class="${status.count}" name='4' src="<%=request.getContextPath() %>/posOpenAuth/generateImage?idCard=${mobMercAuth.idCardNo }&name=${mobMercAuth.usrName}&key=auth" onclick="enlargeImg('<%=request.getContextPath() %>/posOpenAuth/generateImage?idCard=${mobMercAuth.idCardNo }&name=${mobMercAuth.usrName}&key=auth','${status.count}','4')"></c:if></a>      
              </td>
              </tr>
              </c:forEach>
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
                             <c:if test="${flag==2 }">
                            <th>下载图片</th>
                            </c:if>
                        </tr>
                    </thead>
                  <c:forEach items="${mobMercAuthList }" var="mobMercAuth" varStatus="status">
                  <c:if test="${mobMercAuth.authStatus !='00'}">
                  	<tr >
                  	<td style="border:1px solid  #969696;">${fn:length(mobMercAuthList)-status.count+1 }</td>
                    <td style="border:1px solid  #969696;">${mobMercAuth.auditTime }</td>
                    <td style="border:1px solid  #969696;">${mobMercAuth.authUsrNm }</td>
				    <td style="border:1px solid  #969696;">
				    	<c:if test="${mobMercAuth.authStatus == '01'}">无</c:if>
				        <c:if test="${mobMercAuth.authStatus == '02'}">${mobMercAuth.rejectReason }</c:if>
				    </td>
                    <td style="border:1px solid  #969696;">${mobMercAuth.remark }</td> 
                     <c:if test="${flag==2 }"><td><div class="col-sm-8  no-padding">
						<button class="btn btn-danger btn-sm" type="button"
							style="height: 30px;" id="downloadAll" onclick="downloadAllImages('${mobMercAuth.uuid }','${mobMercAuth.channel} }')">下载图片</button>
					</div></td></c:if>
                    </tr>
                  </c:if>
                  </c:forEach>
                </table>
            
         <c:if test="${flag==2 }">
         <h3 class="header smaller lighter green">审核信息</h3>
         <table>
         	<div id="dataNotQualifiedHide">
		        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >资料不合格:</label>
                <div id="dataNotQualified"></div> 
		    </div>
		    <div id="dataMissingHide">
		       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >资料缺失:</label>
               <div id="dataMissing"></div> 
		    </div>
		    <div id="inputErrorHide">
		       <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >信息有误:</label>
              <div id="inputError"></div> 
            </div>
            <div id="businessLicenceHide">
		      <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >其他情况:</label>
              <div id="businessLicence"></div> 
            </div>
	        <%-- <tr>
			<td width="100px">驳回原因:</td>
			<td width="200px"></td>
			<td width="200px"></td>
			<td width="200px"></td>
			<td width="200px"></td>
			<td width="200px"></td>
			</tr>
			<tr>
			<td style="color: gray;">资料不合格</td>
			<td><input type="checkbox"  value='身份证过期' name="rejectReason"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>身份证过期</td>
			<td><input type="checkbox"  value='持证照非本人' name="rejectReason"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>持证照非本人</td>
			<td><input type="checkbox"  value='身份证正面不清晰' name="rejectReason"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>身份证正面不清晰</td>
			<td><input type="checkbox"  value='身份证反面不清晰' name="rejectReason"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>身份证反面不清晰</td>
			<td><input type="checkbox"  value='手持身份证照不清晰' name="rejectReason"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>手持身份证照不清晰</td>
			<td width="250px"><input type="checkbox"  value='手持身份证照片样式不符合要求' name="rejectReason"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>手持身份证照片样式不符合要求</td>
			
			</tr>
			<tr>
			<td style="color: gray;">资料缺失</td>
			<td><input type="checkbox"  value='结算人姓名填写有误' name="rejectReason"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>结算人姓名填写有误</td>
			<td><input type="checkbox"  value='结算身份证反面照未上传' name="rejectReason"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>结算身份证反面照未上传</td>
			<td><input type="checkbox"  value='手持身份证照未上传' name="rejectReason"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>手持身份证照未上传</td>
			</tr>
			
			<tr>
			<td style="color: gray;">信息有误</td>
			<td><input type="checkbox"  value='结算人身份证号有误' name="rejectReason"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>结算人身份证号有误</td>
			<td><input type="checkbox"  value='身份验证不通过' name="rejectReason"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>身份验证不通过</td>
			</tr>
			<tr>
				<td style="color: gray;">其它情况</td>
				<td><input type="checkbox"  value='非境内身份证，无法验证' name="rejectReason"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>非境内身份证，无法验证</td>
			</tr> --%>
	    </table>
		<table >
		<h3 class="header smaller lighter green">会签信息</h3>
			<tr>
				<td>会签意见<span class="red">*</span>：</td>
				<td><textarea  rows="10" cols="100" <c:if test='${flag!=2 }'>disabled="disabled"</c:if>
						id="checkRemark" name="checkRemark"  style="resize: none"></textarea>
				</td>
			</tr>
		</table>
		</c:if>
		</div>
		
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
    <script type="text/javascript">
    $(document).ready(function(){
	    //动态获取驳回原因
		var useType="05";
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
		    		if(item.bigItems=='22'){
		    			j++;
		    			if(j%4==1){
		    				dataNotQualified += tr+'<td width="250px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
		    			}else if(j%4==0){
		    				dataNotQualified += '<td width="250px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
		    			}else{
		    				dataNotQualified += '<td width="250px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
		    			}
		    		}else if(item.bigItems=='23'){
		    			l++;
		    			if(l%4==1){
		    				dataMissing += tr+'<td width="230px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
		    			}else if(l%4==0){
		    				dataMissing += '<td width="230px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
		    			}else{
		    				dataMissing += '<td width="230px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
		    			}
		    		}else if(item.bigItems=='24'){
		    			m++;
		    			if(m%4==1){
		    				inputError += tr+'<td width="230px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
		    			}else if(m%4==0){
		    				inputError += '<td width="230px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
		    			}else{
		    				inputError += '<td width="230px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
		    			}
		    		}
		    		else if(item.bigItems=='25'){
		    			n++;
		    			if(n%4==1){
		    				businessLicence += tr+'<td width="230px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
		    			}else if(n%4==0){
		    				businessLicence += '<td width="230px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>'+tr2;
		    			}else{
		    				businessLicence += '<td width="230px"><label><input type="checkbox" name="rejectReason" value="'+item.smallItems+'" />'+item.smallItems+'</label></td>';
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
		    	if(j==0){
		    		$("#dataNotQualifiedHide").hide();
		    	}
		    	if(l==0){
		    		$("#dataMissingHide").hide();
		    	}
		    	if(m==0){
		    		$("#inputErrorHide").hide();
		    	}
		    	if(n==0){
		    		$("#businessLicenceHide").hide();
		    	}
		    	$("#dataNotQualified").html(dataNotQualified).trigger("chosen:updated");
		    	$("#dataMissing").html(dataMissing).trigger("chosen:updated");
		    	$("#inputError").html(inputError).trigger("chosen:updated");
		    	$("#businessLicence").html(businessLicence).trigger("chosen:updated");
		    }
		});
		$(".chosen-container-multi").attr("style","width: 220px;");
		
		
		
		
	}); 
		$(document).ready(function(){
			$('.menuitem img').animate({width: 80,height:48}, 0);
			$('.menuitem')
			.mouseout(function(){
					gridimage = $(this).find('img');
					gridimage.stop().animate({width: 80,height:48}, 60);}); 
		}); 
        function enlargeImg(address,row,col){//点击图片查看大图
			value=0;
			$("#imgDiv").remove();
			if(col != '4'){
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
				if($(this).attr("name")=='4'){
					result=1;
				}
			});
			if(result==1){//有第四张
				if(col==4){
					col=0;
				}
			}else{
				if(col==3){
					col=0;
				}
			}
			$("#imgDiv").remove();
			if((col+1) != '4'){
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
			//首先先获得当前图片的行数row（第几行，存于class）以及列数col（第几张，存于name）
			var row=$("#img").attr("class");
			var col=$("#img").attr("name");
			col=parseInt(col);
			//查找有没有第四张（公安验证结果）
			var result=0;
			$("."+row).each(function(){
				if($(this).attr("name")=='4'){
					result=1;
				}
			});
			if(result==1){
				if(col==1){
					col=5;
				}
			}else{
				if(col==1){
					col=4;
				}
			}
			$("#imgDiv").remove();
			if((col-1) != '4'){
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
    	if(!confirm("提交请点击“确认”，回到审核页面请点击“取消”")){
    		return;
    	}
    	var rebutReason=0;
    	var usrName=$("#usrName").val();
    	var checkRemark=$("#checkRemark").val();
    	var remarkSize=$("#checkRemark").val().strLen();
    	var flag='${flag}';
    	var rejectReason="";
    	var publicCheck= $("#publicCheck").val();
    	var isCheck=$("#isCheck").val();
        $("input[name='rejectReason']:checkbox").each(function(){ 
            if($(this).prop("checked")){
            	rejectReason += $(this).val()+",";
            	rebutReason += 1;
            }
        })
        
        if(isCheck=='00' && publicCheck=='00'){
        	alert("请先进行公安验证!");
    		return;
        }
        
        if(checkResult=='01'){//审核通过
        	if(rebutReason !=0){
        		alert("审核结果为通过，驳回原因应为空!");
        		return;
        	}
            if(publicCheck=='02'){
            	alert("公安验证不通过!");
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
    	 //逻辑变更：会签意见为必填
    	 if(checkRemark==""||checkRemark==null){
    		 alert("会签意见不得为空！");
    		 return;
    	 } 
    	 

		 if(remarkSize>300){
			 alert("会签意见超长请重新输入300位以内的字符!");
    		 return;
		 }
    	 $.ajax({
 			    	cache:true,
 			        type:"POST",
 			        url:'/posOpenAuth/posCheckCommit',
 					data : {idCardNo:idCardNo,mno:$("#mno").val(),checkResult:checkResult,checkRemark:checkRemark,uuid:$("#uuid").val(),rejectReason:rejectReason,publicCheck:publicCheck,usrName:usrName},
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
    	$("#ICfail"+index+"").show();
    	if(name == '' || idCard == ''){
    		alert('结算人姓名和证件号码不能为空');
    		return false;
    	}
    	
    	var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
        if(reg.test(idCard) === false){  
           alert("证件号码不合法");  
           return false;  
    	}
        //encode 参数信息
        name =  encodeURI(name);
        name =  encodeURI(name);
        //先调用验证接口生成验证图片  然后填充验证图片
        var url = '<%=request.getContextPath() %>/posOpenAuth/checkIdCard?legalNm='+name+'&legalCredentialsNo='+idCard+'&source='+2;
        var span =  $(this).parent().prev('td:eq(6)').find(':span');
        var addr = "/posOpenAuth/generateImage?idCard="+idCard+"&name="+name;
        $.ajax({ url:url, 
			   type: 'POST',
			   async:false,
			   success: function(data){
				   if(data == "1"){
					   $("#ICfail"+index+"").hide();
					   $("#publicCheck").val("01");
					   $("#auth"+index+"").append("<img src='"+addr+"' class='"+row+"' name='4'/></a>");
					   $("#auth"+index+" img").attr("onclick","enlargeImg('"+addr+"','"+row+"','4')");
					   $("#auth"+index+"").trigger("select:updated");
					   $("#authN").attr("disabled", true);
				       //$("#idCardImg"+index+"").attr("src",'/mercIncome/generateImage?idCard='+idCard+"&name="+name);
				   }else{
					   $("#publicCheck").val("02");
					   //隐藏图片显示结果
					   //$("#idCardImg"+index+"").attr('style','display:block');
					   $("#ICfail"+index+"").html("验证不通过!");
					   //$("#ICfail").show();
				   }
			       
	        }});
    }
	
    function sleep(numberMillis) { 
    	   var now = new Date();
    	   var exitTime = now.getTime() + numberMillis;  
    	   while (true) { 
    	       now = new Date(); 
    	       if (now.getTime() > exitTime)    return;
    	    }
    	}
    function downloadAllImages(uuid,channel){
    	location.href="/posOpenAuth/downloadAllImages?uuid="+uuid+"&channel="+channel;
    	/* $.ajax({
			url: "/posOpenAuth/downloadAllImages",
			type: "post",
			data: "uuid="+uuid,
			dataType: "text",
			async: false,
			success: function(message){
				if(message=="end"){
					alert("不存在图片");
				}else if(message=="error"){
					alert("图片下载异常");
				}else{
					alert("图片下载成功");
				}
			}
		}); */
    }
    
</script>
</body>
</html>