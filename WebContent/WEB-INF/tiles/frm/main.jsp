<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!--
	===
	This comment should NOT be removed.
	
	Charisma v2.0.0
	
	Copyright 2012-2014 Muhammad Usman
	Licensed under the Apache License v2.0
	http://www.apache.org/licenses/LICENSE-2.0
	
	http://usman.it
	http://twitter.com/halalit_usman
	===
-->
<meta charset="utf-8">
<title>乾坤车城工作流后台管理系统</title>
<base href="${basePath}" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
<meta name="author" content="Muhammad Usman">

<!-- The styles -->
<link id="bs-css" href="${basePath}css/bootstrap-cerulean.min.css" rel="stylesheet">

<link href="${basePath}css/charisma-app.css" rel="stylesheet">
<link href="${basePath}bower_components/fullcalendar/dist/fullcalendar.css" rel="stylesheet">
<link href="${basePath}bower_components/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">
<link href="${basePath}bower_components/chosen/chosen.min.css" rel="stylesheet">
<link href="${basePath}bower_components/colorbox/example3/colorbox.css" rel="stylesheet">
<link href="${basePath}bower_components/responsive-tables/responsive-tables.css" rel="stylesheet">
<link href="${basePath}bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css" rel="stylesheet">
<link href="${basePath}css/jquery.noty.css" rel="stylesheet">
<link href="${basePath}css/noty_theme_default.css" rel="stylesheet">
<link href="${basePath}css/elfinder.min.css" rel="stylesheet">
<link href="${basePath}css/elfinder.theme.css" rel="stylesheet">
<link href="${basePath}css/jquery.iphone.toggle.css" rel="stylesheet">
<link href="${basePath}css/uploadify.css" rel="stylesheet">
<link href="${basePath}css/animate.min.css" rel="stylesheet">

