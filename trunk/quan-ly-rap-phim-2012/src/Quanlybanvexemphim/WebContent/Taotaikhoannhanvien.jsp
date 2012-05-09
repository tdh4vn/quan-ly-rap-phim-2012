<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Conver.*"%>
<title>Tạo tài khoản nhân viên</title>
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

  function Kiemtrataikhoan(){
   
      var obj1Value = document.getElementById("tendangnhapTxt").value; 
      if (Trim(obj1Value) == "" || obj1Value == undefined){
    	  alert(" Bạn chưa nhập tên đăng nhập ");
          return false;
      } 

      var obj1Value2 = document.getElementById("tennhanvienTxt").value; 
      if (Trim(obj1Value2) == "" || obj1Value2 == undefined){
    	  alert("Bạn chưa nhập tên nhân viên");
          return false;
      } 
      var obj1Value3 = document.getElementById("matkhauTxt").value; 
      if (Trim(obj1Value3) == "" || obj1Value3 == undefined){
    	  alert("Bạn chưa nhập mật khẩu");
          return false;
      } 
      var obj1Value4 = document.getElementById("nhaplaimatkhauTxt").value; 
      if (Trim(obj1Value4) == "" || obj1Value4 == undefined || obj1Value3!=obj1Value4){
    	  alert("Bạn vui lòng　nhập lại mật khẩu");
          return false;
      
      } 

	  return true; //true co nghia la cac dieu kien deu thoa het
  }





  function show_confirm()
  {
     return confirm("Bạn có chắc chắn muốn xoá không ?");
  }
  
</script>
<script type="text/javascript">
    function validatePassword() {
        var pass=document.form.matkhau
        if (pass.value == "") {
        	  alert("Bạn chưa nhập　số mật khẩu!!!")
        	  pass.focus();
        	  return false;
        } else if ((pass.value.length < 6) || (pass.value.length > 32)) {
        	alert("Mật khẩu có độ dài tối thiểu 6 ký tự!!")
        	pass.focus();
        	return false;
        } 
       return true;
    }
</script>
<script type="text/javascript">
    function validatePasswords() {
        var mk=document.frm.matkhaunv
        if (mk.value == "") {
        	  alert("Bạn chưa nhập　số mật khẩu!!!")
        	mk.focus();
        	  return false;
        } else if ((mk.value.length < 6) || (mk.value.length > 32)) {
        	alert("Mật khẩu có độ dài tối thiểu 6 ký tự!!")
        	mk.focus();
        	return false;
        } 
       return true;
    }
</script>
<body>
<%@include file="Header.jsp"%>
<%@include file="MenuAdmin.jsp"%>

<div id="ourCompany-bg">
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

