<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Xoá Phòng</title>
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
    String maphong = request.getParameter("MaPhong");
    System.out.println("maphong: " + maphong);
    String sql1 = "SELECT [TenPhong],[TrangThaiPhong],[SoLuongDayGheToiDa],[SoLuongGheToiDaOMoiDay],[GhiChu]FROM [Quanlybanvephim].[dbo].[Phong] where [MaPhong] ='"
            + maphong + "'";
    System.out.println("sql 1: " + sql1);
    ResultSet rs1 = st.executeQuery(sql1);
  
%>
<form>
<%
 
        String sql = "DELETE FROM [Quanlybanvephim].[dbo].[Phong]WHERE [MaPhong] ='" + maphong + "'"; 
        System.out.println("sql : " + sql);
        int kq = st.executeUpdate(sql);
        System.out.println(kq);

    response.sendRedirect("Quanlyphong.jsp");
%>
</form>
</body>
</html>