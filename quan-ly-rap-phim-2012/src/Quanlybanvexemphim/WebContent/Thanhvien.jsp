<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.util.*"%>
<title>Thành viên</title>
</head>
<Script>
function show_confirm()
{
return confirm("Bạn có chắc chắn muốn xoá không ?");
}
</Script>
<body link="black" alink="black" vlink="black">
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
<!--Header Background Part Starts -->
<%@include file="Header.jsp"%>
<!--Header Background Part Ends -->
<!--Navigation Background Part Starts -->
<%@include file="MenuAdmin.jsp"%>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg"><!--Our Company Part Starts -->
<div id="ourCompany-part">
<form action="Thanhvien.jsp" method="post">
<table width="100%">
	<tr>
		<td colspan=11 align="center">
		<h2 class="ourCompany-hdr">Quản lý thành viên</h2>
		</td>
		<td colspan=11 align="center">
		<p align="right"><font face=" Arial " color="333333"> Xin
		chào <%
			String TenDangNhapTV = request.getParameter("TenDangNhapTV");
			out.println( TenDangNhapTV );
		%> ! </font></p>
		<p align="right"><input type="text" name="timkiem"> <input
			type="submit" name="bttimkiem" value="Tìm kiếm"></p>
		<br>
	</tr>
</table>
<br>
<br>
<table width="100%" border="1">
	<tr bgcolor="333333">


		<td align="center">Tên đăng nhập</td>
		<td align="center">Họ tên</td>
		<td align="center">Ngày sinh</td>
		<td align="center">Địa chỉ</td>
		<td align="center">Mật khẩu</td>
		<td align="center">Số điện thoại</td>
		<td align="center">Email</td>
		<td align="center">Giới tính</td>
		<td></td>
	</tr>
	<%
		String tk=request.getParameter("timkiem");
		System.out.println("tim kiem============="+tk);
		String txttk=request.getParameter("bttimkiem");
		ResultSet rs;
   if("TÃ¬m kiáº¿m".equals(txttk))
 {
	System.out.println("tới đây chư33333333333333333");
			String sql = "SELECT [TenDangNhapTV],[HoTen],[NgaySinh],[DiaChi],[MatKhau],[SoDienThoai],[Email],[GioiTinh] FROM [Quanlybanvephim].[dbo].[ThanhVien]where [TenDangNhapTV] like'%"+tk+"%'or [HoTen]like'%"+tk+"%'or [GioiTinh]like '%"+tk+"%'";
			System.out.println("tới đây chưa11111111111111111111"+sql);
			 rs = st.executeQuery(sql);
	        %>
	<% while(rs.next())
	    {
	    	System.out.println("tới đây chưa44444444444444444");
	        %>
	<tr class="ourCompany-list">
		<td align="center">
		<%out.println(rs.getString(1));%> <input type="hidden"
			name="TenDangNhapTV" value="<%out.print(rs.getString(1));%>" /></td>
		<td align="center">
		<%out.println(rs.getString(2));%> <input type="hidden" name="HoTen"
			value="<%out.print(rs.getString(2));%>" /></td>
		<td align="center">
		<%out.println(rs.getString(3));%> <input type="hidden" name="NgaySinh"
			value="<%out.print(rs.getString(3));%>" /></td>
		<td align="center">
		<%out.println(rs.getString(4));%> <input type="hidden" name="DiaChi"
			value="<%out.print(rs.getString(4));%>" /></td>
		<td align="center">
		<%out.println(rs.getString(5));%> <input type="hidden" name="MatKhau"
			value="<%out.print(rs.getString(5));%>" /></td>
		<td align="center">
		<%out.println(rs.getString(6));%> <input type="hidden"
			name="SoDienThoai" value="<%out.print(rs.getString(6));%>" /></td>
		<td align="center">
		<%out.println(rs.getString(7));%> <input type="hidden" name="Email"
			value="<%out.print(rs.getString(7));%>" /></td>
		<td align="center">
		<%out.println(rs.getString(8));%> <input type="hidden" name="GioiTinh"
			value="<%out.print(rs.getString(8));%>" /></td>
		<td width="10%" align="center"><a href="Khoa.jsp"><font
			face="Tahoma">Khóa</font></a><br>
		<a href="Mo.jsp"><font face="Tahoma">Mở</font></a><br>
		<a href="XoaTV.jsp?TenDangNhapTV=<%=rs.getString(1)%>"
			onClick="return show_confirm()"><font face="Tahoma">Xóa</font></a><br>
		</td>
	</tr>
	<%} %>
	<tr></tr>



	<tr>
		<td><font size="5" color="red">Tổng số thành viên : <%String sql3 = "SELECT count([TenDangNhapTV])from [ThanhVien]";
	            ResultSet rs3 = st.executeQuery(sql3);
	            %> <% while(rs3.next())
	    {
	        %> <%out.println(rs3.getString(1));%>
		</font></td>
	</tr>
	<%} %>



	<%} 
 else  { 
	 %>

	<%   
	       System.out.println("tới đây chưa11111111111111111111");
			String sql1 = "SELECT [TenDangNhapTV],[HoTen],[NgaySinh],[DiaChi],[MatKhau],[SoDienThoai],[Email],[GioiTinh]FROM [Quanlybanvephim].[dbo].[ThanhVien]";
			ResultSet rs1 = st.executeQuery(sql1);
		       while (rs1.next()) {
		       %>
	<tr class="ourCompany-list">
		<td align="center">
		<%out.println(rs1.getString(1));%> <input type="hidden"
			name="TenDangNhapTV" value="<%out.print(rs1.getString(1));%>" /></td>
		<td align="center">
		<%out.println(rs1.getString(2));%> <input type="hidden" name="HoTen"
			value="<%out.print(rs1.getString(2));%>" /></td>
		<td align="center">
		<%out.println(rs1.getString(3));%> <input type="hidden" name="NgaySinh"
			value="<%out.print(rs1.getString(3));%>" /></td>
		<td align="center">
		<%out.println(rs1.getString(4));%> <input type="hidden" name="DiaChi"
			value="<%out.print(rs1.getString(4));%>" /></td>
		<td align="center">
		<%out.println(rs1.getString(5));%> <input type="hidden" name="MatKhau"
			value="<%out.print(rs1.getString(5));%>" /></td>
		<td align="center">
		<%out.println(rs1.getString(6));%> <input type="hidden"
			name="SoDienThoai" value="<%out.print(rs1.getString(6));%>" /></td>
		<td align="center">
		<%out.println(rs1.getString(7));%> <input type="hidden" name="Email"
			value="<%out.print(rs1.getString(7));%>" /></td>
		<td align="center">
		<%out.println(rs1.getString(8));%> <input type="hidden" name="GioiTinh"
			value="<%out.print(rs1.getString(8));%>" /></td>
		<td width="10%" align="center"><a href="Khoa.jsp">Khóa</a><br>
		<a href="Mo.jsp">Mở</a><br>
		<a href="XoaTV.jsp?TenDangNhapTV=<%=rs1.getString(1)%>"
			onClick="return show_confirm()"><font face="Tahoma">Xóa</font></a><br>
		</td>
	</tr>
	<%} %>
	<tr></tr>


	<tr></tr>
	<tr></tr>
	<tr>
		<td colspan="9" align="center"><font face=" Arial "
			color="333333">Tổng số thành viên : </font> <%String sql3 = "SELECT count([TenDangNhapTV])from [ThanhVien]";
	        ResultSet rs3= st.executeQuery(sql3);
	        %> <% while(rs3.next())
	    {
	      %> <font color="993300"> <%out.println(rs3.getString(1));%>
		</font></td>
	</tr>
	<%} %>






	<tr></tr>
</table>
<%} %> <br>
<br>
<br>
<br>
<br>
<br>
</form>
</div>
<!--Our Company Part Ends --></div>
<!--Our Company Bacground Part Ends -->
<!--Future Plans Part Starts -->
<%@include file="FooterAdmin.jsp"%>
<!--Footer Part Ends -->
</body>
</html>