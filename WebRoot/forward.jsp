<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
window.setTimeout("location.href='<%=basePath%>index.jsp'",3000);
</script>
</head>
<body>
${message}，将在3秒过后返回首页。。。
</body>
</html>