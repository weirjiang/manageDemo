<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="format-detection" content="telephone=no"/>
<title>乾坤车城工作流平台</title>
<base href="${basePath}" />
<link rel="stylesheet" href="${basePath}css/jquery.mobile-1.4.5.min.css">
<link rel="stylesheet" href="${basePath}css/jqm-datebox-1.4.4.min.css">
<link rel="stylesheet" href="${basePath}css/main.css" />
<link rel="stylesheet" href="${basePath}css/jquery.jscroll.css" />
<link rel="stylesheet" href="${basePath}css/jquery.scrollToTop.css" />
<script src="${basePath}js/jquery-1.11.1.min.js"></script>
<script src="${basePath}js/jquery.mobile-1.4.5.min.js"></script>
<script src="${basePath}js/jqm-datebox-1.4.4.core.min.js"></script>
<script src="${basePath}js/jqm-datebox-1.4.4.mode.calbox.min.js"></script>
<script src="${basePath}js/jqm-datebox.lang.utf8.js"></script>
<script src="${basePath}js/jquery.form.js"></script>
<script src="${basePath}js/jquery.PrintArea.js"></script>
<script src="${basePath}js/accounting.min.js"></script>
<script src="${basePath}js/common.js"></script>
<script src="${basePath}js/jquery.jscroll.js"></script>
<script src="${basePath}js/jquery.scrollToTop.js"></script>
<script>
	$(function() {
	    $("#toTop").scrollToTop(1000);
	});

	function logout() {
		$.ajax({
			type: 'get',
			url: '${basePath}passport/ajaxLogout',
			success: function(data) {
				if (data == 'ok') {
					window.location.href = '${basePath}';
				}
			}
		});
	}
</script>
</head>
<body>
	<a href="#top" id="toTop"></a>
	<tiles:insertAttribute name="body" />
</body>
</html>
