<%@page import="JDBC.JDBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="goods.ItemsDAO"%>

<%@page import="account.cart"%>
<%@page import="java.util.*"%>
<%@page import="goods.Items"%>
<%@page import="account.CartItem"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>

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
			var Maxnum = 100;
			//alert(Nownum);
			(Nownum + 1 <= Maxnum) ? t.val(Nownum + 1) : Maxnum;
			 
			
			
			//ajax修改
			$.ajax({
		            type: 'post', //可选get
		            url: 'bookservlet', //这里是接收数据的程序
		            data: 'num=' + $("#num1").val(), //传给PHP的数据，多个参数用&连接
		            dataType: 'Json', //服务器返回的数据类型 可选XML ,Json jsonp script html text等
		             		            
		            success: function(msg) {
		                //这里是ajax提交成功后，程序返回的数据处理函数。msg是返回的数据，数据类型在dataType参数里定义！
		                document.getElementById("total").innerHTML = msg;
		                //$("#duoduo").innerHTML = msg;
		            },
		            error: function() {
		                alert('对不起失败了');
		            }
		      })			
		})

		//ajax修改
		//1、获取页面中所有text，并添加onchange相应函数		
		//2、请求地址：bookservlet
		//3、请求参数为：method:
		//4在方法中，获取属性，并获取购物车对象，调用service
		//5、传回jason数据
		//6、更新当前页面
		
		
		$(".min").click(function() {
			var t = $(this).next();
			Nownum = parseInt(t.val());
			(Nownum - 1 <= 0) ? 0 : t.val(Nownum - 1);

			setTotal();
		})

		$(".text_box").blur(function() {
			var t = $(".text_box");
			Nownum = parseInt(t.val());

			var Maxnum = 100;
			if (Nownum > Maxnum) {
				alert("库存不足");
				$(".text_box").val(Maxnum);
			}
		})
		function setTotal() {
			p = parseInt($("#getprice").text());
			n = parseInt($(".text_box"));
			$("#total").val(p * n);
		}
		setTotal();
	})
</script>

</head>
<body>
	<div style="background-color: #2DC1A3">
		<jsp:include page="login_header.jsp" />
	</div>
	<%
		int userid = Integer.parseInt((String) session.getAttribute("loginid"));
		JDBConnection con = new JDBConnection();
		String sql2 = "select * from cart where userid=" + userid;
	%>

<form action="makeorder.jsp" method="post">
	<table align="center" border="1">
		<td colspan=6 align="center"><h3>您购买的商品为：</h3></td>
		<tr bgcolor="#EED2EE">
			<td width="100">书本ID</td>
			<td width="150">书本名称</td>
			<td width="150">购买数量</td>
			<td width="100">单价（元）</td>
			<td width="120">小结（元）</td>
			<td width="130">处理</td>
		</tr>
		<%
			try {
				ResultSet rs = con.executeQuery(sql2);
				if (!rs.isBeforeFirst()) {
					out.print("您尚未添加任何商品，请前往购物");
					response.setHeader("refresh", "2;home.jsp");
				} else 
				{
					int i = 1;
					int n = 1;
					/* out.print(i); */
					while (rs.next()) {
		%>
		<tr>
			<td><input name="<%="bookid"+n%>" value="<%=rs.getInt(3)%>" /></td>
			<%-- <span class="UNUsednum" style="display:none"><%=ci.getitems().getKucun()%></span> --%>
			<td><%=rs.getString(4)%></td>
			<td><input class="min" type="button" value="-" /> 
			
			
			<input
				type="text" size=3 class="text_box" name="<%="num"+i%>"
				value="<%=rs.getInt(6)%>"> <input class="add" name=""
				type="button" value="+" /></td>
			<td><span id="getprice"><%=rs.getFloat(5)%></span></td>
			
			
			
			<td><input name="total"
				value="<%=rs.getInt(6) * rs.getFloat(5)%>" readonly=”readonly”
				style="border: 0;"></input></td>
			<td><a href="delete.jsp?id=<%=rs.getInt(1)%>"> 删除</a></td>

		</tr>
		<%
			i++;
			n++;
			/* out.print(i); */
			}
				}
			} catch (Exception e) {
			}
		%>
		<tr>
			<td colspan=3 align="center">所有商品总价格为：</td>

			<td colspan=3></td>

		</tr>

		<tr>
			<td colspan=3 align="right"><a href="Seegoods.jsp">继续购物</a></td>
			<td colspan=3 align="right"><input type="submit" value="下单" /></td>
		</tr>
	</table>
</form>
</body>
</html>