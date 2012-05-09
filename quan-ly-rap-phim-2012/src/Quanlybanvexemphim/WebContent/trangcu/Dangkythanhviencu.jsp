<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Conver.*"%>
<title>Đăng ký thành viên</title>
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

  function kiemTraDauVao(){
   
      var obj1Value = document.getElementById("hotenTxt").value; 
      if (Trim(obj1Value) == "" || obj1Value == undefined){
    	  alert(" Bạn chưa nhập họ tên ! ");
          return false;
      } 

      var obj1Value2 = document.getElementById("tendangnhapTxt").value; 
      if (Trim(obj1Value2) == "" || obj1Value2 == undefined){
    	  alert("Bạn chưa nhập tên đăng nhập !");
          return false;
      } 
      var obj1Value3 = document.getElementById("matkhauTxt").value; 
      if (Trim(obj1Value3) == "" || obj1Value3 == undefined){
    	  alert("Bạn chưa nhập mật khẩu !");
          return false;
      } 
      var obj1Value4 = document.getElementById("nhaplaimatkhauTxt").value; 
      if (Trim(obj1Value4) == "" || obj1Value4 == undefined ||obj1Value4 != obj1Value3){
    	  alert("Vui lòng nhập lại mật khẩu !");
          return false;
      } 
      var obj1Value5 = document.getElementById("emailTxt").value; 
      if (Trim(obj1Value5) == "" || obj1Value5 == undefined){
    	  alert("Bạn chưa nhập địa chỉ email !");
          return false;
      } 

	  return true; //true co nghia la cac dieu kien deu thoa het
  }
</script>
<%@include file="Header.jsp"%>

<%@include file="MenuUser.jsp"%>

<div id="ourCompany-bg">

<div id="ourCompany-part">
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
<form method="post">



<table width="100%" height="500">

	<tr>
		<td colspan="3"></td>
	</tr>
	<tr>


		<td colspan="3" align="center">
		<h2 class="ourCompany-hdr">Đăng ký thành viên</h2>
		</td>
	</tr>
	<tr>
		<td><br />
		</td>
		<td><br />
		</td>
	</tr>
	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Họ tên: <font color=red>*</font></td>
		<td align="left"><input type="text" size="30" name="hoten"
			id="hotenTxt" /></td>
	</tr>

	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Tên đăng nhập: <font color=red>*</font></td>
		<td align="left"><input type="text" size="30" name="tendangnhap"
			id="tendangnhapTxt" /></td>
	</tr>


	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Mật khẩu:<font color=red>*</font></td>
		<td align="left"><input type="password" size="30" name="matkhau"
			id="matkhauTxt" /></td>
	</tr>

	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Nhập lại mật khẩu:<font color=red>*</font></td>
		<td align="left"><input type="password" size="30"
			name="nhaplaimatkhau" id="nhaplaimatkhauTxt" /></td>
	</tr>

	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Email:<font color=red>*</font></td>
		<td align="left"><input type="text" size="30" name="email"
			id="emailTxt" /></td>
	</tr>

	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Số điện thoại:</td>
		<td align="left"><input type="text" size="30" name="sodienthoai" />
		</td>
	</tr>

	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Ngày sinh:</td>
		<td align="left"><input type="text" size="30" name="txtNgaySinh"
			id="idngaySinh" /> <img src="images/lich.JPG"
			onclick="javascript:NewCssCal('idngaySinh','MMDDYYYY')"></td>
	</tr>

	<tr class="ourCompany-list">
		<td width=20%></td>
		<td align="left">Giới tính:</td>
		<td align="left"><tt><input type="radio" name="gioitinh"
			value="nam" checked="checked" /> Nam <input type="radio"
			name="gioitinh" value="nữ" /> Nữ </tt></td>
	</tr>

	<tr class="ourCompany-list">
		<td width=20%></td>
		<td width=30% align="left">Địa chỉ:</td>
		<td align="left"><input type="text" size="30" name="diachi" /></td>
	</tr>

	<tr>
		<td colspan="3"></td>
	</tr>

	<tr>
		<td width=20%></td>
		<td width=30%></td>
		<td>
		<%
 String HTen = request.getParameter("hoten");
 System.out.println("HTen======" + HTen+ "===========");
 String TDNhap = request.getParameter("tendangnhap");
 session.setAttribute("tendangnhapTV",TDNhap);
 System.out.println("tdnnnnnnn   "+session.getAttribute("tendangnhapTV"));

 String MKhau = request.getParameter("matkhau");
 String EmailNV = request.getParameter("email");
 String SDThoai = request.getParameter("sodienthoai");
 String NSinh = request.getParameter("txtNgaySinh");
 String GTinh =request.getParameter("gioitinh");
 String DChi = request.getParameter("diachi");

 %> <input type="submit" name="themtv" value="Thêm"
			onclick=" return kiemTraDauVao();"> <%!public void Xulydangky(String HTen,String TDNhap,String MKhau,String EmailNV,String SDThoai, String NSinh,String GTinh , String DChi ) 
		   {
 Connection connection = null;
    String data = "jdbc:jtds:sqlserver://localhost:3548/Quanlybanvephim";
    String userName = "sa";
    String password = "123";
    String JDBC_Driver =  "net.sourceforge.jtds.jdbc.Driver";
    Statement st = null;
       try {
            Class.forName(JDBC_Driver);
            connection = DriverManager.getConnection(data, userName, password);
            st = connection.createStatement();
          
            
            String sql = "insert into ThanhVien(HoTen,TenDangNhapTV,MatKhau,Email,SoDienThoai,NgaySinh,GioiTinh,DiaChi)values('"+HTen+"','"+TDNhap+"','"+MKhau+"','"+EmailNV+"','"+SDThoai+"','"+NSinh+"','"+GTinh+"','"+DChi+"')";
            st.executeUpdate(sql); 
       }catch(ClassNotFoundException e){
        e.printStackTrace();
        }
        catch (SQLException se) {        
                se.printStackTrace();
       }finally{
       if(connection !=null){
       try{
         connection.close();
       }catch (Exception e) {
           System.out.println("Khong dong duoc ket noi");
       }
      }
      if(st!=null){
      try{
           st.close();
      }catch (Exception e) {
           System.out.println("Khong dong duoc ket noi");
      }
      }
      }
      }%> <%!String tk; %> <% 
      tk=request.getParameter("themtv");
       System.out.println(tk);
       if("ThÃªm".equals(tk))
  {
	   Xulydangky(HTen, TDNhap, MKhau, EmailNV, SDThoai, NSinh,GTinh, DChi);
	
  }
       %>
		</td>
	</tr>
	<tr>
		<td></td>
		<td align="left"><font color="red">*</font> <font
			color="#951509" face="Arial Narrow" size="3"> Thông tin bắt
		buộc phải điền. </font></td>
	</tr>
</table>



</form>
</body>
</div>

</div>

<%@include file="Footer.jsp"%>

</html>