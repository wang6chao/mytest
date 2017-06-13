
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>支付成功</title>
<link rel="stylesheet" type="text/css" href="css/loginpage.css" />
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	background-color: #EAEAEA;
}

div {
	background-color: #1E90FF;
}

.center-in-center {
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}
</style>

<script type="text/javascript">
	window.onload = function() {
		var obj = document.getElementsByTagName("html")[0];
		obj.onclick = function() {
			window.location = "home.jsp"
		}
	}
</script>

</head>
<body>
	<div id="divBackground">
		<img src="images/register.jpg" />
	</div>

	<div class="center-in-center">
		<h3>付款成功，祝您购物愉快!</h3>
		<p align="center">点击任意地方，3s后将跳转到书城首页</p>
	</div>

	<%
		//response.setHeader("refresh", "2;home.jsp");
	%>
</body>
</html>