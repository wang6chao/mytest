
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>书城首页</title>
<link rel="stylesheet" type="text/css" href="css/homecss.css" />
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script>
	$(function() {
		$("#all_book").click(function() {
			$("#Content-Main").load("Seegoods.jsp");
		})
		$("#com_book").click(function() {
			$("#Content-Main").load("com_book.jsp");
		})
		$("#famous_book").click(function() {
			$("#Content-Main").load("famous_book.jsp");
		})
		$("#art_book").click(function() {
			$("#Content-Main").load("art_book.jsp");
		})
		$("#magazine").click(function() {
			$("#Content-Main").load("magazine.jsp");
		})
		$("#find").click(function() {
			$("#somain").load("search.jsp");
		})
	})
</script>
</head>
<body>
	<div id="Header">
		<div>
			<h1 align="center">欢迎来到我的书城</h1>
			<%
				String flag = (String) session.getAttribute("loginname");
				if (flag != null) {
			%>
			<div id="smile2" class="div-left">
				<%
					Object user1 = session.getAttribute("loginname");
						out.print("欢迎您:" + user1);
				%>
				|<a href="login.jsp">退出</a>
			</div>
			<%
				} else {
			%>
			<div id="smile1" class="div-left">
				<a href="login.jsp">登录</a>|<a href="register.jsp">注册</a>
			</div>
			<%
				}
			%>

			<div class="div-right">
				<a href="myinfo.jsp ">个人中心</a>|<a href="cartinfoout.jsp">查看购物车</a>|<a href="#">我的订单</a>
			</div>
		</div>
	</div>
	<div id="Content">
		<div id="Content-Left">
			<p>
				<a href="#">书本分类：</a><br>
			</p>
			<ul>
				<li><a id="all_book" href="#">所有书籍</a></li>
				<li><a id="com_book" href="#">计算机类</a></li>
				<li><a id="famous_book" href="#">课外名著</a></li>
				<li><a id="art_book" href="#">艺术类</a></li>
				<li><a id="magazine" href="#">杂志</a></li>
			</ul>
			<br> <br> <br> <br> <br>
			<p>
				<a href="intobackground.jsp"> 进入后台</a>
			</p>
		</div>
		
		<div id="Content-Main">
			<jsp:include page="Seegoods.jsp" />
		</div>
	</div>
		
	
	<div class="Clear">
		<!--如何你上面用到float,下面布局开始前最好清除一下。-->
	</div>
	
	
	<div id="Footer" class="box">
		<p align="center">
			<a href="#">所有权 by Mr.W</a>
		</p>
	</div>
</body>
</html>