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

		<title>ͼ���������</title>
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
							<strong>��ѯͼ��</strong>&nbsp;
						</td>
						<td>
							����:
							<input type="text" name=bookName style="width:100">
							&nbsp;
						</td>
						<td>
							����:
							<input type="text" name=author style="width:100">
							&nbsp;
						</td>
						<td>
							������:
							<input type="text" name=publisher style="width:100">
							&nbsp;
						</td>
						<td>
							����:
							<select name=bookType>
								<option value='' selected>
									����
								</option>
								<option value="С˵">
									С˵
								</option>
								<option value="�����">
									�����
								</option>
								<option value="���ù���">
									���ù���
								</option>
								<option value="��֤����">
									��֤����
								</option>
								<option value="��ѧ�̳�">
									��ѧ�̳�
								</option>
								<option value="��е����">
									��е����
								</option>
								<option value="�ڿ���־">
									�ڿ���־
								</option>
								<option value="�������">
									�����鼮
								</option>
							</select>
						</td>
						<td>
							<input type="submit" value="����">
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
					<font style="font-size:17pt;font-style:italic">��Ѱ���</font>
				</caption>
				<tr align=center>
					<th>
						����
					</th>
					<th>
						����
					</th>
					<th>
						����
					</th>
					<th>
						ԭ��
					</th>
					<th>
						�ۿۼ�
					</th>
					<th width="60pt">
						<a href="checkCart">���ﳵ</a>
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
							<input type=submit value="����">
						</form>
					</td>
				</tr>
				<%
				}
				%>
			</table>
			<%
						} else {
						out.println("<center><font color=brown>��Ǹ��û����Ҫ�ҵ��顣</font></center>");
					}
				}
			%>

			<jsp:include page="bottom.txt" />
	</body>
</html>
