m<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<script>
function chuyenManHinh(path){
    parent.parent.location = path;
}
</script>
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
	String tenPhim2 = request.getParameter("tenPhim");
	String ngayChieu = "" + session.getAttribute("ngayChieuAttribute");
	String tenPhimSession = "" + session.getAttribute("tenPhim");
	if (tenPhim2 != null) {
		if ("".equals(tenPhimSession)
				|| tenPhim2.equals(tenPhimSession) == false) {
			session.setAttribute("tenPhim3", tenPhim2);
		}
		String sql1 = "Select  GioChieu, PhutChieu from XuatChieu, LichChieu, "
				+ "Phim where XuatChieu.MaPhim = Phim.MaPhim "
				+ "and XuatChieu.MaXuatChieu = LichChieu.MaXuatChieu and Phim.TenPhim ='"
				+ tenPhim2
				+ "' and LichChieu.NgayChieu ='"
				+ ngayChieu
				+ "'";
		ResultSet rs1 = st.executeQuery(sql1);
%>
<fieldset><legend><font face="Arial " color="black" size="5"> Xuất chiếu </font></legend>
<table>
	<tr>
		<td>
		<table width=100%>
			<%
				while (rs1.next()) {
			%>
			<tr class="ourCompany-list1">
				<td align=left><a href=""
					onclick="chuyenManHinh('Datve.jsp?<%=tenPhim2%>&<%=ngayChieu%>&gioChieu=<%=rs1.getString(1)%>&phutChieu=<%=rs1.getString(2)%>')"><font
					face=" Arial " color="333333"><%=rs1.getString(1)%>h<%=rs1.getString(2)%></font></a></td>
			</tr>
			<%
				} //end while (rs1.next()) {
				} //end if (tenPhim2 != null) {
			%>
		</table>
		</td>
	</tr>
	<tr>
		<td><font color="#951509" face="Arial Narrow" size="3">Quý khách vui lòng click vào xuất chiếu để đặt vé</font></td>
	</tr>
</table>
</fieldset>
</form>
</div>
</div>
</body>
</html>