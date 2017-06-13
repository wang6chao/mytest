<%@ page language="java" 
    pageEncoding="UTF-8"%>
<%@page import="JDBC.JDBConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
</head>
<body>

<% 
	JDBConnection con=new JDBConnection();
	int itemid = Integer.parseInt(request.getParameter("id"));	
	String sql="delete from cart where id="+itemid;
	boolean right= con.executeUpdate(sql);
	if(right){
		out.print("删除成功,2s后跳转到信息输出页面");
		response.setHeader("refresh", "2;cartinfoout.jsp"); 
	}
	else{
		out.print("删除失败");
	}
%>


</body>
</html>