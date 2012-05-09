<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<title>Sự kiện</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--Header Background Part Starts -->
<%@include file="Header.jsp" %>
<!--Header Background Part Ends -->
<!--Navigation Background Part Starts -->
<%@include file="MenuUser.jsp" %>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg">
	<!--Our Company Part Starts -->
	<div id="ourCompany-part" >
<form action="Sukien.jsp" method ="post">
<%
Connection connection = null;
String data = "jdbc:jtds:sqlserver://localhost:1433/Quanlybanvephim";
String userName = "sa";
String passWord = "123";
String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
Statement st = null;
Class.forName(JDBC_Driver);
connection = DriverManager.getConnection(data, userName, passWord);
st = connection.createStatement();

%>

 <table  width="100% ">

    <tr class="ourCompany-list">
        <td colspan=10 align ="center"> <h2 class="ourCompany-hdr">SỰ KIỆN</h2></td>
    </tr>
    <tr><td colspan = "10" align ="center" width = 50%>
    <fieldset>
<legend><font face="Arial " color="black" size="5"> Tìm Kiếm</font></legend>
<table width =70% >
<tr class="ourCompany-list">
<td>Ngày:</td>
<td colspan = "5"><select name="ngay" >
<option value=""> Chọn </option>
    <% for (int i=1;i<=31;i++){
    %><option value="<%=i %>"><%=i%> </option><%
    }%>
</select>
<select name="thang" >
<option value=""> Chọn </option>
     <% for (int i=1;i<=12;i++){
    	 
    %><option value="<%=i %>"><%=i%> </option><%
    }%>
</select>
<select name="nam">
<option value=""> Chọn </option>
     <% for (int i=2012; i<=2040;i++){
    %><option value="<%=i %>"><%=i%> </option><%
    }%>
</select>
</td>
<td >
Tên Sự Kiện
</td>
<td colspan ="5"><input type = "text" name= "tk" value = "Nhập"/></td>
<td colspan = "10" align ="center">
<input type ="submit"name="bttimkiem" value="Tìm kiếm"></td>
</tr>
</table>
</fieldset></td></tr>
       <%
  String ngay = request.getParameter("ngay");
  String thang = request.getParameter("thang");
  String nam = request.getParameter("nam");
  String tensukien = request.getParameter("tk");
  ResultSet rs8;
  String timkiem = request.getParameter("bttimkiem");
  System.out.println("aaaaaaaaa=============="+timkiem);
  if ("TÃ¬m kiáº¿m".equals(timkiem))
	  {
	  //String sql8 ="select [TenSuKien],[NoiDung],[NgayBatDau],[NgayKetThuc],[HinhAnhSuKien],[MucGiamGia],[Ghichu] from [Quanlybanvephim].[dbo].[SuKien] where  [SuKien].[TenSuKien] like '"+ tensukien + "'  or day([SuKien].[NgayBatDau]) ='"+ ngay + "'or month([SuKien].[NgayBatDau]) ='"+ thang + "'or year([SuKien].[NgayBatDau])='"+ nam + "'and( day([SuKien].[NgayKetThuc])<=getdate()and month([SuKien].[NgayKetThuc])<=month(getdate())and year([SuKien].[NgayKetThuc])<= year(getdate()))";
	  //String sql8 ="select [TenSuKien],[NoiDung],[NgayBatDau],[NgayKetThuc],[HinhAnhSuKien],[MucGiamGia],[Ghichu] from [Quanlybanvephim].[dbo].[SuKien] where  [SuKien].[TenSuKien] like '"+ tensukien + "'  and day([SuKien].[NgayBatDau]) ='"+ ngay + "'and month([SuKien].[NgayBatDau]) ='"+ thang + "'and year([SuKien].[NgayBatDau])='"+ nam + "' and( day([SuKien].[NgayKetThuc])<=getdate()and month([SuKien].[NgayKetThuc])<=month(getdate())and year([SuKien].[NgayKetThuc])<= year(getdate()))";
	  
	  String sql8 ="select  tensukien, noidung,ngaybatdau,ngayketthuc,hinhanhsukien,mucgiamgia,ghichu  from sukien where (ngaybatdau>getdate() and (tensukien like '%"+tensukien+"%' or day(ngaybatdau)='"+ngay+"' or month(ngaybatdau)='"+thang+"' or year(ngaybatdau)='"+nam+"'))";
	  System.out.println("sql===================="+sql8);
	   rs8 = st.executeQuery(sql8);
	   while (rs8.next())
	   { 
	       %>  
<tr class="ourCompany-list">
<td>
<img src="<%out.println(rs8.getString(5));%>" />
</td>
<td colspan ="2"><textarea cols="50" rows="5">Tên sự kiện:<%out.println(rs8.getString(1));%>Nội dung:<%out.println(rs8.getString(2));%>Ngày bắt đầu:<%out.println(rs8.getString(3));%>Ngày kết thúc:<%out.println(rs8.getString(4));%>Mức giảm giá:<%out.println(rs8.getString(6));%>Ghi chú:<%out.println(rs8.getString(7));%></textarea></td>
</tr>
<%} %>
                  <%} 
 else  { 
	 %>

<%     
       String sql6="SELECT [TenSuKien],[NoiDung],[NgayBatDau],[NgayKetThuc],[HinhAnhSuKien],[MucGiamGia],[Ghichu]FROM [Quanlybanvephim].[dbo].[SuKien] where ngaybatdau > getdate()";
       ResultSet rs6 = st.executeQuery(sql6);
       while (rs6.next()) {
       %>	 
<tr class="ourCompany-list">
<td>
<img src="<%out.println(rs6.getString(5));%>" />
</td>
<td colspan ="2"><textarea cols="50" rows="5">Tên sự kiện:<%out.println(rs6.getString(1));%>Nội dung:<%out.println(rs6.getString(2));%>Ngày bắt đầu:<%out.println(rs6.getString(3));%>Ngày kết thúc:<%out.println(rs6.getString(4));%>Mức giảm giá:<%out.println(rs6.getString(6));%>Ghi chú:<%out.println(rs6.getString(7));%></textarea></td>
</tr>
<%} }%>
</table>
 <br> <br> <br> <br> <br> <br> <br> <br> <br> 
 </form>
</div>
	<!--Our Company Part Ends -->
</div>
<!--Our Company Bacground Part Ends -->
<!--Future Plans Part Starts -->
<%@include file="Footer.jsp" %>
<!--Footer Part Ends -->
</body>
</html>