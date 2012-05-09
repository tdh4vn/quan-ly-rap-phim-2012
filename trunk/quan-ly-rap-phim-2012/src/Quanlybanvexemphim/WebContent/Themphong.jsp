<%@page import="javax.swing.text.Document"%>
<%@page import="sun.font.Script"%>
<%@page import="sun.jdbc.odbc.JdbcOdbcDriver"%>
<%@ page language="java" import="java.sql.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="java.sql.*"%>
<%@ page import="net.sourceforge.jtds.util.*"%>
<%@page import="java.util.*" %>
<title>Thêm phòng</title>
</head>
<script type="text/javascript">
function keypress(e){
var keypressed = null;
if (window.event)
{
keypressed = window.event.keyCode; //IE
}
else {

keypressed = e.which; //NON-IE, Standard
}
if (keypressed < 48 || keypressed > 57)
{
if (keypressed == 8 || keypressed == 127)
{
return;
}
alert(" Bạn phải nhập số !");
return false;
}
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

  function Kiemtrathemphong(){
   
      var obj1Value = document.getElementById("txtmaphong1").value; 
      if (Trim(obj1Value) == "" || obj1Value == undefined){
       alert(" Bạn chưa nhập mã phòng");
          return false;
      } 

   return true; //true co nghia la cac dieu kien deu thoa het
  }
</script>

<body>
<%@include file="Header.jsp" %>
    <%@include file="MenuUser.jsp" %>
    <div id="ourCompany-bg" align="center">
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
<form action="Themphong.jsp" method ="post">
<br> <br> <br>
<table width="60%">
  
    <tr>
        <td  align="right">
        <%
            String TenDangNhapTV = request.getParameter("TenDangNhapTV");
            out.println("hello " + TenDangNhapTV + "<br>");
        %>
        </td>
    </tr>
    <tr>
        <td>
        <fieldset><legend><font face="Arial " color="black" size="5">Thêm phòng </font> </legend>
        <div align="center">
        <table>
            <tr class="ourCompany-list">
                <td align="left">Mã phòng : <font color = red>*</font></td>
                <td><input type="text" size="30" name="maphong" id = "txtmaphong1"/>
               <%  if ("Loi".equals(request.getParameter("error"))) {
              out.write("Phòng đã tồn tại!!!!");
            }%>
                </td>
                </tr>
                <tr class="ourCompany-list">
                <td align="left">Tên Phòng :</td>
                <td><input type="text" size="30" name="tenphong" id = "tenphongtxt"/></td>
                </tr>
                <tr class="ourCompany-list">
                    <td align="left">Tên dạng phòng </td>
           <td>
            <select name="dangphong" style="width: 210px; height: 18px; ">
                   <%
                       
                      String sql1 = "select MaDangPhong,TenDangPhong from DangPhong ";
                         ResultSet rs1 = st.executeQuery(sql1);
                         ResultSetMetaData rsmd = rs1.getMetaData();
                         int dem=rsmd.getColumnCount();
                         while(rs1.next())
                            {
                              for(int i=1; i<dem;i++)
                           {%>
                                <option value="<%=rs1.getString(1) %>"><%=rs1.getString(2) %></option>
                           <%}
                        }%>
               </select>
            </td>
                </tr>
                <tr class="ourCompany-list">
                    <td align="left">Trạng thái phòng :</td>
                    <td><input type="text" size="30" value="" name ="trangthaiphong" /></td>
                </tr>
                <tr class="ourCompany-list">
                    <td align="left">Số lượng dãy ghế tối đa :</td>
                    <td><input type="text" size="30" name="soluongghe" onkeypress="return keypress(event);"  /></td>
                </tr>
                <tr class="ourCompany-list">
                    <td align="left">Số lượng ghế tối đa ở mỗi dãy:</td>
                    <td><input type="text" size="30" name="soluongday"  onkeypress="return keypress(event);" /></td>
                     
                    
                </tr>
                <tr class="ourCompany-list">
                    <td align="left">Ghi chú :</td>
                    <td><input type="text" size="30" name="ghichu" /></td>
                </tr>
            
      
       
       
    
    <tr>
    <td colspan=10 align="center"> <input type="submit" name="btthem" value="Thêm phòng" onclick="return Kiemtrathemphong()" onkeypress = "return onlyNumbers()";>
    
    </td>
    </tr>
      </table>
       </div>
     </fieldset>
        </td>
    </tr>
           <%
                String maphong=request.getParameter("maphong");
                 String tenphong=request.getParameter("tenphong");
                String dangphong=request.getParameter("dangphong");
                String trangthaiphong=request.getParameter("trangthaiphong");
                 String soluongghe=request.getParameter("soluongghe");
                 String  soluongday=request.getParameter("soluongday");
                 String ghichu=request.getParameter("ghichu");
               
                %>
 <%!public void themphong(String maphong,String tenphong ,String dangphong, String trangthaiphong,String soluongghe,String soluongday, String ghichu) 
     {
 Connection connection = null;
    String data = "jdbc:jtds:sqlserver://localhost:1032/Quanlybanvephim";
    String userName = "sa";
    String password = "123";
    String JDBC_Driver =  "net.sourceforge.jtds.jdbc.Driver";
    Statement st = null;
       try {
            Class.forName(JDBC_Driver);
            connection = DriverManager.getConnection(data, userName, password);
            st = connection.createStatement();
            String sql = "INSERT INTO [Quanlybanvephim].[dbo].[Phong] ([MaPhong],[TenPhong],[MaDangPhong],[TrangThaiPhong],[SoLuongDayGheToiDa],[SoLuongGheToiDaOMoiDay],[GhiChu])VALUES('"+maphong+"','"+tenphong+"','"+dangphong+"','"+trangthaiphong+"','"+soluongghe+"','"+soluongday+"','"+ghichu+"')";
            System.out.println("them==================="+sql);
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
 }%>
 <%
  String tk; 
String sql2="SELECT [MaPhong] FROM [Quanlybanvephim].[dbo].[Phong]";
 ResultSet rs3=st.executeQuery(sql2);
 String ma;
 tk=request.getParameter("btthem");
 System.out.println("==================="+tk);
 while(rs3.next())
 {
     ma=rs3.getString(1);
         if("ThÃªm phÃ²ng".equals(request.getParameter("btthem")))
         {
           if(ma.equals(maphong))
           {
               System.out.println("vào đay chua !!!!!!!!!!1");
               response.sendRedirect("Themphong.jsp?error=Loi");
           }
           else 
          {
               System.out.println("them vào chua mi!!!!!!!!!1");
            themphong(maphong, tenphong ,dangphong, trangthaiphong, soluongghe, soluongday, ghichu);
          }
       }
     
 }

 %>  
</table>
<br> <br> <br> <br> <br>
</form>
</div>
 <%@include file="Footer.jsp" %> 
</body>
</html>