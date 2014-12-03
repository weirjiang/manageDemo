<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div data-role="page">
	<div data-role="content">
		<div class="idxtitle">乾坤车城工作流平台</div>
		<form method="post" class="idx-form" action="">
			<input type="hidden" name="preRequestUrl" value="${preRequestUrl}">
			<input type="text" name="username" id="username" placeholder="输入用户名">
			<span class="error-txt" id="error1" style="display: none">请输入用户名</span>
			<input type="password" name="password" id="password" placeholder="输入密码"> 
			<span class="error-txt" id="error2" style="display: none">${error}</span> 
			<input type="button" value="登录" onclick="javascript:login();">
		</form>
	</div>
</div>
<script>
	function login() {
		if ('' == $('#username').val()) {
			$('#error1').show();
			return;
		}
		$('#error1').hide();
		if ('' == $('#password').val()) {
			$('#error2').text('请输入密码');
			$('#error2').show();
			return;
		}
		$('#error2').hide();
		$.ajax({
			type : 'POST',
			url : '${basePath}passport/ajaxLogin',
			data : {
				username : $("#username").val(),
				password : $("#password").val()
			},
			success : function(data) {
				if (data == 'ok') {
					window.location.href = '${basePath}task/backlog';
				} else {
					$('#error2').text(data);
					$('#error2').show();
				}
			}
		});
	}
</script>
