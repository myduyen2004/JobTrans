<%-- 
    Document   : manage-job
    Created on : Sep 22, 2024, 11:51:30 AM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<!-- Mirrored from www.vasterad.com/themes/hireo_21/dashboard-manage-tasks.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:48 GMT -->
<head>

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
									<li><a href="dashboard-manage-bidders.html">Quản Lý Đấu Thầu</a></li>
									<li><a href="dashboard-my-active-bids.html">Đấu Thầu Đang Hoạt Động <span class="nav-tag">4</span></a></li>
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
				<h3>Quản Lý Nhiệm Vụ</h3>

				<!-- Breadcrumbs -->
				<nav id="breadcrumbs" class="dark">
					<ul>
						<li><a href="#">Trang Chủ</a></li>
						<li><a href="#">Bảng Điều Khiển</a></li>
						<li>Quản Lý Nhiệm Vụ</li>
					</ul>
				</nav>
			</div>
	
			<!-- Row -->
			<div class="row">

				<!-- Dashboard Box -->
				<div class="col-xl-12">
					<div class="dashboard-box margin-top-0">

						<!-- Headline -->
						<div class="headline">
							<h3><i class="icon-material-outline-assignment"></i> Nhiệm Vụ Của Tôi</h3>
						</div>

						<div class="content">
							<ul class="dashboard-box-list">
								<li>
									<!-- Job Listing -->
									<div class="job-listing width-adjustment">

										<!-- Job Listing Details -->
										<div class="job-listing-details">

											<!-- Details -->
											<div class="job-listing-description">
												<h3 class="job-listing-title"><a href="#">Thiết Kế Trang Đích</a> <span class="dashboard-status-button yellow">Sắp Hết Hạn</span></h3>

												<!-- Job Listing Footer -->
												<div class="job-listing-footer">
													<ul>
														<li><i class="icon-material-outline-access-time"></i> Còn 23 giờ</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									
									<!-- Task Details -->
									<ul class="dashboard-task-info">
										<li><strong>3</strong><span>Lượt Đấu Thầu</span></li>
										<li><strong>$22</strong><span>Giá Thầu Trung Bình</span></li>
										<li><strong>$15 - $30</strong><span>Giá Theo Giờ</span></li>
									</ul>

									<!-- Buttons -->
									<div class="buttons-to-right always-visible">
										<a href="dashboard-manage-bidders.html" class="button ripple-effect"><i class="icon-material-outline-supervisor-account"></i> Quản Lý Đấu Thầu <span class="button-info">3</span></a>
										<a href="#" class="button gray ripple-effect ico" title="Chỉnh Sửa" data-tippy-placement="top"><i class="icon-feather-edit"></i></a>
										<a href="#" class="button gray ripple-effect ico" title="Xóa" data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
									</div>
								</li>

								<li>
									<!-- Job Listing -->
									<div class="job-listing width-adjustment">

										<!-- Job Listing Details -->
										<div class="job-listing-details">

											<!-- Details -->
											<div class="job-listing-description">
												<h3 class="job-listing-title"><a href="#">Ứng Dụng Di Động Giao Hàng Thực Phẩm</a></h3>

												<!-- Job Listing Footer -->
												<div class="job-listing-footer">
													<ul>
														<li><i class="icon-material-outline-access-time"></i> Còn 6 ngày, 23 giờ</li>
													</ul>
												</div>
											</div>
										</div>
									</div>

									<!-- Task Details -->
									<ul class="dashboard-task-info">
										<li><strong>3</strong><span>Lượt Đấu Thầu</span></li>
										<li><strong>$3,200</strong><span>Giá Thầu Trung Bình</span></li>
										<li><strong>$2,500 - $4,500</strong><span>Giá Cố Định</span></li>
									</ul>

									<!-- Buttons -->
									<div class="buttons-to-right always-visible">
										<a href="dashboard-manage-bidders.html" class="button ripple-effect"><i class="icon-material-outline-supervisor-account"></i> Quản Lý Đấu Thầu <span class="button-info">3</span></a>
										<a href="#" class="button gray ripple-effect ico" title="Chỉnh Sửa" data-tippy-placement="top"><i class="icon-feather-edit"></i></a>
										<a href="#" class="button gray ripple-effect ico" title="Xóa" data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
									</div>
								</li>

							</ul>
						</div>
					</div>
				</div>

			</div>
			<!-- Row / End -->

			<!-- Footer -->
			<div class="dashboard-footer-spacer"></div>
			<div class="small-footer margin-top-15">
				<div class="small-footer-copyrights">
					© 2024 <strong>JOBTRANS</strong>. All Rights Reserved.
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

</body>

<!-- Mirrored from www.vasterad.com/themes/hireo_21/dashboard-manage-tasks.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:48 GMT -->
</html>
