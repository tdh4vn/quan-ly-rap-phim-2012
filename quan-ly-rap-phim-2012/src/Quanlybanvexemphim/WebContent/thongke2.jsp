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
<html>
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

<title>Thống kê phim</title>
<!--<link href="style.css" rel="stylesheet" type="text/css" />-->
</head>
<%@include file="Header.jsp"%>
<%@include file="MenuAdmin.jsp"%>
<div id="ourCompany-bg">
<div id="ourCompany-part">

<body>


<form action="thongke2.jsp" method="post">
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
<table width=100%>
	<tr>
		<td colspan=10 align="center">
		<h2 class="ourCompany-hdr">Thống kê phim</h2>
		</td>
	</tr>

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

			<tr class="ourCompany-list">

				<td rowspan="3">Từ <%=tuNgayGT%></td>
				<td rowspan="3">đến <%=denNgayGT%></td>
			</tr>
		</table>
		</fieldset>

		<table border=1>
			<tr bgcolor="333333">
				<td><font color="#CBC387">Tên phim </font></td>
				<td><font color="#CBC387">Số lượng vé bán được</font></td>
			</tr>
			<%
			    
			%>
			<%
			
			ArrayList<String> maPhimArray = new ArrayList<String>();
			ArrayList<String> tenPhimArray = new ArrayList<String>();
			ArrayList<Integer> countVeArray = new ArrayList<Integer>();
			ResultSet rs8;
			String sql8 = null;%>
			<%
   			
			
				//System.out.println(i+"lam den vi tri 2");
	   			

			sql8 = "select distinct [TenPhim],[Phim].[MaPhim] from [Quanlybanvephim].[dbo].[Phim] join [Quanlybanvephim].[dbo].[XuatChieu] on Phim.MaPhim=XuatChieu.MaPhim  join [Quanlybanvephim].[dbo].[LichChieu] on XuatChieu.MaXuatChieu=LichChieu.MaXuatChieu  where '"+tuNgay+"'<=NgayChieu and NgayChieu <='"+denNgay+"' ";
			rs8 = st.executeQuery(sql8);
			while (rs8.next()) {
				
				maPhimArray.add(rs8.getString(2));
				tenPhimArray.add(rs8.getString(1));
		
			}
			rs8.close();
			
			System.out.println("MA PHIM===" + maPhimArray);
			System.out.println("TEN PHIM===" + tenPhimArray);		
				String sql9 = null;
				
				for (int i = 0; i < maPhimArray.size(); i++) {
					sql9 = "select count ([Ve].[MaVe]) from [Quanlybanvephim].[dbo].[Ve] ,[Quanlybanvephim].[dbo].[LichChieu] where [Ve].[MaLichChieu]=[LichChieu].[MaLichChieu] and  [Ve].[MaPhim]= '"+maPhimArray.get(i)+"'  and '"+tuNgay+"'<=[LichChieu].[NgayChieu]  and [LichChieu].[NgayChieu]<='"+denNgay+"'";
							
					ResultSet rs9=st.executeQuery(sql9);
					while(rs9.next()){
						countVeArray.add(Integer.parseInt(rs9.getString(1)));
					}
				}
				System.out.println("count ve ban duoc===" + countVeArray);
			%>


			<%for(int j=0;j<maPhimArray.size();j++){ %>


			<tr class="ourCompany-list">
				<td><%=tenPhimArray.get(j)%></td>
				<td><%=countVeArray.get(j) %></td>
			</tr>
			<%
			System.out.println("dem==="+countVeArray.get(j));
			}} %>
		</table>


		</td>
	</tr>

</table>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</form>
</body>
</div>
</div>
<%@include file="FooterAdmin.jsp"%>
</html>
