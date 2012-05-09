<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Phim Đang chiếu</title>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
</head>
<body>
<%@include file="Header.jsp"%>
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
<div id="ourCompany-bg" align="center">
<form action="phimdangchieu.jsp" method="post">

<table border="0" width="70% ">
	<%
		//CODE PHIM DANG CHIEU MOI
		Connection connection = null;
		String data = "jdbc:jtds:sqlserver://localhost:1433/Quanlybanvephim";
		String userName = "sa";
		String passWord = "123";
		String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
		Statement st = null;
		Class.forName(JDBC_Driver);
		connection = DriverManager.getConnection(data, userName, passWord);
		st = connection.createStatement();
		String querｙ = "SELECT count(*) FROM Phim";
		ResultSet hang = st.executeQuery(querｙ);
		String tk;
		ResultSet pt = null;
		int p_one = 1;

		// Code tạo phân trang
		int sohang = 0;
		if (hang.next()) {
			sohang = hang.getInt(1);
		}

		// ở đây biến phân trang dùng cho URL là [B]p[/B]
		int p = 2;
		String sob = request.getParameter("p");
		if (sob != null) {
			if (sob.equals("0")) {
				p = 0;
			} else {
				p = Integer.parseInt(sob) - 1;

			}
		}
		// số record
		p_one = p_one + p + 1;
		String sql, sql1, sql2, sql3, sql4;
		int dem1, dem, dem2, dem3;
		ResultSet rs1, rs2, rs9, rs8;
		tk = request.getParameter("bttimkiem");
		System.out.println("toi đay chua !!!!!!!!!!!!!!!");
		System.out.println("tim kiem===============" + tk);
		if ("TÃ¬m kiáº¿m".equals(tk)) {
			String dangphim = request.getParameter("dangphim");
			String theloai = request.getParameter("theloai");
			String quocgia = request.getParameter("quocgia");
			String ngay = request.getParameter("ngay");
			String thang = request.getParameter("thang");
			String nam = request.getParameter("nam");
			String gia = request.getParameter("gia");
			String tenphim = request.getParameter("tenphim");
			String sql9 = "SELECT phim.maphim,phim.anhdaidien, phim.tenphim, "
					+ "phim.dodaigio, phim.dodaiphut, lichchieu.ngaychieu, "
					+ "phim.motaphim, loaiphim.tenloaiphim "
					+ "FROM phim left join quocgia on phim.maquocgia = quocgia.maquocgia "
					+ "left join dangphim on phim.madangphim = dangphim.madangphim "
					+ "left join loaiphim on phim.maloaiphim = loaiphim.maloaiphim "
					+ "inner join  xuatchieu on phim.maphim= xuatchieu.maphim "
					+ "left join lichchieu on xuatchieu.maxuatchieu = lichchieu.maxuatchieu "
					+ "left join ve on xuatchieu.maxuatchieu = ve.maxuatchieu"
					+ " WHERE (NgayChieu between getdate() and dateadd(dd,7,getdate()))";
			// nếu 1 trong mấy cái parameter ni có dữ liệu thì thêm chữ AND
			if ("".equals(theloai) == false || "".equals(quocgia) == false
                || "".equals(ngay) == false || "".equals(thang) == false
                || "".equals(nam) == false || "".equals(gia) == false
                || "".equals(tenphim) == false) {
            sql9+= " AND ";
        }
			// xử lý từng parameter, 
			String dieuKien = "";
			if ("".equals(theloai) == false)  {
				//nếu chưa có điều kiện nào thị nối đoạn vào luôn.
				// ngược lại, nếu đã có điều kiện khác rồi thì phải có "OR"
				if("".equals(dieuKien)) {
					dieuKien += " loaiphim.maloaiphim = '" + theloai + "'";
				} else {
					dieuKien += " OR loaiphim.maloaiphim = '" + theloai + "'";
				}
			}
			if ("".equals(quocgia)== false) {
				//nếu chưa có điều kiện nào thị nối đoạn vào luôn.
                // ngược lại, nếu đã có điều kiện khác rồi thì phải có "OR"
                if("".equals(dieuKien)) {
                    dieuKien += " quocgia.maquocgia= '" + quocgia + "'";
                } else {
                    dieuKien += " OR quocgia.maquocgia= '" + quocgia + "'";
                }
			}
			if ("".equals(ngay)== false) {
				if("".equals(dieuKien)) {
                    dieuKien += " day(lichchieu.ngaychieu)= '" + ngay + "'";
                } else {
                    dieuKien += " OR day(lichchieu.ngaychieu)= '" + ngay + "'";
                }
			}
			if ("".equals(thang)== false) {
				if("".equals(dieuKien)) {
                    dieuKien += " month(lichchieu.ngaychieu)= '" + thang + "'";
                } else {
                    dieuKien += " OR month(lichchieu.ngaychieu)= '" + thang + "'";
                }
			}
			if ("".equals(nam)== false) {
				if("".equals(dieuKien)) {
                    dieuKien += " year(lichchieu.ngaychieu)= '" + nam + "'";
                } else {
                    dieuKien += " OR year(lichchieu.ngaychieu)= '" + nam + "'";
                }
			}
			if ("".equals(gia)== false) {
				if("".equals(dieuKien)) {
                    dieuKien += " ve.DonGia= '" + gia + "'";
                } else {
                    dieuKien += " OR ve.DonGia= '" + gia + "'";
                }
			}
			if ("".equals(tenphim) == false) {
			
				if("".equals(dieuKien)) {
                    dieuKien += "phim.tenphim = '" + tenphim + "'";
                } else {
                    dieuKien += " phim.tenphim= '" + tenphim + "'";
                }
			}
		    sql9 += dieuKien;
			System.out.println("câu lenh tim kiem============" + sql9);
			rs9 = st.executeQuery(sql9);
			while (rs9.next()) {
	%>
	<tr class="ourCompany-list">
		<td width=300 align="center"><a
			href="Chitietphim.jsp?mphim=<%=rs9.getString(1)%>" target="_blank">
		<img src="<%out.println(rs9.getString(2)); %>" width="300"
			height="450"></img> </a></td>
		<td colspan=3 align="left"><font face="Arial " color="black"
			size="2"> Tên phim:<%
			out.println(rs9.getString(3));
		%> </font> <br>
		Thời lượng:<%
 	out.println(rs9.getString(4));
 %>giờ<%
 	out.println(rs9.getString(5));
 %> <br>
		Thể loại: <%
 	out.println(rs9.getString(8));
 %> <br>
		Ngày chiếu:<%
 	out.println(rs9.getString(6));
 %> <br>
		Mô tả phim:<%
 	out.println(rs9.getString(7));
 %> <br>
		<a href=" Datve.jsp">Đặt vé </a></td>
		<%
			} // while rs8
		%>
		<td colspan=3><br>
		<br>
		<br>
		<br>
		<fieldset><legend> <font face="Arial "
			color="black" size="5">Tìm kiếm </font></legend>
		<div align="center">
		<table width=100%>
			<tr class="ourCompany-list">
				<td align="left">Dạng phim:</td>
				<td><select name="dangphim" style="width: 150px; height: 18px;">
					<%
						sql = "SELECT [MaDangPhim],[TenDangPhim]FROM [Quanlybanvephim].[dbo].[DangPhim] ";
						rs1 = st.executeQuery(sql);
						ResultSetMetaData rsmd = rs1.getMetaData();
						dem = rsmd.getColumnCount();
					%>
					<option value="">chọn</option>
					<%
						while (rs1.next()) {
						    for (int i = 1; i < dem; i++) {
					%>
					<option value="<%=rs1.getString(1) %>"><%=rs1.getString(2)%></option>
					<%
				            } // end for
						} //end while
					%>
				</select></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Thể loại:</td>
				<td><select name="theloai" style="width: 150px; height: 18px;">
					<%
						sql1 = "SELECT [MaLoaiPhim],[TenLoaiPhim]FROM [Quanlybanvephim].[dbo].[LoaiPhim] ";
							ResultSet rs = st.executeQuery(sql1);
							ResultSetMetaData rsmd1 = rs.getMetaData();
							dem1 = rsmd.getColumnCount();
					%>
					<option value="">chọn</option>
					<%
						while (rs.next()) {
								for (int i = 1; i < dem1; i++) {
					%>
					<option value="<%=rs.getString(1) %>"><%=rs.getString(2)%></option>
					<%
						}
							}
					%>
				</select></td>
			</tr>

			<tr class="ourCompany-list">
				<td align="left">Quốc gia:</td>
				<td><select name="quocgia" style="width: 150px; height: 18px;">
					<%
						sql2 = "SELECT [MaQuocGia],[TenQuocGia]FROM [Quanlybanvephim].[dbo].[QuocGia] ";
							rs2 = st.executeQuery(sql2);
							ResultSetMetaData rsmd2 = rs2.getMetaData();
							dem2 = rsmd.getColumnCount();
					%>
					<option value="">chọn</option>
					<%
						while (rs2.next()) {
								for (int i = 1; i < dem2; i++) {
					%>
					<option value="<%=rs2.getString(1) %>"><%=rs2.getString(2)%></option>
					<%
						}
							}
					%>
				</select></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Ngày chiếu:</td>
				<td><select name="ngay" style="width: 60px; height: 18px;">
					<option value="">chọn</option>
					<%
						for (int i = 1; i <= 31; i++) {
					%><option value=<%=i%>><%=i%></option>
					<%
						}
					%>
				</select> <select name="thang" style="width: 60px; height: 18px;">
					<option value="">chọn</option>
					<%
						for (int i = 1; i <= 12; i++) {
					%><option value=<%=i%>><%=i%></option>
					<%
						}
					%>
				</select> <select name="nam" style="width: 60px; height: 18px;">
					<option value="">chọn</option>
					<%
						for (int i = 2012; i <= 2030; i++) {
					%><option value=<%=i%>><%=i%></option>
					<%
						}
					%>
				</select></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Giá vé</td>
				<td><input type="text" size="10" name="gia"> <label>000vnd</label></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Tên phim:</td>
				<td><input type="text" size="30" name="tenphim"></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="right">
				<center><input type="submit" name="bttimkiem"
					value="Tìm kiếm"></center>
				</td>
			</tr>

		</table>
		</div>
		</fieldset>
		<br>
		<br>
		<br>
		<br>
		<%
			} else {

				String sel = "select top 2 * from ( select top "
						+ p_one
						+ " phim.maphim,anhdaidien, phim.tenphim, phim.dodaigio, phim.dodaiphut, lichchieu.ngaychieu, phim.motaphim, loaiphim.tenloaiphim from lichchieu inner join xuatchieu on xuatchieu.maxuatchieu = lichchieu.Maxuatchieu inner join phim on xuatchieu.maphim = phim.maphim inner join loaiphim on phim.maloaiphim = loaiphim.maloaiphim where NgayChieu between getdate() and dateadd(dd,7,getdate())order by ngaychieu asc ) a order by a.ngaychieu desc";
				pt = st.executeQuery(sel);
				System.out.println("cau sql===========" + sel);
				while (pt.next()) {
		%>
		</td>
	</tr>
	<tr class="ourCompany-list">
		<td width=300 align="center"><a
			href="Chitietphim.jsp?mphim=<%=pt.getString(1)%>" target="_blank">
		<img src="<%out.println(pt.getString(2)); %>" width="300" height="450"></img>
		</a></td>
		<td colspan=3 align="left"><font face="Arial " color="black"
			size="2">Tên phim: <%
			out.println(pt.getString(3));
		%> </font> <br>
		Thời lượng:<%
 	out.println(pt.getString(4));
 %>giờ<%
 	out.println(pt.getString(5));
 %> <br>
		Thể loại: <%
 	out.println(pt.getString(8));
 %> <br>
		Ngày chiếu:<%
 	out.println(pt.getString(6));
 %> <br>
		Mô tả phim:<%
 	out.println(pt.getString(7));
 %> <br>

		<a href=" Datve.jsp">Đặt vé </a></td>
		<%
			}
		%>

		<td width=400>
		<fieldset><legend> <font face="Arial "
			color="black" size="5">Tìm kiếm </font></legend>
		<div align="center">
		<table width=100%>
			<tr class="ourCompany-list">
				<td align="left">Dạng phim:</td>
				<td><select name="dangphim" style="width: 150px; height: 18px;">
					<%
						sql = "SELECT [MaDangPhim],[TenDangPhim]FROM [Quanlybanvephim].[dbo].[DangPhim] ";
							rs1 = st.executeQuery(sql);
							ResultSetMetaData rsmd = rs1.getMetaData();
							dem = rsmd.getColumnCount();
					%>
					<option value="">chọn</option>
					<%
						while (rs1.next()) {
								for (int i = 1; i < dem; i++) {
					%>
					<option value="<%=rs1.getString(1) %>"><%=rs1.getString(2)%></option>
					<%
						}
							}
					%>
				</select></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Thể loại:</td>
				<td><select name="theloai" style="width: 150px; height: 18px;">
					<%
						sql1 = "SELECT [MaLoaiPhim],[TenLoaiPhim]FROM [Quanlybanvephim].[dbo].[LoaiPhim] ";
							ResultSet rs = st.executeQuery(sql1);
							ResultSetMetaData rsmd1 = rs.getMetaData();
							dem1 = rsmd.getColumnCount();
					%>
					<option value="">chọn</option>
					<%
						while (rs.next()) {
								for (int i = 1; i < dem1; i++) {
					%>
					<option value="<%=rs.getString(1) %>"><%=rs.getString(2)%></option>
					<%
						}
							}
					%>
				</select></td>
			</tr>

			<tr class="ourCompany-list">
				<td align="left">Quốc gia:</td>
				<td><select name="quocgia" style="width: 150px; height: 18px;">
					<%
						sql2 = "SELECT [MaQuocGia],[TenQuocGia]FROM [Quanlybanvephim].[dbo].[QuocGia] ";
							rs2 = st.executeQuery(sql2);
							ResultSetMetaData rsmd2 = rs2.getMetaData();
							dem2 = rsmd.getColumnCount();
					%>
					<option value="">chọn</option>
					<%
						while (rs2.next()) {
								for (int i = 1; i < dem2; i++) {
					%>
					<option value="<%=rs2.getString(1) %>"><%=rs2.getString(2)%></option>
					<%
						}
							}
					%>
				</select></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Ngày chiếu:</td>
				<td><select name="ngay" style="width: 50px; height: 18px;">
					<option value="">chọn</option>
					<%
						for (int i = 1; i <= 31; i++) {
					%><option value=<%=i%>><%=i%></option>
					<%
						}
					%>
				</select> <select name="thang" style="width: 50px; height: 18px;">
					<option value="">Tất cả</option>
					<%
						for (int i = 1; i <= 12; i++) {
					%><option value=<%=i%>><%=i%></option>
					<%
						}
					%>
				</select> <select name="nam" style="width: 50px; height: 18px;">
					<option value="">chọn</option>
					<%
						for (int i = 2012; i <= 2030; i++) {
					%><option value=<%=i%>><%=i%></option>
					<%
						}
					%>
				</select></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Giá vé</td>
				<td><input type="text" width=150 name="gia"></td>
				<td><label>000vnd</label></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Tên phim:</td>
				<td><input type="text" width=150 name="tenphim"></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="right">
				<center><input type="submit" name="bttimkiem"
					value="Tìm kiếm"></center>
				</td>
			</tr>

		</table>
		</div>
		</fieldset>
		<%
			}
		%>
		<div align="right">
		<%
			int i = 0;
			int n = sohang;
			int j = 1;
			int m = p_one;
			for (i = 0; i < n; i++) {
				if (i % m == 0) {
					if (p >= 0) {
						if (p + 1 == i) {
							out.print("<a href=?p=" + i + "><b>" + j
									+ "</b></a> ");
						} else {
							out.print("<a href=?p=" + i + ">" + j + "</a> ");
						}
					}

					j++;
				}
			}
		%>
		</div>
		</td>
	</tr>

</table>
</form>
</div>
<%@include file="Footer.jsp"%>

</body>
</html>
