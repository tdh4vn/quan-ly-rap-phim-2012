<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Đăng nhập</title>
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
    }x
    return sString;
}

function kiemtradangnhap(){

   var obj1Value = document.getElementById("DangNhaptxt").value; 
   if (Trim(obj1Value) == "" || obj1Value == undefined){
    alert(" Vui lòng nhập tên đăng nhập ");
       return false;
   } 

   var obj1Value2 = document.getElementById("MatKhautxt").value; 
   if (Trim(obj1Value2) == "" || obj1Value2 == undefined){
    alert("Vui lòng nhập mật khẩu");
       return false;
  
   } 
      return true; //true co nghia la cac dieu kien deu thoa het
}
</Script>
<body>
<!--Header Background Part Starts -->
<%@include file="Header.jsp"%>
<!--Header Background Part Ends -->
<!--Navigation Background Part Starts -->
<%@include file="MenuUser.jsp"%>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg"><!--Our Company Part Starts -->
<div id="ourCompany-part"><%--  
        if ("InvalidLogin".equals(request.getParameter("error"))) {
        	out.write("Sai mat khau hoac ten dang nhap");
        }
    
     --%>


<form method="post" name="formDn" action="Xulydangnhap.jsp"><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<fieldset><legend><font face="Arial " color="black"
	size="5">Đăng nhập</font></legend>
<table align="center">
	<tr>
		<td colspan="2"><font color="red"> <%  
        
    
     %>
		</font></td>
	</tr>
	<tr class="ourCompany-list">
		<td>Tên đăng nhập:</td>
		<td><input name="TenDangNhapNV" size="30" type="text"
			id="DangNhaptxt"></td>
	</tr>
	<tr class="ourCompany-list">
		<td>Mật khẩu:</td>
		<td><input name="password" size="30" type="password"
			id="MatKhautxt"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit"
			value="Đăng nhập" onclick="kiemtradangnhap()"></td>
	</tr>
</table>
</fieldset>
</form>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</div>
<!--Our Company Part Ends --></div>
<!--Our Company Bacground Part Ends -->
<!--Future Plans Part Starts -->
<%@include file="Footer.jsp"%>
<!--Footer Part Ends -->
</body>
</html>