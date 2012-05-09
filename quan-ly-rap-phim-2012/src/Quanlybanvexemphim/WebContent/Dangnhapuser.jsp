<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.jdbc.*"%>
<%@page import="javax.servlet.http.*"%>

<title>Đăng nhập thành viên</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<Script>
function Trim(sString) {
    while (sString.substring(0,1) == ' ') {
        sString = sString.substring(1, sString.length);
    }
    while (sString.substring(sString.length-1, sString.length) == ' ')
    {
        sString = sString.substring(0,sString.length-1);
    }
    return sString;
}

function KiemTraDangNhapTV(){

   var obj1Value = document.getElementById("DangNhapUsertxt").value; 
   if (Trim(obj1Value) == "" || obj1Value == undefined){
    alert(" Vui lòng nhập tên đăng nhập ");
       return false;
   } 

   var obj1Value2 = document.getElementById("MatKhauUsertxt").value; 
   if (Trim(obj1Value2) == "" || obj1Value2 == undefined){
    alert("Vui lòng nhập mật khẩu");
       return false;
  
   } 
      return true; //true co nghia la cac dieu kien deu thoa het
}
</Script>

<body>
<!--Trang ni là giao diện để người dùng nhập id & pass-->
<%@include file="Header.jsp"%>
<%@include file="MenuUser.jsp"%>

<div id="ourCompany-bg">
<div id="ourCompany-part">

<!--bấm vô nút đăng nhập thì nhảy tới XuLyDangNhapUser.jsp để xử lý-->
<form action="XuLyDangNhapUser.jsp" method="post"><br>
<br>
<br>
<br>
<br>
<br>
<br>
<table width="990px">
	<tr>
		<td colspan="7" align="right"></td>
	</tr>
	<tr>
		<td colspan="3.5">
		<fieldset><legend><font face="Arial "
			color="black" size="5"> Đăng nhập </font></legend>
		<table>
			<tr>
				<td colspan="3.5"><font color="red"> <%  
        if ("InvalidLogin".equals(request.getParameter("error"))) {
        	out.write("Sai mật khẩu hoặc tên đăng nhập");
        }
     %>
				</font></td>
			</tr>
			<tr class="ourCompany-list">
				<td>Tên đăng nhập:</td>
				<td><input name="TenDangNhapTV" size="30" type="text"
					id="DangNhapUsertxt"></td>
			</tr>
			<tr class="ourCompany-list">
				<td>Mật khẩu:</td>
				<td><input name="passwordTV" size="30" type="password"
					id="MatKhauUsertxt"></td>
			</tr>
			<tr class="ourCompany-list">
				<td colspan="2" align="center"><input type="submit"
					value="Đăng nhập" onclick="KiemTraDangNhapTV()"></td>
			</tr>
		</table>
		</fieldset>
		</td>
		
		
		
		
		<td colspan="3.5">
		<fieldset><legend> <font face="Arial "
			color="black" size="5"> Đăng ký </font></legend>
		<table>
			<tr class="ourCompany-list">
				<td>Nếu bạn chưa có tài khoản</td>
			</tr>
			<tr class="ourCompany-list">
				<td>vui lòng click <a href="Dangkythanhvien.jsp">vào đây</a> để
				đăng ký</td>
			</tr>
		</table>
		</fieldset>
		</td>
	</tr>
</table>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</form>
</div>
</div>
<%@include file="Footer.jsp"%>
</body>
</html>
