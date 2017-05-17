<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../common/taglib.jsp"%>

<div id="navbar" class="navbar navbar-default">
  <script type="text/javascript">
    try{ace.settings.check('navbar' , 'fixed')}catch(e){}
  </script>

  <div class="navbar-container" id="navbar-container">
    <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
      <span class="sr-only">Toggle sidebar</span>

      <span class="icon-bar"></span>

      <span class="icon-bar"></span>

      <span class="icon-bar"></span>
    </button>

    <div class="navbar-header pull-left">
      <a href="#"  class="navbar-brand" >

          <img src="<%=request.getContextPath() %>/img/logo_3.png" height="27px" class="inline "/>
          <img src="<%=request.getContextPath() %>/img/logo_4.png" height="27px" class="inline hidden-480"/>

      </a>
    </div>

    <div class="navbar-buttons navbar-header pull-right" role="navigation">
      <ul class="nav ace-nav">

        <li class="grey">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <i class="ace-icon fa fa-tasks"></i>
            <span class="badge badge-grey">4</span>
          </a>

          <ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
            <li class="dropdown-header">
              <i class="ace-icon fa fa-check"></i>
              4 个办理中
            </li>

            <li class="dropdown-content ace-scroll" style="position: relative;"><div class="scroll-track" style="display: none;"><div class="scroll-bar"></div></div><div class="scroll-content" style="max-height: 200px;">
              <ul class="dropdown-menu dropdown-navbar">
                <li>
                  <a href="#">
                    <div class="clearfix">
                      <span class="pull-left">XX</span>
                      <span class="pull-right">XX</span>
                    </div>

                    <div class="progress progress-mini">
                      <div class="progress-bar" style="width:65%"></div>
                    </div>
                  </a>
                </li>

                <li>
                  <a href="#">
                    <div class="clearfix">
                      <span class="pull-left">XX</span>
                      <span class="pull-right">XX</span>
                    </div>

                    <div class="progress progress-mini">
                      <div class="progress-bar progress-bar-danger" style="width:35%"></div>
                    </div>
                  </a>
                </li>

                <li>
                  <a href="#">
                    <div class="clearfix">
                      <span class="pull-left">XX</span>
                      <span class="pull-right">XX</span>
                    </div>

                    <div class="progress progress-mini">
                      <div class="progress-bar progress-bar-warning" style="width:15%"></div>
                    </div>
                  </a>
                </li>

                <li>
                  <a href="#">
                    <div class="clearfix">
                      <span class="pull-left">XX</span>
                      <span class="pull-right">XX</span>
                    </div>

                    <div class="progress progress-mini progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width:90%"></div>
                    </div>
                  </a>
                </li>
              </ul>
            </div></li>

            <li class="dropdown-footer">
              <a href="#">
                详情
                <i class="ace-icon fa fa-arrow-right"></i>
              </a>
            </li>
          </ul>
        </li>

        <li class="light-blue">
          <a data-toggle="dropdown" href="#" class="dropdown-toggle">
            <i class="ace-icon fa  fa-cogs"></i>
                                    <span>
                                        欢迎您,
                                        ${loginEmployee.empNm}
                                    </span>

            <i class="ace-icon fa fa-caret-down"></i>
          </a>

          <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
            <li style="display: block;">
              <a href="#" onclick="document.getElementById('updatePassword').click()">
                <i class="ace-icon fa fa-cog"></i>
                修改密码
              </a>
            </li>


            <li>
              <a href="#" onclick="if(confirm('确认退出？')){location.href='<%=request.getContextPath()%>/logOutOperate.do'}">
                <i class="ace-icon fa fa-power-off"></i>
                退出系统
              </a>
            </li>
            <c:if test="${empRoleSize >0}">
            <li>
              <a href="#" onclick="top.window.location.replace('<%=request.getContextPath() %>/')">
                <i class="ace-icon fa fa-cog"></i>
                切换角色
              </a>
            </li>
            </c:if>
          </ul>
        </li>
      </ul>
    </div>
  </div><!-- /.navbar-container -->
</div>
