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
    String TDN = request.getParameter("TenDangNhapNV");
    System.out.println("TenDangNhapNV" + TDN);
    String sql1 = "Select TenNhanVien ,MatKhauNV,NgaySinh,GioiTinh,TenQuyen from NhanVien, Quyen where Quyen.MaQuyen ='"
            + TDN + "'";
    System.out.println("sql 1: " + sql1);
    ResultSet rs1 = st.executeQuery(sql1);
   //while (rs1.next()) {
%>
<form>
<table width="500px" align="center">
	<tr>
		<td align="left"
			style="color: black; width: 100px; font-size: 14px; font-weight: bold;">
		Tên đăng nhập NV</td>
		<td width="200px"><label><%=TDN%></label> <input type="hidden"
			name="TenDangNhapNV" value="<%=TDN%>" /></td>

	</tr>

</table>


<%
 
        String sql = "DELETE FROM [Quanlybanvephim].[dbo].[NhanVien]WHERE [TenDangNhapNV] ='" +TDN+ "'"; 
        System.out.println("sql : " + sql);
        int kq = st.executeUpdate(sql);
        System.out.println(kq);

    response.sendRedirect("Taotaikhoannhanvien.jsp");
%>
</form>
</body>