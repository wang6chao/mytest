<%@page import="goods.ItemsDAO"%>
<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="account.cart"%>
<%@page import="java.util.*"%>
<%@page import="goods.Items"%>
<%@page import="account.CartItem"%>

<%
	cart c = (cart) session.getAttribute("cart");
	if (c == null) {
		c = new cart();
		session.setAttribute("cart", c);
	}

	double totalPrice = c.getTotalPrice();

	request.setCharacterEncoding("GBK");
	String action = request.getParameter("action");

	Map products = (HashMap) session.getAttribute("items");

	if (action != null && action.trim().equals("add")) {

		//获取到商品id,获取该商品的属性
		ItemsDAO OneItem = new ItemsDAO();
		Items oneitem = OneItem.getItemsById(Integer.parseInt(request.getParameter("id")));

		CartItem ci = new CartItem();
		ci.setitems(oneitem);

		//ci.setCount()  购买商品的数量
		//获取购买商品的数量并赋值
		String itemCount = request.getParameter("itemCount");
		int n = Integer.parseInt(itemCount);
		ci.setCount(n);
		c.add(ci, n);
	}
	if (action != null && action.trim().equals("delete")) {
		String id = request.getParameter("id");
		c.deleteItemById(id);
	}
%>

<%
	List<CartItem> items = c.getItems();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>购物车</title>
<style>
table, table tr th, table tr td {
	border: 1px solid #0094ff;
}

table {
	min-height: 25px;
	line-height: 25px;
	text-align: center;
	border-collapse: collapse;
}
</style>
<style>
body {
	background-color: #F0F8FF;
}
</style>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
<script>
	$(function() {
		$(".add").click(function() {
			var t = $(this).prev();
			Nownum = parseInt(t.val());
			var maxnum = $(".UNUsednum").text();
			var Maxnum = parseInt(maxnum);
			//alert(Nownum);
			(Nownum + 1 <= Maxnum) ? t.val(Nownum + 1) : Maxnum;
		})

		$(".min").click(function() {
			var t = $(this).next();
			Nownum = parseInt(t.val());
			(Nownum - 1 <= 0) ? 0 : t.val(Nownum - 1);
		})
	})
</script>
</head>
<body>
	<div style="background-color: #2DC1A3">
		<jsp:include page="login_header.jsp" />
	</div>
	<div>


		<form action="makeorder.jsp" method="get">
			
			<table align="center" border="1">
				<td colspan=6 align="center"><h3>您购买的商品为：</h3></td>
				<tr bgcolor="#EED2EE">
					<td width="100">书本ID</td>
					<td width="150">书本名称</td>
					<td width="150">购买数量</td>
					<td width="100">单价（元）</td>
					<!-- <td width="120">小结（元）</td> -->
					<td width="130">处理</td>
				</tr>


				<%
					for (Iterator<CartItem> it = items.iterator(); it.hasNext();) {
						CartItem ci = it.next();
				%>
				<tr>
					<td><input value="<%=ci.getitems().getId()%>" type="text" name="itemid"
						readonly="readonly" style="background-color: transparent"></input></td>
					<span class="UNUsednum" style="display: none"><%=ci.getitems().getKucun()%></span>
					<td><%=ci.getitems().getGoodsname()%></td>
					<td>
						<input class="min" type="button" value="-" />
					 	<input name="<%="p" + ci.getitems().getId() %>"
							type="text" class="text_box" size=3 name="<%="p"%>"
							value="<%=ci.getCount()%>"> 
						<input class="add"
							type="button" value="+" /></td>
					<td><span id="getprice"><%=ci.getitems().getPrice()%></span></td>
					<%-- <td><%=ci.getitems().getPrice() * ci.getCount()%></td> --%>
					<td><a
						href="buy.jsp?action=delete&id=<%=ci.getitems().getId()%>">删除</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan=3 align="center"><a href="Seegoods.jsp">继续购物</a></td>
					<td colspan=3><input type="submit" value="下单"></input></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>