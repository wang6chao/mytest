
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
if (action != null && action.trim().equals("update")) {
	for (int i = 0; i < c.getItems().size(); i++) {
		CartItem ci = c.getItems().get(i);
		int count = Integer.parseInt(request.getParameter("p" + ci.getitems().getId()));
		ci.setCount(count);
	}
}
%>
  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
  
<%  
List<CartItem> items = c.getItems();  
%>  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">  
<title>购物车</title>  
  <script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
<script>
	$(function() {
		$(".add").click(function() {
			var t = $(this).prev();
			Nownum = parseInt(t.val());
			/* var maxnum = $(".UNUsednum").text();
			var Maxnum = parseInt(maxnum); */
			//alert(Nownum);
			(Nownum + 1 <= 100) ? t.val(Nownum + 1) : 100;
			$(t).val().onchange();
		})

		$(".min").click(function() {
			var t = $(this).next();
			Nownum = parseInt(t.val());
			(Nownum - 1 <= 0) ? 0 : t.val(Nownum - 1);
		})
		
		$.fn.update = function(value){
	        $(".text_box").each(function(){
	            if(value!=this.value){
	                this.value = value; 
	                this.onchange();
	            }
	        });
	     };
		
	})
</script>
</head>  
<body>  
  
<!-- c的值是：<%=(c == null) %> items的值是：<%=(items == null) %> -->  
<form action="BBuy.jsp" method="get">  
<input type="hidden" name="action" value="update"/>  
<table align="center" border="1">  
    <tr>  
        <td>产品ID</td>  
        <td>产品名称</td>  
        <td>购买数量</td>  
        <td>单价</td>  
        <td>总价</td>  
        <td>处理</td>  
    </tr>  
    <%  
    for(Iterator<CartItem> it = items.iterator(); it.hasNext(); ) {  
        CartItem ci = it.next();  
        %>  
        <tr>  
            <td><%=ci.getitems().getId() %></td>  
            <td><%=ci.getitems().getGoodsname() %></td>  
            <td>  <input class="min" name="" type="button" value="-" /> 
                <input type="text" size=3 class="text_box"  name="<%="p" + ci.getitems().getId() %>" value="<%=ci.getCount() %>"   
                    onkeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;"  
                    onchange="document.forms[0].submit()">     
                    <input class="add" name="" type="button" value="+" />            
            </td>  
            <td><%=ci.getitems().getPrice() %></td>  
            <td><%=ci.getitems().getPrice()*ci.getCount() %></td>  
            <td>  
                  
                <a href="Buy.jsp?action=delete&id=<%=ci.getitems().getId() %>">删除</a>  
                  
            </td>  
        </tr>  
        <%  
    }  
    %>  
      
      
    <tr>  
        <td colspan=3 align="right">  
            所有商品总价格为：  
        </td>  
        <td colspan=3><%=c.getTotalPrice() %></td>  
    </tr>  
      
      
    <tr>  
    <!-- <td colspan=3>  
             <a href="javascript:document.forms[0].submit()">修改</a>   
        </td>  -->  
        <td colspan=6 align="right">  
            <a href="">下单</a>         
        </td>  
    </tr>  
</table>  
</form>  
</body>  
</html>  