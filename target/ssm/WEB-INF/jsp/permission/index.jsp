<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path=request.getContextPath();
	request.setAttribute("path", path);
%>
<html>
<head>
<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
  		<title>权限管理系统</title>
  		<!-- 自适应设置 -->
  		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<!-- Tell the browser to be responsive to screen width -->
	  	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	  	<link rel="stylesheet" href="${path}/static/css/bootstrap/css/bootstrap.min.css">
	  	<!-- Font Awesome -->
	  	<link rel="stylesheet" href="${path}/static/css/font-awesome/css/font-awesome.min.css">
	  	<!-- Ionicons -->
	  	<link rel="stylesheet" href="${path}/static/css/Ionicons/css/ionicons.min.css">
	  	<!-- Theme style -->
	  	<link rel="stylesheet" href="${path}/static/css/plugins/css/AdminLTE.css">
	  	<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
	        page. However, you can choose any other skin. Make sure you
	        apply the skin class to the body tag so the changes take effect. -->
	  	<link rel="stylesheet" href="${path}/static/css/plugins/css/skins/skin-blue.min.css">
  		<!-- Google Font -->
  		<link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
		<div class="wrapper">
		
		  <!-- Main Header -->
		  <header class="main-header">
		
		    <!-- Logo -->
		    <a href="index2.html" class="logo">
		      <!-- mini logo for sidebar mini 50x50 pixels -->
		      <span class="logo-mini"><b>权</b>限</span>
		      <!-- logo for regular state and mobile devices -->
		      <span class="logo-lg"><b>权限</b>管理系统</span>
		    </a>
		
		    <!-- Header Navbar -->
		    <nav class="navbar navbar-static-top" role="navigation">
		      <!-- Sidebar toggle button-->
		      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
		        <span class="sr-only">Toggle navigation</span>
		      </a>
		      <!-- Navbar Right Menu -->
		      <div class="navbar-custom-menu">
		        <ul class="nav navbar-nav">
		          <!-- Messages: style can be found in dropdown.less-->
		          <li class="dropdown messages-menu">
		            <!-- Menu toggle button -->
		            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
		              <i class="fa fa-envelope-o"></i>
		              <span class="label label-success">4</span>
		            </a>
		            <ul class="dropdown-menu">
		              <li class="header">You have 4 messages</li>
		              <li>
		                <!-- inner menu: contains the messages -->
		                <ul class="menu">
		                  <li><!-- start message -->
		                    <a href="#">
		                      <div class="pull-left">
		                        <!-- User Image -->
		                        <img src="${path}/static/img/user2-160x160.jpg" class="img-circle" alt="User Image">
		                      </div>
		                      <!-- Message title and timestamp -->
		                      <h4>
		                        Support Team
		                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
		                      </h4>
		                      <!-- The message -->
		                      <p>Why not buy a new awesome theme?</p>
		                    </a>
		                  </li>
		                  <!-- end message -->
		                </ul>
		                <!-- /.menu -->
		              </li>
		              <li class="footer"><a href="#">See All Messages</a></li>
		            </ul>
		          </li>
		          <!-- /.messages-menu -->
		
		          <!-- Notifications Menu -->
		          <li class="dropdown notifications-menu">
		            <!-- Menu toggle button -->
		            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
		              <i class="fa fa-bell-o"></i>
		              <span class="label label-warning">10</span>
		            </a>
		            <ul class="dropdown-menu">
		              <li class="header">You have 10 notifications</li>
		              <li>
		                <!-- Inner Menu: contains the notifications -->
		                <ul class="menu">
		                  <li><!-- start notification -->
		                    <a href="#">
		                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
		                    </a>
		                  </li>
		                  <!-- end notification -->
		                </ul>
		              </li>
		              <li class="footer"><a href="#">View all</a></li>
		            </ul>
		          </li>
		          <!-- Tasks Menu -->
		          <li class="dropdown tasks-menu">
		            <!-- Menu Toggle Button -->
		            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
		              <i class="fa fa-flag-o"></i>
		              <span class="label label-danger">9</span>
		            </a>
		            <ul class="dropdown-menu">
		              <li class="header">You have 9 tasks</li>
		              <li>
		                <!-- Inner menu: contains the tasks -->
		                <ul class="menu">
		                  <li><!-- Task item -->
		                    <a href="#">
		                      <!-- Task title and progress text -->
		                      <h3>
		                        Design some buttons
		                        <small class="pull-right">20%</small>
		                      </h3>
		                      <!-- The progress bar -->
		                      <div class="progress xs">
		                        <!-- Change the css width attribute to simulate progress -->
		                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
		                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
		                          <span class="sr-only">20% Complete</span>
		                        </div>
		                      </div>
		                    </a>
		                  </li>
		                  <!-- end task item -->
		                </ul>
		              </li>
		              <li class="footer">
		                <a href="#">View all tasks</a>
		              </li>
		            </ul>
		          </li>
		          <!-- User Account Menu -->
		          <li class="dropdown user user-menu">
		            <!-- Menu Toggle Button -->
		            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
		              <!-- The user image in the navbar-->
		              <img src="${path}/static/img/user2-160x160.jpg" class="user-image" alt="User Image">
		              <!-- hidden-xs hides the username on small devices so only the image appears. -->
		              <span class="hidden-xs">${user.userName }</span>
		            </a>
		            <ul class="dropdown-menu">
		              <!-- The user image in the menu -->
		              <li class="user-header">
		                <img src="${path}/static/img/user2-160x160.jpg" class="img-circle" alt="User Image">
		
		                <p>
		                  admin 超级管理员
		                  <small>2012年从事本工作</small>
		                </p>
		              </li>
		              <!-- Menu Body -->
		              <li class="user-body">
		                <div class="row">
		                  <div class="col-xs-4 text-center">
		                    <a href="#">关注</a>
		                  </div>
		                  <div class="col-xs-4 text-center">
		                    <a href="#">Sales</a>
		                  </div>
		                  <div class="col-xs-4 text-center">
		                    <a href="#">粉丝</a>
		                  </div>
		                </div>
		                <!-- /.row -->
		              </li>
		              <!-- Menu Footer-->
		              <li class="user-footer">
		                <div class="pull-left">
		                  <a href="#" class="btn btn-default btn-flat">个人资料</a>
		                </div>
		                <div class="pull-right">
		                  <a href="${path}/login/loginOut" class="btn btn-default btn-flat">退出系统</a>
		                </div>
		              </li>
		            </ul>
		          </li>
		        </ul>
		      </div>
		    </nav>
		  </header>
		  <!-- Left side column. contains the logo and sidebar -->
		  <aside class="main-sidebar">
		
		    <!-- sidebar: style can be found in sidebar.less -->
		    <section class="sidebar">
		
		      <!-- Sidebar Menu -->
		      <ul class="sidebar-menu" data-widget="tree">
		        <li class="header">导航菜单</li>
		        <!-- Optionally, you can add icons to the links -->
		        <c:forEach items="${user.pers}" var="per" varStatus="status">
		        	<%-- ${per.name } --%>
		        <li class="${status.index eq 0 ? 'action':''} treeview">
		          <a href="${path}/${per.url}"><i class="fa ${per.icon}"></i> <span>${per.name}</span>
		            <span class="pull-right-container">
		                <i class="fa fa-angle-left pull-right"></i>
		              </span>
		          </a>
		          <ul class="treeview-menu">
		          	<c:forEach items="${per.subs }" var="sub">
		            <li class="active"><a target="url" href="${path}/${sub.url }"><i class="fa ${sub.icon }"></i> ${sub.name }</a></li>
		           </c:forEach>
		           <!--  <li><a href="#"><i class="fa fa-circle-o"></i> 角色管理</a></li>
		            <li><a href="#"><i class="fa fa-circle-o"></i> 权限管理</a></li> -->
		          </ul>
		        </li>
		        </c:forEach>
		        <!-- <li class="treeview">
		          <a href="#"><i class="fa fa-spotify"></i> <span>商品管理</span>
		            <span class="pull-right-container">
		                <i class="fa fa-angle-left pull-right"></i>
		              </span>
		          </a>
		          <ul class="treeview-menu">
		            <li><a href="#">Link in level 2</a></li>
		            <li><a href="#">Link in level 2</a></li>
		          </ul>
		        </li> -->
		      </ul>
		      <!-- /.sidebar-menu -->
		    </section>
		    <!-- /.sidebar -->
		  </aside>
		
		  <!-- Content Wrapper. Contains page content -->
		  <div class="content-wrapper">
		    <!-- Content Header (Page header) -->
		    <!--<section class="content-header">
		      <h1>
		        Page Header
		        <small>Optional description</small>
		      </h1>
		      <ol class="breadcrumb">
		        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
		        <li class="active">Here</li>
		      </ol>
		    </section>-->
		
		    <!-- Main content -->
		    <section class="content">
		
		      <!--------------------------
		        | Your Page Content Here |
		        -------------------------->
				<ol class="breadcrumb" id="nav_title" style="position:static;float:none;">
			        <li class="active"><i class="fa fa-home" style="font-size:20px;position:relative;top:2px;left:-3px;"></i> &nbsp; 首页</li>
			        <li class="active">测试</li>
			    </ol>
			    <!--name="url" 对应左边导航栏的target的值  -->
			    <iframe name="url" scrolling="yes" frameborder="0" style="width:100%;min-height:600px;overflow:visible;background:#fff;" src="${path}/user/index"></iframe>
		    </section>
		    <!-- /.content -->
		  </div>
		  <!-- /.content-wrapper -->
		
		  <!-- Main Footer -->
		 <!--  <footer class="main-footer">
		    To the right
		    <div class="pull-right hidden-xs">
		      	版本V1.0
		    </div>
		    Default to the left
		    <strong>版权 &copy; 2018 <a href="#">贵州华信科技有限公司</a>.</strong> 版权归属.
		  </footer> -->
		
		  <!-- Control Sidebar -->
		  <aside class="control-sidebar control-sidebar-dark">
		    <!-- Create the tabs -->
		    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
		      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
		      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
		    </ul>
		    <!-- Tab panes -->
		    <div class="tab-content">
		      <!-- Home tab content -->
		      <div class="tab-pane active" id="control-sidebar-home-tab">
		        <h3 class="control-sidebar-heading">Recent Activity</h3>
		        <ul class="control-sidebar-menu">
		          <li>
		            <a href="javascript:;">
		              <i class="menu-icon fa fa-birthday-cake bg-red"></i>
		
		              <div class="menu-info">
		                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
		
		                <p>Will be 23 on April 24th</p>
		              </div>
		            </a>
		          </li>
		        </ul>
		        <!-- /.control-sidebar-menu -->
		
		        <h3 class="control-sidebar-heading">Tasks Progress</h3>
		        <ul class="control-sidebar-menu">
		          <li>
		            <a href="javascript:;">
		              <h4 class="control-sidebar-subheading">
		                Custom Template Design
		                <span class="pull-right-container">
		                    <span class="label label-danger pull-right">70%</span>
		                  </span>
		              </h4>
		
		              <div class="progress progress-xxs">
		                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
		              </div>
		            </a>
		          </li>
		        </ul>
		        <!-- /.control-sidebar-menu -->
		
		      </div>
		      <!-- /.tab-pane -->
		      <!-- Stats tab content -->
		      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
		      <!-- /.tab-pane -->
		      <!-- Settings tab content -->
		      <div class="tab-pane" id="control-sidebar-settings-tab">
		        <form method="post">
		          <h3 class="control-sidebar-heading">General Settings</h3>
		
		          <div class="form-group">
		            <label class="control-sidebar-subheading">
		              Report panel usage
		              <input type="checkbox" class="pull-right" checked>
		            </label>
		
		            <p>
		              Some information about this general settings option
		            </p>
		          </div>
		          <!-- /.form-group -->
		        </form>
		      </div>
		      <!-- /.tab-pane -->
		    </div>
		  </aside>
		  <!-- /.control-sidebar -->
		  <!-- Add the sidebar's background. This div must be placed
		  immediately after the control sidebar -->
		  <div class="control-sidebar-bg"></div>
		<!-- jQuery 3 -->
		<script src="${path}/static/js/jquery.js"></script>
		<!-- Bootstrap 3.3.7 -->
		<script src="${path}/static/css/bootstrap/js/bootstrap.js"></script>
		<!-- AdminLTE App -->
		<script src="${path}/static/css/plugins/js/adminlte.js"></script>
	</body>
</html>