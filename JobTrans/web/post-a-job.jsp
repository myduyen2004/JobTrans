
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
<jsp:useBean id="category" class="jobtrans.dal.CategoryDAO" scope="session"></jsp:useBean>
<jsp:useBean id="categoryModel" class="jobtrans.model.Category" scope="session"></jsp:useBean>
<!-- Basic Page Needs
================================================== -->
<title>JobTrans</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/colors/blue.css">

</head>
<body class="gray">

<!-- Wrapper -->
<div id="wrapper">

<!-- Header Container
================================================== -->

<div class="clearfix"></div>
<!-- Header Container / End -->


<!-- Dashboard Container -->
<div class="dashboard-container">

	<!-- Dashboard Sidebar
	================================================== -->
	<!-- Dashboard Sidebar / End -->


	<!-- Dashboard Content
	================================================== -->
	<div class="dashboard-content-container" data-simplebar>
		<div class="dashboard-content-inner" >
			
			<!-- Dashboard Headline -->
			<div class="dashboard-headline">
				<h3>Đăng Nhiệm Vụ</h3>
			</div>
	
			<!-- Row -->
			<div class="row">
                            <form action="CRUDJobServerlet" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="command" value="CREATE">
				<!-- Dashboard Box -->
				<div class="col-xl-12">
					<div class="dashboard-box margin-top-0">

						<!-- Headline -->
						<div class="headline">
							<h3><i class="icon-feather-folder-plus"></i> Biểu Mẫu Đăng Nhiệm Vụ</h3>
						</div>

						<div class="content with-padding padding-bottom-10">
							<div class="row">

								<div class="col-xl-4">
									<div class="submit-field">
										<h5>Tên Dự Án</h5>
                                                                                <input type="text" class="with-border" name="projectName" placeholder="Ví Dụ: Tạo trang web cho tôi">
									</div>
								</div>

								<div class="col-xl-4">
									<div class="submit-field">
										<h5>Danh Mục</h5>
                                                                                <select class="selectpicker with-border" name="category" data-size="7" title="Chọn Danh Mục">
                                                                                    
                                                                                    <c:forEach var="cateName" items="${categoryModel.getCategoryName(category.getAllCategory())}">
                                                                                        <option>${cateName}</option>
                                                                                    </c:forEach>
										</select>
									</div>
								</div>

								<div class="col-xl-4">
									<div class="submit-field">
										<h5>Địa Điểm  <i class="help-icon" data-tippy-placement="right" title="Để trống nếu là công việc trực tuyến"></i></h5>
										<div class="input-with-icon">
											<div id="autocomplete-container">
												<input id="autocomplete-input" class="with-border" type="text" name="address" placeholder="Bất Cứ Nơi Nào">
											</div>
											<i class="icon-material-outline-location-on"></i>
										</div>
									</div>
								</div>

								<div class="col-xl-6">
									<div class="submit-field">
										<h5>Ngân Sách Dự Kiến Của Bạn Là Gì?</h5>
										<div class="row">
											<div class="col-xl-6">
												<div class="input-with-icon">
													<input class="with-border" type="text" name="budget" placeholder="">
													<i class="currency">VND</i>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="col-xl-6">
									<div class="submit-field">
                                                                                <h5>Ngày hết hạn </h5>
										<div class="keywords-container">
											<div class="keyword-input-container">
												<input type="date" class="keyword-input with-border" name="date"/>
											</div>
											<div class="keywords-list"><!-- keywords go here --></div>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>

								<div class="col-xl-12">
									<div class="submit-field">
										<h5>Mô Tả Dự Án Của Bạn</h5>
										<textarea cols="30" rows="5" class="with-border" name="description"></textarea>
										<div class="uploadButton margin-top-30">
											<input class="uploadButton-input" type="file" accept=".png, .jpg, .jpeg, .doc, .docx, .pdf, .jar, .zip" id="upload" name="file" multiple/>
											<label class="uploadButton-button ripple-effect" for="upload">Tải Lên Tập Tin</label>
											<span class="uploadButton-file-name">Hình ảnh hoặc tài liệu giúp mô tả dự án của bạn</span>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-12">
					<button type="submit" class="button ripple-effect big margin-top-30"><i class="icon-feather-plus"></i> Đăng Tin Tuyển Dụng</button>
				</div>
                            </form>
			</div>
			<!-- Row / End -->

			<!-- Footer -->
			<div class="dashboard-footer-spacer"></div>
			<div class="small-footer margin-top-15">
				<div class="small-footer-copyrights">
					© 2019 <strong>Hireo</strong>. Bảo Lưu Mọi Quyền.
				</div>
				<ul class="footer-social-links">
					<li>
						<a href="#" title="Facebook" data-tippy-placement="top">
							<i class="icon-brand-facebook-f"></i>
						</a>
					</li>
					<li>
						<a href="#" title="Twitter" data-tippy-placement="top">
							<i class="icon-brand-twitter"></i>
						</a>
					</li>
					<li>
						<a href="#" title="Google Plus" data-tippy-placement="top">
							<i class="icon-brand-google-plus-g"></i>
						</a>
					</li>
					<li>
						<a href="#" title="LinkedIn" data-tippy-placement="top">
							<i class="icon-brand-linkedin-in"></i>
						</a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<!-- Footer / End -->

		</div>
	</div>
	<!-- Dashboard Content / End -->

