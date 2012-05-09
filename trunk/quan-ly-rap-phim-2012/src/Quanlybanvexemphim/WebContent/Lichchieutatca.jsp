
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--@page import="javax.servlet.http.*"--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.jdbc.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Conver.*"%>
<script src="datetimepicker_css.js"></script>
<script type="text/javascript">
	function cancelSubmit() {
	    document.UpdateScheduleForm.action = "ListSchedule.jsp";
		return true;
	}
	function updateSubmit() {
		var ONE_DAY = 1000 * 60 * 60 * 24;
		var currentDate = new Date;

		var expectedStartDate = document.getElementById("expectedStartDate");
		var dateAdvtoClient =  document.getElementById("dateAdvtoClient");
		var actualStartDate = document.getElementById("actualStartDate");
	
		var dayExpectedStartDate = expectedStartDate.value.substring(8,10);
		var monthExpectedStartDate = expectedStartDate.value.substring(5,7);
		var yearExpectedStartDate = expectedStartDate.value.substring(0,4);

		var dayActualStartDate = actualStartDate.value.substring(8,10);
		var monthActualStartDate = actualStartDate.value.substring(5,7);
		var yearActualStartDate = actualStartDate.value.substring(0,4);

		var formatExpectedStartDate = monthExpectedStartDate + "/" + dayExpectedStartDate + "/" + yearExpectedStartDate;
		
        var formarActualStartDate = monthActualStartDate + "/" + dayActualStartDate + "/" + yearActualStartDate;
    
       
        var parseExpectedStartDate = Date.parse(formatExpectedStartDate);
        var parseActualStartDate = Date.parse(formarActualStartDate);

        var convertExpectedStartDateToJavaDate = new Date(parseExpectedStartDate);
        var convertActualStartDate =  new Date(parseActualStartDate);

		var getTimeExpectedStartDateJavaDate = convertExpectedStartDateToJavaDate.getTime();
		var getTimeActualStartDate = convertActualStartDate.getTime();
		var getTimeCurrentDate = currentDate.getTime();

		var actualDateSubtractExpectedStartDate = getTimeActualStartDate - getTimeExpectedStartDateJavaDate;
		var actualDateSubtractCurrentDate = getTimeActualStartDate - getTimeCurrentDate;

		var resultOfActualDateSubtractExpectedStartDate = Math.round(actualDateSubtractExpectedStartDate/ONE_DAY);
		var resultOfActualDateSubtractCurrentDate = Math.round(actualDateSubtractCurrentDate/ONE_DAY);
		if(resultOfActualDateSubtractExpectedStartDate < 0 || resultOfActualDateSubtractCurrentDate>0 || resultOfActualDateSubtractExpectedStartDate=="" || resultOfActualDateSubtractExpectedStartDate==null){
			alert("Actual Start Date Invalid.");
			return false;
		}
		if(dateAdvtoClient.value == null || dateAdvtoClient.value==""){
			alert("Vendor Received Date must be entered.");
			return false;
		}else{
		document.UpdateScheduleForm.action = "updateSchedule.do";
		return true;
		}
	}
	function terminatedSubmit() {
		document.UpdateScheduleForm.action = "terminated.do";
		confirm("");
		return true;
	}
	function changeDate() {
		
		var contractNumber = "<%=request.getAttribute("contractNo")%>";
		document.UpdateScheduleForm.action = "infoSchedule.do?contractNumber="+contractNumber;
		document.UpdateScheduleForm.submit();
	}
	function changeActualDate(){
	    var ONE_DAY = 1000 * 60 * 60 * 24;

	    var vendorTurnaroundTime = document.getElementById("vendorTurnaroundTime");
		var stringActualStartDate = document.getElementById("actualStartDate");
		var stringActualEndDate = document.getElementById("actualEndDate");
		
		var dayActualEndDate = stringActualEndDate.value.substring(8,10); 
		var monthActualEndDate = stringActualEndDate.value.substring(5,7);
		var yearActualEndDate = stringActualEndDate.value.substring(0,4);
		
		var dayActualStartDate = stringActualStartDate.value.substring(8,10); 
		var monthActualStartDate = stringActualStartDate.value.substring(5,7);
		var yearActualStartDate = stringActualStartDate.value.substring(0,4);
		
		
		var formatActualEndDate = monthActualEndDate +"/"+ dayActualEndDate +"/"+ yearActualEndDate;
		var formatActualStartDate = monthActualStartDate +"/"+ dayActualStartDate +"/"+ yearActualStartDate;
		
		var parseActualEndDate = Date.parse(formatActualEndDate);
		var parseActualStartDate = Date.parse(formatActualStartDate);
		
		var convertActualEndDateToJavaDate = new Date(parseActualEndDate);
		var convertActualStartDateToJavaDate = new Date(parseActualStartDate);
		
		var getTimeActualEndJavaDate = convertActualEndDateToJavaDate.getTime();
		var getTimeActualStartJavaDate = convertActualStartDateToJavaDate.getTime();

		var count =Math.abs(getTimeActualEndJavaDate - getTimeActualStartJavaDate);
		
		vendorTurnaroundTime.value = Math.round(count/ONE_DAY);
	}
