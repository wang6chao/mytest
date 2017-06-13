
<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="JDBC.JDBConnection"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="goods.ItemsDAO"%>
<%@page import="goods.Items"%>
<%@page import="java.util.List"%>
<%@page import=" java.util.ArrayList"%>
<link rel="stylesheet" type="text/css" href="css/homecss.css" />
<style>
body {background-color:#F0F8FF;}
</style>
<div>
	<h2>商品展示|<a href="cartinfoout.jsp">查看购物车</a href="home.jsp">|<a>返回商城首页</a></h2>
	<hr>

	<form action="search.jsp" method=post>
		<table border=0 bordercolor="green">
			<tr>
				<td><strong>查询图书</strong></td>
				<td>书名: <input type="text" name=bookName style="width: 80">
					&nbsp;
				</td>
				<td>作者: <input type="text" name=author style="width: 80">
					&nbsp;
				</td>
				<td>出版社: <input type="text" name=publisher style="width: 80">
					&nbsp;
				</td>
				<td><input type="submit" value="搜索" id="find"></td>
			</tr>
		</table>
	</form>
	<br>

	<div id="somain">
	<center>
		<table width="750" height="60" cellpadding="0" cellspacing="0"
			border="0">
			<tr>
				<td>
			<%		
 				ItemsDAO itemsDao = new ItemsDAO();
 				ArrayList<Items> list = itemsDao.getAllItems();
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
							<dd class="dd_authorname">
								作者：<%=item.getAuthor()%></dd>
							<dd class="dd_publishing">
								出版社：<%=item.getPublishing()%></dd>
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
</div>

