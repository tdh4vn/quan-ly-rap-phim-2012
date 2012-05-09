<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<%@page import="java.util.*"%>
<title>Thêm phim</title>
</head>
<script>

  function Trim(sString) {
       while (sString.substring(0,1) == ' ') {
           sString = sString.substring(1, sString.length);
       }
       while (sString.substring(sString.length-1, sString.length) == ' ')
       {
           sString = sString.substring(0,sString.length-1);
       }
       return sString;
}

  function Kiemtrathemphim(){
   
      var obj1Value = document.getElementById("Maphimtxt").value; 
      if (Trim(obj1Value) == "" || obj1Value == undefined){
       alert(" Bạn chưa nhập mã phim ");
          return false;
      } 

      var obj1Value2 = document.getElementById("Tenphimtxt").value; 
      if (Trim(obj1Value2) == "" || obj1Value2 == undefined){
       alert("Bạn chưa nhập tên phim");
          return false;
      } 
      var obj1Value3 = document.getElementById("Madangphimtxt").value; 
      if (Trim(obj1Value3) == "" || obj1Value3 == undefined){
       alert("Bạn chưa nhập dạng phim");
          return false;
      } 
      var obj1Value4 = document.getElementById("Maloaiphimtxt").value; 
      if (Trim(obj1Value4) == "" || obj1Value4 == undefined ){
       alert("Bạn chưa nhập loại phim");
          return false;
      
      } 
      var obj1Value5 = document.getElementById("Dodaigiotxt").value; 
      if (Trim(obj1Value5) == "" || obj1Value5 == undefined ){
       alert("Bạn chưa nhập độ dài giờ của phim");
          return false;
      
      }
      var obj1Value6 = document.getElementById("Dodaiphuttxt").value; 
      if (Trim(obj1Value6) == "" || obj1Value6 == undefined ){
       alert("Bạn chưa nhập độ dài phút của phim");
          return false;
      
      }  
      var obj1Value7 = document.getElementById("Maquocgiatxt").value; 
      if (Trim(obj1Value7) == "" || obj1Value7 == undefined ){
       alert("Bạn chưa nhập quốc gia");
          return false;
      
      } 
   return true; //true co nghia la cac dieu kien deu thoa het
  }
</script>
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
%>
<!--Header Background Part Starts -->
<%@include file="Header.jsp"%>
<!--Header Background Part Ends -->
<!--Navigation Background Part Starts -->
<%@include file="MenuAdmin.jsp"%>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg"><!--Our Company Part Starts -->
<div id="ourCompany-part">
<form action="Themphim.jsp" method="post">

