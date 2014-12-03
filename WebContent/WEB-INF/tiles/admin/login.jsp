<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Free HTML5 Bootstrap Admin Template</title>
    <base href="${basePath}" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <link id="bs-css" href="${basePath}css/bootstrap-cerulean.min.css" rel="stylesheet">

    <link href="${basePath}css/charisma-app.css" rel="stylesheet">
    <link href='${basePath}bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='${basePath}bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='${basePath}bower_components/chosen/chosen.min.css' rel='stylesheet'>
    <link href='${basePath}bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='${basePath}bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='${basePath}bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='${basePath}css/jquery.noty.css' rel='stylesheet'>
    <link href='${basePath}css/noty_theme_default.css' rel='stylesheet'>
    <link href='${basePath}css/elfinder.min.css' rel='stylesheet'>
    <link href='${basePath}css/elfinder.theme.css' rel='stylesheet'>
    <link href='${basePath}css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='${basePath}css/uploadify.css' rel='stylesheet'>
    <link href='${basePath}css/animate.min.css' rel='stylesheet'>

    <!-- jQuery -->
    <script src="/manage/js/jquery-1.8.0.min.js"></script>
  <!--   <script src="bower_components/jquery/jquery.min.js"></script> -->

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href="img/favicon.ico">

</head>

<body>
<div class="ch-container">
    <div class="row">
        
    <div class="row">
        <div class="col-md-12 center login-header">
            <h2>Welcome to Charisma</h2>
        </div>
        <!--/span-->
    </div><!--/row-->

    <div class="row">
        <div class="well col-md-5 center login-box">
            <div class="alert alert-info">
                Please login with your Username and Password.
            </div>
            <div id="msg" class="alert alert-danger" style="display: none;">请输入用户名和密码</div>
            <form class="form-horizontal" action="" method="post" onsubmit="return false;">
                <fieldset>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
                        <input type="text" class="form-control" placeholder="Username" id="userName">
                    </div>
                    <div class="clearfix"></div><br>

                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                        <input type="password" class="form-control" placeholder="Password" id="password">
                    </div>
                    <div class="clearfix"></div>

                    <div class="input-prepend">
                        <label class="remember" for="remember"><input type="checkbox" id="remember"> Remember me</label>
                    </div>
                    <div class="clearfix"></div>

                    <p class="center col-md-5">
                        <button type="submit" class="btn btn-primary" onclick="javascript:login();">Login</button>
                    </p>
                </fieldset>
            </form>
        </div>
        <!--/span-->
    </div><!--/row-->
</div><!--/fluid-row-->

</div><!--/.fluid-container-->

<!-- external javascript -->

<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- library for cookie management -->
<script src="js/jquery.cookie.js"></script>
<!-- calender plugin -->
<script src='bower_components/moment/min/moment.min.js'></script>
<script src='bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='js/jquery.dataTables.min.js'></script>

<!-- select or dropdown enhancer -->
<script src="bower_components/chosen/chosen.jquery.min.js"></script>
<!-- plugin for gallery image view -->
<script src="bower_components/colorbox/jquery.colorbox-min.js"></script>
<!-- notification plugin -->
<script src="js/jquery.noty.js"></script>
<!-- library for making tables responsive -->
<script src="bower_components/responsive-tables/responsive-tables.js"></script>
<!-- tour plugin -->
<script src="bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
<!-- star rating plugin -->
<script src="js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="js/charisma.js"></script>

	
	<script>
		$(function(){
			alert("hhe");
		});
		function login(){
			$.ajax({
				type : 'POST',
				url : '${basePath}member/doLogin',
				data : {
					username : $("#userName").val(),
					password : $("#password").val()
				},
				success : function(data) {
					if (data.status == 'ok') {
						$('#msg').hide();
						window.location.href = '${basePath}member/homemgr/i';
					} else {
						$('#msg').show();
						$('#msg').html("用户名或密码错误");
					}
				}
			});
		};
	</script>
</body>
</html>
