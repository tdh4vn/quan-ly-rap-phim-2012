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
<%
	//ở đây mình đã có tên phim & ngày chiếu từ trang banve_chonngay & banve_chonphim
	//ta đã đẩy dữ liệu ngày chiếu vào session ở trang banve_chonphim.
	//ở trang này ta đẩy dữ liệu tên phim vào session.
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
<fieldset><legend><font face="Arial " color="black" size="5"> Xuất chiếu </font></legend> <%
 	//ngày chiếu đã dc set vào session sau khi click vào link ngày chiếu ở
 	//frame chọn ngày  
 	String ngayChieu = "" + session.getAttribute("ngayChieuAttribute");

 	//tên phim dc lấy từ lúc click vào link ở frame tên phim.
 	String tenPhim2 = request.getParameter("tenPhim");
 	//xử lý để tránh trường hợp quăng báo lỗi khi load lần đầu:
 	//nếu tên phim khác null thì mới xử lý, ngc lại hiện trang trống
 	if (tenPhim2 != null) {
 		//đẩy dữ liệu tên phim vào session.
 		session.setAttribute("tenPhim3", tenPhim2);
 %>
<table>
	<tr>
		<td>
		<table width=100%>
			<%
				String sql_long = "select x.giochieu, x.phutchieu, l.maphong, x.maxuatchieu, l.malichchieu "
							+ "from xuatchieu x left join phim p on x.maphim = p.maphim "
							+ "left join lichchieu l on x.maxuatchieu = l.maxuatchieu "
							+ "where p.tenphim = '"
							+ tenPhim2
							+ "'"
							+ "and l.ngaychieu = '" + ngayChieu + "'";
					System.out.println("cau sql chon xuat chieu:  " + sql_long);
					ResultSet rs1 = st.executeQuery(sql_long);
					while (rs1.next()) {
			%>
			<tr class="ourCompany-list1">
				<td align=left><a href=""
					onclick="chuyenManHinh('Giaodich.jsp?tphim=<%=tenPhim2%>&<%=ngayChieu%>&gioChieu=<%=rs1.getString(1)%>&phutChieu=<%=rs1.getString(2)%>&maPhong=<%=rs1.getString(3)%>&maXuatChieu=<%=rs1.getString(4)%>&maLichChieu=<%=rs1.getString(5)%>')"><font
					face="Arial" color="333333"><%=rs1.getString(1)%>h<%=rs1.getString(2)%> <%=rs1.getString(3)%></font></a> <%
 	} //end while (rs1.next()) {
 	} //end if(tenPhim2 != null) {
 %>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</fieldset>
<br>
<br>
<br>
</div>
</div>
</body>
<script>
function chuyenManHinh(path){
    parent.parent.location = path;
}
</script>
</html>