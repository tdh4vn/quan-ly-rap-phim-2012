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
<div id="ourCompany-bg"><!--Our Company Part Starts -->
<div id="ourCompany-part1">
<form>
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
	String ngayChieu2 = request.getParameter("ngayChieu");
	String ngayChieuSession = ""
			+ session.getAttribute("ngayChieuAttribute");
	if (ngayChieu2 != null) {
		if ("".equals(ngayChieuSession)
				|| ngayChieu2.equals(ngayChieuSession) == false) {
			session.setAttribute("ngayChieuAttribute", ngayChieu2);
		}
%>
<fieldset><legend> <font face="Arial " color="black" size="5"> Tên phim </font></legend>
<table width=100%>
	<%
		String sql1 = "Select distinct TenPhim from Phim,LichChieu,XuatChieu "
					+ "where XuatChieu.MaPhim = Phim.MaPhim and XuatChieu.MaXuatChieu = LichChieu.MaXuatChieu "
					+ "and LichChieu.NgayChieu = '" + ngayChieu2 + "'";
			System.out.println("cau sql lấy danh sách phim từ ngày chiếu"
					+ sql1);
			ResultSet rs1 = st.executeQuery(sql1);
			while (rs1.next()) {
	%>
	<tr class="ourCompany-list1">
		<td align=left><a href="Chonxc.jsp?tenPhim=<%=rs1.getString(1)%>&<%=ngayChieu2%>" target="xuatchieu"><font
			face=" Arial " color="333333"> <%=rs1.getString(1)%> </font></a></td>
	</tr>
	<%
            } //end while (rs1.next()) {
		} //end if (ngayChieu2 != null) {
	%>
</table>
</fieldset>
</form>
</div>
</div>
</body>

</html>