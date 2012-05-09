<html>
<head>
<title>Header</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- ImageReady Preload Script (index.psd) -->
<script type="text/javascript">
<!--
<%@page import="java.sql.*"%>
<%@page import="net.sourceforge.jtds.jdbc.*"%>
<%@page import="javax.servlet.http.*"%>
<Script>
function newImage(arg) {
	if (document.images) {
		rslt = new Image();
		rslt.src = arg;
		return rslt;
	}
}

function changeImages() {
	if (document.images && (preloadFlag == true)) {
		for (var i=0; i<changeImages.arguments.length; i+=2) {
			document[changeImages.arguments[i]].src = changeImages.arguments[i+1];
		}
	}
}

var preloadFlag = false;
function preloadImages() {
	if (document.images) {
		trang_chu_over = newImage("images/trangchu1.JPG");
		phim_over = newImage("images/phim1.JPG");
		lich_chieu_over = newImage("images/lichchieu1.JPG");
		su_kien_over = newImage("images/sukien1.JPG");
		thac_mac_over = newImage("images/thacmac1.JPG");
		thanh_vien_over = newImage("images/thanhvien1.JPG");
		dang_nhap_over = newImage("images/dangnhap1.JPG");
		dang_xuat_over = newImage("images/dangxuat1.JPG");
		preloadFlag = true;
	}
}

// -->
</script>
<!-- End Preload Script -->
</head>
<link href="css/styles.css" rel="stylesheet" type="text/css">
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0"
	marginheight="0" onLoad="preloadImages();">
<center><!-- ImageReady Slices (index.psd) -->
<table width="775" border="1" cellpadding="0" cellspacing="0"
	class="frame" id="Table_01">
	<!--DWLayoutTable-->
	<tr>
		<td colspan=7><img alt="hehe" src="images/bannerapril.JPG"
			width=980 height=150></td>

	</tr>
	<tr>
		<td><a href="Trangchu.jsp"
			onmouseover="window.status='trang_chu'; changeImages('trang_chu', 'images/trangchu1.JPG'); return true;"
			onmouseout="window.status=''; changeImages('trang_chu', 'images/trangchu.JPG'); return true;"
			onmousedown="changeImages('trang_chu', 'images/trangchu1.JPG'); return true;"
			onmouseup="changeImages('trang_chu', 'images/trangchu1.JPG'); return true;">
		<img name="trang_chu" src="images/trangchu.JPG" width="120"
			height="35" border="0" alt="trang chu"></a></td>
		<td width=100><a href="Phim.jsp"
			onmouseover="window.status='phim'; changeImages('phim', 'images/phim1.JPG'); return true;"
			onmouseout="window.status=''; changeImages('phim', 'images/phim.JPG'); return true;"
			onmousedown="changeImages('phim', 'images/phim1.JPG'); return true;"
			onmouseup="changeImages('phim', 'images/phim1.JPG'); return true;">
		<img name="phim" src="images/phim.JPG" width="120" height="35"
			border="0" alt="phim"></a></td>
		<td width=100><a href="Lichchieu.jsp"
			onmouseover="window.status='lich_chieu'; changeImages('lich_chieu', 'images/lichchieu1.JPG'); return true;"
			onmouseout="window.status=''; changeImages('lich_chieu', 'images/lichchieu.JPG'); return true;"
			onmousedown="changeImages('lich_chieu', 'images/lichchieu1.JPG'); return true;"
			onmouseup="changeImages('lich_chieu', 'images/lichchieu1.JPG'); return true;">
		<img name="lich_chieu" src="images/lichchieu.JPG" width="120"
			height="35" border="0" alt="lich chieu"></a></td>
		<td><a href="Sukien.jsp"
			onmouseover="window.status='su_kien'; changeImages('su_kien', 'images/sukien1.JPG'); return true;"
			onmouseout="window.status=''; changeImages('su_kien', 'images/Sukien.JPG'); return true;"
			onmousedown="changeImages('su_kien', 'images/sukien1.JPG'); return true;"
			onmouseup="changeImages('su_kien', 'images/sukien1.JPG'); return true;">
		<img name="su_kien" src="images/Sukien.JPG" width="120" height="35"
			border="0" alt="su kien"></a></td>
		<td><a href="Thacmac.jsp"
			onmouseover="window.status='thac_mac'; changeImages('thac_mac', 'images/thacmac1.JPG'); return true;"
			onmouseout="window.status=''; changeImages('thac_mac', 'images/thacmac.jpg'); return true;"
			onmousedown="changeImages('thac_mac', 'images/thacmac1.JPG'); return true;"
			onmouseup="changeImages('thac_mac', 'images/thacmac1.JPG'); return true;">
		<img name="thac_mac" src="images/thacmac.jpg" width="120" height="35"
			border="0" alt="thac mac"></a></td>
		<td><a href="Thanhvien.jsp"
			onmouseover="window.status='thanh_vien'; changeImages('thanh_vien', 'images/tv1.JPG'); return true;"
			onmouseout="window.status=''; changeImages('thanh_vien', 'images/Tv.jpg'); return true;"
			onmousedown="changeImages('thanh_vien', 'images/tv1.JPG'); return true;"
			onmouseup="changeImages('thanh_vien', 'images/tv1.JPG'); return true;">
		<img name="thanh_vien" src="images/Tv.jpg" width="120" height="35"
			border="0" alt="thanh_vien"></a></td>

		<td><a href="Dangxuat.jsp"
			onmouseover="window.status='dang_xuat'; changeImages('dang_xuat', 'images/dangxuat1.JPG'); return true;"
			onmouseout="window.status=''; changeImages('dang_xuat', 'images/dangxuat.JPG'); return true;"
			onmousedown="changeImages('dang_xuat', 'images/dangxuat1.JPG'); return true;"
			onmouseup="changeImages('dang_xuat', 'images/dangxuat1.JPG'); return true;">
		<img name="dang_xuat" src="images/dangxuat.JPG" width="120"
			height="35" border="0" alt="dang xuat"></a></td>
	</tr>
</table>
</center>
</body>

</html>