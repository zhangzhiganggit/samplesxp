<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

     <%@include file="../../layout/common.css.jsp"%>
</head>

<body class="no-skin ">
    
   <%--  <%@include file="../layout/header.jsp"%> --%>

    <div class="main-container" id="main-container">
        <script type="text/javascript">
            try{ace.settings.check('main-container' , 'fixed')}catch(e){}
        </script>
       <%--   <%@include file="../layout/menu.jsp"%>  --%>

        <div class="main-content ">
            <div class="main-content-inner ">

               
                <div class="page-content ">

                    <div class="row" >


                        <div class=" widget-container-col ui-sortable  "  >
                           
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        	结果列表
                                    </h5>


                                </div>

                                <div class="widget-body">
                                     <font size="3" color="red">本次批量导入${oper }D+1共成功${successCount }条,失败${failCount }条,商编重复${repeatNum}条,失败商户及原因如下</font>
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                 <th align="center" style="width: 10%">序号</th> 
                                                <th style="width: 30%"> 商编 </th>
                                                <th > 失败原因</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                           <c:forEach items="${list}" var="de"  varStatus="status">
													<tr class="trRow">
														<td class="rowNm"  style="text-align: center;">${status.index+1 }</td> 
														<td class="mno" style="text-align: center;">${de.mno }</td>
														<td class="errMsg" style="text-align: left;">${de.errorMsg }</td>
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


						</div>
                    <div class="form-actions center widget-color-normal5">
                             <button class="btn btn-primary btn-sm" type="button" id="downToExcel" onclick="toExcel();">
							<span class="ace-icon fa fa-arrow-circle-o-down icon-on-right bigger-110"></span>
							导出
							</button>
							&nbsp;
							<button class="btn  btn-sm" type="button" onclick="closeThisWin()">
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>

                                                                                                  关闭
                             </button>
                   </div>
                   <form id="expForm" action="<%=request.getContextPath()%>/mecIfDayOneStatus/exportErrMsg.do" method="post">
                      <input type="hidden" id="jsonStr" name="jsonStr">
                   </form>
                    </div>
                </div>

            </div>

        </div><!-- /.main-content -->

    </div><!-- /.main-container -->

    <%@include file="../../layout/common.alljs.jsp"%>
    <script type="text/javascript">
    function closeThisWin(){
    	parent.$.fancybox.close();
    }
     </script>
    
    <script type="text/javascript">
      function myObject(rowNm,mno,errMsg){ 
	    this.rowNm = rowNm;
	  	this.mno = mno;
	  	this.errMsg = errMsg;
	 	return this;
      }

       function toExcel(){
    	   var dateArray = [];
     	   $(".rowNm").each(function(){
       		    var parent = $(this).parents(".trRow");
       		    var rowNm = parent.find(".rowNm").text();
	       		var mno = parent.find(".mno").text();
	       		var errMsg = parent.find(".errMsg").text();
        	    dateArray.push(new myObject(rowNm,mno,errMsg)); 
     		});
     	   if(dateArray.length == 0){
       		alert("导入失败的数据为空,无法导出");
       		return;
           }
     	   var jsonStr = JSON.stringify(dateArray);
     	   $("#jsonStr").val(jsonStr);
		   document.getElementById("expForm").submit();
       }
   
        jQuery(function($) {
        	$('.chosen-select').chosen({});
        })
    
     
</script>
</body>
</html>











