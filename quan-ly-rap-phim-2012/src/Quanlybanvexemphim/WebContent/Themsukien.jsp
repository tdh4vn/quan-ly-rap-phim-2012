
<%@page import="java.util.HashMap"%>
<%@page import="Conver.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<title>Thêm sự kiện</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
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
<form action="Themsukien.jsp" method="post"><br>
<br>
<br>
<table width=100%>
	<tr>
		<td colspan=10 align=right>
		<%String TenDangNhapTV=request.getParameter("TenDangNhapTV");
  out.println("hello "+TenDangNhapTV+"<br>"); %>
		</td>
	</tr>
	<tr>
		<td colspan=10>
		<fieldset><legend><font face="Arial "
			color="black" size="5"> Thêm sự kiện:</font></legend>
		<table align="center" width=100%>
			<tr class="ourCompany-list">
				<td>Mã sự kiện:</td>
				<td><input type="text" name="masukien"></td>
				<td>Ngày bắt đầu:</td>
				<td><input type="text" name="txtTuNgay" id="idTuNgay">
				<input type="hidden" name="TuNgay" value="txtTuNgay"> <img
					src="images/lich.JPG"
					onclick="javascript:NewCssCal('idTuNgay','YYYYMMDD')"></td>
				<td></td>
			</tr>
			<tr class="ourCompany-list">
				<td>Tên sự kiện:</td>
				<td><input type="text" name="tensukien"></td>
				<td>Ngày kết thúc:</td>

				<td><input type="text" name="txtDenNgay" id="idDenNgay">
				<input type="hidden" name="DenNgay" value="txtDenNgay"> <img
					src="images/lich.JPG"
					onclick="javascript:NewCssCal('idDenNgay','YYYYMMDD')"></td>
			</tr>
			<tr class="ourCompany-list">
				<td>Nội dung:</td>
				<td><input type="text" name="noidung"></td>
				<td>Mức giảm giá:</td>
				<td colspan=4><input type="text" name="mucgiamgia" size=30></td>
			</tr>
			<tr class="ourCompany-list">
				<td>Ảnh đại diện:</td>
				<td><input type="file" name="anhdaidien"></td>
				<td>Ghi chú:</td>
				<td colspan=4><input type="text" name="ghichu" size=30></td>
			</tr>

			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tr>
				<td colspan="10" align="center"><input type="submit"
					name="capnhat" value="Cập nhật"> <%
 String MaSuKien = request.getParameter("masukien");
 System.out.println("MaSuKien======" + MaSuKien+ "===========");
 String TenSuKien = request.getParameter("tensukien");
 System.out.println(TenSuKien);
 String NoiDung = request.getParameter("noidung");
 String MucGiamGia = request.getParameter("mucgiamgia");
 String HinhAnhSuKien = request.getParameter("anhdaidien");
 String GhiChu = request.getParameter("ghichu");
 String tuNgayGT = request.getParameter("txtTuNgay");

 String denNgayGT = request.getParameter("txtDenNgay");
 ConvertDate cd = new ConvertDate();
 String tuNgay = tuNgayGT + " 00:00";
 System.out.println("tu ngay====" + tuNgay);
 String denNgay = denNgayGT + " 00:00";
 System.out.println("den ngay====" + denNgay);
 %> <%!public void Xulythemsukien(String MaSuKien,String TenSuKien,String NoiDung,String nbd, String nkt,String HinhAnhSuKien,String MucGiamGia,String GhiChu) 
     {
 Connection connection = null;
    String data = "jdbc:jtds:sqlserver://localhost:1433/Quanlybanvephim";
    String userName = "sa";
    String password = "123";
    String JDBC_Driver =  "net.sourceforge.jtds.jdbc.Driver";
    Statement st = null;
       try {
            Class.forName(JDBC_Driver);
            connection = DriverManager.getConnection(data, userName, password);
            st = connection.createStatement();
            String  sql= "INSERT INTO [Quanlybanvephim].[dbo].[SuKien](MaSuKien,[TenSuKien],[NoiDung],[NgayBatDau] ,[NgayKetThuc],[HinhAnhSuKien],[MucGiamGia],[Ghichu]) VALUES ('"+MaSuKien+"','"+TenSuKien+"','"+NoiDung+"','"+nbd+"','"+nkt+"','"+HinhAnhSuKien+"','"+MucGiamGia+"','"+GhiChu+"')";
     st.executeUpdate(sql);          
          } 
       catch (ClassNotFoundException e) {
        e.printStackTrace();
        } catch (SQLException se) {        
           se.printStackTrace();
        } finally {
    if (connection != null) {
    try {
     connection.close();
    }
    catch (Exception e) {
     System.out.println("Khong dong duoc ket noi");
    }
   }

   if (st != null) {
    try {
     st.close();
    }
    catch (Exception e) {
     System.out.println("Khong dong duoc ket noi");
    }
   }
        }
 }%> <%! String tk; %> <%
  tk=request.getParameter("capnhat");
  System.out.println(request.getParameter("capnhat"));
 
   if("Cáº­p nháº­t".equals(tk))
  {
    Xulythemsukien(MaSuKien, TenSuKien, NoiDung, tuNgay, denNgay,HinhAnhSuKien,MucGiamGia, GhiChu);
  }
 %>
				</td>
		</table>
		</fieldset>
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

