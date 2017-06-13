<%@ page language="java" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>登录失败</title>
</head>
<body>
<h3>登录失败，3s后将跳转到<a href="login.jsp">登录页面</a></h3>
<%
	response.setHeader("refresh", "3;login.jsp");
%>
</body>
</html>