<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<!-- Mirrored from www.vasterad.com/themes/hireo_21/dashboard-post-a-task.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:47 GMT -->
<head>
<jsp:useBean id="category" class="jobtrans.dal.JobDAO" scope="session"></jsp:useBean>
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
<header id="header-container" class="fullwidth">

	<!-- Header -->
	<div id="header">
		<div class="container">
			
			<!-- Left Side Content -->
			<div class="left-side">
				
				<!-- Logo -->
				<div id="logo">
					<a href="index-2.html"><img src="images/logo.png" alt=""></a>
				</div>

				<!-- Main Navigation -->
				<nav id="navigation">
					<ul id="responsive">

						<li><a href="#">Trang Chủ</a>
							<ul class="dropdown-nav">
								<li><a href="index-2.html">Trang Chủ 1</a></li>
								<li><a href="index-3.html">Trang Chủ 2</a></li>
								<li><a href="index-4.html">Trang Chủ 3</a></li>
							</ul>
						</li>

						<li><a href="#" class="current">Tìm Việc</a>
							<ul class="dropdown-nav">
								<li><a href="#">Duyệt Công Việc</a>
									<ul class="dropdown-nav">
										<li><a href="jobs-list-layout-full-page-map.html">Danh Sách Toàn Trang + Bản Đồ</a></li>
										<li><a href="jobs-grid-layout-full-page-map.html">Lưới Toàn Trang + Bản Đồ</a></li>
										<li><a href="jobs-grid-layout-full-page.html">Lưới Toàn Trang</a></li>
										<li><a href="jobs-list-layout-1.html">Bố Cục Danh Sách 1</a></li>
										<li><a href="jobs-list-layout-2.html">Bố Cục Danh Sách 2</a></li>
										<li><a href="jobs-grid-layout.html">Bố Cục Lưới</a></li>
									</ul>
								</li>
								<li><a href="#">Duyệt Nhiệm Vụ</a>
									<ul class="dropdown-nav">
										<li><a href="tasks-list-layout-1.html">Bố Cục Danh Sách 1</a></li>
										<li><a href="tasks-list-layout-2.html">Bố Cục Danh Sách 2</a></li>
										<li><a href="tasks-grid-layout.html">Bố Cục Lưới</a></li>
										<li><a href="tasks-grid-layout-full-page.html">Lưới Toàn Trang</a></li>
									</ul>
								</li>
								<li><a href="browse-companies.html">Duyệt Công Ty</a></li>
								<li><a href="single-job-page.html">Trang Công Việc</a></li>
								<li><a href="single-task-page.html">Trang Nhiệm Vụ</a></li>
								<li><a href="single-company-profile.html">Hồ Sơ Công Ty</a></li>
							</ul>
						</li>

						<li><a href="#">Dành Cho Nhà Tuyển Dụng</a>
							<ul class="dropdown-nav">
								<li><a href="#">Tìm Kiếm Freelancer</a>
									<ul class="dropdown-nav">
										<li><a href="freelancers-grid-layout-full-page.html">Lưới Toàn Trang</a></li>
										<li><a href="freelancers-grid-layout.html">Bố Cục Lưới</a></li>
										<li><a href="freelancers-list-layout-1.html">Bố Cục Danh Sách 1</a></li>
										<li><a href="freelancers-list-layout-2.html">Bố Cục Danh Sách 2</a></li>
									</ul>
								</li>
								<li><a href="single-freelancer-profile.html">Hồ Sơ Freelancer</a></li>
								<li><a href="dashboard-post-a-job.html">Đăng Công Việc</a></li>
								<li><a href="dashboard-post-a-task.html">Đăng Nhiệm Vụ</a></li>
							</ul>
						</li>

						<li><a href="#">Bảng Điều Khiển</a>
							<ul class="dropdown-nav">
								<li><a href="dashboard.html">Bảng Điều Khiển</a></li>
								<li><a href="dashboard-messages.html">Tin Nhắn</a></li>
								<li><a href="dashboard-bookmarks.html">Đánh Dấu</a></li>
								<li><a href="dashboard-reviews.html">Đánh Giá</a></li>
								<li><a href="dashboard-manage-jobs.html">Công Việc</a>
									<ul class="dropdown-nav">
										<li><a href="dashboard-manage-jobs.html">Quản Lý Công Việc</a></li>
										<li><a href="dashboard-manage-candidates.html">Quản Lý Ứng Viên</a></li>
										<li><a href="dashboard-post-a-job.html">Đăng Công Việc</a></li>
									</ul>
								</li>
								<li><a href="dashboard-manage-tasks.html">Nhiệm Vụ</a>
									<ul class="dropdown-nav">
										<li><a href="dashboard-manage-tasks.html">Quản Lý Nhiệm Vụ</a></li>
										<li><a href="dashboard-manage-bidders.html">Quản Lý Người Đấu Thầu</a></li>
										<li><a href="dashboard-my-active-bids.html">Đấu Thầu Đang Hoạt Động</a></li>
										<li><a href="dashboard-post-a-task.html">Đăng Nhiệm Vụ</a></li>
									</ul>
								</li>
								<li><a href="dashboard-settings.html">Cài Đặt</a></li>
							</ul>
						</li>

						<li><a href="#">Trang</a>
							<ul class="dropdown-nav">
								<li>
									<a href="#">Bản Đồ Mở</a>
									<ul class="dropdown-nav">
										<li><a href="jobs-list-layout-full-page-map-OpenStreetMap.html">Danh Sách Toàn Trang + Bản Đồ</a></li>
										<li><a href="jobs-grid-layout-full-page-map-OpenStreetMap.html">Lưới Toàn Trang + Bản Đồ</a></li>
										<li><a href="single-job-page-OpenStreetMap.html">Trang Công Việc</a></li>
										<li><a href="single-company-profile-OpenStreetMap.html">Hồ Sơ Công Ty</a></li>
										<li><a href="pages-contact-OpenStreetMap.html">Liên Hệ</a></li>
										<li><a href="jobs-list-layout-1-OpenStreetMap.html">Tự Động Hoàn Thành Địa Điểm</a></li>
									</ul>
								</li>
								<li><a href="pages-blog.html">Blog</a></li>
								<li><a href="pages-pricing-plans.html">Kế Hoạch Giá</a></li>
								<li><a href="pages-checkout-page.html">Trang Thanh Toán</a></li>
								<li><a href="pages-invoice-template.html">Mẫu Hóa Đơn</a></li>
								<li><a href="pages-user-interface-elements.html">Phần Tử Giao Diện Người Dùng</a></li>
								<li><a href="pages-icons-cheatsheet.html">Bảng Tóm Tắt Biểu Tượng</a></li>
								<li><a href="pages-login.html">Đăng Nhập & Đăng Ký</a></li>
								<li><a href="pages-404.html">Trang 404</a></li>
								<li><a href="pages-contact.html">Liên Hệ</a></li>
							</ul>
						</li>

					</ul>
				</nav>
				<div class="clearfix"></div>
				<!-- Main Navigation / End -->
				
			</div>
			<!-- Left Side Content / End -->


			<!-- Right Side Content / End -->
			<div class="right-side">

				<!--  User Notifications -->
				<div class="header-widget hide-on-mobile">
					
					<!-- Notifications -->
					<div class="header-notifications">

						<!-- Trigger -->
						<div class="header-notifications-trigger">
							<a href="#"><i class="icon-feather-bell"></i><span>4</span></a>
						</div>

						<!-- Dropdown -->
						<div class="header-notifications-dropdown">

							<div class="header-notifications-headline">
								<h4>Thông Báo</h4>
								<button class="mark-as-read ripple-effect-dark" title="Đ đánh dấu tất cả đã đọc" data-tippy-placement="left">
									<i class="icon-feather-check-square"></i>
								</button>
							</div>

							<div class="header-notifications-content">
								<div class="header-notifications-scroll" data-simplebar>
									<ul>
										<!-- Notification -->
										<li class="notifications-not-read">
											<a href="dashboard-manage-candidates.html">
												<span class="notification-icon"><i class="icon-material-outline-group"></i></span>
												<span class="notification-text">
													<strong>Michael Shannah</strong> đã ứng tuyển cho công việc <span class="color">Kỹ Sư Phần Mềm Toàn Diện</span>
												</span>
											</a>
										</li>

										<!-- Notification -->
										<li>
											<a href="dashboard-manage-bidders.html">
												<span class="notification-icon"><i class=" icon-material-outline-gavel"></i></span>
												<span class="notification-text">
													<strong>Gilbert Allanis</strong> đã đặt giá cho dự án <span class="color">Phát Triển Ứng Dụng iOS</span>
												</span>
											</a>
										</li>

										<!-- Notification -->
										<li>
											<a href="dashboard-manage-jobs.html">
												<span class="notification-icon"><i class="icon-material-outline-autorenew"></i></span>
												<span class="notification-text">
													Thông tin công việc của bạn <span class="color">Kỹ Sư PHP Toàn Diện</span> đang hết hạn.
												</span>
											</a>
										</li>

										<!-- Notification -->
										<li>
											<a href="dashboard-manage-candidates.html">
												<span class="notification-icon"><i class="icon-material-outline-group"></i></span>
												<span class="notification-text">
													<strong>Sindy Forrest</strong> đã ứng tuyển cho công việc <span class="color">Kỹ Sư Phần Mềm Toàn Diện</span>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>

						</div>

					</div>
					
					<!-- Messages -->
					<div class="header-notifications">
						<div class="header-notifications-trigger">
							<a href="#"><i class="icon-feather-mail"></i><span>3</span></a>
						</div>

						<!-- Dropdown -->
						<div class="header-notifications-dropdown">

							<div class="header-notifications-headline">
								<h4>Tin Nhắn</h4>
								<button class="mark-as-read ripple-effect-dark" title="Đánh dấu tất cả đã đọc" data-tippy-placement="left">
									<i class="icon-feather-check-square"></i>
								</button>
							</div>

							<div class="header-notifications-content">
								<div class="header-notifications-scroll" data-simplebar>
									<ul>
										<!-- Notification -->
										<li class="notifications-not-read">
											<a href="dashboard-messages.html">
												<span class="notification-avatar status-online"><img src="images/user-avatar-small-03.jpg" alt=""></span>
												<div class="notification-text">
													<strong>David Peterson</strong>
													<p class="notification-msg-text">Cảm ơn đã liên hệ. Tôi hiện khá bận rộn với nhiều việc...</p>
													<span class="color">4 giờ trước</span>
												</div>
											</a>
										</li>

										<!-- Notification -->
										<li class="notifications-not-read">
											<a href="dashboard-messages.html">
												<span class="notification-avatar status-offline"><img src="images/user-avatar-small-02.jpg" alt=""></span>
												<div class="notification-text">
													<strong>Sindy Forest</strong>
													<p class="notification-msg-text">Chào Tom! Thật tiếc khi phải nói với bạn rằng tôi đang trong kỳ nghỉ cho đến...</p>
													<span class="color">Hôm qua</span>
												</div>
											</a>
										</li>

										<!-- Notification -->
										<li class="notifications-not-read">
											<a href="dashboard-messages.html">
												<span class="notification-avatar status-online"><img src="images/user-avatar-placeholder.png" alt=""></span>
												<div class="notification-text">
													<strong>Marcin Kowalski</strong>
													<p class="notification-msg-text">Tôi đã nhận thanh toán. Cảm ơn sự hợp tác!</p>
													<span class="color">Hôm qua</span>
												</div>
											</a>
										</li>
									</ul>
								</div>
							</div>

							<a href="dashboard-messages.html" class="header-notifications-button ripple-effect button-sliding-icon">Xem Tất Cả Tin Nhắn<i class="icon-material-outline-arrow-right-alt"></i></a>
						</div>
					</div>

				</div>
				<!--  User Notifications / End -->

				<!-- User Menu -->
				<div class="header-widget">

					<!-- Messages -->
					<div class="header-notifications user-menu">
						<div class="header-notifications-trigger">
							<a href="#"><div class="user-avatar status-online"><img src="images/user-avatar-small-01.jpg" alt=""></div></a>
						</div>

						<!-- Dropdown -->
						<div class="header-notifications-dropdown">

							<!-- User Status -->
							<div class="user-status">

								<!-- User Name / Avatar -->
								<div class="user-details">
									<div class="user-avatar status-online"><img src="images/user-avatar-small-01.jpg" alt=""></div>
									<div class="user-name">
										${userName} <span>Freelancer</span>
									</div>
								</div>
								
								<!-- User Status Switcher -->
								<div class="status-switch" id="snackbar-user-status">
									<label class="user-online current-status">Trực Tuyến</label>
									<label class="user-invisible">Ẩn</label>
									<!-- Status Indicator -->
									<span class="status-indicator" aria-hidden="true"></span>
								</div>	
						</div>
						
						<ul class="user-menu-small-nav">
							<li><a href="dashboard.html"><i class="icon-material-outline-dashboard"></i> Bảng Điều Khiển</a></li>
							<li><a href="dashboard-settings.html"><i class="icon-material-outline-settings"></i> Cài Đặt</a></li>
							<li><a href="LogoutServlet"><i class="icon-material-outline-power-settings-new"></i> Đăng Xuất</a></li>
						</ul>

						</div>
					</div>

				</div>
				<!-- User Menu / End -->

				<!-- Mobile Navigation Button -->
				<span class="mmenu-trigger">
					<button class="hamburger hamburger--collapse" type="button">
						<span class="hamburger-box">
							<span class="hamburger-inner"></span>
						</span>
					</button>
				</span>

			</div>
			<!-- Right Side Content / End -->

		</div>
	</div>
	<!-- Header / End -->

