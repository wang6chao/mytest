<%@ page language="java" 
    pageEncoding="UTF-8"%>
 
<%@page import="JDBC.JDBConnection"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="goods.ItemsDAO"%>
<%@page import="goods.Items"%>
<%@page import="java.util.List"%>
<%@page import=" java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/homecss.css" />
<style>
body {background-color:#F0F8FF;}
</style>
</head>
<body>

<div>
				<h2>艺术类书籍</h2>
				<hr>
 
				<br>

				<center>
					<table width="750" height="60" cellpadding="0" cellspacing="0"
						border="0">
						<tr>
							<td>
								<!-- 商品循环开始 -->
								 <%
						 		ItemsDAO itemsDao = new ItemsDAO();
						 		ArrayList<Items> list = itemsDao.getItemsByFenlei(3);
						 		if (list != null && list.size() > 0) {
						 			for (int i = 0; i < list.size(); i++) {
						 			Items item = list.get(i);
 								%>
								<div>
									<dl>
										<dt>
											<a class="" href="details.jsp?id=<%=item.getId()%>"><img
												src="<%=item.getImg()%>" width="120" height="90" border="1" /></a>
										</dt>
										<dd class="dd_name"><%=item.getGoodsname()%></dd>
										<dd class="dd_authorname">作者：<%=item.getAuthor()%></dd>
										<dd class="dd_publishing">出版社：<%=item.getPublishing()%></dd>
										<dd class="dd_city">
											备注:<%=item.getInfo()%>&nbsp;&nbsp;价格:￥
											<%=item.getPrice()%></dd>
										<dd class="dd_city">
											库存:
											<%=item.getKucun()%>&nbsp;&nbsp;销量：<%=item.getXiaoliang()%></dd>
									</dl>
								</div> <!-- 商品循环结束 --> <%
 	}
 	}
 %>
							</td>
						</tr>
					</table>
				</center>
			</div>
</body>
</html>