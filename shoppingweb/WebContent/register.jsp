<%@page import="JDBC.JDBConnection"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="Register.RegisterTest"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<script src="js/register.js"></script>
<link rel="stylesheet" type="text/css" href="css/register.css" />


</head>
<body>
	<div id="divBackground">
		<img src="images/register.jpg" />
	</div>
	<h1 style="text-align: center">欢迎来到我的书城</h1>

	
	<div id="main">
	<div id="tabNav" class="divcsstable1">
		<ul>
			<li onclick="tab('tab1')">已有账号快速登录</li>
			<li>&nbsp &nbsp &nbsp &nbsp</li>
			<li onclick="tab('tab2')">快速注册</li>
		</ul>
	</div>
	<br>
	<div id="tab" class="divcsstable2">
		<div id="tab1">
			<form action="login_ok" name="form1" method="post">
				<table width="460" border="0" align="center">
					<tr>
						<td >账号：</td>
						<td ><input name="loginname" type="text"
							id="userid" 
							value="6-12位账号"
							onfocus="fn_focus(this);"
							onblur="checkUserinfo()"></td>
						<td><span id="useridSpan" style="color: #F00"></span></td>

					</tr>
					<tr>
						<td >密码：</td>
						<td ><input name="loginpassword" type="password"></td>
					</tr>
					<tr>
						<td width="82">&nbsp;</td>
						<td width="152"><input type="submit" name="Submit" value="登录">&nbsp;&nbsp;<input
							type="reset" value="清除"></td>
					</tr>
				</table>
			</form>

		</div>

		<div id="tab2" class="divcsstable" style="display: block;">
			<form action="registerdeal" method="post">
				<table width="100%" border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td>*用户名</td>
						<td><input name="Rusername" class="inputcolor" type="text"
							id="username" value="登录的用户名(6—12位)" onfocus="fn_focus(this);"
							onblur="fn_blur(this);"  /> <span
							id="usernameSpan" style="color: #F00"></span></td>
					</tr> 
					<tr>
						<td>*密码</td>
						<td><input name="Rpassword" type="password" id="pwd1" /> <span
							id="userpwdSpan1" style="color: #F00"></span></td>
					</tr>
					<tr>
						<td>*确认密码</td>
						<td><input name="Rpassword1" type="password" id="pwd2" /></td>
					</tr>
					<tr>
						<td>*性别</td>
						<td><input type="radio" name="Sex" value="1">Male <br>
							<input type="radio" name="Sex" value="0">Female</td>
					</tr>
					<tr>
						<td>*真实姓名</td>
						<td><input name="Realname" type="text" /></td>
					</tr>
					<tr>
						<td>*联系电话</td>
						<td><input name="Telnum" type="text" /></td>
					</tr>
					<tr>
						<td>*邮箱</td>
						<td><input type="text" name="Email" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><input type="submit" value="提交" />&nbsp &nbsp <input type="reset"
							value="重置" /></td>
					</tr>
				</table>
		</div>
		</form>
	</div>
	</div>
	</div>

</body>
</html>