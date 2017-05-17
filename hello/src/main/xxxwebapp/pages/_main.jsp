<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/taglib.jsp"%>
<script type="text/javascript">
function checkMore(){
	var notice=0;
	$("a[data-toggle='tab']").each(function(){
	    if($(this).attr("id")=='公告管理'){
	    	notice+=1;
	    }
	});
	if(notice<1){
		return true;
	}else{
		$("#公告管理").trigger("click");
		return false;
	}
	
}
</script>
<div>
	<div class="row">
		<div class="col-sm-6" style="display: none;">
			<div class="widget-box transparent">
				<div class="widget-header widget-header-flat">
					
				</div>

				<div class="widget-body">
					<div class="widget-main padding-4">
						<div id="sales-charts"></div>
					</div>
					<!-- /.widget-main -->
				</div>
				<!-- /.widget-body -->
			</div>
			<!-- /.widget-box -->
		</div>
		<!-- /.col -->

		<%--代办事项--%>
		<div class="col-sm-12"  style="display: none;">
			<div class="widget-box transparent">
				<div class="widget-header widget-header-flat">
					<h4 class="widget-title lighter">
						<i class="ace-icon fa 	fa-pencil-square-o "></i> 待办事项
					</h4>
				</div>

				<div class="widget-body">
					<div class="widget-main padding-4">
						<div class="accordion-style1 panel-group accordion-style2"
							id="accordion">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="#collapseOne" data-parent="#accordion"
											data-toggle="collapse"
											class="accordion-toggle width-80 inline"
											aria-expanded="false"
											onclick="fillCandidateTask();"
											> <i
											data-icon-show="ace-icon fa fa-angle-right"
											data-icon-hide="ace-icon fa fa-angle-down"
											class="bigger-110 ace-icon fa fa-angle-right"
											></i> &nbsp;待办理
										</a>

										<div class="inline right">
											<a href="#" class="label label-success arrowed">More</a>
										</div>
									</h4>
								</div>

								<div id="collapseOne" class="panel-collapse collapse"
									aria-expanded="false">
									<div class="panel-body no-padding">
										<div
											class="col-sm-12 tab-content no-border no-padding width-100">
											<div class="tab-pane in active" id="inbox">
												<div class="message-container">
													<div class="message-list-container">
														<div id="candidateTask" class="message-list"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title ">

										<a href="#collapseTwo" data-parent="#accordion"
											data-toggle="collapse"
											class="width-80 inline accordion-toggle collapsed"
											aria-expanded="false"
											onclick="fillAssigneeTask()"
											> <i
											data-icon-show="ace-icon fa fa-angle-right"
											data-icon-hide="ace-icon fa fa-angle-down"
											class="bigger-110 ace-icon fa fa-angle-right"></i> &nbsp;办理中
										</a>

										<div class="inline right">
											<a href="#" class="label label-success arrowed">More</a>
										</div>

									</h4>

								</div>

								<div id="collapseTwo" class="panel-collapse collapse"
									aria-expanded="false">
									<div class="panel-body no-padding">
										<div
											class="col-sm-12 tab-content no-border no-padding width-100">
											<div class="tab-pane in active" id="inbox">
												<div class="message-container">
													<div class="message-list-container">
														<div id="assigneeTask" class="message-list"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title ">

										<a href="#collapseThree" data-parent="#accordion"
											data-toggle="collapse"
											class="width-80 inline accordion-toggle collapsed"
											aria-expanded="false"
											onclick="fillCompleteTask();"
											> <i
											data-icon-show="ace-icon fa fa-angle-right"
											data-icon-hide="ace-icon fa fa-angle-down"
											class="bigger-110 ace-icon fa fa-angle-right"></i> &nbsp;已完成
										</a>

										<div class="inline right">
											<a href="#" class="label label-success arrowed">More</a>
										</div>

									</h4>

								</div>

								<div id="collapseThree" class="panel-collapse collapse"
									aria-expanded="false">
									<div class="panel-body no-padding">
										<div
											class="col-sm-12 tab-content no-border no-padding width-100">
											<div class="tab-pane in active" id="inbox">
												<div class="message-container">
													<div class="message-list-container">
														<div id="ownCompleteTask" class="message-list"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title ">

										<a href="#collapseFour" data-parent="#accordion"
											data-toggle="collapse"
											class="width-80 inline accordion-toggle collapsed"
											aria-expanded="false"
											onclick="fillFinishedTask();"
											> <i
											data-icon-show="ace-icon fa fa-angle-right"
											data-icon-hide="ace-icon fa fa-angle-down"
											class="bigger-110 ace-icon fa fa-angle-right"></i> &nbsp;已结束
										</a>

										<div class="inline right">
											<a href="#" class="label label-success arrowed">More</a>
										</div>

									</h4>

								</div>

								<div id="collapseFour" class="panel-collapse collapse"
									aria-expanded="false">
									<div class="panel-body no-padding">
										<div
											class="col-sm-12 tab-content no-border no-padding width-100">
											<div class="tab-pane in active" id="inbox">
												<div class="message-container">
													<div class="message-list-container">
														<div id="finishiedCompleteTask" class="message-list"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- /.widget-body -->
			</div>
			<!-- /.widget-box -->
		</div>
	</div>


	<%--通知--%>
	<div class="row"  style="display: none;">
		<div class="col-sm-12">
			<div class="widget-box">
				<div class="widget-header">

					<h3 class="widget-title lighter ">

						<span class="col-sm-7 no-padding"> <i
							class="ace-icon fa fa-comment blue"></i> 公告
						</span> <span class="col-sm-5"> <label class="pull-right inline">
						<form action="notice/more">
								<small class="muted hover"><a id="noticeMore" onclick="return checkMore()"
								href="<%=request.getContextPath()%>/notice/more"
									class="label label-success arrowed">More</a></small>
						</form>
						</label>
						</span>
					</h3>
				</div>

				<div class="widget-body">
					<div class="widget-main no-padding">
						<div class="dialogs" id="noticeMsg"></div>


					</div>


				</div>
				<!-- /.widget-main -->
			</div>
			<!-- /.widget-body -->
		</div>
		<!-- /.widget-box -->
	</div>

</div>
<!-- /.row -->


<!-- PAGE CONTENT ENDS -->