</header>
<div class="clearfix"></div>
<!-- Header Container / End -->


<!-- Dashboard Container -->
<div class="dashboard-container">

	<!-- Dashboard Sidebar
	================================================== -->
	<div class="dashboard-sidebar">
		<div class="dashboard-sidebar-inner" data-simplebar>
			<div class="dashboard-nav-container">

				<!-- Responsive Navigation Trigger -->
				<a href="#" class="dashboard-responsive-nav-trigger">
					<span class="hamburger hamburger--collapse" >
						<span class="hamburger-box">
							<span class="hamburger-inner"></span>
						</span>
					</span>
					<span class="trigger-title">Điều Hướng Bảng Điều Khiển</span>
				</a>
				
				<!-- Navigation -->
				<div class="dashboard-nav">
					<div class="dashboard-nav-inner">

						<ul data-submenu-title="Bắt Đầu">
							<li><a href="dashboard.html"><i class="icon-material-outline-dashboard"></i> Bảng Điều Khiển</a></li>
							<li><a href="dashboard-messages.html"><i class="icon-material-outline-question-answer"></i> Tin Nhắn <span class="nav-tag">2</span></a></li>
							<li><a href="dashboard-bookmarks.html"><i class="icon-material-outline-star-border"></i> Đánh Dấu</a></li>
							<li><a href="dashboard-reviews.html"><i class="icon-material-outline-rate-review"></i> Đánh Giá</a></li>
						</ul>
						
						<ul data-submenu-title="Tổ Chức và Quản Lý">
							<li><a href="#"><i class="icon-material-outline-business-center"></i> Công Việc</a>
								<ul>
									<li><a href="dashboard-manage-jobs.html">Quản Lý Công Việc <span class="nav-tag">3</span></a></li>
									<li><a href="dashboard-manage-candidates.html">Quản Lý Ứng Viên</a></li>
									<li><a href="dashboard-post-a-job.html">Đăng Công Việc</a></li>
								</ul>	
							</li>
							<li class="active-submenu"><a href="#"><i class="icon-material-outline-assignment"></i> Nhiệm Vụ</a>
								<ul>
									<li><a href="dashboard-manage-tasks.html">Quản Lý Nhiệm Vụ <span class="nav-tag">2</span></a></li>
									<li><a href="dashboard-manage-bidders.html">Quản Lý Người Đấu Thầu</a></li>
									<li><a href="dashboard-my-active-bids.html">Các Đấu Thầu Hoạt Động Của Tôi <span class="nav-tag">4</span></a></li>
									<li><a href="dashboard-post-a-task.html">Đăng Nhiệm Vụ</a></li>
								</ul>	
							</li>
						</ul>

						<ul data-submenu-title="Tài Khoản">
							<li><a href="dashboard-settings.html"><i class="icon-material-outline-settings"></i> Cài Đặt</a></li>
							<li><a href="index-logged-out.html"><i class="icon-material-outline-power-settings-new"></i> Đăng Xuất</a></li>
						</ul>
						
					</div>
				</div>
				<!-- Navigation / End -->

			</div>
		</div>
	</div>
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