<%@page import="JDBC.JDBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Register.RegisterTest"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<%
	JDBConnection connection = new JDBConnection();
%>

<body>

<jsp:useBean id="dbBean" scope="page" class="JDBC.JDBConnection" />	//

<%
	request.setCharacterEncoding("utf-8");
	String zname = request.getParameter("Rusername");
	String sex=request.getParameter("Sex");
	String zpwd = request.getParameter("Rpassword");
	String zpwd1 = request.getParameter("Rpassword1");
	String telnum=request.getParameter("Telnum");
	String realname=request.getParameter("Realname");
	String email=request.getParameter("Email");

	//转换
	int intsex =Integer.parseInt(sex);
	//检测是否有重名，返回布尔值isExist
	RegisterTest isPass =new RegisterTest();
	boolean isExist =isPass.isExist(zname);
	boolean isNull =isPass.isNull(zname, zpwd);		
	//检测两次密码输入是否相同
	boolean isSame =isPass.isSame(zpwd, zpwd1);
	//检测电话号码是否通过
	boolean isTel=isPass.checkMobileNumber(telnum);	
	//检测邮箱的格式
	boolean isEmail=isPass.checkEmail(email);
	
	
	
	//设置自动增长的id值index
	int index = 0; 
    String maxIDSql="select max(id) as id from userinfo"; 
	ResultSet sqlRst = connection.executeQuery(maxIDSql); 
    if(sqlRst.next()){ 
        index = sqlRst.getInt("id")+1;  
    }else{ 
        index = 0; 
    }  
	
	if(isExist){
		out.print("此账号已经被注册，请重新输入一个账号");
		response.setHeader("refresh", "2;register.jsp");
	}
	else if(!isNull){
		out.print("用户名或者密码为空");
		response.setHeader("refresh", "2;register.jsp");
	}
	else if(!isSame){
		out.print("输入密码不一致，请返回重新输入");
		response.setHeader("refresh", "2;register.jsp");
	}
	else if(!isEmail){
		out.print("邮箱格式不正确，请重新输入");
		response.setHeader("refresh", "2;register.jsp");
	}
	else if(!isTel){
		out.print("电话号码格式不正确，请重新输入");
		response.setHeader("refresh", "2;register.jsp");
	}
	else{
		isPass.add(index,zname, zpwd, intsex, realname, telnum, email);
	}
	
	/*--String str="";
	if(zname==null||zpwd==null)
	{
		out.print("用户名或密码不能为空，请返回重新注册");
		response.setHeader("refresh", "2;register.jsp");				
	}
	else if(!zpwd.equals(zpwd1))
	{
		out.print("两次密码输入不一致，请返回重新注册");
		response.setHeader("refresh", "2;register.jsp");
	}
	else
	{
		
		String sqlAdd="insert into userinfo values('','"+zname+"','"+zpwd+"','"+sex+"','"+realname+"','"+telnum+"','"+email+"')";
		dbBean.executeUpdate(sqlAdd);
		dbBean.closeConnection();
		out.print("成功了吗？");
		response.sendRedirect("register.jsp");
	}--*/
 %>
 
 <table width="400" border="1">
  <tr>
    <td>用户名</td>
    <td><%=zname %></td>
  </tr>
  <tr>
    <td>密码</td>
    <td><%=zpwd%></td>
  </tr>
  <tr>
  <tr>
    <td>性别</td>
    <td><%=sex%></td>
  </tr>
  <tr>
  <tr>
    <td>真实姓名</td>
    <td><%=realname%></td>
  </tr>
  <tr>
  <tr>
    <td>联系电话</td>
    <td><%=telnum%></td>
  </tr>
  <tr>
  </tr>
  <tr>
    <td>邮箱</td>
    <td><%=email %></td>
  </tr>
</table>
 点击<a href="login.html">此处</a>进行登录
 
</body>
</html>