<table width="100%">
	<tr>
		<td colspan=11 align="right"><font face=" Arial " color="333333">
		<%String TenDangNhapTV=request.getParameter("TenDangNhapTV");
  out.println("Xin chào "+TenDangNhapTV+"<br>"); %> </font>
   <%  if ("Loi".equals(request.getParameter("error"))) {
              out.write("Phim đã tồn tại!!!!");
             }%>
  </td>
	</tr>
	<tr>
	
		<td colspan="11">
		<fieldset><legend><font face="Arial "
			color="black" size="5"> Thêm phim</font></legend>
		<div align="center">
		<table>
			<tr class="ourCompany-list">
				<td align="left">Mã phim :<font color="red">*</font></td>
				<td></td>
				<td align="left"><input type="text" size="30" name="MaPhim"
					id="Maphimtxt" />
				</td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Tên phim :<font color="red">*</font></td>
				<td></td>
				<td align="left"><input type="text" size="30" name="TenPhim"
					id="Tenphimtxt" /></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Dạng phim :<font color="red">*</font></td>
				<td></td>
				<td align="left"><select name="MaDangPhim" id="Madangphimtxt">
					<%
						String sql1 = "SELECT [MaDangPhim],[TenDangPhim]FROM [Quanlybanvephim].[dbo].[DangPhim] ";
						ResultSet rs1 = st.executeQuery(sql1);
						ResultSetMetaData rsmd1 = rs1.getMetaData();
						int dem1 = rsmd1.getColumnCount();
						while (rs1.next()) {
							for (int i = 1; i < dem1; i++) {
					%>
					<option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
					<%
						}
						}
					%>
				</select></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Loại phim:<font color="red">*</font></td>
				<td></td>
				<td align="left"><select name="MaLoaiPhim" id="Maloaiphimtxt">
					<%
						String sql2 = "SELECT [MaLoaiPhim],[TenLoaiPhim]FROM [Quanlybanvephim].[dbo].[LoaiPhim] ";
						ResultSet rs2 = st.executeQuery(sql2);
						ResultSetMetaData rsmd2 = rs2.getMetaData();
						int dem2 = rsmd2.getColumnCount();
						while (rs2.next()) {
							for (int i = 1; i < dem2; i++) {
					%>
					<option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
					<%
						}
						}
					%>
				</select></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Độ dài:<font color="red">*</font></td>
				<td></td>
				<td align="left"><select name="DoDaiGio" id="Dodaigiotxt">
					<%
						for (int gio = 1; gio <= 3; gio++) {
					%><option value="<%=gio%>"><%=gio%></option>
					<%
						}
					%>
				</select> giờ <select name="DoDaiPhut" id="Dodaiphuttxt">
					<%
						for (int phut = 00; phut <= 59; phut++) {
					%><option value="<%=phut%>"><%=phut%></option>
					<%
						}
					%>
				</select> phút</td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Ngày bắt đầu chiếu:</td>
				<td></td>
				<td align="left"><select name="NgayBatDau">
					<%
						for (int ngay = 1; ngay <= 31; ngay++) {
					%><option value="<%=ngay%>"><%=ngay%></option>
					<%
						}
					%>
				</select> <select name="ThangBatDau">
					<%
						for (int thang = 1; thang <= 12; thang++) {
					%><option value="<%=thang%>"><%=thang%></option>
					<%
						}
					%>
				</select> <select name="NamBatDau">
					<%
						for (int nam = 2012; nam <= 2030; nam++) {
					%><option value="<%=nam%>"><%=nam%></option>
					<%
						}
					%>
				</select></td>
			</tr>

			<tr class="ourCompany-list">
				<td align="left">Ngày kết thúc chiếu:</td>
				<td></td>
				<td align="left"><select name="NgayKetThuc">
					<%
						for (int ngay = 1; ngay <= 31; ngay++) {
					%><option value="<%=ngay%>"><%=ngay%></option>
					<%
						}
					%>
				</select> <select name="ThangKetThuc">
					<%
						for (int thang = 1; thang <= 12; thang++) {
					%><option value="<%=thang%>"><%=thang%></option>
					<%
						}
					%>
				</select> <select name="NamKetThuc">
					<%
						for (int nam = 2012; nam <= 2030; nam++) {
					%><option value="<%=nam%>"><%=nam%></option>
					<%
						}
					%>
				</select></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Quốc gia:</td>
				<td></td>
				<td align="left"><select name="MaQuocGia" id="Maquocgiatxt">
					<%
						String sql3 = "SELECT [MaQuocGia],[TenQuocGia]FROM [Quanlybanvephim].[dbo].[QuocGia] ";
						ResultSet rs3 = st.executeQuery(sql3);
						ResultSetMetaData rsmd = rs3.getMetaData();
						int dem = rsmd.getColumnCount();
						while (rs3.next()) {
							for (int i = 1; i < dem; i++) {
					%>
					<option value="<%=rs3.getString(1)%>"><%=rs3.getString(2)%></option>
					<%
						}
						}
					%>
				</select></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Hình ảnh đại diện:</td>
				<td></td>
				<td align="left"><input type="file" name="AnhDaiDien" size="30" /></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Ghi chú :</td>
				<td></td>
				<td align="left"><input type="text" size="30" name="GhiChu" /></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Mô tả phim:</td>
				<td></td>
				<td align="left"><textarea rows="5" cols="24" name="MoTaPhim" /></textarea></td>
			</tr>
			<tr class="ourCompany-list">
				<td colspan="3" align="center"><input type="submit"
					name="btthem" value="Thêm" onclick="return Kiemtrathemphim();"></td>
			</tr>
			<tr>
				<td colspan="3"><font color="red">*</font> <font
					color="#951509" face="Arial Narrow" size="3"> Thông tin bắt
				buộc phải điền. </font></td>
			</tr>
		</table>
		</div>
		</fieldset>
		</td>
	</tr>

	<%
		String maphim = request.getParameter("MaPhim");
		String tenphim = request.getParameter("TenPhim");
		String madangphim = request.getParameter("MaDangPhim");
		String maloaiphim = request.getParameter("MaLoaiPhim");
		String dodaigio = request.getParameter("DoDaiGio");
		String dodaiphut = request.getParameter("DoDaiPhut");
		String maqg = request.getParameter("MaQuocGia");
		String ngaybd = request.getParameter("NgayBatDau");
		String thangbd = request.getParameter("ThangBatDau");
		String nambd = request.getParameter("NamBatDau");
		String nbd = "" + thangbd + "/" + ngaybd + "/" + nambd + "";
		String ngaykt = request.getParameter("NgayKetThuc");
		String thangkt = request.getParameter("ThangKetThuc");
		String namkt = request.getParameter("NamKetThuc");
		String nkt = "" + thangkt + "/" + ngaykt + "/" + namkt + "";

		String anhdaidien = request.getParameter("AnhDaiDien");
		String ghichu = request.getParameter("GhiChu");
		String motaphim = request.getParameter("MoTaPhim");
	%>
	<%!public void Phim(String maphim, String tenphim, String madangphim,
			String maloaiphim, String dodaigio, String dodaiphut, String maqg,
			String nbd, String nkt, String anhdaidien, String ghichu,
			String motaphim, Statement st, Connection connection) {
	    	   	try {
			
			String sql1 = "select convert(varchar(50),NgayBatDau,103)as nbd from Phim";
			st.executeQuery(sql1);
			String sql2 = "select convert(varchar(50),NgayKetThuc,103)as nkt from Phim";
			st.executeQuery(sql2);
			String sql = "INSERT INTO [Quanlybanvephim].[dbo].[Phim]([MaPhim],[TenPhim],[MaDangPhim],[MaLoaiPhim],[DoDaiGio],[DoDaiPhut],[MaQuocGia],[NgayBatDau],[NgayKetThuc],[AnhDaiDien],[GhiChu],[MoTaPhim])VALUES('"
					+ maphim
					+ "','"
					+ tenphim
					+ "','"
					+ madangphim
					+ "','"
					+ maloaiphim
					+ "','"
					+ dodaigio
					+ "','"
					+ dodaiphut
					+ "','"
					+ maqg
					+ "','"
					+ nbd
					+ "','"
					+ nkt
					+ "','"
					+ anhdaidien
					+ "','" + ghichu + "',N'" + motaphim + "')";
			System.out.println("câu lệnh insert ==================="+sql);
		
			st.executeUpdate(sql);           
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
	<%!String tk;%>
	<%
	String sql4="SELECT [MaPhim] FROM [Quanlybanvephim].[dbo].[Phim]";
	ResultSet rs4=st.executeQuery(sql4);
	 String ma;
		tk = request.getParameter("btthem");
		while(rs4.next())
		{ 
			 ma=rs4.getString(1);
		
				if(ma.equals(maphim))
				{
					System.out.println("$$$$$$$$$$$$$$$$4");
					response.sendRedirect("Themphim.jsp?error=Loi");
				}
				else
				{
					System.out.println("ra chua mi!!!!!!!!!!!!!!!");
			     Phim(maphim, tenphim, madangphim, maloaiphim, dodaigio,
					   dodaiphut, maqg, nbd, nkt, anhdaidien, ghichu, motaphim, st, connection);
		      
			}
		}
	%>

</table>
</form>
<!--Our Company Part Ends --></div>
<!--Our Company Bacground Part Ends --> <!--Future Plans Part Starts -->
<%@include file="FooterAdmin.jsp"%> <!--Footer Part Ends -->
</div>
</body>
</html>
