<%@ page language="java" 
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<% 
    request.setCharacterEncoding("utf-8"); 
%> 
<% 
    List<String>info=(List<String>)request.getAttribute("info");
    if(info!=null){   //判断是否有内容 
        Iterator<String>iter=info.iterator();//  实例化Iterator 
        while(iter.hasNext()){ 
%> 
             <h4><%=iter.next()%></h4> 
<%           
        } 
    } 
%>

</body>
</html>