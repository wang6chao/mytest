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
	int userid = Integer.parseInt(request.getParameter("userid"));
	
	String repwd = request.getParameter("userpwd");
	String sex=request.getParameter("Sex");
	String telnum=request.getParameter("Telnum");
	String realname=request.getParameter("Realname");
	String email=request.getParameter("Email");
	
	String sql ="update userinfo set password='"+repwd+"',sex="+sex+",realname='"+realname+"',tel='"+telnum+"',email='"+email+"' where id="+userid+"";
	/* out.print(sql); */
	boolean right= con.executeUpdate(sql);
	if(right){
		out.print("修改成功,2s后跳转到信息输出页面");
		response.setHeader("refresh", "2;myinfo.jsp"); 
	}
	else{
		out.print("修改失败");
	} 
%>

</body>
</html>