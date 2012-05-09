<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="ourCompany-bg">
<div id="ourCompany-part1">
<%
	//sau khi chọn ngày ở trang banve_chonngay, mình đầy dữ liệu ngày chiếu vào
	//session ở đây

	Connection connection = null;
	String data = "jdbc:jtds:sqlserver://localhost:1433/Quanlybanvephim";
	String userName = "sa";
	String passWord = "123";
	String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
	Statement st = null;
	Class.forName(JDBC_Driver);
	connection = DriverManager.getConnection(data, userName, passWord);
	st = connection.createStatement();
	// lấy param ngày chiếu từ banve_chonngay nhét vào session
	String ngayChieu2 = request.getParameter("ngayChieu");
%>
<fieldset><legend> <font face="Arial " color="black" size="5"> Tên phim </font></legend> <%
 	//chỉ thực hiện tất cả các việc sau nếu có ngày chiếu gửi đến 
 	//tức là cái link bên frame chọn ngày chiếu dc click
 	//nếu có dữ liệu thì mới hiển thị, ngc lại thì hiện trang trống
 	if (ngayChieu2 != null) {
 		session.setAttribute("ngayChieuAttribute", ngayChieu2);

 		String sql1 = "Select distinct TenPhim from Phim,LichChieu,XuatChieu "
 				+ "where XuatChieu.MaPhim = Phim.MaPhim "
 				+ "and XuatChieu.MaXuatChieu = LichChieu.MaXuatChieu "
 				+ "and LichChieu.NgayChieu = '" + ngayChieu2 + "'";
 		System.out.println("cau sql lay danh sach ten phim " + sql1);
 		ResultSet rs1 = st.executeQuery(sql1);
 %>
<table width=100%>
	<%
		while (rs1.next()) {
	%>
	<tr class="ourCompany-list1">
		<td align=left><a href="Banve_Chonxuatchieu.jsp?tenPhim=<%=rs1.getString(1)%>" target="xuatchieuAdmin"><font
			face=" Arial " color="333333"> <%=rs1.getString(1)%> </font></a> <%
 	} //end while (rs1.next()) {
} //end if(ngayChieu2 != null) {
 %>
		</td>
	</tr>
</table>
<br>
<br>
<br>
</fieldset>
</div>
</div>
</body>
</html>