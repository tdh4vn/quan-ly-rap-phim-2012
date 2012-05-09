
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.util.*"%>
<title>Đặt vé</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
	function message() {
		var userName = document.getElementById("user").value();
		alert(userName);
		//alert("Chúc mừng bạn đặt vé thành công. Xin hãy nhớ mã vé này để đến quầy thanh toán và nhận vé trước giờ chiếu 30 phút. Xin cảm ơn! "); 
  	}
  	function kiemTraDangNhap() {
  		var userName = document.getElementById('user').value();
		alert(userName);
		if(userName != "") {
   			alert("Chúc mừng bạn đặt vé thành công. Xin hãy nhớ mã vé này để đến quầy thanh toán và nhận vé trước giờ chiếu 30 phút. Xin cảm ơn! "); 
   		} else {
   			alert("bạn chưa đăng nhập");
   		}
  	}
 </script>

<body>
<!--Header Background Part Starts -->
<%@include file="Header.jsp"%>
<!--Header Background Part Ends -->
<!--Navigation Background Part Starts -->
<%@include file="MenuUser.jsp"%>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg"><!--Our Company Part Starts -->
<div id="ourCompany-part">
<form action="Datve2.jsp">
<table width="100%">
	<tr>
		<td colspan=8 align="center">
		<h2 class="ourCompany-hdr">Đặt vé</h2>
		</td>
	</tr>
	<tr>
		<td colspan="8"><br>
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
			String giochieu1 = request.getParameter("gioChieu");
			session.setAttribute("gioChieuatrribute", giochieu1);
			String phutchieu1 = request.getParameter("phutChieu");
			session.setAttribute("phutChieuatrribute", phutchieu1);
		%>
		<table width="80%" align="center">
		<tr>
		<%
                    if ("Loi".equals(request.getParameter("error"))) {
                        out.write("Bạn phải đăng nhập để đặt vé !!!");
                    }
		 if ("thanhcong1".equals(request.getParameter("Thanhcong1"))) {
             out.write("Bạn phải chọn số lượng ghế!!!");
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
			
			<marquee><a href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN" src="http://Taochu.Uhm.vN/chu/52/k.gif" border='0'>
			<a href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN" src="http://Taochu.Uhm.vN/chu/52/h.gif" border='0'>
			<a href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN" src="http://Taochu.Uhm.vN/chu/52/u.gif" border='0'>
			<a href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN" src="http://Taochu.Uhm.vN/chu/52/y.gif" border='0'>
			<a href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN" src="http://Taochu.Uhm.vN/chu/52/e.gif" border='0'>
			<a href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN" src="http://Taochu.Uhm.vN/chu/52/n.gif" border='0'>
			<a href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN" src="http://Taochu.Uhm.vN/chu/52/m.gif" border='0'>
			<a href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN" src="http://Taochu.Uhm.vN/chu/52/a.gif" border='0'>
			<a href="http://localhost:8080/Quanlybanvexemphim/Sukien.jsp"><img alt="http://Taochu.Uhm.vN" src="http://Taochu.Uhm.vN/chu/52/i.gif" border='0'>
			</a></marquee>
				
			<tr>
				<td>Tên phim :</td>
				<td><%=session.getAttribute("tenphimAttribute")%></td><td></td>
				<td>Ngày chiếu:</td>
				<td><%=session.getAttribute("ngayChieuAttribute")%></td>
				<!--				lấy dữ liệu đăng nhập để kiểm tra--> 
				<td><input type="hidden" id="user" value=<%=session.getAttribute("TenDangNhapTV")%> /></td>

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
				<td><select name="soluongVeThuong" id="SLveThuongid"
					onchange="tongTienThuong();">
					<%
						for (int i = 0; i <= 8; i++) {
					%><option value="<%=i %>"><%=i%></option>
					<%
						}
					%>

				</select></td>
				<%
					String sql1 = "Select SoTien from Gia where MaLoaiGhe = 'T'";
					ResultSet rs1 = st.executeQuery(sql1);
					while (rs1.next()) {
				%>
				<td><label id="giaVeThuong"> <%
 	out.println(rs1.getString(1));
 	}
 %> </label></td>

				<td><label id="tongTienThuongId"> </label></td>
			</tr>

			<tr class="ourCompany-list">
				<td><label> Vé VIP </label></td>
				<td><select name="soluongVeVip" id="SLveVIPid"
					onchange="tongTienVIP();">
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
					while (rs2.next()) {
				%>
				<td><label id="giaveVIP"> <%
 	out.println(rs2.getString(1));
 	}
 %> </label></td>
				<td><label id="tongTienVIPId"> </label></td>
			</tr>
		</table>
		<table width="100%">
			<tr>
				<%
					String sql3 = " Select  XuatChieu.MaXuatChieu,XuatChieu.MaPhim,LichChieu.MaLichChieu from XuatChieu, LichChieu, Phim where XuatChieu.MaPhim = Phim.MaPhim and XuatChieu.MaXuatChieu = LichChieu.MaXuatChieu and Phim.MaPhim ='"
							+ session.getAttribute("maPhim3")
							+ "'and LichChieu.NgayChieu ='"
							+ session.getAttribute("ngayChieuAttribute") + "'";
					ResultSet rs3 = st.executeQuery(sql3);
					while (rs3.next()) {
				%>
				<td><input type="hidden" name="maXuatchieu"
					value="<%=rs3.getString(1)%>"></td>
				<td><input type="hidden" name="maPhimName"
					value="<%=rs3.getString(2)%>"></td>
				<td><input type="hidden" name="maLichchieu"
					value="<%=rs3.getString(3)%>"></td>
				<%
					}
				%>

			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit"
					value="Đặt vé" name="DatVevalue" > <%
 	String SLveThuong = request.getParameter("soluongVeThuong");
 	System.out.println("So luong ve thuong la====" + SLveThuong);
 	String SLveVip = request.getParameter("soluongVeVip");
 	System.out.println("So luong ve Vip la ====" + SLveVip);
 	String maPhim3 = request.getParameter("maPhimName");
 	System.out.print("ma phim o day la ===" + maPhim3);
 	String maXuatChieu = request.getParameter("maXuatchieu");
 	System.out.print("ma xuatchieu o day la ===" + maXuatChieu);
 	String maLichChieu = request.getParameter("maLichchieu");
 	System.out.print("ma xuatchieu o day la ===" + maLichChieu);
 	String tendn = "" + session.getAttribute("tenDangNhapTV");
 	System.out.print("ta la sieu nhan day, ten ta la ===" + tendn);
 %> <%!public void Xulydatve(String SLveThuong, String SLveVip, String maPhim3,
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
			String sql = "INSERT INTO [Quanlybanvephim].[dbo].[DanhSachDatVeOnline]([TenDangNhapTV],[SoLuongVeThuong] ,[MaPhim],[SoLuongVeVip],[MaXuatChieu],[MaLichChieu],[TrangThaiDatVe])VALUES ('"
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
	}%> <%!public int layMaVeVuaSinhRa() {
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
	
	}
%> <%!String tk;
	int maVeVuaSinhRa;%> <%
 	tk = request.getParameter("DatVevalue");
 	System.out.println(tk);
 	if ("Äáº·t vÃ©".equals(tk)) {
 		
 		if (session.getAttribute("tenDangNhapTV") == null) {
            String linkTraVe = "Datve2.jsp?error=Loi";
            response.sendRedirect(linkTraVe);
        } else {
        	if(SLveThuong.equals("0")&&SLveVip.equals("0"))
        	{
        		
        	
        		response.sendRedirect("Datve2.jsp?Thanhcong1=thanhcong1 ");	
        	}
        	else
        	{
        		//gọi hàm insert 1 record moi vao bang datveonline
                Xulydatve(SLveThuong, SLveVip, maPhim3, maXuatChieu,
                        maLichChieu, tendn);
                //goi hàm để lấy mã vé vừa sinh ra
                maVeVuaSinhRa = layMaVeVuaSinhRa();
                response.sendRedirect("Datve2.jsp?Thanhcong=thanhcong");
        	}
 		
        }
 	}
 %>
				</td>
			</tr>
		</table>
		<table width="100%">
			
			<tr>
				<td colspan="5" align="left"><font color="#951509"
					face="Arial Narrow" size="3">Lưu ý : Đơn giá trên là đơn giá
				chưa khuyến mãi </font></td>
				<td colspan="3" align="right"><a href="Sodoghe_user.jsp">Xem
				sơ đồ ghế</a></td>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<br>
		</td>
	</tr>
	<tr></tr>
	<tr></tr>
	<tr></tr>

</table>
</form>
<br>
<br>
<br>
<br>
</div>

</div>

<%@include file="Footer.jsp"%>

</body>
<Script>
function tongTienThuong()
{document.getElementById("tongTienThuongId").innerHTML = (document.getElementById("SLveThuongid").value) * (document.getElementById("giaVeThuong").innerHTML);
var tenMucTongTienThuong = document.getElementById('SLveThuongid').value ;
document.getElementById("tongTienThuongId").innerHTML = (document.getElementById("SLveThuongid").value) * (document.getElementById("giaVeThuong").innerHTML);
}

function tongTienVIP()
{
 document.getElementById("tongTienVIPId").innerHTML = (document.getElementById("SLveVIPid").value) * (document.getElementById("giaveVIP").innerHTML);
 var tenMucTongTienVIP = document.getElementById('SLveVIPid').value ;
 document.getElementById("tongTienVIPId").innerHTML = (document.getElementById("SLveVIPid").value) * (document.getElementById("giaveVIP").innerHTML);
}

</Script>
</html>