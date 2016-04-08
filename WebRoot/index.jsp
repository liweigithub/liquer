<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>欢迎来到清泉酒厂官方网站</title>
		<link rel="shortcut icon" href="favicon.ico"/>
		<link rel="bookmark" href="favicon.ico"/>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="swfobject/swfobject.js"></script>
		<script type="text/javascript" src="swfaddress/swfaddress.js"></script>
		<script type="text/javascript" src="swffit/swffit.js"></script>
		<style type="text/css" media="screen">
html,body,body.sidebars {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

object {
	outline: none;
}
</style>
	</head>

	<body bgcolor="#000000">
		<div id="websiteid">
			<script type="text/javascript">
	var flashvars = {};
	var params = {
		quality : "high",
		wmode : "window",
		devicefont : "false",
		allowscriptaccess : "always",
		bgcolor : "#000000",
		allowFullScreen : "true",
		scale : "noScale",
		salign : "lt",
		menu : "false"
	};
	var attributes = {
		id : "flash"
	};
	swfobject.embedSWF("template.swf", "websiteid", "100%", "100%", "9.0.0",
			"expressInstall.swf", flashvars, params, attributes);
	swffit.fit("flash", 980, 670);
</script>
		</div>
	</body>
</html>
