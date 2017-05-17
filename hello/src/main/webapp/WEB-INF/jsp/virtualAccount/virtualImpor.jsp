<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
       <%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付 Admin</title>

    <%@include file="../layout/common.css.jsp"%>
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
                        <div class=" widget-container-col ui-sortable"   >
                            <div class="widget-box widget-color-normal3" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title bigger lighter">
                                        <i class="ace-icon fa fa-table"></i>
                                        虚拟账号导入
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" action="<%=request.getContextPath()%>/virtualAccount/addVirtual.do" >
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >户名:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                          <input type="text" id="accountName"  name="accountName" value="" class="form-control input-small width-200px" data-placement="bottom" title=""   data-rel="tooltip" data-original-title="Hello Tooltip!">                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联行行号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <input type="text" min="0" id="backCardNum" name="lbnkNo"  class="form-control input-small width-80 " data-placement="bottom" title=""   >
                                                            <button class="btn btn-minier btn-sm" type="button" id="bank" >
                                                                查询
                                                            </button>
                                                        </div>
                                                    </div><br />
                                                    <div class="form-group form-group-sm width-300px " style="display: none">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >是否默认账号:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            	否  <input type="radio" name="isDefault" value="0" checked="checked"/> 
															              是   <input type="radio" name="isDefault" value="1" /> 
                                                        </div>
                                                    </div>
                                                  
                                                    <div class="form-group form-group-sm width-100 ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >虚拟账号:</label>

                                                        <div class="col-sm-8 no-padding width-85">
                                                            <textarea maxlength="" id="accountNos" name="accountNos" style="height:80px" class="form-control limited input-small width-100"></textarea>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                <c:if test="${loginUserPermission.SMSA_FINANCE_002!=null }">
                                                    <button class="btn btn-danger btn-sm" id="subbtn" type="button" onclick="subVirtual()">
                                                        <span class="ace-icon fa fa-floppy-o icon-on-right bigger-110"></span>
                                                        保存
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
        </div><!-- /.main-content -->
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div>

<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 800px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">查询联行行号</h4>
				</div>
				<div class="modal-body no-padding" style="height: 500px">
					<div class="widget-main ">
						<form class="form-inline form-horizontal" id="bnkLinkForm">
							<input type="hidden" name="pageNum" value="${pageInfo.pageNum }">
							<input type="hidden" name="pageSize"
								value="${null == pageInfo.pageSize? 10 :pageInfo.pageSize }">
							<input type="hidden" name="total" value="${pageInfo.getTotal()}">
							<div class=" col-xs-12">
								<div class="form-group form-group-sm width-300px ">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属省:</label>

									<div class="col-sm-8  no-padding">
										<select id="bankProv" name="lbnkProv"
											class="chosen-select form-control width-70"
											onchange="setCity2(this.value)">
											<option value="0">请选择省份</option>
											<c:forEach items="${bnkProvs }" var="prov">
												<option value="${prov.areaId }">${prov.areaNm}</option>
											</c:forEach>
											
										</select>
									</div>
								</div>
								<div class="form-group form-group-sm width-300px ">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">所属市:</label>

									<div class="col-sm-8  no-padding">
										<select id="bankCityCd" name="lbnkCity"
											class="chosen-select form-control width-70">
											<option value="0">请选择城市</option>
										</select>
									</div>
								</div>

								<div class="form-group form-group-sm width-300px">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算银行名称*:</label>

									<div class="col-sm-8  no-padding">
										<select data-placeholder="请选择" name="bnkCd"
											class="chosen-select form-control width-200px">

											<option value="">其他银行</option>

											<c:forEach items="${bnkList }" var="bnk">
												<option value="${bnk.bnkCd }">${bnk.bnkNm }</option>
											</c:forEach>
										</select>
									</div>
								</div>


								<div class="form-group form-group-sm width-300px">
									<label
										class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">结算银行信息*:</label>

									<div class="col-sm-8  no-padding ">
										<input type="text" name="lbnkNm"
											class="form-control input-small width-200px "
											data-placement="bottom" title="">
									</div>
								</div>

								<button class="btn btn-normal btn-sm" type="button"
									onclick="searchBnkLink()">
									<span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
									查询
								</button>
							</div>
						</form>

						<div class="col-sm-12 no-padding" id="bnkPage"></div>
					</div>
				</div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
	</div>
 
	<%@include file="../layout/common.alljs.jsp"%>
	<script type="text/javascript">
	function amountb(){
		 //以下是验证整数的正则
		 var checkCut=$("#backCardNum").val();
	    var reg =/^\d{1,12}?$/ ;
	     if(!reg.test(checkCut)){
	    	 $("#backCardNum").val('');
	 	}
	 }
	 window.setInterval("amountb()",100)
	function searchBnkLink(){
		$.ajax({
	    	cache: true,
	        type: "POST",
	        url:'/org/searchBnkLink.do',
			data : $('#bnkLinkForm').serialize(),// 你的formid
			async : false,
			error : function(data) {
				alert("系统异常，请稍后再试");
			},
			success : function(data) {
				$("#bnkPage").html(data);
			}
		});
	}
	function chooseBnkInfo(obj1, obj2, obj3, obj4, obj5) {
		$("#backCardNum").val(obj5)
		$('#myModal').modal('hide');
	}
	
	function setCity2(pid){
		$.ajax({
			type:'post',
			url:"/org/moudel/org_bnk_city.do",
			data:'id='+pid,
			async:false,
			success:function(data){
				$("#bankCityCd").chosen("destroy");
				$("#bankCityCd").html(data);
				$("#bankCityCd").chosen({});
			},
			error:function(){
				$.messager.alert('提示信息','数据提交失败');
			}
		});
	}
	
	function subVirtual(){
		var accountName  =$("#accountName").val();
		var backCardNum  =$("#backCardNum  ").val();
		var accountNos  =$("#accountNos").val();
		if(accountName==''||accountName==null){
			alert("户名不能为空");
			return;
		}
		if(backCardNum==''||backCardNum==null){
			alert("联行号不能为空");
			return;
		}
		if(accountNos==''||accountNos==null){
			alert("账号不能为空");
			return;
		}
		
		$("#subbtn").attr("disabled", true);
		
		$.ajax({
			    	cache: true,
			        type: 'POST',
			        url:'/virtualAccount/addVirtual.do',
					data : $('#searchForm').serialize(),// 你的formid
					async : false,
					error : function(data) {
						alert(data.msg);
						$("#subbtn").attr("disabled", false);
					},
					success : function(data) {
						alert(data.msg);
						$("#subbtn").attr("disabled", false);
					}
				});
	}
	
		$('.main-content .chosen-select').chosen({});


		jQuery(function($) {

			$('#bank').click(function() {
				$('#myModal').modal({
					keyboard : true
				});

			});

			$('#myModal').on('shown.bs.modal', function() {
				$('#myModal .chosen-select').chosen("destroy");
				$('#myModal .chosen-select').chosen({});
			})

			$('#searchForm').bootstrapValidator({
				message : 'This value is not valid',
				container : 'popover',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					accountName : {
						validators : {
							notEmpty : {},

						}
					},
					lbnkNo : {
						validators : {
							notEmpty : {},

						}
					},    
					accountNos : {
						validators : {
							notEmpty : {},

						}
					}
				}
			});

			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			})
			//show datepicker when clicking on the icon
			.next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
			//or change it into a date range picker
			$('.input-daterange').datepicker({
				autoclose : true
			});

		})
	</script>
</body>
</html>





