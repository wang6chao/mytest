<%@page import="goods.zzz"%>
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
	<h2 align="left">生成订单</h2>
	<%
		int userid = Integer.parseInt((String) session.getAttribute("loginid"));
		String username = (String) session.getAttribute("loginname");

		String bookid1 = request.getParameter("bookid1");
		//String bookid2 = request.getParameter("bookid2");		
		
		String booknum1 = request.getParameter("num1");
		//String booknum2 = request.getParameter("num2");

		JDBConnection con = new JDBConnection();
		
		//对订单的数据进行操作，书本的库存减少，销量增加
		String sql ="select * from bookitems where id="+ bookid1;
		ResultSet rs1 = con.executeQuery(sql);
		rs1.next();
		int nownum1=rs1.getInt(8)-Integer.parseInt(booknum1);
		int nowxiaoliang = rs1.getInt(9)+Integer.parseInt(booknum1);
		String sql1 = "update bookitems set bookitems.kucun="+nownum1+",bookitems.xiaoliang="+nowxiaoliang+" where bookitems.id="+bookid1;
		boolean flag=con.executeUpdate(sql1);
		if(!flag){
			out.print("有用吗");
		}
		
		
		//对用户的购物车进行操作，按下下单之后，购物车清空
		String sql3="delete from cart where userid ="+userid;
		boolean flag1=con.executeUpdate(sql3);

			String sql2 = "select * from dingdanstatus";
			ResultSet rs = con.executeQuery(sql2);


		
	
	%>


	<%
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.util.Date currentTime = new java.util.Date();//得到当前系统时间
		String str_date1 = formatter.format(currentTime); //将日期时间格式化 	
		out.print(str_date1);
		zzz uid = new zzz();
		String uuid = uid.getOrderIdByUUId();
	%>
	<form action="makeorderdeal.jsp" method="post">
		<table>
			<tr>
				<td>订单编号</td>
				<td><input style="border: 0px; background: none;"
					readonly="readonly" name="uuid" value="<%=uuid%>"/></td>
			</tr>

			<tr>
				<td>收货人姓名：</td>
				<td><input style="border: 0px; background: none;"
					readonly="readonly" value="<%=username%>" name="username"/></td>
			</tr>
			<tr>
				<td>地址：</td>
				<td><input name="address" /></td>
			</tr>

			<tr>
				<td>交易时间：</td>
				<td><input style="border: 0px; background: none;" name="date"
					readonly="readonly" value="<%=str_date1%>" /></td>
			</tr>
			<tr>
				<td>订单状态</td>
				<td><select name="status">
						<%
							while (rs.next()) {
								String ss = rs.getString(2);
								int a = rs.getInt(1);
						%>
						<option value="<%=a%>"><%=ss%></option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td><input type="submit" value="提交" /></td>
				<td><input type="reset" value="重置"></td>
			</tr>
		</table>


	</form>
	<!-- 	//ci.setCount()  购买商品的数量
		//获取购买商品的数量并赋值
		/* String itemCount =(String) request.getParameter("itemnum");
		int n = Integer.parseInt(itemCount);
		ci.setCount(n);
		c.add(ci, n);
		
		

		JDBConnection con = new JDBConnection();
		String sql1 = "select * from cart where itemid="+itemid+"and userid="+userid;
		
		ResultSet rs = con.executeQuery(sql1);
 

			/* cart c = (cart) session.getAttribute("cart");
			if (c == null) {
				c = new cart();
				session.setAttribute("cart", c);
			}

			double totalPrice = c.getTotalPrice();
			Map products = (HashMap) session.getAttribute("items"); */

			//获取到商品id,获取该商品的属性
			/* ItemsDAO OneItem = new ItemsDAO();
			Items oneitem = OneItem.getItemsById(Integer.parseInt(request.getParameter("itemid")));

			CartItem ci = new CartItem();
			ci.setitems(oneitem); */

			//ci.setCount()  购买商品的数量
			//获取购买商品的数量并赋值
			/* String itemCount =(String) request.getParameter("itemnum");
			int n = Integer.parseInt(itemCount);
			ci.setCount(n);
			c.add(ci, n);
 */
			
			
			/* //---------------------------数据库的操作	
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
			} */

	%> -->
</body>
</html>