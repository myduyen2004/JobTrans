<%-- 
    Document   : page-contact
    Created on : Sep 26, 2024, 10:34:47 AM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>

<!-- Basic Page Needs
================================================== -->
<title>JobTrans-Liên hệ</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/colors/blue.css">

</head>
<body>

<!-- Wrapper -->
<div id="wrapper">

<!-- Header Container
================================================== -->
<%@include file="includes/header.jsp" %>
<div class="clearfix"></div>
<div id="titlebar" class="gradient">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>Liên hệ</h2>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">

		<div class="col-xl-12">
			<div class="contact-location-info margin-bottom-50">
				<div class="contact-address">
					<ul>
						<li class="contact-address-headline">JobTrans</li>
						<li>Đại học FPT Đà Nẵng</li>
						<li>Phone (123) 123-456</li>
						<li><a href="duyenvo31032004@gmail.com">duyenvo31032004@gmail.com</a></li>
					</ul>

				</div>
				<div id="single-job-map-container">
					<div id="singleListingMap" data-latitude="37.777842" data-longitude="-122.391805" data-map-icon="im im-icon-Hamburger"></div>
					<a href="#" id="streetView">Bản đồ</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Container / End -->

<!-- Footer
================================================== -->
<%@include file="includes/footer.jsp" %>
<!-- Footer / End -->

</div>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/jquery-migrate-3.1.0.min.html"></script>
<script src="js/mmenu.min.js"></script>
<script src="js/tippy.all.min.js"></script>
<script src="js/simplebar.min.js"></script>
<script src="js/bootstrap-slider.min.js"></script>
<script src="js/bootstrap-select.min.js"></script>
<script src="js/snackbar.js"></script>
<script src="js/clipboard.min.js"></script>
<script src="js/counterup.min.js"></script>
<script src="js/magnific-popup.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/custom.js"></script>

<!-- Snackbar // documentation: https://www.polonel.com/snackbar/ -->
<script>
// Snackbar for user status switcher
$('#snackbar-user-status label').click(function() { 
	Snackbar.show({
		text: 'Your status has been changed!',
		pos: 'bottom-center',
		showAction: false,
		actionText: "Dismiss",
		duration: 3000,
		textColor: '#fff',
		backgroundColor: '#383838'
	}); 
}); 
</script>

<!-- Google API & Maps -->
<!-- Geting an API Key: https://developers.google.com/maps/documentation/javascript/get-api-key -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaoOT9ioUE4SA8h-anaFyU4K63a7H-7bc&amp;libraries=places"></script>
<script src="js/infobox.min.js"></script>
<script src="js/markerclusterer.js"></script>
<script src="js/maps.js"></script>

</body>

<!-- Mirrored from www.vasterad.com/themes/hireo_21/pages-contact.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:35:00 GMT -->
</html>
