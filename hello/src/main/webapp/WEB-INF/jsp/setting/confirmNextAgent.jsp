<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.suixingpay.sms.orm.uap.domain.Org"%>
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
                                        预览新增代理商信息
                                    </h5>
                                </div>
                                <div class="widget-body">
                                    <div class="widget-main no-padding ">
                                        <div class="widget-main ">
                                            <form id="searchForm" class="form-inline form-horizontal" method="post" action="/org/continueToModify.do">
                                                <input type="hidden" name="orgInfo" value='<%= JSONArray.fromObject((Org)request.getAttribute("org")).toString().replace("\\", "").replace("[", "").replace("]", "").replace("dateCreated", "dateCreatedStr").replace("lastUpdated", "lastUpdatedStr").replace("'", "\"")%>'>
                                                <input type="hidden" value="add1" name="action">
                                                <div class=" col-xs-12">
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构名称<span class="red">*</span>:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgNm }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >状态<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgStsStr }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgStsStr }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-100">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构地址<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding width-80"  >
                                                            <label class="form-control input-small width-95   view-control  "
                                                                   data-content="${org.orgAddr }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgAddr }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >机构电话:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgTelNo }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgTelNo }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >联系人邮箱<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.contactMail }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.contactMail }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >邮政编码:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgZip }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgZip }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm  width-300px">
                                                        <label   class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left" >传真:</label>
                                                        <div class="col-sm-8  no-padding">
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgFax }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgFax }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联系人<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.contact }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.contact }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >联系人手机<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.contactTelNo }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.contactTelNo }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >所属城市<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.provNm }${org.cityNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.provNm }${org.cityNm }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构经营模式<span class="red">*</span>:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgRunPropStr }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgRunPropStr }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >机构注册号:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.orgRegistNum }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.orgRegistNum }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法人名称:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.legalPersonNm }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.legalPersonNm }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-300px ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册资本:</label>
                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.registCapitall }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.registCapitall }</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group form-group-sm width-100 ele">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >注册地址:</label>
                                                        <div class="col-sm-8  no-padding width-80"  >
                                                            <label class="form-control input-small width-95   view-control  "
                                                                   data-content="${org.registAddress }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.registAddress }</label>
                                                        </div>
                                                    </div>
 													<div class="form-group form-group-sm width-300px ">
                                                        <label  class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >法人身份证:</label>

                                                        <div class="col-sm-8  no-padding"  >
                                                            <label class="form-control input-small width-200px   view-control  "
                                                                   data-content="${org.legalCard }" data-placement="bottom" data-trigger="hover" data-rel="popover"
                                                                    >${org.legalCard }</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 ele2">
                                                    <c:if test="${not empty citys }">
                                                    <h3 class="header smaller lighter green">代理区域</h3>
                                                    <c:forEach items="${citys }" var="city">
	                                                     <div class="col-sm-3 no-padding">
	                                                        <label>
	                                                            <span class="lbl">${city}</span>
	                                                        </label>
	                                                     </div>
                                                    </c:forEach></c:if>
                                                </div>
                                                <div class="row"></div>
                                                <div class="form-actions center widget-color-normal5">
                                                    <button class="btn btn-danger btn-sm" type="button" onclick="confirmSaveOrg()">
                                                        <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                                        确认保存
                                                    </button>
                                                    <button class="btn  btn-sm" type="submit" >
                                                        <span class="ace-icon fa fa-power-off icon-on-right bigger-110"></span>
                                                        继续修改
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
        </div><!-- /.main-content -->



        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
            <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
        </a>
    </div><!-- /.main-container -->



<!-- basic scripts -->

    <%@include file="../layout/common.alljs.jsp"%>
<!-- inline scripts related to this page -->
    <script type="text/javascript">
    jQuery(function($) {
	    	if(${org.orgRunProp}==2)
            $('.ele').show();
        else
            $('.ele').hide()
	    $('[data-rel=popover]').popover({container:'body'});
	})
    function confirmSaveOrg(){
	    	$.ajax({
	    		type:'post',
	    		url:"/org/save.do",
	    		data:$('#searchForm').serialize()
	    		,
	    		async:false,
	    		success:function(data){
	    			data = eval("("+data+")")
	    			alert(data.message);
	    			if(data.message.substr(0,4)=="保存成功"){
	    				window.parent.$.fancybox.close();
	    				window.parent.location.reload();
	    			}
	    		},
	    		error:function(data){
	    			data = eval("("+data+")")
	    			if(data == ""){
	        			alert('数据提交失败');
	    			}else{
	    				alert(data.message);
	    			}
	    		}
	    	});
    }
  
</script>
</body>
</html>











