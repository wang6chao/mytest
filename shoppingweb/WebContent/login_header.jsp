<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
</head>
<body>
	<h2 align="center">
		<%
			Object user1 = session.getAttribute("loginname");
			if (user1 != null) {
				out.print("欢迎您:" + user1);
			}
		%>
	</h2>
</body>
</html>