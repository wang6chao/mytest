<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>错误信息提示</title>
</head>
<body>
<% 
    request.setCharacterEncoding("utf-8"); 
%> 
<% 
    List<String>info=(List<String>)session.getAttribute("info");
    if(info!=null){   //判断是否有内容 
        Iterator<String>iter=info.iterator();//  实例化Iterator 
        while(iter.hasNext()){ 
%> 
             <h4><%=iter.next()%></h4> 
<%           
        } 
    } 
%>
亲，请按照格式进行注册咯!<br>
请点击<a href="register.jsp">此处</a>返回注册页面
</body>
</html>