<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Xoá Phim</title>
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
</head>
<body>
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
    String maxacnhan = request.getParameter("MaXacNhan");
    System.out.println("xoa di" + maxacnhan);
    String sql1 = "Select TenPhim, NgayChieu, GioChieu, PhutChieu, SoLuongVeThuong, SoLuongVeVip, MaXacNhan from Phim inner join DanhSachDatVeOnline on Phim.MaPhim = DanhSachDatVeOnline.MaPhim inner join XuatChieu on DanhSachDatVeOnline.MaXuatChieu = XuatChieu.MaXuatChieu inner join LichChieu on LichChieu.MaXuatChieu=XuatChieu.MaXuatChieu";
    System.out.println("sql 1: " + sql1);
    ResultSet rs1 = st.executeQuery(sql1);
   //while (rs1.next()) {
%>
<form>
<table width="500px" align="center">
	<tr>
		<td align="left"
			style="color: black; width: 100px; font-size: 14px; font-weight: bold;">
		Mã xác nhận</td>
		<td width="200px"><label><%=maxacnhan%></label> <input
			type="hidden" name="MaXacNhan" value="<%=maxacnhan%>" /></td>

	</tr>

</table>


<%
 
        String sql = "DELETE FROM [Quanlybanvephim].[dbo].[DanhSachDatVeOnline]where MaXacNhan ='" +maxacnhan+ "'"; 
        System.out.println("sql : " + sql);
        int kq = st.executeUpdate(sql);
        System.out.println(kq);
        response.sendRedirect("Thongtinthanhvien.jsp");
%>
</form>
</body>