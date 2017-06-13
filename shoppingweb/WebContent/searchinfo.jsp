<%@page import="java.sql.ResultSet"%>
<%@page import="JDBC.JDBConnection"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>个人中心</title>
</head>
<style>
table, table tr th, table tr td {
	border: 1px solid #0094ff;
}

table {
	width: 300px;
	min-height: 45px;
	line-height: 25px;
	text-align: center;
	border-collapse: collapse;
}
</style>
<body>

<h3>您的个人信息（请妥善保管）：</h3>
<%
	String a =  (String )session.getAttribute("loginid");
	JDBConnection con = new JDBConnection();
	String sql = "select * from userinfo where id=" + a;
	//out.print(sql);
	try {
		ResultSet rs = con.executeQuery(sql);
		while (rs.next()) {
%>

<table bgcolor="#EEE9E9">
	<tr>
		<td width="100">id</td>
		<td><%=rs.getInt(1)%></td>
	</tr>

	<tr>
		<td>用户名</td>
		<td><%=rs.getString(2)%></td>
	</tr> 

	<%-- <tr>
		<td >用户密码</td>
		<td><%=rs.getString(3)%></td>
	</tr> --%>

	<tr>
		<td>性别(1:男 2：女)</td>
		<td><%=rs.getInt(4)%></td>
	</tr>

	<tr>
		<td>真实姓名</td>
		<td><%=rs.getString(5)%></td>
	</tr>

	<tr>
		<td>Tel</td>
		<td><%=rs.getString(6)%></td>
	</tr>

	<tr>
		<td>Email</td>
		<td><%=rs.getString(7)%></td>
	</tr>
</table>
<%
	}
	} catch (Exception e) {
	}
%>
</body>
</html>