</div>
<!-- Dashboard Container / End -->

</div>
<!-- Wrapper / End -->


<!-- Scripts
================================================== -->
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

<!-- Chart.js // documentation: http://www.chartjs.org/docs/latest/ -->
<script src="js/chart.min.js"></script>
<script>
	Chart.defaults.global.defaultFontFamily = "Nunito";
	Chart.defaults.global.defaultFontColor = '#888';
	Chart.defaults.global.defaultFontSize = '14';

	var ctx = document.getElementById('chart').getContext('2d');

	var chart = new Chart(ctx, {
		type: 'line',

		// The data for our dataset
		data: {
			labels: ["January", "February", "March", "April", "May", "June"],
			// Information about the dataset
	   		datasets: [{
				label: "Views",
				backgroundColor: 'rgba(42,65,232,0.08)',
				borderColor: '#2a41e8',
				borderWidth: "3",
				data: [196,132,215,362,210,252],
				pointRadius: 5,
				pointHoverRadius:5,
				pointHitRadius: 10,
				pointBackgroundColor: "#fff",
				pointHoverBackgroundColor: "#fff",
				pointBorderWidth: "2",
			}]
		},

		// Configuration options
		options: {

		    layout: {
		      padding: 10,
		  	},

			legend: { display: false },
			title:  { display: false },

			scales: {
				yAxes: [{
					scaleLabel: {
						display: false
					},
					gridLines: {
						 borderDash: [6, 10],
						 color: "#d8d8d8",
						 lineWidth: 1,
	            	},
				}],
				xAxes: [{
					scaleLabel: { display: false },  
					gridLines:  { display: false },
				}],
			},

		    tooltips: {
		      backgroundColor: '#333',
		      titleFontSize: 13,
		      titleFontColor: '#fff',
		      bodyFontColor: '#fff',
		      bodyFontSize: 13,
		      displayColors: false,
		      xPadding: 10,
		      yPadding: 10,
		      intersect: false
		    }
		},


});

</script>


<!-- Google Autocomplete -->
<script>
	function initAutocomplete() {
		 var options = {
		  types: ['(cities)'],
		  // componentRestrictions: {country: "us"}
		 };

		 var input = document.getElementById('autocomplete-input');
		 var autocomplete = new google.maps.places.Autocomplete(input, options);

		if ($('.submit-field')[0]) {
		    setTimeout(function(){ 
		        $(".pac-container").prependTo("#autocomplete-container");
		    }, 300);
		}
	}
</script>

<!-- Google API & Maps -->
<!-- Geting an API Key: https://developers.google.com/maps/documentation/javascript/get-api-key -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaoOT9ioUE4SA8h-anaFyU4K63a7H-7bc&amp;libraries=places"></script>


</body>

<!-- Mirrored from www.vasterad.com/themes/hireo_21/dashboard-post-a-task.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:47 GMT -->
</html>