<table width="100%">

	<tr>
		<td colspan="10" align=right><br />
		<fieldset><legend><font face="Arial "
			color="black" size="5"> Tạo tài khoản</font></legend>
		<form action="Taotaikhoannhanvien.jsp" method="post" name="form"
			onsubmit="return validatePassword() ">
		<table width=70%>
			<tr class="ourCompany-list">
				<td align="left">Tên đăng nhập:<font color=red>*</font> <%  if ("Loi".equals(request.getParameter("error"))) {
              out.write("Nhân viên đã tồn tại!!!!");
            }%>
				</td>
				<td align="left"><input type="text" size="30"
					name="tendangnhap" id="tendangnhapTxt" /></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Tên nhân viên:<font color=red>*</font></td>
				<td align="left"><input type="text" size="30"
					name="tennhanvien" id="tennhanvienTxt" /></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Mật khẩu:<font color=red>*</font></td>
				<td align="left"><input type="password" size="30"
					name="matkhau" id="matkhauTxt" /></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Nhập lại mật khẩu:<font color=red>*</font></td>
				<td align="left"><input type="password" size="30"
					name="nhaplaimatkhau" id="nhaplaimatkhauTxt" /></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Ngày sinh:</td>
				<td align="left"><input type="text" size="30"
					name="txtNgaySinh" id="idngaySinh" /> <img src="images/lich.JPG"
					onclick="javascript:NewCssCal('idngaySinh','MMDDYYYY')"></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Giới tính<font color=red>*</font>:</td>
				<td align="left"><tt><input type="radio" name="gioitinh"
					value="nam" checked="checked" /> Nam <input type="radio"
					name="gioitinh" value="nữ" /> Nữ </tt></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Quyền<font color=red>*</font>:</td>
				<td align="left"><select name="quyen"
					style="width: 100px; height: 18px;">
					<%
						String sql1 = "SELECT [MaQuyen],[TenQuyen]FROM [Quanlybanvephim].[dbo].[Quyen] ";
						ResultSet rs1 = st.executeQuery(sql1);
						ResultSetMetaData rsmd = rs1.getMetaData();
						int dem = rsmd.getColumnCount();
						while (rs1.next()) {
							for (int i = 1; i < dem; i++) {
					%>
					<option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
					<%
						}
						}
					%>
				</select></td>
				<td></td>
			</tr>

			<tr class="ourCompany-list">
				<td></td>
				<td align="left"><input type="submit" name="themnv"
					value="Thêm" onclick="return Kiemtrataikhoan();"></td>
			<tr>
				<td colspan="2"><font color="red">*</font> <font
					color="#951509" face="Arial Narrow" size="3"> Thông tin bắt
				buộc phải điền. </font></td>
			</tr>
			<%
					String TenDangNhap = request.getParameter("tendangnhap");
					System.out.println("MaDV======" + TenDangNhap + "===========");
					String TenNhanVien = request.getParameter("tennhanvien");
					System.out.println(TenNhanVien);
					String MatKhau = request.getParameter("matkhau");
					String ngaySinh = request.getParameter("txtNgaySinh");
					System.out.println("ngay sinh cua nhan vien la===" +ngaySinh);
					String GioiTinh = request.getParameter("gioitinh");
					String Quyen = request.getParameter("quyen");
					System.out.println("aaaaa" + Quyen + "aaaaaaaaa");
				%>
			<%!public void Xulytaotaikhoan(String TenDangNhap, String TenNhanVien,
			String MatKhau, String ngaySinh, String GioiTinh, String Quyen) {
		Connection connection = null;
		String data = "jdbc:jtds:sqlserver://localhost:3548/Quanlybanvephim";
		String userName = "sa";
		String password = "123";
		String JDBC_Driver = "net.sourceforge.jtds.jdbc.Driver";
		Statement st = null;
		try {
			Class.forName(JDBC_Driver);
			connection = DriverManager.getConnection(data, userName, password);
			st = connection.createStatement();
			
			String sql = "insert into NhanVien(TenDangNhapNV,TenNhanVien,MatKhauNV,NgaySinh,GioiTinh,MaQuyen)values('"
					+ TenDangNhap
					+ "','"
					+ TenNhanVien
					+ "','"
					+ MatKhau
					+ "','" + ngaySinh + "','" + GioiTinh + "','" + Quyen + "')";

			st.executeUpdate(sql);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
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
				String sql ="select TenDangNhapNV from NhanVien";
				ResultSet rs6= st.executeQuery(sql);
				String tennv;
					tk = request.getParameter("themnv");
					System.out.println(tk);
					while (rs6.next())
					{
						tennv=rs6.getString(1);
						if ("ThÃªm".equals(tk)) {
							if(tennv.equals(TenDangNhap))
							{
								System.out.println("vào đên đay chua??????????????");
								 response.sendRedirect("Taotaikhoannhanvien.jsp?error=Loi");
							}
							else
							{
								Xulytaotaikhoan(TenDangNhap,TenNhanVien,MatKhau,ngaySinh,
										GioiTinh, Quyen);	
							}
							
						}
					}
					
				%>


		</table>
		</form>
		</fieldset>
		<br>
		<br>
		<form action="Taotaikhoannhanvien.jsp" method="post" name="frm"
			onsubmit="return validatePasswords()">
		<table border="1" width=100%>
			<tr bgcolor="333333">
				<td align="center"><font color="#CBC387">Tên đăng nhập
				</font></td>
				<td align="center"><font color="#CBC387">Tên nhân viên</font></td>
				<td align="center"><font color="#CBC387">Mật khẩu</font></td>
				<td align="center"><font color="#CBC387">Ngày Sinh</font></td>
				<td align="center"><font color="#CBC387">Giới tính</font></td>
				<td align="center"><font color="#CBC387">Quyền</font></td>
				<td align="center"></td>
			</tr>
			<%
				//String sql2 = "Select TenDangNhapNV ,TenNhanVien ,MatKhauNV,NgaySinh,GioiTinh,TenQuyen from NhanVien, Quyen where Quyen.MaQuyen = NhanVien.MaQuyen";
			String sql2 = "Select TenDangNhapNV ,TenNhanVien ,MatKhauNV,NgaySinh,GioiTinh,TenQuyen from NhanVien, Quyen where Quyen.MaQuyen = NhanVien.MaQuyen";
				ResultSet rs = st.executeQuery(sql2);

				while (rs.next()) {
			%>

			<tr class="ourCompany-list">
				<td><label> <%
					out.println(rs.getString(1));
				%> </label> <input type="hidden" name="tendangnhap" id="tenDangNhapID"
					value="<%=rs.getString(1)%>" /></td>
				<td align="center"><input type="text" name="tennhanvien"
					id="tenNhanVienID" value="<%=rs.getString(2)%>" /></td>
				<td align="center"><input type="text" name="matkhaunv"
					id="matKhauID" value="<%=rs.getString(3)%>" /></td>
				<td align="center"><input type="text" name="ngaysinh"
					value="<%=rs.getString(4)%>" /></td>
				<td align="center"><input type="text" name="gioitinh"
					id="gioiTinhID" value="<%=rs.getString(5)%>" /></td>
				<td align="center"><input type="text" name="quyen" id="quyenID"
					value="<%=rs.getString(6)%>" /></td>


				<td align="center"><a
					href="Xoanhanvien.jsp?TenDangNhapNV=<%=rs.getString(1)%>"
					onClick="return show_confirm()">Xoá</a></td>
				<%
					}
				%>
			</tr>

		</table>
		<br />

		<center><input type="submit" name="btcapnhat"
			value="Cập nhật" onclick=" return kiemTraDauVao1();"></input></center>
		<%
			String[] TDNhapArray = request.getParameterValues("tendangnhap");
			String[] TNVienArray = request.getParameterValues("tennhanvien");
			String[] MKhauArray = request.getParameterValues("matkhaunv");
			String[] NSinhArray = request.getParameterValues("ngaysinh");
			String[] GTinhArray = request.getParameterValues("gioitinh");
			String[] QuyenArray = request.getParameterValues("quyen");
		%> <%
 	tk = request.getParameter("btcapnhat");
		System.out.print("sql=========" + tk);
 	if ("Cáº­p nháº­t".equals(tk)) {
 		System.out.println("in ra di" + TDNhapArray);
 		int ok = 0;
 		for (int i = 0; i <=TDNhapArray.length - 1; i++) {
 			sql1 = "UPDATE [Quanlybanvephim].[dbo].[NhanVien]SET [TenNhanVien] ='"
 					+ TNVienArray[i]
 					+ "',[MatKhauNV]='"
 					+ MKhauArray[i]
 					+ "',[NgaySinh] ='"
 					+ NSinhArray[i]
 					+ "',[GioiTinh] ='"
 					+ GTinhArray[i]
 					+ "'  WHERE [TenDangNhapNV] = '"
 					+ TDNhapArray[i]
 					+ "'";
 			System.out.print("sql=========" + sql1);
 			ok = st.executeUpdate(sql1);
 			System.out.print("Da cap nhat dong so = " + (i + 1)
 					+ "ket qua la = " + 1);
 		}
 		response.sendRedirect("Taotaikhoannhanvien.jsp");
 	}
 %>
		</form>
		</td>
	</tr>
</table>
</div>
</div>
<%@include file="FooterAdmin.jsp"%>
</body>
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

  function kiemTraDauVao1(){
   
      var obj1Value = document.getElementById("tenDangNhapID").value; 
      if (Trim(obj1Value) == "" || obj1Value == undefined){
    	  alert(" Bạn chưa nhập tên đăng nhập ! ");
          return false;
      } 

      var obj1Value2 = document.getElementById("tenNhanVienID").value; 
      if (Trim(obj1Value2) == "" || obj1Value2 == undefined){
    	  alert("Bạn chưa nhập tên nhân viên !");
          return false;
      } 
      var obj1Value3 = document.getElementById("matKhauID").value; 
      if (Trim(obj1Value3) == "" || obj1Value3 == undefined){
    	  alert("Bạn chưa nhập mật khẩu !");
          return false;
      
      } 
      var obj1Value5 = document.getElementById("gioiTinhID").value; 
      if (Trim(obj1Value5) == "" || obj1Value5 == undefined){
    	  alert("Bạn chưa nhập giới tính !");
          return false;
      } 
      var obj1Value5 = document.getElementById("quyenID").value; 
      if (Trim(obj1Value5) == "" || obj1Value5 == undefined){
    	  alert("Bạn chưa nhập giới tính !");
          return false;
      } 

	  return true; //true co nghia la cac dieu kien deu thoa het
  }
</script>
</html>