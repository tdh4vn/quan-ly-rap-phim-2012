<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-31j">
<title>Sơ đồ ghế</title>
</head>
<%@page import="org.apache.catalina.Session"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<body>
<%@include file="Header.jsp"%>
<% if(session.getAttribute("tenDangNhapTV")==null){%>
<%@include file="MenuUser.jsp"%>
<%}else{ %>
<%@include file="MenuUserDaDangNhap.jsp"%>
<%} %>
<div id="ourCompany-bg">

<div id="ourCompany-part">
<table width=100%>
	<tr>
		<td colspan="16" align="center">
		<h2 class="ourCompany-hdr">Sơ đồ ghế</h2>
		</td>
	</tr>
	<tr>
		<td colspan="16">
		<fieldset><legend> <font face="Arial "
			color="black" size="5"> Hướng dẫn </font> </legend>
		<table width=100%>
			<tr>
				<td width="10px"></td>
				<td align="center" width="5px" bgcolor="FFFFCC"></td>
				<td width="90px">Ghế thường</td>
				<td width="5px" bgcolor="6699FF"></td>
				<td width="90px">Ghế VIP</td>
			</tr>
		</table>
		</fieldset>
		</td>
	</tr>

	<tr bgcolor="grey">
		<td align="center"></td>
		<td align="center">01</td>
		<td align="center">02</td>
		<td align="center">03</td>
		<td align="center">04</td>
		<td align="center">05</td>
		<td align="center">06</td>
		<td align="center">07</td>
		<td align="center">08</td>
		<td align="center">09</td>
		<td align="center">10</td>
		<td align="center">11</td>
		<td align="center">12</td>
		<td align="center">13</td>
		<td align="center">14</td>
		<td align="center">15</td>
	</tr>

	<tr>
		<td bgcolor="grey" align="center">A</td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
	</tr>

	<tr>
		<td bgcolor="grey" align="center">B</td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
	</tr>

	<tr>
		<td bgcolor="grey" align="center">C</td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
	</tr>

	<tr>
		<td bgcolor="grey" align="center">D</td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
	</tr>

	<tr>
		<td bgcolor="grey" align="center">E</td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
	</tr>

	<tr>
		<td bgcolor="grey" align="center">F</td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
	</tr>

	<tr>
		<td bgcolor="grey" align="center">G</td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
	</tr>

	<tr>
		<td bgcolor="grey" align="center">H</td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
	</tr>

	<tr>
		<td bgcolor="grey" align="center">I</td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
	</tr>

	<tr>
		<td bgcolor="grey" align="center">J</td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
	</tr>

	<tr>
		<td bgcolor="grey" align="center">K</td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
		<td bgcolor="FFFFCC"></td>
	</tr>

	<tr>
		<td bgcolor="grey" align="center">L</td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
	</tr>

	<tr>
		<td bgcolor="grey" align="center">M</td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
	</tr>

	<tr>
		<td bgcolor="grey" align="center">N</td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
	</tr>

	<tr>
		<td bgcolor="grey" align="center">O</td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
		<td bgcolor="6699FF"></td>
	</tr>

</table>
</div>
</div>
<%@include file="Footer.jsp"%>
</body>

</html>