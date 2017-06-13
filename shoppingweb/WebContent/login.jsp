
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>

<script src="js/focus-flur.js"></script>
<link rel="stylesheet" type="text/css" href="css/loginpage.css" />

</head>
<body>

	<%
		//登录之前先清空session；
		session.removeAttribute("loginname");
		session.removeAttribute("loginid");
		session.invalidate();
	%>

	<div id="divBackground">
		<img src="images/register.jpg" />
	</div>

	<div id="main">
		<table border="1" align="center" cellpadding="1" cellspacing="1"
			bordercolor="#FFFFFF">
			<tr>
				<td height="202" valign="top"><br> <font size="4pt">
						<h3 align="center">&nbsp;&nbsp;用&nbsp;户&nbsp;登&nbsp;陆</h3>
				</font>

					<hr width="90%" color="#999999">
					<form action="login_ok" name="form1" method="post">
						<table width="380" border="0" align="center">
							<tr>
								<td>账号：&nbsp;&nbsp;</td>
								<td><input id="loginid" name="loginname" type="text"
									value="6-12位账号" onfocus="lg_focus(this);"
									onblur="lg_blur(this);"></td>
								<td><span id="loginidSpan" style="color: #F00"></span></td>
							</tr>
							<tr>
								<td>密码：&nbsp;&nbsp;</td>
								<td><input id="loginpwd" name="loginpassword"
									type="password""
								></td>
							</tr>
							<tr>
								<td width="82">&nbsp;</td>
								<td width="152"><input type="submit" name="Submit"
									value="登录">&nbsp;&nbsp;<input type="reset" value="清除"></td>
							</tr>
						</table>
					</form></td>
			</tr>
		</table>
	</div>
</body>
</html>

