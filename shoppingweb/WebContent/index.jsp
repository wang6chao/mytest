<%@ page language="java" import="java.util.List" pageEncoding="GBK"%>
<%@page import="com.hexiang.shoppingcart.biz.Product;"%>
<jsp:useBean id="product" scope="session" class="com.hexiang.shoppingcart.biz.Product"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>���ﳵ</title>
<style type="text/css">
/* ҳ��������ʽ */
body, td, input {
    font-family:Arial;
    font-size:12px;
}

/* ��������ʽ */
table.default {
    border-collapse:collapse;
    width:500px;
}

/* ���Ԫ����ʽ */
table.default td {
    border:1px solid black;
    padding:3px;
    height:27px;
}

/* ��ͷ��ʽ */
table.default td.item {
    background:#006699;
    color:#fff;
    text-align:center;
}

/* ���ﳵdiv��ʽ */
#shoppingcart {
    margin-top:20px;
}
</style>

<script type="text/javascript">
var xmlHttp;    //���ڱ���XMLHttpRequest�����ȫ�ֱ���

//���ڴ���XMLHttpRequest����
function createXmlHttp() {
    //����window.XMLHttpRequest�����Ƿ����ʹ�ò�ͬ�Ĵ�����ʽ
    if (window.XMLHttpRequest) {
       xmlHttp = new XMLHttpRequest();                  //FireFox��Opera�������֧�ֵĴ�����ʽ
    } else {
       xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");//IE�����֧�ֵĴ�����ʽ
    }
}

//ˢ�¹��ﳵ
function refreshCart() {
    sendRequest("");
}

//���ﳵ��Ӳ�Ʒ
function addProduct(pid) {
    sendRequest("&action=add&pid=" + pid);
}

//��չ��ﳵ
function emptyCart() {
    sendRequest("&action=empty");
}

//ɾ�����ﳵ�ڵ�����Ʒ
function delProduct(pid) {
    sendRequest("&action=del&pid=" + pid);
}

//����������Ͳ�������
function sendRequest(params) {
    createXmlHttp();                        //����XmlHttpRequest����
    xmlHttp.onreadystatechange = showCartInfo;
    xmlHttp.open("GET", "cart.jsp?timestamp=" + new Date().getTime() + params, true);
    xmlHttp.send(null);
}

//����������Ӧ��Ϣд�빺�ﳵdiv��
function showCartInfo() {
    if (xmlHttp.readyState == 4) {
        document.getElementById("shoppingcart").innerHTML = xmlHttp.responseText;
    }
}
</script>

  <body>
    <h1>���ﳵ</h1>
    <table class="default">
    	<tr>
    		<td class="item">��Ʒ����</td>
    		<td class="item">��Ʒ�۸�</td>
    		<td class="item">���빺�ﳵ</td>
    	</tr>
    		<%
    			List<Product> products = null;
    			products = product.initProduct();
    			if(products==null){
    				out.println("���޲�Ʒ!");
    			}
    			else{
    				for(int i=0;i<products.size();i++){
    					%>
    						<tr>
    							<td class="item"><%=products.get(i).getProductName()%></td>
    							<td class="item"><%=products.get(i).getProductPirce()%> Ԫ</td>
    							<td class="item"><input type="button" value="���빺�ﳵ" onclick="addProduct('<%=product.getProductId()%>')"></td>
    						</tr>
    					<%
    				}
    			}
    		 %>
    	</table>
    	<!-- ���ﳵ��Ϣ -->
    	<div id="shoppingcart">
    	</div>
  </body>
</html>