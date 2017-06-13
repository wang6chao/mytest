
<%@page import="JDBC.JDBConnection"%>
<%@page import="java.sql.ResultSet"%>


<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<%
	JDBConnection con = new JDBConnection();
%>

<body>

	<jsp:useBean id="dbBean" scope="page" class="JDBC.JDBConnection" />
	//

	<%
		
		String uuid = request.getParameter("uuid");
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String date = request.getParameter("date");
		int status = Integer.parseInt(request.getParameter("status"));

		String sql= "insert into account values('"+uuid+"','"+username+"','"+address+"','"+date+"','"+status+"')";
				

		boolean flag=con.executeUpdate(sql);
		if(flag){
			out.print("<h2>操作成功，请等待发货！</h2>");
			response.setHeader("refresh", "2;home.jsp");
		}
		else{
			out.print("<h2>操作失误，请重新提交！</h2>");
			//response.setHeader("refresh", "2;makeorder.jsp");
		}
	%>


</body>
</html>