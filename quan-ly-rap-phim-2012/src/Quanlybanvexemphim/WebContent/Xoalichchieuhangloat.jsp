<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.jdbc.*"%>
<%@page import="java.util.*"%>
<%
	Connection connection = null;
	String data = "jdbc:jtds:sqlserver://localhost:1433/Quanlybanvephim";
	String userName = "sa";
	String password = "123";
	String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
	Statement st = null;

	try {
		Class.forName(JDBC_Driver);
		// connection
		connection = DriverManager.getConnection(data, userName,
				password);
		st = connection.createStatement();

	} catch (ClassNotFoundException e) {
		System.out.println("Class not found");
		e.printStackTrace();
	} catch (SQLException se) {
		System.out.println("SQL Error");
		se.printStackTrace();
	}
%>
<title>Xoá lịch chiếu</title>

</head>
<body>
<%
	String ngayP = request.getParameter("Ngay");
	String tuNgayP=request.getParameter("tuNgayX");
	String denNgayP=request.getParameter("denNgayX");
	System.out.println("tu ngay=== "+tuNgayP);
	System.out.println("den ngay=== "+denNgayP);
	String sql1="DELETE FROM [Quanlybanvephim].[dbo].[LichChieu] WHERE NgayChieu='"+ngayP+"'";
	st.executeUpdate(sql1);
	connection.close();
	System.out.println("Xoa thanh cong ngay "+ngayP);
	//response.sendRedirect("Lichchieu.jsp?txtTuNgay=2012%2F03%2F08&TuNgay=txtTuNgay&txtDenNgay=2012%2F03%2F20&DenNgay=txtDenNgay&btnTimKiem=TimKiem");
	response.sendRedirect("Themlichhangloat.jsp?txtTuNgay="+ tuNgayP+"&txtDenNgay="+denNgayP+"&btnThemLichHangLoat=ThÃªm lá»ch hÃ ng loáº¡t");
	
%>
</body>
</html>