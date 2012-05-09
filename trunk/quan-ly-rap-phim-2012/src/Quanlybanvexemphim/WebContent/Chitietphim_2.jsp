<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<title>Chi tiết phim</title>
</head>
<script>
function Trim(sString) {
    while (sString.substring(0,1) == ' ') {
        sString = sString.substring(1, sString.length);
    }
    while (sString.substring(sString.length-1, sString.length) == ' ') {
        sString = sString.substring(0,sString.length-1);
    }
    return sString;
}
function Kiemtrabinhluan(){
    var obj1Value = document.getElementById("Binhluantxt").value; 
    if (Trim(obj1Value) == "" || obj1Value == undefined){
        alert(" Bạn chưa nhập bình luận ");
        return false;
    } 
    return true; //true co nghia la cac dieu kien deu thoa het
}
</script>
<body link="black" alink="black" vlink="black">
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

	String mphim1 = request.getParameter("mphim");
	String tentv1 = "" + session.getAttribute("tenDangNhapTV");
	String binhLuan = request.getParameter("NoiDungBinhLuan");

	String sql = "SELECT [AnhDaiDien],[TenPhim],[TenDangPhim],[TenLoaiPhim], "
			+ "[TenQuocGia],[DoDaiGio],[DoDaiPhut],[MoTaPhim] "
			+ " FROM [Quanlybanvephim].[dbo].[Phim],[DangPhim],[LoaiPhim],[QuocGia] "
			+ " where [Phim].[MaDangPhim]=[DangPhim].[MaDangPhim] "
			+ " and [Phim].[MaLoaiPhim]=[LoaiPhim].[MaLoaiPhim] "
			+ " and [Phim].[MaQuocGia]=[QuocGia].[MaQuocGia] "
			+ " and [Phim].[MaPhim]='" + mphim1 + "'";
	ResultSet rs = st.executeQuery(sql);
%>
<%@include file="Header.jsp"%>
<%@include file="MenuUser.jsp"%>
<div id="ourCompany-bg">
<div id="ourCompany-part">
<form method="post" action="Chitietphim.jsp?mphim=<%=mphim1%>">
<table width="100%">
	<tr>
		<!-- hiển thị dòng "xin chào Dương Ngọc Trang" ở phía trên bên trái -->
		<td colspan="8" align="right"><font face=" Arial " color="333333"> Xin chào <%=tentv1%>! </font></td>
	</tr>
	<%
		while (rs.next()) {
	%>
	<tr>
		<td colspan="8">
		<table width="100%">
			<tr class="ourCompany-list">
				<td align="center"><img src="<%out.println(rs.getString(1)); %>" width="400" height="550"></img></td>
				<td><font face="Arial " color="black" size="5"> <%=rs.getString(2)%> </font> <br />
				Dạng phim: <%=rs.getString(3)%><br>
				Loại phim: <%=rs.getString(4)%><br>
				Quốc gia :<%=rs.getString(5)%><br>
				Độ dài :<%=rs.getString(6)%> giờ <%=rs.getString(7)%> phút<br>
				Mô tả phim: <%=rs.getString(8)%><br>
				<font face="Tahoma" size="3"> <a href="Chitietlichchieu.jsp?mphim=<%=mphim1%>">Đặt vé</a></font></td>
			</tr>
			<tr>
				<td align="center"><font color="#951509" face="Arial Narrow" size="3"> Bạn phải đăng nhập để bình luận</font></td>
			</tr>
			<%
				} //end while (rs.next()) {
			%>
			<tr>
				<td align="center"><input type="text" name="NoiDungBinhLuan" id="Binhluantxt" size="50"
					style="height: 79px; width: 415px;"><br>
				<%
					if ("Loi".equals(request.getParameter("error"))) {
						out.write("Bạn phải đăng nhập để bình luận!!!!!!!!!!!!!!!!!!!");
					}
				%>
				</td>
			</tr>
			<tr>
				<td align="center"><input type="submit" name="btnBinhLuan" value="Bình luận"
					onclick="return Kiemtrabinhluan();"></td>
				<%!String tk;%>
				<%
					tk = request.getParameter("btnBinhLuan");
					if ("BÃ¬nh luáº­n".equals(tk)) {
						if (session.getAttribute("tenDangNhapTV") == null) {
							String linkTraVe = "Chitietphim.jsp?error=Loi"+"&mphim=" + mphim1;
							response.sendRedirect(linkTraVe);
						} else {
							Xulybinhluan(tentv1, mphim1, binhLuan);
						}
					}
				%>
			</tr>
			<tr>
				<td colspan="6">
				<hr />
				<table width="100%">
					<tr>
						<%
							String sql1 = "select TenDangNhapTV, NoiDungBinhLuan "
									+ "from "
									+ "binhluan inner join phim on binhluan.maphim = phim.maphim "
									+ "WHERE phim.maphim = '" + mphim1 + "'";
							ResultSet rs1 = st.executeQuery(sql1);
							System.out.println("câu lệnh để lấy cái bình luận  vừa rồi========"
									+ sql1);
							while (rs1.next()) {
						%>
						<td><font size="3" face="Tahoma"><b><label><%=rs1.getString(1)%></label>:</b></font></td>
						<td></td>
						<td width="900"><font size="2" face="Tahoma"><label><%=rs1.getString(2)%></label></font></td>
					</tr>
					<%
						}
					%>
				</table>
				</td>
		</table>
		</td>
	</tr>
</table>
</form>
</div>
</div>
<%@include file="Footer.jsp"%>
</body>
<%!public void Xulybinhluan(String ma, String maphim, String binhLuan) {
		Connection connection = null;
		String data = "jdbc:jtds:sqlserver://localhost:1433/Quanlybanvephim";
		String userName = "sa";
		String password = "123";
		String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
		Statement st = null;
		try {
			Class.forName(JDBC_Driver);
			connection = DriverManager.getConnection(data, userName, password);
			st = connection.createStatement();
			String sql = "insert into BinhLuan (TenDangNhapTV,MaPhim,NoiDungBinhLuan) values ('"
					+ ma + "','" + maphim + "','" + binhLuan + "')";
			System.out.println("cau sql chen binh luan: " + sql);
			st.executeUpdate(sql);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (Exception e) {
					System.out.println("Khong dong duoc ket noi");
				}
			}
			if (st != null) {
				try {
					st.close();
				} catch (Exception e) {
					System.out.println("Khong dong duoc ket noi");
				}
			}
		}
	}%>
</html>