<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.io.*"%>
<%@page import="net.sourceforge.jtds.jdbc.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Conver.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>Thống kê vé</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--Header Background Part Starts -->
<%@include file="Header.jsp" %>
<!--Header Background Part Ends -->
<!--Navigation Background Part Starts -->
<%@include file="MenuAdmin.jsp" %>
<!--Navigation Background Part Ends -->
<!--Our Company Bacground Part Starts -->
<div id="ourCompany-bg">
	<!--Our Company Part Starts -->
	<div id="ourCompany-part" >
<form action ="Thongkeve.jsp" method = "post">
<table border="0" width = 100% >
<tr>

  <td colspan = 10 align="center"><br><br><br>
  <h2 class="ourCompany-hdr">Thống kê vé</h2></td>
</tr>
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
<tr>
  <td colspan = 10 align = right> <font face=" Arial " color ="333333"><%String TenDangNhapTV=request.getParameter("TenDangNhapTV");
  out.println("Xin chào "+TenDangNhapTV+"<br>"); %></font>
   
<table align= "center" width = 40%>
<tr class="ourCompany-list">
<td >Ngày</td>
<td><input type="text" name="txtTuNgay" id="idTuNgay">
						<input type="hidden" name="TuNgay" value="txtTuNgay"> <img
							src="images/lich.JPG"
							onclick="javascript:NewCssCal('idTuNgay','YYYYMMDD')"></td>
</tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td align="right" colspan ="2"><input type="submit" name = "thongke"value = "Thống kê">
<br><br><br>
<%
String Ngay = request.getParameter("txtTuNgay");
String chonNgay = Ngay + " 00:00";
System.out.println("tu ngay====" + chonNgay);
 
 %>

</td>
</tr>
<tr><%=chonNgay%></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr>
<td colspan ="3"> <font color = "#951509" face="Arial Narrow" size="3"> Số lượng vé bán được:</font></td>
<%
  //String  sql= "select count ([Ve].[MaVe]) from [Quanlybanvephim].[dbo].[Ve],[Quanlybanvephim].[dbo].[XuatChieu],[Quanlybanvephim].[dbo].[LichChieu] where [Ve].[MaXuatChieu]=[XuatChieu].[MaXuatChieu]and[XuatChieu].[MaXuatChieu]=[LichChieu].[MaXuatChieu] and [LichChieu].[NgayChieu]='"+nc+"'";
  String sql ="select count ([Ve].[MaVe]) from [Quanlybanvephim].[dbo].[Ve],[Quanlybanvephim].[dbo].[LichChieu] where [Ve].[MaLichChieu]=[LichChieu].[MaLichChieu]and [LichChieu].[NgayChieu]='"+chonNgay+"'";
  ResultSet rs = st.executeQuery(sql);

		while (rs.next()) {
	%>
	
<td colspan ="4"><font face=" Arial " color ="333333"><%out.println(rs.getString(1)); %>
</font></td><%}%>
</tr>
</table>
<br/>
<br/>
<br/>
</table>
</form>
<br><br><br><br><br><br><br>
 </div>
	<!--Our Company Part Ends -->
</div>
<!--Our Company Bacground Part Ends -->
<!--Future Plans Part Starts -->
<%@include file="Footer.jsp" %>
<!--Footer Part Ends -->
</body>
</html>