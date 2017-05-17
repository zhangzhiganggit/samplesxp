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
			width:"400px";
			height:"400px";
		}
		.buttonsDiv{
			position: fixed; 
			left:25%; 
			top:0;
			width:400px;
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
			     	<c:if test="${flag==1 }">钱包用户身份信息认证</c:if>
			     	<c:if test="${flag==2 }">钱包用户身份信息认证审核</c:if>
			    </h5>
			
			</div>
			
	<div class="widget-body">
	    <div class="widget-main no-padding ">
	        <div class="widget-main ">
   	<form id="formA" class="form-inline form-horizontal" method="post" target="_blank">
       <div class="col-sm-12">
		<input type="hidden" name="publicCheck" id="publicCheck">
		<input type="hidden" name="size" id="size" value="${hisList.size()}"/>
       <h3 class="header smaller lighter green">基本信息</h3>
       <div class="form-group form-group-sm  width-300px">

           <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >用户编号:</label>
           <div class="col-sm-8  no-padding">
               <input type="text" name="userNo" id="userNo" class="form-control input-small width-200px disabled" disabled="disabled" title="" value="${walletList[0].userNo}"  >
               <input type="hidden" name="uuid" id="uuid" value="${walletList[0].uuid }">
           </div>
       </div>
       <div class="form-group form-group-sm width-300px">
           <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >手机号:</label>

           <div class="col-sm-8  no-padding"  >
               <input type="text" name="tel" id="tel" class="form-control input-small width-200px " disabled="disabled"    title=""  value="${walletList[0].tel}" />
           </div>
       </div>
       <div class="form-group form-group-sm width-300px">
           <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >真实姓名:</label>

           <div class="col-sm-8  no-padding"  >
               <input type="text" name="idcardNm" id="idcardNm" class="form-control input-small width-200px " disabled="disabled"    title=""  value="${walletList[0].idcardNm}" />
           </div>
       </div>
       <div class="form-group form-group-sm width-300px">
           <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >身份证号:</label>

           <div class="col-sm-8  no-padding"  >
               <input type="text" name="idcardNo" id="idcardNo" class="form-control input-small width-200px " disabled="disabled"    title=""  value="${walletList[0].idcardNo}" />
           </div>
       </div>
       <div class="form-group form-group-sm width-300px">
           <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册时间:</label>

           <div class="col-sm-8  no-padding"  >
               <input type="text" name="dtCte" id="dtCte" class="form-control input-small width-200px " disabled="disabled"    title=""  value="${walletList[0].dtCte}" />
           </div>
       </div>
   </div>
                                  
      <div class="col-sm-12">
          <h3 class="header smaller lighter green">身份认证上传信息</h3>
          <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
              <thead class="thin-border-bottom">
                  <tr>
                  	  <th>申请次数</th>
                      <th>申请认证时间</th>
                      <th>身份证照片</th>
                      <c:if test='${flag!=1 }'>
                      	<th>操作</th>
                      </c:if>
                      <th>公安验证结果</th>
                  </tr>
              </thead>
              <c:forEach items="${walletList}" var="vvMecIfCheck" varStatus="status" >
                 <%-- <input  type="hidden" name="idCardNo" id="idCardNo" value="${mobMercAuth.idCardNo }"> --%>
              <tr >
              <c:if test="${vvMecIfCheck.authenticationStatus =='00'}">
              <td style="border:1px solid  #969696;">${hisList.size()+1}</td>
              </c:if> 
              <c:if test="${vvMecIfCheck.authenticationStatus !='00'}">
              <td style="border:1px solid  #969696;">${hisList.size()}</td>
              </c:if> 
              <td style="border:1px solid  #969696;" align="center"><fmt:formatDate value="${vvMecIfCheck.authenticationDt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
              <td style="border:1px solid  #969696;" align="center">
              	<a href="#" class="menuitem" id="idcardFrontImg"></a>
				<a href="#" class="menuitem" id="idcardBackImg"></a>
              </td>
              <c:if test='${flag==2 }'>
	              <td style="border:1px solid  #969696;" align="center">
	              	<button class="btn btn-minier btn-purple" type="button" id="authN" onclick='checkIdInfo("${vvMecIfCheck.idcardNm }","${vvMecIfCheck.idcardNo}")' <c:if test="${vvMecIfCheck.authenticationStatus !='00'}"> disabled="disabled"</c:if> >公安验证</button>
	              </td>
              
              <td align="center" style="border:1px solid  #969696;">
				<div id="waitingCheck"><label>待审核</label></div>
				<div id="failedToPass" hidden="hidden"><label>审核不通过!</label></div>
				<div id="idcardImage" hidden="hidden" class="menuitem"></div> 
				</td>
				</c:if>
				<c:if test="${flag==1 }">
				<input type="hidden" name="authenticationStatus" id="authenticationStatus" value="${vvMecIfCheck.authenticationStatus}"/>
				<td align="center" style="border: 1px solid #969696;">
					<c:if test="${vvMecIfCheck.authenticationStatus == '00' }">
					<div id="waitingCheck"><a href='#' class='menuitem'><label>待审核</label></a></div>
					<div id="failedToPass" hidden="hidden"><label>审核不通过!</label></div>
					</c:if>
					<c:if test="${vvMecIfCheck.authenticationStatus == '02' }">
					<div id="waitingCheck" hidden="hidden"><a href='#' class='menuitem'><label>待审核</label></a></div>
					<div id="failedToPass" ><label>审核不通过!</label></div>
					</c:if>
					<div id="idcardImage"  class="menuitem"></div> 
					</td>
				</c:if>
				
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
                            <th>审核结果</th>
                            <th>未通过原因</th>
                            <th>会签意见</th>
                            <th>历史图片</th>
                        </tr>
                    </thead>
                  <c:forEach items="${hisList}" var="vvMecIfCheck" varStatus="status">
                  	<tr >
                  	<td style="border:1px solid  #969696;">${fn:length(hisList)-status.count+1 }</td>
                    <td style="border:1px solid  #969696;">${vvMecIfCheck.checkDt }</td>
                    <td style="border:1px solid  #969696;">${vvMecIfCheck.checkErNm }</td>
                    <td style="border:1px solid  #969696;">
                      <c:if test="${vvMecIfCheck.authenticationStatus =='01'}">审核通过</c:if>
                      <c:if test="${vvMecIfCheck.authenticationStatus =='02'}">审核驳回</c:if>
                    
                    </td>
				    <td style="border:1px solid  #969696;">
				    	<c:if test="${vvMecIfCheck.authenticationStatus == '01'}"></c:if>
				        <c:if test="${vvMecIfCheck.authenticationStatus == '02'}">${vvMecIfCheck.suggestion }</c:if>
				    </td>
                    <td style="border:1px solid  #969696;">${vvMecIfCheck.remarks }</td> 
                    <td align="center" >
					<input type="button" class="btn btn-minier btn-purple" onclick="uploadImg('${vvMecIfCheck.uuid }',0)" value="下载" title=""/>
                    </tr>
                  </c:forEach>
                </table>
            </div>
         <div class="col-sm-12">
         <c:if test="${flag==2 }">
         <h3 class="header smaller lighter green">审核信息</h3>
         <table>
	        <tr>
			<td width="100px">驳回原因:</td>
			<td width="200px"></td>
			<td width="200px"></td>
			<td width="200px"></td>
			<td width="200px"></td>
			<td width="200px"></td>
			</tr>
			<tr>
			<td style="color: gray;">资料不合格</td>
			<td><input type="checkbox"  value='手持身份证正面照片不合格' name="suggestion"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>手持身份证正面照片不合格</td>
			<td><input type="checkbox"  value='手持身份证反面照片不合格' name="suggestion"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>手持身份证反面照片不合格</td>
			<td><input type="checkbox"  value='身份证过期' name="suggestion"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>身份证过期</td>
			<td><input type="checkbox"  value='身份信息不可用' name="suggestion"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>身份信息不可用</td>
			</tr>
			<tr>
			<td></td>
			<td><input type="checkbox"  value='身份证年限不合格' name="suggestion"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>身份证年限不合格</td>
			<td width="200px"><input type="checkbox"<c:if test="">checked="checked"</c:if> id="lastReason"name="lastReason"> 
			<input type="text"name="suggestion" id="other" value="其他原因，不能超过15个汉字"
				onclick="clickOther()" onblur="lossOther()"class="form-control input-small " title=""
				style="font-size: 8px; height: 25px; width: 170px"></td>
			</tr>
			<tr>
			<td style="color: gray;">信息有误</td>
			<td><input type="checkbox"  value='身份证验证不通过' name="suggestion"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>身份证验证不通过</td>
			<td><input type="checkbox"  value='身份证号有误' name="suggestion"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>身份证号有误</td>
			<td><input type="checkbox"  value='身份姓名有误' name="suggestion"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>身份姓名有误</td>
			<td><input type="checkbox"  value='持证照非本人' name="suggestion"<c:if test="${flag==1 }">disabled="disabled"</c:if>/>持证照非本人</td>
			</tr>
	    </table>
		<table class=" table table-condensed">
			<tr>
				<td>会签意见<span style="color: red">*</span>:</td>
				<td><textarea  rows="10" cols="100" <c:if test='${flag!=2 }'>disabled="disabled"</c:if>
						id="remarks" name="remarks"  style="resize: none"></textarea>
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
  //加载网页后加载图片
	$(document).ready(function() {
		debugger
		var idcardFrontImg= "<img class='1' name='1' src='<%=request.getContextPath() %>/walletUserCheck/loadimg?address=${walletList[0].idcardFront}' onclick='enlargeImg(\"<%=request.getContextPath() %>/walletUserCheck/loadimg?address=${walletList[0].idcardFront}\",\"1\",\"1\")'>";
		var idcardBackImg= "<img class='1' name='2' src='<%=request.getContextPath() %>/walletUserCheck/loadimg?address=${walletList[0].idcardBack}' onclick='enlargeImg(\"<%=request.getContextPath() %>/walletUserCheck/loadimg?address=${walletList[0].idcardBack}\",\"1\",\"2\")'>";
		$("#idcardFrontImg").html(idcardFrontImg);
		$("#idcardBackImg").html(idcardBackImg);
		$('.menuitem img').animate({
			width : 80,
			height : 48
		}, 0);
			//$("#idcardImage").show();
			var authenticationStatus=$("#authenticationStatus").val();
			 if(${flag==1} && authenticationStatus=='01'){
			checkIdInfo('${walletList[0].idcardNm}','${walletList[0].idcardNo}','${walletList[0].authenticationStatus}');
			} 
	});
    function clickOther(){
		$("#other").val("");
	}
    function lossOther(){
		var other = $("#other").val();
		if(other == ''){
			$("#other").val("其他原因，不能超过15个汉字");
		}
		
	}
		$(document).ready(function(){
			$('.menuitem img').animate({width: 80,height:48}, 0);
			$('.menuitem')
			.mouseout(function(){
					gridimage = $(this).find('img');
					gridimage.stop().animate({width: 80,height:48}, 60);}); 
		}); 
		function enlargeImg(address, row, col) {//点击图片查看大图
			value = 0;
			$("#imgDiv").remove();
			$("#add").append("<div class='suspend' id='imgDiv' hidden='hidden'><img id='img' width='400px' height='400px'  onclick='clickImgFunction()'/></div>");
			$("#img").attr("src", address);
			$("#img").attr("class", row);//将小图的信息，即第几行存于大图信息中
			$("#img").attr("name", col);//将小图的信息，即第几列存于大图信息中
			$("#buttonsDiv").show();
			$("#imgDiv").show();
		}
		function closeImgDiv(){//点击关闭
			$("#imgDiv").hide();
			$("#buttonsDiv").hide();
		}
		
		function toNext() {//点击下一张
			//首先先获得当前图片的行数row（第几行，存于class）以及列数col（第几张，存于name）
			var row = $("#img").attr("class");
			var col = $("#img").attr("name");
			col = parseInt(col);
			var idcardImage = !$("#idcardImage").is(":hidden");
			if(idcardImage){//有第四张图片
				if(col==3){
					col=0;
				}
			}else{
				if(col==2){
					col=0;
				}
			}
			//查找下一张图片，查找方法，行数相同，列数加一
			$("." + row).each(function() {//将与当前大图行数相同的对像遍历
				if ($(this).attr("name") == ((col + 1) + "")) {//如果这个对像的name等于当前图片的name+1,则为下一张
					$("#img").attr("src", $(this).attr("src"));//给大图重新定义地址，行数，列数
					$("#img").attr("class", $(this).attr("class"));
					$("#img").attr("name", $(this).attr("name"));
				}
			});
		}
		function toLast() {//点击上一张
			//首先先获得当前图片的行数row（第几行，存于class）以及列数col（第几张，存于name）
			var row = $("#img").attr("class");
			var col = $("#img").attr("name");
			col = parseInt(col);
			
			var idcardImage = !$("#idcardImage").is(":hidden");
			if(idcardImage){//有第四张图片
				if(col==1){
					col=4;
				}
			}else{
				if(col==1){
					col=3;
				}
			}
			//查找下一张图片，查找方法，行数相同，列数加一
			$("." + row).each(function() {//将与当前大图行数相同的对像遍历
				if ($(this).attr("name") == ((col - 1) + "")) {//如果这个对像的name等于当前图片的name-1,则为上一张
					$("#img").attr("src", $(this).attr("src"));//给大图重新定义地址，行数，列数
					$("#img").attr("class", $(this).attr("class"));
					$("#img").attr("name", $(this).attr("name"));
				}
			});
		}
 		var value=0;
		function clickImgFunction(obj){
			value +=90;
			$("#imgDiv").rotate({ animateTo:value});
		}
		function uploadImg(value,args){
			location.href = "/walletUserCheck/uploadImg?uuid="+value+"&args=0";
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
    	debugger
    	 var waitingCheck= !$("#waitingCheck").is(":hidden");
    	 if(waitingCheck){
 			alert("请进行公安验证");
 			return;
 		}
    	var publicCheck=$("#publicCheck").val();
    	var rebutReason=0;
    	var remarks=$("#remarks").val();
    	var flag='${flag}';
    	var suggestion="";
        $("input[name='suggestion']:checkbox").each(function(){ 
            if($(this).prop("checked")){
            	debugger
            	suggestion += $(this).val()+",";
            	rebutReason += 1;
            }
        })
        var other= $("#other").val();
        if($("input[id='lastReason']").is(':checked')){
        	debugger
        	if(other==''|| other=='其他原因，不能超过15个汉字'){
        		alert("请填写其他原因!");
        	}else{
        		suggestion += other+",";
    			rebutReason += 1;
        	}
        	
		}
       /*  var other = $("#other").val();
        debugger
		if(other=="" || other== null || other== undefined || other=="其他原因，不能超过15个汉字"){
			rebutReason -= 1;
		} */
        if(checkResult=='01'){//审核通过
        	if(rebutReason !=0){
        		alert("已选择驳回原因，不能审核通过!");
        		return;
        	}
           if(publicCheck=='02'){
        	 alert("公安验证未通过!");
       		 return;
           }
        }
        if(checkResult=='02'){//审核驳回
        	if(rebutReason==0){
        		alert("未选择驳回原因，不能审核驳回!");
        		return;
        	}
         var len = other.strLen();
         if(len>30){
        	alert("其他原因，不能超过15个汉字！");
        	return;
        } 
        }
    	 //逻辑变更：会签意见为必填
    	 if(remarks==""||remarks==null){
    		 alert("会签意见不得为空！");
    		 return;
    	 } 
    	 var remarkLen=remarks.strLen();
		  if(remarkLen>300){
			 alert("备注信息超长请重新输入300位以内的字符!");
    		 return;
		 } 
    	 $.ajax({
 			    	cache:true,
 			        type:"POST",
 			        url:'/walletUserCheck/walletUserCheck',
 					data : {userNo:$("#userNo").val(),checkResult:checkResult,remarks:remarks,suggestion:suggestion},
 					async : false,
 					error : function(data) {
 						alert(data);
 					},
 					success : function(data) {
 						alert(data);
 						parent.$.fancybox.close();
 						window.parent.location.reload();
 					}
 				}); 
     }
    
    
    /**校验身份证信息*/
   function checkIdInfo(name,idCard,authenticationStatus){
		    name =  encodeURI(name);
		    name =  encodeURI(name);
		    var addr = "/walletUserCheck/generateImage?idCard="+idCard+"&name="+name;
		    $.ajax({ 
		    	url:'/walletUserCheck/checkIdCard?name='+name+'&idCard='+idCard+'&source=2', 
				type: 'POST',
				async:false,
				success: function(data){
						debugger
						//data :1成功 2接口成功返回信息失败 3接口失败
						if(data == "1"){
							$("#waitingCheck").hide();
							$("#failedToPass").hide();
							var img= "<img class='1' name='3' src='<%=request.getContextPath() %>/vvMecIfCheck/generateImage?idCard=${walletList[0].idcardNo}&name=${walletList[0].idcardNm}' onclick='enlargeImg(\"<%=request.getContextPath() %>/walletUserCheck/generateImage?idCard=${walletList[0].idcardNo}&name=${walletList[0].idcardNm }\",\"1\",\"3\")'>";
							$("#idcardImage").html(img);
							$('.menuitem img').animate({
								width : 80,
								height : 48
							}, 0);
							$("#idcardImage").show();
							$("#publicCheck").val("01");
						}else if(data == "2"){
							$("#waitingCheck").hide();
							$("#failedToPass").show();
							$("#idcardImage").hide();
							$(".pass").attr("disabled","disabled");
							$("#publicCheck").val("02");
						}else if(data == "3"){
							$("#waitingCheck").hide();
							$("#failedToPass").show();
							$("#idcardImage").hide();
							$("#publicCheck").val("02");
						}
		        }
		    });
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