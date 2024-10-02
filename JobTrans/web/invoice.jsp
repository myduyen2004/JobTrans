<%-- 
    Document   : invoice
    Created on : Sep 22, 2024, 11:57:23 AM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from www.vasterad.com/themes/hireo_21/pages-invoice-template.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:58 GMT -->
<head>
	<meta charset="utf-8">
	<title>JobTrans Invoice</title>
	<link rel="stylesheet" href="css/invoice.css">
</head> 

<body>

<!-- Print Button -->
<div class="print-button-container">
	<a href="javascript:window.print()" class="print-button">In hóa đơn này</a>
</div>

<!-- Invoice -->
<div id="invoice">

	<!-- Header -->
	<div class="row">
		<div class="col-xl-6">
			<div id="logo"><img src="images/logo.png" alt=""></div>
		</div>

		<div class="col-xl-6">	

			<p id="details">
				<strong>Đơn hàng:</strong> #00124 <br>
				<strong>Ngày phát hành:</strong> 20/08/2019 <br>
				Đến hạn 7 ngày kể từ ngày phát hành
			</p>
		</div>
	</div>


	<!-- Client & Supplier -->
	<div class="row">
		<div class="col-xl-12">
			<h2>Hóa đơn</h2>
		</div>

		<div class="col-xl-6">	
			<strong class="margin-bottom-5">Nhà cung cấp</strong>
			<p>
				Hireo Ltd. <br>
				21 St Andrews Lane <br>
				London, CF44 6ZL, Vương Quốc Anh <br>
			</p>
		</div>

		<div class="col-xl-6">	
			<strong class="margin-bottom-5">Khách hàng</strong>
			<p>
				John Doe <br>
				36 Edgewater Street <br>
				Melbourne, 2540, Úc <br>
			</p>
		</div>
	</div>


	<!-- Invoice -->
	<div class="row">
		<div class="col-xl-12">
			<table class="margin-top-20">
				<tr>
					<th>Mô tả</th>
					<th>Giá</th>
					<th>VAT (20%)</th>
					<th>Tổng cộng</th>
				</tr>

				<tr>
					<td>Kế hoạch tiêu chuẩn</td> 
					<td>$49.00</td>
					<td>$9.80</td>
					<td>$58.80</td>
				</tr>
			</table>
		</div>
		
		<div class="col-xl-4 col-xl-offset-8">	
			<table id="totals">
				<tr>
					<th>Tổng số tiền đến hạn</th> 
					<th><span>$58.80</span></th>
				</tr>
			</table>
		</div>
	</div>


	<!-- Footer -->
	<div class="row">
		<div class="col-xl-12">
			<ul id="footer">
				<li><span>www.jobtrans.com</span></li>
				<li>jobtrans@gmail.com</li>
				<li>(+84) 123-123-456</li>
			</ul>
		</div>
	</div>
		
</div>

</body>

<!-- Mirrored from www.vasterad.com/themes/hireo_21/pages-invoice-template.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:59 GMT -->
</html>

