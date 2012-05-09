
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="javax.servlet.http.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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

function kiemTraTimKiem(){

   var obj1Value = document.getElementById("idTuNgay").value; 
   if (Trim(obj1Value) == "" || obj1Value == undefined){
    alert(" Vui lòng chọn ngày bắt đầu ");
       return false;
   } 

   var obj1Value2 = document.getElementById("idDenNgay").value; 
   if (Trim(obj1Value2) == "" || obj1Value2 == undefined){
    alert("Vui lòng nhập ngày kết thúc");
       return false;
  
   } 
      return true; //true co nghia la cac dieu kien deu thoa het
}
</Script>
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
<%@include file="Header.jsp"%>

<%@include file="MenuAdmin.jsp"%>

<div id="ourCompany-bg"><!--Our Company Part Starts -->
<div id="ourCompany-part">
<form action="Themlichhangloat.jsp"><br>
<br>
<br>
<br>
<br>
<table width="100%">

	<tr>
		<td colspan="10">
		<table width="100%">

			<tr>
				<td>
				<h2 class="ourCompany-hdr">Thêm lịch hàng loạt</h2>
				</td>
			</tr>

			<tr>
				<td colspan="10" align="center">
				<fieldset><legend> <font face="Arial "
					color="black" size="5">Chọn ngày</font></legend>
				<table>

					<tr class="ourCompany-list">
						<td>Từ ngày:</td>
						<td><input type="text" name="txtTuNgay" id="idTuNgay">
						<input type="hidden" name="TuNgay"
							value="<%=request.getParameter("txtTuNgay") %>"> <img
							src="images/lich.JPG"
							onclick="javascript:NewCssCal('idTuNgay','YYYYMMDD')"></td>

					</tr>
					<tr class="ourCompany-list">
						<td>Đến ngày:</td>
						<td><input type="text" name="txtDenNgay" id="idDenNgay">
						<input type="hidden" name="DenNgay"
							value="<%=request.getParameter("txtDenNgay") %>"> <img
							src="images/lich.JPG"
							onclick="javascript:NewCssCal('idDenNgay','YYYYMMDD')"></td>
					</tr>

					<tr>

						<td colspan="2" align="center"><input type="submit"
							name="btnThemLichHangLoat" value="Thêm lịch hàng loạt"
							onclick="return kiemTraTimKiem()"></td>
					</tr>
					<tr>
						<!--THONG BAO LOI					-->
						<td colspan="2" style="color: red; size: 15">
						<%if ("LoiCapNhat".equals(request.getParameter("error"))) {
						         out.write("Ngày bắt đầu cập nhật nhỏ hơn ngày hiện tại, bạn không thể cập nhật lịch chiếu!!!");
					        } %>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="color: blue; size: 15">
						<%if ("CapNhatThanhCong".equals(request.getParameter("thongBao"))) {
						         out.write("Cập nhật thành công!!!");
					        } %>
						</td>
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
				ArrayList<String> maPhimList = new ArrayList<String>();
				ArrayList<String> tenPhimList = new ArrayList<String>();
				ArrayList<String> ngayBDList = new ArrayList<String>();
				ArrayList<String> ngayKTList = new ArrayList<String>();
				String sql4 = "SELECT [MaPhim],[TenPhim],[NgayBatDau],[NgayKetThuc] FROM [Quanlybanvephim].[dbo].[Phim]";
				ResultSet rs4 = st.executeQuery(sql4);
				while (rs4.next()) {
					maPhimList.add(rs4.getString(1));
					tenPhimList.add(rs4.getString(2));
					ngayBDList.add(rs4.getString(3));
					ngayKTList.add(rs4.getString(4));
				}
				rs4.close();
				ArrayList<String> tenPhim = new ArrayList<String>();
				ArrayList<String> gioChieu = new ArrayList<String>();
				ArrayList<String> phutChieu = new ArrayList<String>();
			%>
			<%
				//BAT DAU TIM KIEM
				String tk=request.getParameter("btnThemLichHangLoat");
				System.out.println("nut tim kiem neh miiiiiiiiiiiiiiii "+tk );
				if ("ThÃªm lá»ch hÃ ng loáº¡t".equals(request.getParameter("btnThemLichHangLoat"))) {
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
				<!--TAO BIEN FROM AN DE LAY SO NGAY TIM KIEM -> AP DUNG CHO CAP NHAT-->
				<td colspan="10"><input type="hidden" name="ngaySize"
					value="<%=ngay.size()%>">
				<table width="px" border="1px" bordercolor="black" align="center">

					<tr bgcolor="333333">
						<td rowspan="2" align="center">Ngày</td>
						<td width="10px" rowspan="2" align="center">Giờ</td>

						<%
							for (int i = 0; i < tenPhong.size(); i++) {
						%>
						<td colspan="2" align="center"><%=tenPhong.get(i)%></td>
						<%
							}
						%>
						<td rowspan="2"></td>
					</tr>

					<tr bgcolor="333333">

						<%
							for (int j = 0; j < tenPhong.size(); j++) {
						%>
						<td width="230px">Tên Phim</td>
						<td width="150px">Xuất chiếu</td>
						<%
							}
						%>

					</tr>
					<%
							for (int k = 0; k < ngay.size(); k++) {
								String xoaNgay = ngay.get(k);
					%>
					<tr>

						<td><input type="hidden" name="ngayHD"
							value="<%=ngay.get(k)%>"></td>
						<!--								<td></td>-->
						<td></td>
						<%
								for (int h = 0; h < tenPhong.size(); h++) {
						%>
						<!--TAO BIEN FROM AN DE LAY NGAY -> AP DUNG CHO CAP NHAT-->
						<td></td>
						<td></td>

						<%
								}
						%>

						<td rowspan="15"><a
							href="Xoalichchieu.jsp?Ngay=<%=xoaNgay%>&tuNgayX=<%=tuNgayGT%>&denNgayX=<%=denNgayGT%>">Xoá</a></td>

					</tr>
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
										sql3 = "select [Phim].[MaPhim], [TenPhim], [GioChieu],[PhutChieu], [LichChieu].[MaLichChieu],[XuatChieu].[MaXuatChieu] from [Quanlybanvephim].[dbo].[Phim] join [Quanlybanvephim].[dbo].[XuatChieu] on Phim.MaPhim=XuatChieu.MaPhim join [Quanlybanvephim].[dbo].[LichChieu] on XuatChieu.MaXuatChieu=LichChieu.MaXuatChieu where MaPhong='"
												+ maPhong.get(i)
												+ "' and NgayChieu='"
												+ ngay.get(k)
												+ "' and GioChieu >= '"
												+ gio
												+ "' and GioChieu < '" + gioKeTiep + "' ";
												ResultSet rs3 = st.executeQuery(sql3);
											//System.out.println(i+"lam den vi tri 2");
						   	   			if (rs3.next()) {
						   	   					System.out.println("ma lich chieu==="+ rs3.getString(5) + " Ma xuat chieu==="+ rs3.getString(6));
						%>

						<!--						          			<td><select name="maPhim<%=maPhong.get(i) %>">-->
						<td><select name="maPhim<%=maPhong.get(i)%>">
							<option value="<%=rs3.getString(1)%>"><%=rs3.getString(2)%></option>
							<option value=""></option>
							<%
											for (int n = 0; n < maPhimList.size(); n++) {
							%>
							<option value="<%=maPhimList.get(n) %>"><%=tenPhimList.get(n)%></option>
							<%
											}
							%>

						</select></td>
						<td><font color="#47481A"><%=gio%>h</font><input type="text"
							name="phutChieu<%=maPhong.get(i)%>" value="<%=rs3.getString(4)%>"
							style="width: 18px;"></td>


						<%
												System.out.println("Hien thi phong: "
													+ maPhong.get(i) + " ===Ngay=="
													+ ngay.get(k));
							   			}else { %>
						<td><select name="maPhim<%=maPhong.get(i) %>">
							<option value=""></option>
							<%
											for (int n = 0; n < maPhimList.size(); n++) {
							%>
							<option value="<%=maPhimList.get(n)%>"><%=tenPhimList.get(n)%></option>
							<%
											}
							%>
						</select></td>
						<td><font color="#47481A"><%=gio%>h</font><input type="text"
							name="phutChieu<%=maPhong.get(i) %>" value=""
							style="width: 18px;"></td>
						<%     			 } //if 
									} //for cua maPhong.size()
						%>


					</tr>
					<%
								}

							}//for cua ngay.size()
					%>


					<tr>

						<td align="center" colspan="13"><input type="submit"
							name="btnCapNhat" value="Cập nhật"></td>
					</tr>
					<%}//if timkiem
					%>
					<%
						String sql5=null;
						String sql6=null;
						String sql7=null;
						String sql8=null;
						String sql9=null;
						String sql10=null;
						ArrayList<String> mPTimDuoc = new ArrayList<String>();
						ArrayList<String> xuatChieuList = new ArrayList<String>();
						//Bat dau cap nhat
						if ("Cáº­p nháº­t".equals(request.getParameter("btnCapNhat"))) {
							
							String tuNgayCN = request.getParameter("TuNgay");
							System.out.println("tu ngay fgfghghj====="+tuNgayCN);

							String denNgayCN = request.getParameter("DenNgay");
							System.out.println("den ngay fhghgjh====="+denNgayCN);
							
							//SO SANH NGAY BAT DAU LON HON NGAY HIEN TAI KHONG? NEU LON HON SE THUC HIEN, NHO HON THI THONG BAO
							
							
							ConvertDate cd = new ConvertDate();						
							int d=cd.checkDate(tuNgayCN);
							System.out.println("d ++++++++++++++++++++++++++++++++++++++"+d);
							if(d==1){
								System.out.println("cap nhat neh====="+ request.getParameter("btnCapNhat"));							
								int ngaySize = Integer.parseInt(request.getParameter("ngaySize"));
								System.out.println("ngaySize========"+ngaySize);
								String[] ngayCapNhatArray = request.getParameterValues("ngayHD");
								
								for(int i=0;i<ngaySize;i++)
								{
									System.out.println("ngay+++++++++"+ngayCapNhatArray[i]);
								}
								//XOA LICH CHIEU VA XUAT CHIEU NEU DA CO
								
								for (int k = 0; k < ngaySize; k++) {
									for(int p=0;p<maPhong.size();p++){									
										for (int m = 0; m < 14; m++) {
											int gio = m + 9;
											int gioKeTiep = gio + 1;
											sql5 = "select [Phim].[MaPhim], [TenPhim], [GioChieu],[PhutChieu], [LichChieu].[MaLichChieu],[XuatChieu].[MaXuatChieu] from [Quanlybanvephim].[dbo].[Phim] join [Quanlybanvephim].[dbo].[XuatChieu] on Phim.MaPhim=XuatChieu.MaPhim join [Quanlybanvephim].[dbo].[LichChieu] on XuatChieu.MaXuatChieu=LichChieu.MaXuatChieu where NgayChieu='"
												+ ngayCapNhatArray[k]
												+ "' and GioChieu = '"
												+ gio
												+ "' order by MaPhong";
												ResultSet rs5 = st.executeQuery(sql5);
											if(rs5.next()){
												System.out.println("Ma xuat chieu==="+rs5.getString(6)+" ma phim==="+rs5.getString(1)+" ten phim==="+rs5.getString(2)+" gio chieu==="+rs5.getString(3)+" phut chieu==="+rs5.getString(4));
												System.out.println("Ma lich chieu==="+rs5.getString(5)+ " Ma xuat chieu==="+rs5.getString(6)+" ma phim==="+rs5.getString(1)+" ten phim==="+rs5.getString(2)+" gio chieu==="+rs5.getString(3)+" phut chieu==="+rs5.getString(4));
												sql7="DELETE FROM [Quanlybanvephim].[dbo].[XuatChieu] WHERE [MaXuatChieu]='"+rs5.getString(6)+"'";
												st.executeUpdate(sql7);
												System.out.println("da xoa xuat chieu");
												
											}//KET THUC IF(RS5.NEXT())																														
												
										}//KET THUC FOR M		
										
									}//KET THUC FOR P
										
								}//KET THUC FOR K
								//BAT DAU INSERT XUAT CHIEU VA LICH CHIEU
								for (int k = 0; k < ngaySize; k++) {
									for(int p=0;p<maPhong.size();p++){
										String[] maPhimArray=request.getParameterValues("maPhim"+maPhong.get(p));
										//System.out.println("ma phim la===="+maPhimArray);
										String[] phutChieuArray=request.getParameterValues("phutChieu"+maPhong.get(p));
										//System.out.println("phut chieu la===="+phutChieuArray);
										for (int m = 0; m < 14; m++) {
											int gio = m + 9;
											int gioKeTiep = gio + 1;
											
											System.out.println("maPhimArray======="+maPhimArray[m]);
											System.out.println("gio chieu ++++++++"+gio);
											System.out.println("phut chieu ***********"+phutChieuArray[m]);
											if(maPhimArray[m].equals("")){
												System.out.println("hahahahahahahahah");
											}else{
											
													sql9="INSERT INTO [Quanlybanvephim].[dbo].[XuatChieu]([MaPhim],[GioChieu],[PhutChieu]) VALUES ('"+maPhimArray[m]+"','"+gio+"','"+phutChieuArray[m]+"')";
													st.executeUpdate(sql9);
													System.out.println("da them xuat chieu");
													sql8="SELECT top 1 [MaXuatChieu],[MaPhim],[GioChieu],[PhutChieu] FROM [Quanlybanvephim].[dbo].[XuatChieu] where [MaPhim]='"+maPhimArray[m]+"' and [GioChieu]= '"+gio+"' and [PhutChieu]='"+phutChieuArray[m]+"'";
													ResultSet rs8=st.executeQuery(sql8);
													if(rs8.next()){
													sql10="INSERT INTO [Quanlybanvephim].[dbo].[LichChieu]([MaPhong],[MaXuatChieu],[NgayChieu])VALUES('"+maPhong.get(p)+"','"+rs8.getString(1)+"','"+ngayCapNhatArray[k]+"')";
													st.executeUpdate(sql10);
													System.out.println("da them lich chieu");
												}//if rs8.next()																		
												
											}//if cua MaPhimArray		
										}//for(m)
										
									}//for(p)
								}//for(k)
								response.sendRedirect("Themlichhangloat.jsp?thongBao=CapNhatThanhCong&txtTuNgay="+tuNgayCN+"&txtDenNgay="+denNgayCN+"&btnThemLichHangLoat=ThÃªm lá»ch hÃ ng loáº¡t");
							}else{								
									System.out.println("loi roi!!khong cap nhat duoc dau!");							
									response.sendRedirect("Themlichhangloat.jsp?error=LoiCapNhat&txtTuNgay="+tuNgayCN+"&txtDenNgay="+denNgayCN+"&btnThemLichHangLoat=ThÃªm lá»ch hÃ ng loáº¡t");
							}
						}
					
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
<br>
<br>
</form>
</div>
<!--Our Company Part Ends --></div>

<%@include file="FooterAdmin.jsp"%>
<!--Footer Part Ends -->
</body>
</html>
