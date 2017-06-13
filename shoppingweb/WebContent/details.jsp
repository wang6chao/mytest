<%@page import="JDBC.JDBConnection"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="goods.ItemsDAO"%>
<%@page import="goods.Items"%>
<%@page import="java.util.List"%>
<%@page import=" java.util.ArrayList"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<style>
.special {
	width: 80px;
}
</style>
<style>
body {
	background-color: #F0F8FF;
}
</style>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script>
	$(function() {
		$(".add").click(function() {
			var t = $(this).prev();
			Nownum = parseInt(t.val());
			var maxnum = $(".Usednum").text();
			var Maxnum = parseInt(maxnum);
			//alert(Nownum);
			(Nownum + 1 <= Maxnum) ? t.val(Nownum + 1) : Maxnum;
		})

		$(".min").click(function() {
			var t = $(this).next();
			Nownum = parseInt(t.val());
			var maxnum = $(".Usednum").text();
			//var Maxnum = parseInt(maxnum);
			(Nownum - 1 <= 0) ? 0 : t.val(Nownum - 1);
		})

		$("#addcart").click(
				function() {
					var t = $(".text_box");
					itemCount = parseInt(t.val());
					var idnum = $(".idnum").text();
					var kucun = $(".Usednum").text();
					$(this).attr("href","buy.jsp?id=" + idnum + "&action=add&itemCount="+ itemCount + "&kucun=" + kucun)
				})

		$(".text_box").blur(function() {
			var t = $(".text_box");
			Nownum = parseInt(t.val());
			var maxnum = $(".Usednum").text();
			var Maxnum = parseInt(maxnum);
			if (Nownum > Maxnum) {
				alert("库存不足");
				$(".text_box").val(Maxnum);
			}
		})

	})
</script>

</head>
<body>

	<div style="background-color: #2DC1A3">
		<jsp:include page="login_header.jsp" />
	</div>
	<h1>
		商品详情|<a href="cartinfoout.jsp">查看购物车</a>
	</h1>
	<hr>
	<center>
		<table width="750" height="60" cellpadding="0" cellspacing="0"
			border="0">
			<tr>
				<!-- 商品详情Integer.parseInt(request.getParameter("id") -->
				<%
					ItemsDAO itemDAO = new ItemsDAO();
					Items item = itemDAO.getItemsById(Integer.parseInt(request.getParameter("id")));
					if (item != null) {
				%>
				<td width="70%" valign="top">
					<form action="addcart.jsp" method="post">
						<table>
							<tr>
								<td rowspan="7"><img src="<%=item.getImg()%>" width="180"
									height="260" /></td>

							</tr>
							<tr>
								<td>名称：</td>
								<td><input style="border: 0px; background: none;"
									readonly="readonly" name="itemname"
									value="<%=item.getGoodsname()%>"></input></td>
							</tr>

							<tr>
								<td>id：</td>
								<td><input style="border: 0px; background: none;"
									readonly="readonly" class="idnum" name="itemid"
									readonly=”readonly” value="<%=item.getId()%>"></input></td>
							</tr>
							<tr>
								<td>库存：</td>
								<td><span class="Usednum"><%=item.getKucun()%></span></td>
								</td>
							</tr>

							<tr>
								<td>销量：</td>
								<td><%=item.getXiaoliang()%></td>

							</tr>

							<tr>
								<td>价格：</td>
								<td><input style="border: 0px; background: none;"
									readonly="readonly" name="danjia" value="<%=item.getPrice()%>">元</input></td>
							</tr>
							<tr>
								<td>数量：</td>
								<td colspan=3><input class="min" name="" type="button"
									value="-" /> <input class="text_box" name="itemnum"
									type="text" value="1" style="width: 25px;" /> <input
									class="add" name="" type="button" value="+" /></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td><input type="submit" value="加入购物车"></input></td>
							</tr>
						</table>
					</form>
				</td>
				<%
					}
				%>
			
</body>
</html>