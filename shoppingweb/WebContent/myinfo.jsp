<%@page import="java.sql.ResultSet"%>
<%@page import="JDBC.JDBConnection"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="css/homecss.css" />
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script>
	$(function() {
		$("#search").click(function() {
			$("#Content-Main").load("searchinfo.jsp");
		})
		$("#change").click(function() {
			$("#Content-Main").load("changeinfo.jsp");
		})
		$("#tocart").click(function() {
			$("#Content-Main").load("cartinfo.jsp");
		})
	})
</script>
</head>
<body>

	<div id="Header">
		<br><jsp:include page="login_header.jsp" /></div>

	<div id="Content">
		<div id="Content-Left">
			<p class="setcolor">用户功能列表</p>
			<ul>
				<li><a id="search" href="#">查看个人信息</a></li>
				<li><a id="change" href="#">修改个人信息</a></li>
				<li><a id="tocart" href="cartinfoout.jsp">我的购物车</a></li>
				<li><a id="toshop" href="home.jsp">前往购物</a></li>
				<li><a href="logout.jsp">退出登录</a></li>
			</ul>
		</div>
		<div id="Content-Main">
		</div>

	</div>
</body>
</html>