</script>
<%
	Connection connection = null;
	String data = "jdbc:jtds:sqlserver://localhost:1433/Quanlybanvephim";
	String userName = "sa";
	String password = "123";
	String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
	Statement st = null;

	try {
		Class.forName(JDBC_Driver);
		// connection
		connection = DriverManager.getConnection(data, userName,
				password);
		st = connection.createStatement();

	} catch (ClassNotFoundException e) {
		System.out.println("Class not found");
		e.printStackTrace();
	} catch (SQLException se) {
		System.out.println("SQL Error");
		se.printStackTrace();
	}
%>
<title>Lịch chiếu</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
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
<form action="Lichchieutatca.jsp"><br>
<br>
<br>
<br>
<br>
<table width="100%">
	<tr>
		<td colspan="10" align="center">
		<h2 class="ourCompany-hdr">Lịch chiếu tất cả</h2>
		</td>
	</tr>

	<tr>
		<td colspan="10">
		<table width="100%">
			
			<tr>
				<td colspan="10" align="center">
				<fieldset><legend> <font face="Arial "
					color="black" size="5"> Chọn ngày </font></legend>
				<table>

					<tr class="ourCompany-list">
						<td>Từ ngày:</td>
						<td><input type="text" name="txtTuNgay" id="idTuNgay">
						<input type="hidden" name="TuNgay" value="txtTuNgay"> <img
							src="images/lich.JPG"
							onclick="javascript:NewCssCal('idTuNgay','YYYYMMDD')"></td>

					</tr>
					<tr class="ourCompany-list">
						<td>Đến ngày:</td>
						<td><input type="text" name="txtDenNgay" id="idDenNgay">
						<input type="hidden" name="DenNgay" value="txtDenNgay"> <img
							src="images/lich.JPG"
							onclick="javascript:NewCssCal('idDenNgay','YYYYMMDD')"></td>
					</tr>

					<tr>
						<td></td>
						<td align="center"><input type="submit" name="btnTimKiem"
							value="Tìm kiếm"></td>
					</tr>
					<tr>
						<td></td>

					</tr>
				</table>
				</fieldset>
				</td>
			</tr>
			<%
				ArrayList<Integer> soPhong = new ArrayList<Integer>();
				String sql1 = " SELECT count([MaPhong]) FROM [Quanlybanvephim].[dbo].[Phong]";
				ResultSet rs1 = st.executeQuery(sql1);
				while (rs1.next()) {
					soPhong.add(rs1.getInt(1));

				}
				rs1.close();
				ArrayList<String> maPhong = new ArrayList<String>();
				ArrayList<String> tenPhong = new ArrayList<String>();
				String sql2 = "SELECT [MaPhong],[TenPhong] FROM [Quanlybanvephim].[dbo].[Phong]";
				ResultSet rs2 = st.executeQuery(sql2);
				while (rs2.next()) {
					maPhong.add(rs2.getString(1));
					tenPhong.add(rs2.getString(2));
				}
				rs2.close();
				ArrayList<String> tenPhim = new ArrayList<String>();
				ArrayList<String> gioChieu = new ArrayList<String>();
				ArrayList<String> phutChieu = new ArrayList<String>();
			%>
			<%
				if ("TÃ¬m kiáº¿m".equals(request.getParameter("btnTimKiem"))) {
					System.out.println("tim kiem neh====="
							+ request.getParameter("btnTimKiem"));
					String tuNgayGT = request.getParameter("txtTuNgay");

					String denNgayGT = request.getParameter("txtDenNgay");

					//System.out.println(denNgayGT);
					ConvertDate cd = new ConvertDate();
					ArrayList<String> ngay = new ArrayList<String>();
					String tuNgay = tuNgayGT + " 00:00";
					System.out.println("tu ngay====" + tuNgay);
					String denNgay = denNgayGT + " 00:00";
					System.out.println("den ngay====" + denNgay);
					ngay = cd.getDatesInDuration(tuNgay, denNgay);
					//ngay = cd.getDatesInDuration("2012/01/01 00:00","2012/01/10 00:00");
					System.out.println(ngay);
					System.out.println(ngay.size());
					String sql3 = null;
			%>

			<tr>
				<td colspan="10">
				<table width="px" border="1px" align="center">

					<tr bgcolor="333333">
						<td rowspan="2" align="center"><font color = "white">Ngày</font></td>
						<td rowspan="2" align="center"><font color = "white">Giờ</font></td>

						<%
							for (int i = 0; i < tenPhong.size(); i++) {
						%>
						<td colspan="2" align="center"><font color = "white"><%=tenPhong.get(i)%></font></td>
						<%
							}
						%>
						<td rowspan="2"></td>
					</tr>

					<tr bgcolor="333333">

						<%
							for (int j = 0; j < tenPhong.size(); j++) {
						%>
						<td width="200px"><font color = "white">Tên Phim</font></td>
						<td width="80px"><font color = "white">Xuất chiếu</font></td>
						<%
							}
						%>

					</tr>
					<%
							for (int k = 0; k < ngay.size(); k++) {
								String xoaNgay = ngay.get(k);
					%>

					<!--  Bat dau dong du lieu -->
					<tr>

						<td rowspan="14"><font color="#47481A"><%=ngay.get(k)%></font></td>
						<%
								for (int m = 0; m < 14; m++) {
									int gio = m + 9;
									int gioKeTiep = gio + 1;
						%>
						<td><font color="#47481A"><%=gio%>h</font></td>
						<%
									for (int i = 0; i < maPhong.size(); i++) {
											//System.out.println("lam den vi tri 1");
						%>
						<%
							   			sql3 = "select [TenPhim], [GioChieu],[PhutChieu] from [Quanlybanvephim].[dbo].[Phim] join [Quanlybanvephim].[dbo].[XuatChieu] on Phim.MaPhim=XuatChieu.MaPhim join [Quanlybanvephim].[dbo].[LichChieu] on XuatChieu.MaXuatChieu=LichChieu.MaXuatChieu where MaPhong='"
													+ maPhong.get(i)
													+ "' and NgayChieu='"
													+ ngay.get(k)
													+ "' and GioChieu >= '"
													+ gio
													+ "' and GioChieu < '" + gioKeTiep + "' ";
										ResultSet rs3 = st.executeQuery(sql3);
											//System.out.println(i+"lam den vi tri 2");
						   	   			if (rs3.next()) {
						%>

						<td><font color="#47481A"><%=rs3.getString(1)%></font></td>
						<td><font color="#47481A"><%=rs3.getString(2)%>h<%=rs3.getString(3)%></font></td>

						<%
							    		  System.out.println("Hien thi phong: "+maPhong.get(i)+" ===Ngay=="+ngay.get(k));
							   			}else { %>
						<td width="200px"></td>
						<td></td>
						<%     			 } //if 
									} //for cua maPhong.size()
						%>


					</tr>
					<%
								}

							}//for cua ngay.size()
					%>


					<%}//if timkiem
					%>


				</table>
		</table>
</table>
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
