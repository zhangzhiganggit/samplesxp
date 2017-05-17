<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付admin</title>

    <%@include file="../../layout/common.jsp"%>
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
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        	携机入网限制设置查询条件
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
                                            <form class="form-inline form-horizontal" action="<%=request.getContextPath()%>/deviceLimit/list.do" id="searchForm" method="POST">
                                                <input type="hidden" name="currentPage"/>
                                                <input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
												<input type="hidden" name="pageSize" value="${pageInfo.pageSize }">
												<input type="hidden" id="isFirstLoad" name="isFirstLoad" value="false" />
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >厂商简称:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <select data-placeholder="请选择" id="factId" name="factId" onchange="changeFactId()"
                                                              class="chosen-select form-control width-200px" >
                                                               <option value="">全部</option>
																<c:if test="${!empty manuFactoryList }">
																	<c:forEach items="${manuFactoryList}" var="item">
																		<option value="${item.factId}"
																		<c:if test="${item.factId==deviceLimit.factId}"> selected </c:if>>${item.factShortname}</option>									
																    </c:forEach>
																</c:if>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label     class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >型号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <select data-placeholder="请选择" id="modId" name="modId" 
                                                              class="chosen-select form-control width-200px" >
                                                               <option value="">全部</option>
																<c:if test="${!empty adList }">
																	<c:forEach items="${adList}" var="item">
																	    <option value="${item.modId}"
																		<c:if test="${item.modId==deviceLimit.modId}"> selected </c:if>>${item.modNm}</option>
																	</c:forEach>
																</c:if>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >状态:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                           <select data-placeholder="请选择" id="status" name="status" 
                                                              class="chosen-select form-control width-200px" >
                                                              <option value="">全部</option>
																			<option value="01" <c:if test="${01==deviceLimit.status}"> selected </c:if>>限制中</option>
																			<option value="11" <c:if test="${11==deviceLimit.status}"> selected </c:if>>已恢复</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                     <div class="form-group form-group-sm width-300px ">
                                                        <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">操作时间:</label>
                                                        <div class="col-sm-8   no-padding">
                                                            <div class="input-daterange input-group width-200px">
                                                                <input type="text" name="operTimeStart" id="operTimeStart"  class="input-small form-control" value="${deviceLimit.operTimeStart}" onchange="changeDateStart()">
                                                                                <span class="input-group-addon">
                                                                                    <i class="fa fa-exchange"></i>
                                                                                </span>
                                                                <input type="text" name="operTimeEnd"  id="operTimeEnd" class="input-small form-control" value="${deviceLimit.operTimeEnd}" onchange="changeDateEnd()">
                                                            </div>
                                                        </div>
                                                    </div>
                                                      <!-- 完毕 -->
                                                </div>
                                                <button class="btn btn-normal btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                    检索
                                                </button>
                                                <button class="btn btn-info btn-sm" type="button"  onclick="resetMecForm()">
                                                    <span class="ace-icon fa fa-search-minus icon-on-right bigger-110"></span>
                                                    清空检索条件
                                                </button> 
                                                <button class="btn btn-danger btn-sm" type="button" onclick="javaScript:openIframe('','3','')">
                                                    <span class="ace-icon fa  icon-on-right bigger-110"></span>
                                                   添加
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                                                                        携机入网限制设置查询结果
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width:10%">厂商简称</th>
                                                <th style="text-align:center;width:8%">型号 </th>
                                                <th style="text-align:center;width:5%">限制操作</th>
                                                <th style="text-align:center;width:9%">生效时间 </th>
                                                <th style="text-align:center;width:9%">入库时间限制</th>
                                                <th style="text-align:center;width:5%">状态</th>
                                                <th style="text-align:center;width:7%">操作人</th>
                                                <th style="text-align:center;width:8%">操作时间</th>
                                                <th style="text-align:center;width:10%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${deLimitList}" var="de"  varStatus="status">
												<tr>
													<td style="text-align:left;">${de.factShortname }</td>
													<td style="text-align:center;">${de.modName}</td>
													<td style="text-align:center;">
													   <c:if test="${de.tranType == '01' }">入库</c:if>
													   <c:if test="${de.tranType == '11' }">签到</c:if>
													   <c:if test="${de.tranType == '00' }">入库,签到</c:if>
													</td>
													<td style="text-align:center;">${de.beginDate}</td>
													<td style="text-align:center;">${de.storeDate}</td>
													<td style="text-align:center;">
														<c:if test="${de.status == '01' }">限制中</c:if>
														<c:if test="${de.status == '11' }">已恢复</c:if>
													</td>
													<td style="text-align:center;">${de.empNm}</td>
													<td style="text-align:center;">${de.operTime }</td>
													<td style="text-align:left;">
									                     <div class="action-buttons">
									                     <c:if test="${de.status == '01' }">
										                         <a href="javaScript:openIframe('${de.batNo}','2','')" class="blue">
										                             	 修改
										                         </a>
										                         <a onclick="if(confirm('确认要恢复该终端限制吗？')==false)return false;" href="javaScript:repeatStorage('${de.batNo}')" class="blue">
										                             	恢复入网
										                         </a>
										                         <a href="<%=request.getContextPath()%>/deviceLimit/limitOwner?batNo=${de.batNo}&factId=${ deviceLimit.factId}&modId=${deviceLimit.modId }&status=${deviceLimit.status }&operTimeStart=${deviceLimit.operTimeStart}&operTimeEnd=${deviceLimit.operTimeEnd}" class="blue">
									                             	 限制归属
									                             </a>
										                 </c:if>
										                         <a href="javaScript:openIframe('${de.batNo}','1','${de.operNo}')" class="blue">
									                             	 操作记录
									                             </a>
									                             <a href="javaScript:openIframe('${de.batNo}','4','')" class="blue">查看版本号</a>
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
                            	<label class="dataTables_info " id="dynamic-table_info"
									role="status" aria-live="polite"></label>
                               </div>
                                <div class="col-sm-8 right">
                                    <%@include file="../../layout/pagination.jsp" %>
                                </div>
                        </div>
                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%@include file="../../layout/common.js.jsp"%>
         <script type="text/javascript" src="<%=request.getContextPath() %>/js/common/common.js"></script>
    <!-- inline scripts related to this page -->
    <script type="text/javascript"> 
		$('.chosen-select').chosen({}); 
        jQuery(function($) {
        //show the dropdowns on top or bottom depending on window height and menu position
        $('#task-tab .dropdown-hover').on('mouseenter', function(e) {
            var offset = $(this).offset();

            var $w = $(window)
            if (offset.top > $w.scrollTop() + $w.innerHeight() - 100)
                $(this).addClass('dropup');
            else $(this).removeClass('dropup');
        });



        $('.date-picker').datepicker({
            autoclose: true,
            language: 'zh-CN',
            todayHighlight: true
        })
//show datepicker when clicking on the icon
            .next().on(ace.click_event, function(){
                $(this).prev().focus();
            });
//or change it into a date range picker
        $('.input-daterange').datepicker({autoclose:true,language: 'zh-CN'});
    })
        function resetMecForm(){
           	 $(':input','#searchForm') 
           	 .not(':button, :submit, :reset, :hidden')
           	 .val('')  
           	 .removeAttr('checked')  
           	 .removeAttr('selected');
           	 $("#operTimeEnd").val('');
        	 $("#operTimeEnd").trigger("chosen:updated");
        	 $("#operTimeStart").val('');
       		 $("#operTimeStart").trigger("chosen:updated");     		 
       		 $("#factId").val('');
      		 $("#factId").trigger("chosen:updated");
      		 $("#modId").chosen("destroy"); 
      		 $("#modId").trigger("chosen:updated");
      	     $("#modId").html('<option value="">全部</option>');
      	     $("#modId").chosen({});
   	         $("#modId").trigger("chosen:updated");
      		 $("#status").val('');
      		 $("#status").trigger("chosen:updated");
       	}
        
    function openIframe(uuid,flag,operNo){
    	var href = '';
    	if(1 == flag){
    		href = '<%=request.getContextPath() %>/deviceLimit/Detail.do?batNo='+uuid+'&operNo='+operNo;
    	}else if(2 == flag){
    		href = '<%=request.getContextPath() %>/deviceLimit/Edit.do?uuid='+uuid;
    	}else if(3 == flag){
    		href = '<%=request.getContextPath() %>/deviceLimit/preAdd.do';
    	}else if(4 == flag){
    		href = '<%=request.getContextPath() %>/deviceLimit/posVersionDetail.do?batNo='+uuid;
    	}
    	$.fancybox.open({
			href : href,
			type: 'iframe',
            padding: 5,
            scrolling: 'no',
            width: $(window).width() * 0.8,
            centerOnScroll:true,
            autoSize: true,
            helpers:{
            	overlay:{
            		closeClick:false
            	}
            },
			afterClose:function(){
				if(3 == flag|| 2 == flag){
					reloadParent();
				}
			}
		});
    }
    
   
    
  //厂商简称和型号下拉框变动	
	  function changeFactId() {
			var fact_id = $("#factId").val();
			var mobj = $("#modId");
			var option="<option value=''> 请选择...  </option>";
			mobj.empty();
			$.ajax({
				url : '/deviceLimit/changeFactId',
				data : {fact_id : fact_id},
				cache : true,
				async : false,
				success : function(data) {
					debugger
					for (var i = 0; i < data.length; i++) {
						option+="<option value='"+data[i].modId+"'>" + data[i].modNm + "</option>";
					}
					$("#modId").html(option);
					$("#modId").trigger("chosen:updated");
				}
			});
		}
  //恢复入网
  function repeatStorage(uuid){
	  $.ajax({
			type : "GET",
			url : "${ctx}/deviceLimit/repeatStorage.do",
			dataType : "json",
			data:{
				"batNo":uuid
	        	},
			cache : false,
			success : function(data) {
				if(data.flag=="success"){
					alert("恢复入网操作成功");
					reloadParent();
				}else if(data.flag=="error"){
					alert("恢复入网操作失败");
				}
			}
		});
  }
  function reloadParent(){
  	document.getElementById("searchForm").submit();
  }
  function changeDateStart(){
		 var operTimeStart=Number($("#operTimeStart").val().replace(/-/g,''));
		 var operTimeEnd=Number($("#operTimeEnd").val().replace(/-/g,''));
		 if(operTimeEnd!=0){
			 if(operTimeStart>operTimeEnd){
				 $("#operTimeEnd").val($("#operTimeStart").val());
			 }
		 }
	 }
	 function changeDateEnd(){
		 var operTimeStart=Number($("#operTimeStart").val().replace(/-/g,''));
		 var operTimeEnd=Number($("#operTimeEnd").val().replace(/-/g,''));
		 if(operTimeStart!=0){
			 if(operTimeStart>operTimeEnd){
				 $("#operTimeStart").val($("#operTimeEnd").val());
			 }
		 }
	 }
</script>

</body>
</html>