<!-- jQuery -->
<script src="${basePath}bower_components/jquery/jquery.min.js"></script>
<script src="${basePath}js/jquery.form.js"></script>
<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- The fav icon -->
<link rel="shortcut icon" href="${basePath}img/favicon.ico">
</head>
<body>
	<!-- topbar starts -->
	<div class="navbar navbar-default" role="navigation">

		<div class="navbar-inner">
			<button type="button" class="navbar-toggle pull-left animated flip">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="admin/navigate/index"> 
				<img alt="Charisma Logo" src="${basePath}img/logo20.png" class="hidden-xs" /> <span>Charisma</span>
			</a>

			<!-- user dropdown starts -->
			<div class="btn-group pull-right">
				<button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					<i class="glyphicon glyphicon-user"></i>
					<span class="hidden-sm hidden-xs"> 账户</span> 
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#" class="btn-setting">个人资料</a></li>
					<li class="divider"></li>
					<li><a href="javascript:void(0);" onclick="javascript:logout();">注销</a></li>
				</ul>
			</div>
			<!-- user dropdown ends -->

			<!-- theme selector starts -->
			<div class="btn-group pull-right theme-container animated tada">
				<button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					<i class="glyphicon glyphicon-tint"></i>
					<span class="hidden-sm hidden-xs"> 主题/皮肤</span> 
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" id="themes">
					<li><a data-value="classic" href="#"><i class="whitespace"></i> 经典</a></li>
					<li><a data-value="cerulean" href="#"><i class="whitespace"></i> Cerulean</a></li>
					<li><a data-value="cyborg" href="#"><i class="whitespace"></i> Cyborg</a></li>
					<li><a data-value="simplex" href="#"><i class="whitespace"></i> Simplex</a></li>
					<li><a data-value="darkly" href="#"><i class="whitespace"></i> Darkly</a></li>
					<li><a data-value="lumen" href="#"><i class="whitespace"></i> Lumen</a></li>
					<li><a data-value="slate" href="#"><i class="whitespace"></i> Slate</a></li>
					<li><a data-value="spacelab" href="#"><i class="whitespace"></i> Spacelab</a></li>
					<li><a data-value="united" href="#"><i class="whitespace"></i> United</a></li>
				</ul>
			</div>
			<!-- theme selector ends -->

			<ul class="collapse navbar-collapse nav navbar-nav top-menu">
				<li><a href="${basePath}" title="访问工作流"><i class="glyphicon glyphicon-globe"></i></a></li>
				<li>
					<form class="navbar-search pull-left">
						<input placeholder="搜索" class="search-query form-control col-md-10" name="query" type="text">
					</form>
				</li>
			</ul>
		</div>
	</div>
	<!-- topbar ends -->
	<div class="ch-container">
		<div class="row">

			<!-- left menu starts -->
			<div class="col-sm-2 col-lg-2">
				<div class="sidebar-nav">
					<div class="nav-canvas">
						<div class="nav-sm nav nav-stacked"></div>
						<ul class="nav nav-pills nav-stacked main-menu">
							<li class="nav-header">&nbsp;</li>
							<li><a class="ajax-link" href="admin/navigate/index"><i class="glyphicon glyphicon-home"></i><span> 首页</span></a></li>
							<li><a class="ajax-link" href="admin/usermgr/i"><i class="glyphicon glyphicon-eye-open"></i><span> 用户管理</span></a></li>
							<li><a class="ajax-link" href="admin/rolemgr/i"><i class="glyphicon glyphicon-edit"></i><span> 角色管理</span></a></li>
							<li><a class="ajax-link" href="admin/dealer/i"><i class="glyphicon glyphicon-list-alt"></i><span> 供应商管理</span></a></li>
							<li><a class="ajax-link" href="admin/navigate/typography"><i class="glyphicon glyphicon-font"></i><span> 编码表</span></a></li>
							<li><a class="ajax-link" href="admin/navigate/report"><i class="glyphicon glyphicon-picture"></i><span> 报表统计</span></a></li>
							<li><a class="ajax-link" href="admin/dealer/dataTable"><i class="glyphicon glyphicon-picture"></i><span>dataTable</span></a></li>
							<li class="nav-header hidden-md"></li>
							<li class="accordion">
								<a href="#"><i class="glyphicon glyphicon-plus"></i><span> 订单管理</span></a>
								<ul class="nav nav-pills nav-stacked">
									<li><a href="#">修改订单</a></li>
									<li><a href="#">删除订单</a></li>
								</ul>
							</li>
							<li class="accordion">
								<a href="#"><i class="glyphicon glyphicon-plus"></i><span> 系统管理</span></a>
								<ul class="nav nav-pills nav-stacked">
									<li><a href="#">菜单管理</a></li>
									<li><a href="#">权限管理</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<tiles:insertAttribute name="content" />
			
		</div>

		<hr>

		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h3>Settings</h3>
					</div>
					<div class="modal-body">
						<p>Here settings can be configured...</p>
					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
						<a href="#" class="btn btn-primary" data-dismiss="modal">Save changes</a>
					</div>
				</div>
			</div>
		</div>

		<footer class="row">
			<p class="col-md-9 col-sm-9 col-xs-12 copyright">
				&copy; <a href="http://usman.it" target="_blank">Muhammad Usman</a>
				2012 - 2014
			</p>

			<p class="col-md-3 col-sm-3 col-xs-12 powered-by">
				Powered by: <a href="http://usman.it/free-responsive-admin-template">Charisma</a>
			</p>
		</footer>

	</div>
	<!--/.fluid-container-->

	<!-- external javascript -->

	<script src="${basePath}bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- library for cookie management -->
	<script src="${basePath}js/jquery.cookie.js"></script>
	<!-- calender plugin -->
	<script src="${basePath}bower_components/moment/min/moment.min.js"></script>
	<script src="${basePath}bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
	<!-- data table plugin -->
  	<script src="${basePath}js/jquery.dataTables.min.js"></script>

	<!-- select or dropdown enhancer -->
	<script src="${basePath}bower_components/chosen/chosen.jquery.min.js"></script>
	<script src="${basePath}js/main.js"></script>
	<!-- plugin for gallery image view -->
	<script src="${basePath}bower_components/colorbox/jquery.colorbox-min.js"></script>
	<!-- notification plugin -->
	<script src="${basePath}js/jquery.noty.js"></script>
	<!-- library for making tables responsive -->
	<script src="bower_components/responsive-tables/responsive-tables.js"></script>
	<!-- tour plugin -->
	<script src="bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
	<!-- star rating plugin -->
	<script src="${basePath}js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="${basePath}js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="${basePath}js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="${basePath}js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="${basePath}js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="${basePath}js/charisma.js"></script>
	
	<script>
		function logout() {
			$.ajax({
				type: 'get',
				url: '${basePath}passport/ajaxLogout',
				success: function(data) {
					if (data == 'ok') {
						window.location.href = '${basePath}admin/login';
					}
				}
			});
		}
	</script>
</body>
</html>
