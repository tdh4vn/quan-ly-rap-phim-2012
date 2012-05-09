
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.util.*"%>
<title>Giao dịch</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--Header Background Part Starts -->
<%@include file="Header.jsp"%>
<!--Header Background Part Ends -->
<!--Navigation Background Part Starts -->
<%
	if (session.getAttribute("tenDangNhapTV") == null) {
%>
<%@include file="MenuUser.jsp"%>
<%
	} else {
%>
<%@include file="MenuUserDaDangNhap.jsp"%>
<%
	}
%>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg"><!--Our Company Part Starts -->
<div id="ourCompany-part">
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
	String tenPhim = "" + session.getAttribute("tenPhim3");
	String ngayChieu = "" + session.getAttribute("ngayChieuAttribute");
	

	String SLveThuong = request.getParameter("soluongVeThuong");
    String SLveVip = request.getParameter("soluongVeVip");
    String maPhim3 = request.getParameter("maPhimName");
    String maXuatChieu = request.getParameter("maXuatchieu");
    String maLichChieu = request.getParameter("maLichchieu");
    String tendn = "" + session.getAttribute("tenDangNhapTV");
%>
<form action="Datve.jsp">
<table width="100%">
	<tr>
		<td colspan=8 align="center">
		<h2 class="ourCompany-hdr">Đặt vé</h2>
		</td>
	</tr>
	<tr>
		<td colspan="8"><br>
		<table width="80%" align="center">
			<tr>
				<%
					if ("Loi".equals(request.getParameter("error"))) {
						out.write("Bạn phải đăng nhập để đặt vé !!!");
					}
					if ("thanhcong1".equals(request.getParameter("Thanhcong1"))) {
						out.write("Bạn phải chọn số lượng ghế!!!!");
					}
					 if ("thanhcong".equals(request.getParameter("Thanhcong"))) {
				            out.write("Chúc mừng bạn đặt vé thành công.Mã vé của bạn là  ");%>
				                <%=maVeVuaSinhRa%>  
				                <%out.write(" Xin đến quầy thanh toán và nhận vé trước giờ chiếu 30 phút. Xin cảm ơn! ");
				            
				             }
				                %>
			</tr>

			<tr>
				<td colspan="7" align="right"></td>
			</tr>
			<marquee><a href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN"
				src="http://Taochu.Uhm.vN/chu/52/k.gif" border='0'> <a
				href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN"
				src="http://Taochu.Uhm.vN/chu/52/h.gif" border='0'> <a
				href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN"
				src="http://Taochu.Uhm.vN/chu/52/u.gif" border='0'> <a
				href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN"
				src="http://Taochu.Uhm.vN/chu/52/y.gif" border='0'> <a
				href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN"
				src="http://Taochu.Uhm.vN/chu/52/e.gif" border='0'> <a
				href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN"
				src="http://Taochu.Uhm.vN/chu/52/n.gif" border='0'> <a
				href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN"
				src="http://Taochu.Uhm.vN/chu/52/m.gif" border='0'> <a
				href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN"
				src="http://Taochu.Uhm.vN/chu/52/a.gif" border='0'> <a
				href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN"
				src="http://Taochu.Uhm.vN/chu/52/i.gif" border='0'> </a></marquee>
			<tr>
				<td>Tên phim :</td>
				<td><%=tenPhim%></td>
				<td></td>
				<td>Ngày chiếu:</td>
				<td><%=ngayChieu%></td>


			</tr>
		</table>
		<table width=100% border="1">
			<tr bgcolor="333333">
				<td><font color="#CBC387">Các loại vé:</font></td>
				<td><font color="#CBC387">Số lượng:</font></td>
				<td><font color="#CBC387">Đơn giá:</font></td>
				<td><font color="#CBC387">Thành tiền:</font></td>
			</tr>

			<tr class="ourCompany-list">
				<td><label> Vé thường </label></td>
				<td><select name="soluongVeThuong" id="SLveThuongid" onchange="tongTienThuong();">
					<option value="1">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
				</select></td>
				<%
					String sql1 = "Select SoTien from Gia where MaLoaiGhe = 'T'";
					ResultSet rs1 = st.executeQuery(sql1);
					rs1.next();
				%>
				<td><label id="giaVeThuong"> <%=rs1.getString(1)%></label></td>
				<td><label id="tongTienThuongId"> </label></td>
			</tr>
			<tr class="ourCompany-list">
				<td><label> Vé VIP </label></td>
				<td><select name="soluongVeVip" id="SLveVIPid" onchange="tongTienVIP();">
					<%
						for (int j = 0; j <= 8; j++) {
					%><option value="<%=j%>"><%=j%></option>
					<%
						}
					%>
				</select></td>
				<%
					String sql2 = "Select SoTien from Gia where MaLoaiGhe = 'V'";
					ResultSet rs2 = st.executeQuery(sql2);
					rs2.next();
				%>
				<td><label id="giaveVIP"> <%=rs2.getString(1)%></label></td>
				<td><label id="tongTienVIPId"> </label></td>
			</tr>
		</table>
		<table width="100%">
			<tr>
				<%
					String sql3 = " Select  XuatChieu.MaXuatChieu,XuatChieu.MaPhim,"
							+ "LichChieu.MaLichChieu from XuatChieu, LichChieu, Phim "
							+ "where XuatChieu.MaPhim = Phim.MaPhim "
							+ "and XuatChieu.MaXuatChieu = LichChieu.MaXuatChieu "
							+ "and Phim.TenPhim ='" + tenPhim
							+ "'and LichChieu.NgayChieu ='" + ngayChieu + "'";
					ResultSet rs3 = st.executeQuery(sql3);
					while (rs3.next()) {
				%>
				<td><input type="hidden" name="maXuatchieu" value="<%=rs3.getString(1)%>"></td>
				<td><input type="hidden" name="maPhimName" value="<%=rs3.getString(2)%>"></td>
				<td><input type="hidden" name="maLichchieu" value="<%=rs3.getString(3)%>"></td>
				<%
					}
				%>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit" value="Đặt vé" name="DatVevalue"></td>
			</tr>
		</table>
		<table width="100%">
			<tr>
				<td colspan="5" align="left"><font color="#951509" face="Arial Narrow" size="3">Lưu ý : Đơn giá trên là
				đơn giá chưa khuyến mãi </font></td>

				<td colspan="3" align="right"><a href="Sodoghe_user.jsp">Xem sơ đồ ghế</a></td>
			</tr>

		</table>
		<br>
		<br>
		<br>
		<br>
		</td>
	</tr>
