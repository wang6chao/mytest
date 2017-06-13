<%@ page language="java" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
</head>
<body>


<% 
	response.setCharacterEncoding("utf-8");
	String nn=request.getParameter("num");	
	try{ 
	int n=Integer.parseInt(nn);
	}
	catch(){};
	out.print(n);
%>
</body>
</html>