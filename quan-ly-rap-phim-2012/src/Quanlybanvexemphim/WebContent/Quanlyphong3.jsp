<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.net.URLEncoder" %>
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<title>Quản lý phòng</title>
</head>
<body>
 <%

 response.setStatus(301);

 response.setHeader( "Location", "http://localhost:8080/April/Quanlyphong3.jsp" );

 response.setHeader( "Connection", "close" );

 %>
<%@include file="Header.jsp" %>
    <%@include file="MenuAdmin.jsp" %>
    <div id="ourCompany-bg" align="center">
<form action="Quanlyphong3.jsp" >
<%  if ("thanhcong".equals(request.getParameter("capnhat"))) {
              out.write("Cập nhật thành công!!!!");
            }%>
<table border="0" width="80% ">
<tr>
        <td colspan="10" align="right" >
        Hello <%=session.getAttribute("tenDangNhap")%>
        
        
        </td>
    </tr>

	<tr>
    <td></td>
    </tr>
	
	<tr>
		<td colspan=10 align="center"> <h2 class="ourCompany-hdr">Quản lý phòng</h2>
		<table border="width: 1000px; border: 1px; border-color:black;">
			<tr bgcolor ="333333">
				<th style="background: gray; font-style: bold; font-size: 14px">Mã
				phòng</th>
				<th style="background: gray; font-style: bold; font-size: 14px">Tên
				phòng</th>
				<th style="background: gray; font-style: bold; font-size: 14px">Dạng
				phòng</th>
				<th style="background: gray; font-style: bold; font-size: 14px">Trạng
				thái phòng</th>
				<th style="background: gray; font-style: bold; font-size: 14px">Số
				lượng xuất đã chiếu</th>
				<th style="background: gray; font-style: bold; font-size: 14px">Số
				lượng dãy ghế tối đa</th>
				<th style="background: gray; font-style: bold; font-size: 14px">Số
				lượng ghế tối đa ở mỗi dãy</th>
				<th style="background: gray; font-style: bold; font-size: 14px">Ghi
				chú</th>
				<th style="background: gray; font-style: bold; font-size: 14px"></th>
				<th style="background: gray; font-style: bold; font-size: 14px"></th>


			</tr>
			<%
				Connection connection = null;
				String data = "jdbc:jtds:sqlserver://localhost:1433/Quanlybanvephim";
				String userName = "sa";
				String passWord = "123";
				String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
				Statement st = null;
				
				  try {
			            Class.forName(JDBC_Driver);
			            // connection
			            connection = DriverManager.getConnection(data, userName, passWord);        
			         	st = connection.createStatement();	     			
						
			        } catch (ClassNotFoundException e) {
			           System.out.println("Class not found");
			           e.printStackTrace();
			        } catch (SQLException se) {
			           System.out.println("SQL Error");        	
			           se.printStackTrace();
			        }
				String sql = "SELECT [MaPhong],[TenPhong],[MaDangPhong],[TrangThaiPhong],[SoLuongDayGheToiDa],[SoLuongGheToiDaOMoiDay],[GhiChu]FROM [Quanlybanvephim].[dbo].[Phong]";
				ResultSet rs = st.executeQuery(sql);
				//String ma=request.getParameter("rs.getString(1)");

				String tk;
				String sql1;

				while (rs.next()) {
			%>

			<tr class="ourCompany-list">
				<td><label>
				<%
					out.println(rs.getString(1));
				%>
				</label> <input type="hidden" name="maPhong" value="<%=rs.getString(1)%>" /></td>

				<td><input type="text" size="15" name="txttenphong"
					value="<%=rs.getString(2)%>" /></td>
				<td><input type="text" size="15" name="txtdang"
					value="<%=rs.getString(3)%>" /></td>
				<td><input type="text" size="15" name="txttrangthai"
					value="<%=rs.getString(4)%>" /></td>
				<td><input type="text" size="15" name="txtsoluong" value=15></td>
				<td><input type="text" size="30" name="txtghemax"
					value="<%=rs.getString(5)%>" /></td>
				<td><input type="text" size="15" name="txtghemaxday"
					value="<%=rs.getString(6)%>" /></td>
				<td><input type="text" size="15" name="txtghichu"
					value="<%=rs.getString(7)%>" /></td>
				<td><a href="Xoaphong.jsp?MaPhong=<%=rs.getString(1)%>">Xoá</a></td>
				<td><a href="Quanlyghe_thu.jsp?MaPhong=<%=rs.getString(1)%>">Quản
				lý ghế</a> <%
 	}
 %>
				</td>
			</tr>
            </table>
            <table width =100%>
            <tr >
            <td colspan=10  align="right"> <input type="button" value = "Thêm phòng" onclick="javascript:window.location='Themphong.jsp';"></td>
            <td colspan=10 align="left"><input type="submit" name="btcapnhat"
                value="Cập nhật"></td>
        </tr>

		</table>
		
		<%
			String[] maphongArray = request.getParameterValues("maPhong");
		System.out.println("maphong======"+maphongArray);
			String[] tenphongArray = request.getParameterValues("txttenphong");
			String[] dangphongArray = request.getParameterValues("txtdang");
			String[] trangthaiArray = request
					.getParameterValues("txttrangthai");
			String[] soluongArray = request.getParameterValues("txtsoluong");
			String[] ghemaxArray = request.getParameterValues("txtghemax");
			String[] ghemaxdayArray = request
					.getParameterValues("txtghemaxday");
			String[] ghichuArray = request.getParameterValues("txtghichu");
		%> <%
 	tk = request.getParameter("btcapnhat");
		System.out.println(tk);
 	if ("Cáº­p nháº­t".equals(tk)) {
 		System.out.println("maphongArray=========" + maphongArray);
 		int ok = 0;
 		for (int i = 0; i <= maphongArray.length - 1; i++) {
 			System.out.println("aaaaaaaaaaa=========" + maphongArray[i]);
 			sql1 = "UPDATE [Quanlybanvephim].[dbo].[Phong]SET [TenPhong] ='"
 					+ tenphongArray[i]
 					+ "',[MaDangPhong]='"
 					+ dangphongArray[i]
 					+ "',[TrangThaiPhong] ='"
 					+ trangthaiArray[i]
 					+ "',[SoLuongDayGheToiDa] ='"
 					+ ghemaxArray[i]
 					+ "' ,[SoLuongGheToiDaOMoiDay] ='"
 					+ ghemaxdayArray[i]
 					+ "',[GhiChu] ='"
 					+ ghichuArray[i]
 					+ "' WHERE [MaPhong] = '"
 					+ maphongArray[i] + "'";
 			System.out.print("sql=========" + sql1);
 			ok = st.executeUpdate(sql1);
 			System.out.print("Da cap nhat dong so = " + (i + 1)
 					+ "ket qua la = " + 1);
 			
 		}
 		 
 	}
 	
 	connection.close();
 %>

		
</table>
</form>
 </div>

   <%@include file="Footer.jsp" %>

</body>
</html>