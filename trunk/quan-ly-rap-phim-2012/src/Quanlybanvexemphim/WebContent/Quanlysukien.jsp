<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@page import="java.util.HashMap"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<title>Quản lý sự kiện</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<Script>
function show_confirm()
{
return confirm("Bạn có chắc chắn muốn xoá không ?");
}
</Script>
<body>
<!--Header Background Part Starts -->
<%@include file="Header.jsp"%>
<!--Header Background Part Ends -->
<!--Navigation Background Part Starts -->
<%@include file="MenuAdmin.jsp"%>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg"><!--Our Company Part Starts -->
<div id="ourCompany-part">
<form action="Quanlysukien.jsp" method="post">
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
		%> <br>
<br>
<table width=100%>
	<tr>
		<td colspan=10 align="center">
		<h2 class="ourCompany-hdr">Quản lý sự kiện</h2>
		</td>

		<td colspan=10 align=right>
		<%String TenDangNhapTV=request.getParameter("TenDangNhapTV");
  out.println("hello "+TenDangNhapTV+"<br>"); %>
		</td>
	</tr>
	<tr>
		<td colspan="10" align="right"><input type="text"
			name="thongtincantim" value="Nhập" /> <input type="submit"
			name="timkiem" value="Tìm kiếm" /></td>
	</tr>
	<tr>
		<td colspan="10">
		<table border="1" width=100%>
			<tr bgcolor="333333">
				<td>Mã sự kiện</td>
				<td>Tên sự kiện</td>
				<td>Nội dung</td>
				<td>Ngày bắt đầu</td>
				<td>Ngày kết thúc</td>
				<td>Ghi chú</td>
				<td></td>
			</tr>
			<%
  String thongtintk = request.getParameter("thongtincantim");
  String tk1=request.getParameter("timkiem");
  ResultSet rs3;
  if ("TÃ¬m kiáº¿m".equals(tk1)) {
   System.out.println("ra di mi");
  String sql3 ="SELECT [MaSuKien],[TenSuKien],[NoiDung],[NgayBatDau],[NgayKetThuc],[Ghichu]FROM [Quanlybanvephim].[dbo].[SuKien] where [MaSuKien] like '%"+ thongtintk + "%' or [TenSuKien] like '%"+ thongtintk + "%' or [NoiDung] like '%"+ thongtintk + "%' or [GhiChu] like '%"+ thongtintk + "%'";
  System.out.println("sql===================="+sql3);
   rs3 = st.executeQuery(sql3);
       while (rs3.next())
   { 
  %>
			<tr class="ourCompany-list">
				<td><a href="Quanlysukien.jsp" target="_blank"></a></td>
			</tr>
			<tr class="ourCompany-list">
				<td align=center><font color="red"><label>
				<%out.println(rs3.getString(1));%>
				</label> <input type="hidden" name="masukien" value="<%= rs3.getString(1)%>" /></font></td>
				<td align=center><input type="text" name="tensukien"
					value="<%out.println(rs3.getString(2));%>" /></td>
				<td align=center><input type="text" name="noidung"
					value="<%out.println(rs3.getString(3));%>" /></td>
				<td align=center><input type="text" name="ngaybatdau"
					value="<%out.println(rs3.getString(4));%>" /></td>
				<td align=center><input type="text" name="ngayketthuc"
					value="<%out.println(rs3.getString(5));%>" /></td>
				<td align=center><input type="text" name="ghichu"
					value="<%out.println(rs3.getString(6));%>" /></td>
				<td align=center><a
					href="XoaSuKien.jsp?MaSuKien=<%out.println(rs3.getString(1));%>"
					onClick="return show_confirm()">Xóa</a></td>
			</tr>
			<%}%>
			<tr>
				<td colspan="7" align="center">
				<table width=100%>
					<tr>
						<td align="right" colspan="7"><input type="button"
							value="Thêm"
							onclick="javascript:window.location='Themsukien.jsp';"></input>
						</td>
						<td align="left" colspan="7"><input type="submit"
							name="btcapnhat" value="Cập nhật"></td>
					</tr>
				</table>
				</td>
			</tr>
			<%        
           String[] masukienArray = request.getParameterValues("masukien");
           String[] tensukienArray = request.getParameterValues("tensukien");
           String[] noidungArray = request.getParameterValues("noidung");
           String[] ngaybatdauArray = request.getParameterValues("ngaybatdau");
           String[] ngayketthucArray = request.getParameterValues("ngayketthuc");
           String[] ghichuArray = request.getParameterValues("ghichu");
  %>
			<%
            String tk;            
            tk=request.getParameter("btcapnhat");
            if("Cáº­p nháº­t".equals(tk))
                      {
            	System.out.println("masukienArray=========" + masukienArray);
            	int ok = 0;
            	String sql1;
            for (int i=0 ;i<= masukienArray.length - 1;i++)
            {
             sql1 = "UPDATE [Quanlybanvephim].[dbo].[SuKien]SET [TenSuKien] ='"+tensukienArray[i]+"',[NoiDung]='"+noidungArray[i]+"',[NgayBatDau] ='"+ngaybatdauArray[i]+"',[NgayKetThuc] ='"+ngayketthucArray[i]+"' ,[GhiChu] ='"+ghichuArray[i]+"' WHERE [MaSuKien] = '"+masukienArray[i]+"'";
              System.out.print("sql========="+sql1);
              ok = st.executeUpdate(sql1);
              System.out.print("Da cap nhat dong so = " + (i + 1) + "ket qua la = " + 1);
            }
            }%>




			<%} 
 else  { 
	 %>
			<%
		String sql = "SELECT [MaSuKien],[TenSuKien],[NoiDung],[NgayBatDau],[NgayKetThuc],[Ghichu]FROM [Quanlybanvephim].[dbo].[SuKien]";
		ResultSet rs = st.executeQuery(sql);
		  //String ma=request.getParameter("rs.getString(1)");
        while (rs.next()) {
	%>

			<tr class="ourCompany-list">
				<td align=center><label>
				<%out.println(rs.getString(1)); %>
				</label> <input type="hidden" name="masukien" value="<%= rs.getString(1) %>" /></td>
				<td align=center><input type="text" name="tensukien"
					value="<%out.println(rs.getString(2));%>"></td>
				<td align=center><input type="text" name="noidung"
					value="<%out.println(rs.getString(3));%>"></td>
				<td align=center><input type="text" name="ngaybatdau"
					value="<%out.println(rs.getString(4));%>"></td>
				<td align=center><input type="text" name="ngayketthuc"
					value="<%out.println(rs.getString(5));%>"></td>
				<td align=center><input type="text" name="ghichu"
					value="<%out.println(rs.getString(6));%>"></td>
				<td align=center><a
					href="XoaSuKien.jsp?MaSuKien=<%out.println(rs.getString(1));%>"
					onClick="return show_confirm()">Xóa</a></td>
			</tr>
			<%}%>
			<tr>
				<td colspan="7" align="center"></td>
			</tr>
		</table>
		<table width=100%>
			<tr>
				<td align="right" colspan="7"><input type="button" value="Thêm"
					onclick="javascript:window.location='Themsukien.jsp';"></input></td>
				<td align="left" colspan="7"><input type="submit"
					name="btcapnhat" value="Cập nhật"></td>
			</tr>
		</table>
		</td>
		<%        
           String[] masukienArray = request.getParameterValues("masukien");
           String[] tensukienArray = request.getParameterValues("tensukien");
           String[] noidungArray = request.getParameterValues("noidung");
           String[] ngaybatdauArray = request.getParameterValues("ngaybatdau");
           String[] ngayketthucArray = request.getParameterValues("ngayketthuc");
           String[] ghichuArray = request.getParameterValues("ghichu");
  %>
		<%
            String tk;            
            tk=request.getParameter("btcapnhat");
            if("Cáº­p nháº­t".equals(tk))
                      {
            	System.out.println("masukienArray=========" + masukienArray);
            	int ok = 0;
            	String sql1;
            for (int i=0 ;i<= masukienArray.length- 1;i++)
            {
            	
            	System.out.println("ma========="+i+"+++++++++++++" + masukienArray[i]);
              sql1 = "UPDATE [Quanlybanvephim].[dbo].[SuKien]SET [TenSuKien] ='"+tensukienArray[i]+"',[NoiDung]='"+noidungArray[i]+"',[NgayBatDau] ='"+ngaybatdauArray[i]+"',[NgayKetThuc] ='"+ngayketthucArray[i]+"' ,[GhiChu] ='"+ghichuArray[i]+"' WHERE [MaSuKien] = '"+masukienArray[i]+"'";
              System.out.println("sql========="+sql1);
              ok = st.executeUpdate(sql1);
              System.out.print("Da cap nhat dong so = " + (i + 1) + "ket qua la = " + 1);
            }
            }%>

		<%} %>


	</tr>
</table>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</form>
</div>
<!--Our Company Part Ends --></div>
<!--Our Company Bacground Part Ends -->
<!--Future Plans Part Starts -->
<%@include file="Footer.jsp"%>
<!--Footer Part Ends -->
</body>
</html>

