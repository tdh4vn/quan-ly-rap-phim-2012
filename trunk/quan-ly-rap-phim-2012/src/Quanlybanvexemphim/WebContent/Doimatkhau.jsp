<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<title>Đổi mật khẩu</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<Script>
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

function kiemtradoimatkhau(){

   var obj1Value = document.getElementById("matkhaucutxt").value; 
   if (Trim(obj1Value) == "" || obj1Value == undefined){
 	  alert(" Vui lòng nhập mật khẩu cũ ");
       return false;
   } 

   var obj1Value2 = document.getElementById("matkhaumoitxt").value; 
   if (Trim(obj1Value2) == "" || obj1Value2 == undefined){
 	  alert("Vui lòng nhập mật khẩu mới");
       return false;
   } 
   var obj1Value3 = document.getElementById("nhaplaimatkhaumoitxt").value; 
   if (Trim(obj1Value3) == "" || obj1Value3 == undefined || obj1Value3!=obj1Value2){
 	  alert("Vui lòng nhập lại mật khẩu mới");
       return false;
   } 
      return true; //true co nghia la cac dieu kien deu thoa het
}
</Script>
<script type="text/javascript">
    function validatePassword() {
        var pass=document.form.matkhaumoi
        if (pass.value == "") {
        	  alert("Bạn chưa nhập　số mật khẩu!!!")
        	  pass.focus();
        	  return false;
        } else if ((pass.value.length < 6) || (pass.value.length > 32)) {
        	alert("Mật khẩu tối thiểu 6 ký tự !!")
        	pass.focus();
        	return false;
        } 
       return true;
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
<br>
<br>
<br>
<br>
<br>
<table width="80%">


	<tr>

		<td colspan="7" align=right>
		<fieldset><legend> <font face="Arial "
			color="black" size="5"> Đổi mật khẩu </font></legend>
		<form action="Doimatkhau.jsp" method="post" name="form"
			onsubmit="return validatePassword()">
		<table width=70%>
			<tr class="ourCompany-list">
				<td align=left>Tên đăng nhập:</td>
				<td><label><font face=" Arial " color="#951509"><%=session.getAttribute("tenDangNhapTV")%></font></label>
				<input type="hidden" name="TDNhap"
					value="<%=session.getAttribute("tenDangNhapTV")%>" /></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Mật khẩu cũ:<font color=red>*</font></td>
				<td align="left"><input type="password" size="30"
					name="matkhaucu" id="matkhaucutxt" /> <%  if ("Loi".equals(request.getParameter("error"))) {
              out.write("Mật khẩu sai.Vui lòng nhập lại mật khẩu!!!!");
            }%>
				</td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Mật khẩu mới:<font color=red>*</font></td>
				<td align="left"><input type="password" size="30"
					name="matkhaumoi" id="matkhaumoitxt" /></td>
			</tr>
			<tr class="ourCompany-list">
				<td align="left">Nhập lại mật khẩu mới:<font color=red>*</font>
				</td>
				<td align="left"><input type="password" size="30"
					name="nhaplaimatkhaumoi" id="nhaplaimatkhaumoitxt" /></td>
			</tr>
			<tr class="ourCompany-list">
				<td></td>
				<td align="left"><input type="submit" name="nhaplaimatkhau"
					value="Lưu" onclick="return kiemtradoimatkhau();"></input></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><font color="red">*</font> <font
					color="#951509" face="Arial Narrow" size="3"> Thông tin bắt
				buộc phải điền. </font></td>
			</tr>
			<%
String matkhaucu=request.getParameter("matkhaucu");
 String NLMKmoi = request.getParameter("nhaplaimatkhaumoi");
    System.out.println("Mat khau moi ne" +NLMKmoi);
 
 %>
			<%! String tk; %>
			<%
    
   String sql=" select MatKhau from ThanhVien where TenDangNhapTV='"+ session.getAttribute("tenDangNhapTV")+ "'";
    System.out.println("cau lenh======"+sql); 
    ResultSet rs5=st.executeQuery(sql);
     String mk; 
   
    tk=request.getParameter("nhaplaimatkhau");
    System.out.print("sql========="+tk);
    while(rs5.next())
    {
    	mk= rs5.getString(1);
    	 System.out.println("mật khẩu cũ====="+mk);
    	 if("LÆ°u".equals(tk))
    	    {
    	    	if(mk.equals(matkhaucu)){
    	    		 System.out.println("in ra di" + session.getAttribute("tenDangNhapTV"));
    	    	     int ok = 0;
    	    	   
    	    	      String sql2;
    	    	      sql2 = "UPDATE [Quanlybanvephim].[dbo].[ThanhVien]SET [MatKhau] ='"+NLMKmoi+"' where TenDangNhapTV = '"+ session.getAttribute("tenDangNhapTV")+ "'";
    	    	      System.out.print("sql========="+sql2);
    	    	      ok = st.executeUpdate(sql2);
    	    	      response.sendRedirect("Thongtinthanhvien.jsp");
    	    	      
    	    	}
    	    	else 
    	    		
    	    	{
    	    		  response.sendRedirect("Doimatkhau.jsp?error=Loi");
    	    	}
    	    
    	    
    	     }
    }
   %>


		</table>
		</form>
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
</body>
</div>

</div>

<%@include file="Footer.jsp"%>

</html>