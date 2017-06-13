<%@ page language="java" pageEncoding="gb2312"%>
<%@ page import="java.util.ArrayList,java.util.Iterator"%>
<%@ page import="common.Format,bean.BookBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>图书搜索结果</title>
		<%!ArrayList list = null;%>
	</head>
	<body>
		<center>
			<table>
				<tr>
					<td>
						<jsp:include page="top.jsp" />
					</td>
				</tr>
				<tr align=right>
					<td>
						<jsp:include page="advertise.jsp" />
					</td>
				</tr>
			</table>
		</center>
			<form action=searchBook method=post>
				<table border=0 bordercolor="green" align=center>
					<tr>
						<td>
							<strong>查询图书</strong>&nbsp;
						</td>
						<td>
							书名:
							<input type="text" name=bookName style="width:100">
							&nbsp;
						</td>
						<td>
							作者:
							<input type="text" name=author style="width:100">
							&nbsp;
						</td>
						<td>
							出版社:
							<input type="text" name=publisher style="width:100">
							&nbsp;
						</td>
						<td>
							类型:
							<select name=bookType>
								<option value='' selected>
									所有
								</option>
								<option value="小说">
									小说
								</option>
								<option value="计算机">
									计算机
								</option>
								<option value="经济管理">
									经济管理
								</option>
								<option value="认证考试">
									认证考试
								</option>
								<option value="大学教程">
									大学教程
								</option>
								<option value="机械工程">
									机械工程
								</option>
								<option value="期刊杂志">
									期刊杂志
								</option>
								<option value="其它书藉">
									其他书籍
								</option>
							</select>
						</td>
						<td>
							<input type="submit" value="搜索">
						</td>
					</tr>
				</table>
			</form>
			<%
					if (session.getAttribute("bookList") != null) {
					list = (ArrayList) session.getAttribute("bookList");
					Iterator it = list.iterator();
					if (it.hasNext()) {
						BookBean book;
			%>
			<table border=1 width=80% bordercolor=green align=center>
				<caption>
					<font style="font-size:17pt;font-style:italic">搜寻结果</font>
				</caption>
				<tr align=center>
					<th>
						封面
					</th>
					<th>
						书名
					</th>
					<th>
						作者
					</th>
					<th>
						原价
					</th>
					<th>
						折扣价
					</th>
					<th width="60pt">
						<a href="checkCart">购物车</a>
					</th>
				</tr>
				<%
							int i = 0;
							while (it.hasNext()) {
						book = (BookBean) it.next();
						i++;
				%>
				<tr align=center>
					<td>
						<img src=<%=book.getBookView()%> width=60 height=90>
					</td>
					<td>
						<%=book.getBookName()%>
					</td>
					<td>
						<%=book.getAuthor()%>
					</td>
					<td>
						<strike> <%=Format.numFormat(book.getPrice())%> </strike>
					</td>
					<td>
						<font color=brown><%=Format.numFormat(book.getPriceDiscount())%>
						</font>
					</td>
					<td>
						<form action="checkCart" method="post">
							<input type="hidden" name="bookID" value=<%=book.getBookID()%>>
							<input type="hidden" name="bookName"
								value=<%=book.getBookName()%>>
							<input type="hidden" name="price" value=<%=book.getPrice()%>>
							<input type="hidden" name="priceByOff"
								value=<%=book.getPriceDiscount()%>>
							<input type="hidden" name="bookView"
								value=<%=book.getBookView()%>>
							<input type=submit value="购买">
						</form>
					</td>
				</tr>
				<%
				}
				%>
			</table>
			<%
						} else {
						out.println("<center><font color=brown>抱歉，没有您要找的书。</font></center>");
					}
				}
			%>

			<jsp:include page="bottom.txt" />
	</body>
</html>
