<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-31j">
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.jdbc.*"%>
<%@page import="java.util.*"%>
<title>Insert title here</title>
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
	String maPhong2 = request.getParameter("maPhongName");
	String soGhe = request.getParameter("soGheName");
	System.out.print("so ghe xu ly ban ve" + soGhe);
	String ngayChieu = request.getParameter("ngayChieuname");
	String tenPhimChieu = request.getParameter("tenPhimName");
	String gioChieu2 = request.getParameter("gioChieuName");
	System.out.print("met qua roi ne" + gioChieu2);
	String phutChieu2 = request.getParameter("phutChieuName");
	String LChieu = "" + session.getAttribute("lc");
	String XChieu = "" + session.getAttribute("xc");
%>
<%!String tk;%>
<%
	tk = request.getParameter("banve");
	if ("OK".equals(tk)) {
		int ok = 0;
		String sql1;
		sql1 = "UPDATE [Quanlybanvephim].[dbo].[Ghe_LichChieu]"
				+ "SET [TrangThaiGhe] = 'Đã bán' where SoGhe = '"
				+ soGhe + "' and MaPhong = '" + maPhong2
				+ "' and MaLichChieu ='" + LChieu
				+ "' and MaXuatChieu ='" + XChieu + "' ";
		System.out.print("\ncau sql ban ghe  " + sql1);
		ok = st.executeUpdate(sql1);
	}
	response.sendRedirect("Giaodich.jsp?maPhong=" + maPhong2
			+ "&ngaychieu=" + ngayChieu + "&tenphim=" + tenPhimChieu
			+ "&gioChieu=" + gioChieu2 + "&phutChieu=" + phutChieu2
			+ "");
%>

</body>
</html>