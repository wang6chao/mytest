<%@page import="JDBC.JDBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="goods.ItemsDAO"%>
<%@page import="account.cart"%>
<%@page import="java.util.*"%>
<%@page import="goods.Items"%>
<%@page import="account.CartItem"%>

<%@page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<style>
body {
	background-color: #F0F8FF;
}
</style>
</head>
<body>
	<div style="background-color: #2DC1A3">
		<jsp:include page="login_header.jsp" />
	</div>

	<%
		int userid = Integer.parseInt((String) session.getAttribute("loginid"));
		String itemid = request.getParameter("itemid");
		String itemname = request.getParameter("itemname");
		String itemprice = request.getParameter("danjia");
		String itemnum = request.getParameter("itemnum");

		JDBConnection con = new JDBConnection();
		String sql1 = "select * from cart where itemid="+itemid+"and userid="+userid;
		
		ResultSet rs = con.executeQuery(sql1);

		if (rs.next()) {
			out.print("您已经添加过此商品，请不要重复添加!</br>");
			response.setHeader("refresh", "2;Seegoods.jsp");
		} else {
			//--------------------------链表的操作     跟数据库的操作相同
			cart c = (cart) session.getAttribute("cart");
			if (c == null) {
				c = new cart();
				session.setAttribute("cart", c);
			}
			double totalPrice = c.getTotalPrice();
			Map products = (HashMap) session.getAttribute("items");
			//获取到商品id,获取该商品的属性
			ItemsDAO OneItem = new ItemsDAO();
			Items oneitem = OneItem.getItemsById(Integer.parseInt(request.getParameter("itemid")));
			CartItem ci = new CartItem();
			ci.setitems(oneitem);
			//ci.setCount()  购买商品的数量
			//获取购买商品的数量并赋值
			String itemCount =(String) request.getParameter("itemnum");
			int n = Integer.parseInt(itemCount);
			ci.setCount(n);
			c.add(ci, n);
	
			//---------------------------数据库的操作	
			int index = 0;
			String maxIDSql = "select max(id) as id from cart";
			ResultSet sqlRst = con.executeQuery(maxIDSql);
			if (sqlRst.next()) {
				index = sqlRst.getInt("id") + 1;
			} else {
				index = 0;
			}
			String sql = "insert into cart values('" + index + "','" + userid + "','" + itemid + "','" + itemname
					+ "','" + itemprice + "','" + itemnum + "')";
			boolean result = con.executeUpdate(sql);
			if (result) {
				out.print("加入到购物车成功，3s将跳转到购物车页面");
				response.setHeader("refresh", "2;cartinfoout.jsp");
			} else {
				out.print("加入失败，程序报错");
			}
		}
	%>
</body>
</html>