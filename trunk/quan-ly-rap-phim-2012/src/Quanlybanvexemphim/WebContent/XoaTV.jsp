<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Xoá thành viên</title>
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
    String tentv = request.getParameter("TenDangNhapTV");
    System.out.println("TenDangNhapTV: " + tentv );
    String sql = "SELECT [HoTen],[NgaySinh],[DiaChi],[MatKhau],[SoDienThoai],[Email],[MaGioiTinh]FROM [Quanlybanvephim].[dbo].[ThanhVien]Where [TenDangNhapTV]='"
    + tentv + "'";
    System.out.println("sql: " + sql);
    ResultSet rs1 = st.executeQuery(sql);
   //while (rs1.next()) {
%>
<form>
<table width="500px" align="center">
	<tr>
		<td align="left"
			style="color: black; width: 100px; font-size: 14px; font-weight: bold;">
		Tên đăng nhập thành viên</td>
		<td width="200px"><label><%=tentv%></label> <input type="hidden"
			name="TenDangNhapTV" value="<%=tentv%>" /></td>

	</tr>

</table>


<%
 
        String sql1 = "DELETE FROM [Quanlybanvephim].[dbo].[ThanhVien]WHERE [TenDangNhapTV] ='" +tentv+ "'"; 
        System.out.println("sql : " + sql1);
        int kq = st.executeUpdate(sql1);
        System.out.println(kq);

    response.sendRedirect("Thanhvien.jsp");
%>
</form>
</body>