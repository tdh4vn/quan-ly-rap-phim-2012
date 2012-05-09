<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
<title>Sự kiện</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<html>
<body>

<form action="Sukien.jsp" method="post">
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

<table width="100% ">

	<tr class="ourCompany-list">
		<td colspan=10 align="center">
		<h2 class="ourCompany-hdr">SỰ KIỆN</h2>
		</td>
	</tr>
	<tr>
		<td colspan="10" align="center" width=50%>
		<fieldset><legend><font face="Arial "
			color="black" size="5"> Tìm Kiếm</font></legend>
		<table width=70%>
			<tr class="ourCompany-list">
				<td>Ngày:</td>
				<td><input type="text" name="txtTuNgay" id="idTuNgay">
				<input type="hidden" name="TuNgay" value="txtTuNgay"> <img
					src="images/lich.JPG"
					onclick="javascript:NewCssCal('idTuNgay','YYYYMMDD')"></td>

				<td>Tên Sự Kiện</td>
				<td colspan="5"><input type="text" name="tk" value="Nhập" /></td>
				<td colspan="10" align="center"><input type="submit"
					name="bttimkiem" value="Tìm kiếm"></td>
			</tr>
		</table>
		</fieldset>
		</td>
	</tr>
	<%
  String tuNgayGT = request.getParameter("txtTuNgay");
  String tensukien = request.getParameter("tk");
  String tuNgay = tuNgayGT + " 00:00";
  System.out.println("tu ngay====" + tuNgay);
  ResultSet rs8;
  String timkiem = request.getParameter("bttimkiem");
  System.out.println("aaaaaaaaa=============="+timkiem);
  if ("TÃ¬m kiáº¿m".equals(timkiem))
	  {
	  //String sql8 ="select [TenSuKien],[NoiDung],[NgayBatDau],[NgayKetThuc],[HinhAnhSuKien],[MucGiamGia],[Ghichu] from [Quanlybanvephim].[dbo].[SuKien] where  [SuKien].[TenSuKien] like '"+ tensukien + "'  or day([SuKien].[NgayBatDau]) ='"+ ngay + "'or month([SuKien].[NgayBatDau]) ='"+ thang + "'or year([SuKien].[NgayBatDau])='"+ nam + "'and( day([SuKien].[NgayKetThuc])<=getdate()and month([SuKien].[NgayKetThuc])<=month(getdate())and year([SuKien].[NgayKetThuc])<= year(getdate()))";
	  //String sql8 ="select [TenSuKien],[NoiDung],[NgayBatDau],[NgayKetThuc],[HinhAnhSuKien],[MucGiamGia],[Ghichu] from [Quanlybanvephim].[dbo].[SuKien] where  [SuKien].[TenSuKien] like '"+ tensukien + "'  and day([SuKien].[NgayBatDau]) ='"+ ngay + "'and month([SuKien].[NgayBatDau]) ='"+ thang + "'and year([SuKien].[NgayBatDau])='"+ nam + "' and( day([SuKien].[NgayKetThuc])<=getdate()and month([SuKien].[NgayKetThuc])<=month(getdate())and year([SuKien].[NgayKetThuc])<= year(getdate()))";

	  String sql8 ="select [TenSuKien],[NoiDung],[NgayBatDau],[NgayKetThuc],[HinhAnhSuKien],[MucGiamGia],[GhiChu] from [Quanlybanvephim].[dbo].[SuKien]  where ([SuKien].[TenSuKien]like '%"+ tensukien + "%' 	and [SuKien].[NgayBatDau] ='"+ tuNgay + "')  or ([SuKien].[TenSuKien]like '%"+ tensukien + "%' 	and [SuKien].[NgayKetThuc] ='"+ tuNgay + "')  or ([SuKien].[TenSuKien]like '%"+ tensukien + "%'	and [SuKien].[NgayKetThuc] >'"+ tuNgay + "'	and '"+ tuNgay + "'>[SuKien].[NgayBatDau])or  [SuKien].[TenSuKien]like '%"+ tensukien + "%'    or  [SuKien].[NgayBatDau] ='"+ tuNgay + "'   or  [SuKien].[NgayKetThuc] ='"+ tuNgay + "'";
	  System.out.println("sql===================="+sql8);
	   rs8 = st.executeQuery(sql8);
	   while (rs8.next())
	   { 
	       %>
	<tr class="ourCompany-list">
		<td><img src="<%out.println(rs8.getString(5));%>" /></td>
		<td colspan="2"><textarea cols="50" rows="5">Tên sự kiện:<%out.println(rs8.getString(1));%>Nội dung:<%out.println(rs8.getString(2));%>Ngày bắt đầu:<%out.println(rs8.getString(3));%>Ngày kết thúc:<%out.println(rs8.getString(4));%>Mức giảm giá:<%out.println(rs8.getString(6));%>Ghi chú:<%out.println(rs8.getString(7));%>
		</textarea></td>
	</tr>
	<%} %>
	<%} 
 else  { 
	 %>

	<%     
       String sql6="SELECT [TenSuKien],[NoiDung],[NgayBatDau],[NgayKetThuc],[HinhAnhSuKien],[MucGiamGia],[Ghichu]FROM [Quanlybanvephim].[dbo].[SuKien]";
       ResultSet rs6 = st.executeQuery(sql6);
       while (rs6.next()) {
       %>
	<tr class="ourCompany-list">
		<td><img src="<%out.println(rs6.getString(5));%>" /></td>
		<td colspan="2"><textarea cols="50" rows="5">Tên sự kiện:<%out.println(rs6.getString(1));%>Nội dung:<%out.println(rs6.getString(2));%>Ngày bắt đầu:<%out.println(rs6.getString(3));%>Ngày kết thúc:<%out.println(rs6.getString(4));%>Mức giảm giá:<%out.println(rs6.getString(6));%>Ghi chú:<%out.println(rs6.getString(7));%>
		</textarea></td>
	</tr>
	<%} }%>
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
</form>

</body>
</html>