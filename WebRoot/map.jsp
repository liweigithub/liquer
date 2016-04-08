<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta content="telephone=no,email=no" name="format-detection">
<title>清泉酒厂在线地图</title>
<link rel="stylesheet" href="<%=basePath%>/css/animate.min.css" />
<!-- 动画效果 -->
<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main.css?v=1.0" />
<link rel="stylesheet" href="<%=basePath%>/css/baguettebox.min.css">
<link rel="stylesheet" href="<%=basePath%>/css/zzsc.css">
<script src="js/baguettebox.min.js"></script>
<script type="text/javascript"	src="http://webapi.amap.com/maps?v=1.3&key=b5c7246ab8acf3e6bf88003ebad60c31"></script>
<script src="<%=basePath%>/js/baguettebox.min.js"></script>
<style type="text/css">
table {
	color: black;
}

body {
	font-size: 12px;
}

#tip {
	position: absolute;
	right: 5px;
	bottom: 20px;
	background-color: #fff;
	padding: 6px;
	border: solid 1px silver;
	border-radius: 3px;
	box-shadow: 3px 4px 3px 0px silver;
}

#tip input[type='button'] {
	float: left;
	padding: 6px;
	color: #09f;
	border: solid 1px #09f;
	background-color: #fff;
	margin: 3px 9px;
	cursor: pointer;
	border-radius: 3px;
}

div img {
	margin: 3px;
}
</style>
</head>
<body>
	<div id="mapContainer"></div>
	<script type="text/javascript">
		var infoWindow;
		//定义动态查看事件
		function activity() {
			alert("111");
		}
		//初始化点击事件
		var makerClick = function(e) {
			openInfo();
		}
		//初始化地图对象，加载地图
		var map = new AMap.Map("mapContainer", {
			resizeEnable : true,
			zoom : 13,
			center : [ 102.603024, 29.505606 ]
		});
		//添加点标记
		var marker = new AMap.Marker({
			position : [ 102.603024, 29.505606 ],
			icon : "images/map_l.png",
			animation : "AMAP_ANIMATION_DROP",
			clickable : true
		});
		marker.setMap(map);

		//给点标记注册单击事件
		AMap.event.addListener(marker, 'click', makerClick);
		//在指定位置打开信息窗体
		function openInfo() {
			//构建信息窗体中显示的内容
			var info = [];
			info.push("<div><img src=\" images/map_title.png \"/> ");
			info.push("<hr>");
			info.push("<div><a target='_blank' href='<%=basePath%>'><img width='290px' height='85px' style='margin-top:-14px' src=' images/map_banner.jpg'/></a>");
			info.push("<table style='margin-top:-70px'>");
			info.push("<tr><th>地址:<th><td>汉源县,大田乡,新中村,加油站附近<td></tr>");
			info.push("<tr><th>电话:<th><td>17051107107<td></tr>");
			info.push("<tr><th>邮箱:<th><td>1099532501@qq.com<td></tr>");
			info.push("<tr><th>动态:<th><td><a href='javascript:;' class='flipInX dialog'>点击查看</a><td></tr>");
			info.push("</table>");
			infoWindow = new AMap.InfoWindow({
				content : info.join("<br/>")
			//使用默认信息窗体框样式，显示信息内容
			});
			infoWindow.open(map, [ 102.603024, 29.505606 ]);
		}
		openInfo();
	</script>
	<!-- 控制弹框的div-->
	<div id="HBox">
		<!--控制图片的div -->
		<div class="baguetteBoxOne gallery">
			<a href="images/1-3.jpg"><img src="images/thumbs/1-3.jpg"></a>
			<a href="images/1-4.jpg"><img src="images/thumbs/1-4.jpg"></a>
			<a href="images/1-5.jpg"><img src="images/thumbs/1-5.jpg"></a>
			<a href="images/1-6.jpg"><img src="images/thumbs/1-6.jpg"></a>
			<a href="images/1-3.jpg"><img src="images/thumbs/1-3.jpg"></a>
			<a href="images/1-4.jpg"><img src="images/thumbs/1-4.jpg"></a>
			<a href="images/1-5.jpg"><img src="images/thumbs/1-5.jpg"></a>
			<a href="images/1-6.jpg"><img src="images/thumbs/1-6.jpg"></a>
			<a href="images/1-3.jpg"><img src="images/thumbs/1-3.jpg"></a>
			<a href="images/1-4.jpg"><img src="images/thumbs/1-4.jpg"></a>
			<a href="images/1-5.jpg"><img src="images/thumbs/1-5.jpg"></a>
			<a href="images/1-6.jpg"><img src="images/thumbs/1-6.jpg"></a>
			<a href="images/1-6.jpg"><img src="images/thumbs/1-6.jpg"></a>
			<a href="images/1-6.jpg"><img src="images/thumbs/1-6.jpg"></a>
			<a href="images/1-6.jpg"><img src="images/thumbs/1-6.jpg"></a>
			<a href="images/1-3.jpg"><img src="images/thumbs/1-3.jpg"></a>
			<a href="images/1-4.jpg"><img src="images/thumbs/1-4.jpg"></a>
			<a href="images/1-5.jpg"><img src="images/thumbs/1-5.jpg"></a>
			<a href="images/1-6.jpg"><img src="images/thumbs/1-6.jpg"></a>
			<a href="images/1-3.jpg"><img src="images/thumbs/1-3.jpg"></a>
			<a href="images/1-4.jpg"><img src="images/thumbs/1-4.jpg"></a>
			<a href="images/1-5.jpg"><img src="images/thumbs/1-5.jpg"></a>
			<a href="images/1-6.jpg"><img src="images/thumbs/1-6.jpg"></a>
			<a href="images/1-3.jpg"><img src="images/thumbs/1-3.jpg"></a>
			<a href="images/1-4.jpg"><img src="images/thumbs/1-4.jpg"></a>
			<a href="images/1-5.jpg"><img src="images/thumbs/1-5.jpg"></a>
			<a href="images/1-6.jpg"><img src="images/thumbs/1-6.jpg"></a>
			<a href="images/1-6.jpg"><img src="images/thumbs/1-6.jpg"></a>
			<a href="images/1-6.jpg"><img src="images/thumbs/1-6.jpg"></a>
			<a href="images/1-6.jpg"><img src="images/thumbs/1-6.jpg"></a>
		</div>
	</div>
	<!--控制弹框的js -->
	<script src="<%=basePath%>/js/jquery.js"></script>
	<script src="<%=basePath%>/js/jquery.hDialog.min.js"></script>
	<script>
		//图片播放
		baguetteBox.run('.baguetteBoxOne', {
			animation : 'fadeIn',
		});
		//点击弹框
		$(function() {
			var $el = $('.dialog');
			$el.hDialog();
		});
	</script>
	<a href="javascript:;" class="flipInX dialog">flipInX动画</a>
</body>
</html>