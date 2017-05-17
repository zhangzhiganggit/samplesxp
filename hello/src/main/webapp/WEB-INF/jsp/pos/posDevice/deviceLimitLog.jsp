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
                            <div class="widget-box widget-color-normal2" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                                                                     限制归属查询结果
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <table class="table table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th style="text-align:center;width:6%">序号</th>
                                                <th style="text-align:center;width:8%">归属分公司 </th>
                                                <th style="text-align:center;width:7%">归属机构</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${limitLog}" var="de"  varStatus="status">
												<tr>
													<td style="text-align:left;">${status.index + 1}</td>
													<td style="text-align:center;">${de.branchNm}</td>
													<td style="text-align:center;">${de.orgNm}</td>
												</tr>
											</c:forEach> 
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="form-actions center widget-color-normal5">
										<button class="btn  btn-sm" type="button"  onclick="closeWin()">
                                                    <span class="ace-icon fa 	 icon-on-right bigger-110"></span>
                                                    返回
                                                </button>
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
  function closeWin(){
		parent.$.fancybox.close();
	}
</script>

</body>
</html>











