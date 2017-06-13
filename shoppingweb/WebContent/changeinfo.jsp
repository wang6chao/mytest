<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="JDBC.JDBConnection"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>

<style>
table, table tr th, table tr td {
	border: 1px solid #0094ff;
}

table {
	width: 500px;
	min-height: 35px;
	line-height: 25px;
	text-align: center;
	border-collapse: collapse;
}
</style>
</head>
<body>

	<h3>修改个人信息</h3>
		<form action="updatedeal.jsp" name="form2" method="post">
	<table>

		<%
			String a = (String) session.getAttribute("loginid");
			JDBConnection con = new JDBConnection();
			String sql = "select * from userinfo where id=" + a;
			//out.print(sql);
			try {
				ResultSet rs = con.executeQuery(sql);
				while (rs.next()) {
		%>
	
		<tr>
			<td bgcolor="#EED2EE">用户id</td>
			<td><input name="userid" type="text" value="<%=rs.getInt(1)%>"
				readonly=”readonly” style="border: 0; background: transparent;"></td>
		</tr>

		<tr>
			<td bgcolor="#EED2EE">用户名</td>
			<td><input name="username" type="text"
				value="<%=rs.getString(2)%>" readonly=”readonly”
				style="border: 0; background: transparent;"></td>
		</tr>

		<tr>
			<td bgcolor="#EED2EE">用户密码</td>
			<td><input name="userpwd" type="password"></td>
		</tr>

		<tr>
			<td bgcolor="#EED2EE">*性别</td>
			<td><input type="radio" name="Sex" value="1">Male <br>
				<input type="radio" name="Sex" value="0">Female</td>
		</tr>

		<tr>
			<td bgcolor="#EED2EE">真实姓名</td>
			<td><input name="Realname" type="text" /></td>
		</tr>

		<tr>
			<td bgcolor="#EED2EE">Tel</td>
			<td><input name="Telnum" type="text" /></td>
		</tr>

		<tr>
			<td bgcolor="#EED2EE">Email</td>
			<td><input type="text" name="Email" /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><input type="submit" value="修改" />&nbsp &nbsp <input
				type="reset" value="清空" /></td>
		</tr>
	</table>
	</form>
	<%
		}
		} catch (Exception e) {
		}
	%>
</body>
</html>