</table>
</form>
 <%!public void Xulydatve(String SLveThuong, String SLveVip, String maPhim3,
			String maXuatChieu, String maLichChieu, String tendn) {
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
			String sql = "INSERT INTO [Quanlybanvephim].[dbo].[DanhSachDatVeOnline]"
					+ "([TenDangNhapTV],[SoLuongVeThuong] ,[MaPhim],[SoLuongVeVip],[MaXuatChieu],"
					+ "[MaLichChieu],[TrangThaiDatVe])VALUES ('"
					+ tendn
					+ "','"
					+ SLveThuong
					+ "' ,'"
					+ maPhim3
					+ "' ,'"
					+ SLveVip
					+ "' ,'"
					+ maXuatChieu
					+ "' ,'"
					+ maLichChieu
					+ "','chua xac nhan')";
			System.out.println("============" + sql);
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
	<%!String tk;
    int maVeVuaSinhRa; %>
	 <%!public int layMaVeVuaSinhRa() {
		int kq = 0;
		Connection connection = null;
		String data = "jdbc:jtds:sqlserver://localhost:1433/Quanlybanvephim";
		String userName = "sa";
		String password = "123";
		String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
		Statement st = null;
		ResultSet rs = null;
		try {
			Class.forName(JDBC_Driver);
			connection = DriverManager.getConnection(data, userName, password);
			st = connection.createStatement();
			String sql = "SELECT TOP 1 * FROM danhsachdatveonline ORDER BY maxacnhan DESC";
			rs = st.executeQuery(sql);
			rs.next(); //sai ở câu lệnh này
			kq = rs.getInt(1);
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
		return kq;
	}%> <%
 	tk = request.getParameter("DatVevalue");
 	System.out.println(tk);
 	if ("Äáº·t vÃ©".equals(tk)) {
 		if (session.getAttribute("tenDangNhapTV") == null) {
 			String linkTraVe = "Datve2.jsp?error=Loi";
 			response.sendRedirect(linkTraVe);
 		} else {
 			if (SLveThuong.equals("0") && SLveVip.equals("0")) {
 				response
 						.sendRedirect("Datve.jsp?Thanhcong1=thanhcong1");
 			} else {
 				Xulydatve(SLveThuong, SLveVip, maPhim3, maXuatChieu,
 						maLichChieu, tendn);
 				maVeVuaSinhRa = layMaVeVuaSinhRa();
 				System.out.println("maVeVuaSinhRa="+maVeVuaSinhRa);
 				response.sendRedirect("Datve.jsp?Thanhcong=thanhcong");
 			}
 		}
 	}
 %> <br>
<br>
<br>
<br>
</div>
<!--Our Company Part Ends --></div>
<!--Our Company Bacground Part Ends -->
<!--Future Plans Part Starts -->
<%@include file="Footer.jsp"%>
<!--Footer Part Ends -->
</body>
<Script>
function tongTienThuong(){
    var tongTien = document.getElementById("tongTienThuongId").innerHTML ;
    var soLuongVeThuong = document.getElementById("SLveThuongid").value ;
    var giaVeThuong = document.getElementById("giaVeThuong").value;
    document.getElementById("tongTienThuongId").innerHTML = soLuongVeThuong * giaVeThuong;
}
function tongTienVIP(){
    document.getElementById("tongTienVIPId").innerHTML = (document.getElementById("SLveVIPid").value) * (document.getElementById("giaveVIP").innerHTML);
	var tenMucTongTienVIP = document.getElementById('SLveVIPid').value ;
	document.getElementById("tongTienVIPId").innerHTML = (document.getElementById("SLveVIPid").value) * (document.getElementById("giaveVIP").innerHTML);
}

</Script>
</html>