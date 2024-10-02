<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jobtrans.model.Job" %>
<%@ page import="jobtrans.model.User" %>
<!doctype html>
<html lang="en">

<!-- Mirrored from www.vasterad.com/themes/hireo_21/single-task-page.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:44 GMT -->
<head>
<jsp:useBean id="jg" class="jobtrans.dal.JobDAO" scope="session"></jsp:useBean>
<jsp:useBean id="jgmodel" class="jobtrans.model.JobGreetings" scope="session"></jsp:useBean>
<jsp:useBean id="usermodel" class="jobtrans.model.User" scope="session"></jsp:useBean>
<!-- Basic Page Needs
================================================== -->
<title>JobTrans</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/colors/blue.css">
<link rel="stylesheet" href="css/popup.css">

</head>
<body>

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



<!-- Titlebar
================================================== -->
<div class="single-page-header" data-background-image="images/single-task.jpg">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="single-page-header-inner">
					<div class="left-side">
						<div class="header-image"><a href="#"><img src=${employer.avatarUrl} alt="avatar"></a></div>
						<div class="header-details">
							<h3>${job.jobTitle}</h3>
							<h5>Về nhà tuyển dụng</h5>
							<ul>
								<li><a href="single-company-profile.html"><i class="icon-material-outline-business"></i>${employer.userName}</a></li>
								<li><div class="star-rating" data-rating="5.0"></div></li>
								<li><div class="verified-badge-with-title">Đã xác minh</div></li>
							</ul>
						</div>
					</div>
					<div class="right-side">
						<div class="salary-box">
							<div class="salary-type">Ngân sách dự án</div>
							<div class="salary-amount"><fmt:formatNumber value="${job.budget}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" /></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Page Content
================================================== -->
<div class="container">
	<div class="row">
		
		<!-- Content -->
		<div class="col-xl-8 col-lg-8 content-right-offset">
			
			<!-- Description -->
			<div class="single-page-section">
				<h3 class="margin-bottom-25">Mô tả dự án</h3>
				<p>${job.description}</p>
			</div>

			<!-- Atachments -->
			<div class="single-page-section">
				<h3>Tệp đính kèm</h3>
				<div class="attachments-container">
					<a href="${job.docURL}" class="attachment-box ripple-effect"><span>Tóm tắt dự án</span><i>PDF</i></a>
				</div>
			</div>
                                
			<div class="clearfix"></div>
			
			<!-- Freelancers Bidding -->
			<div class="boxed-list margin-bottom-60">
				<div class="boxed-list-headline">
					<h3><i class="icon-material-outline-group"></i> Freelancers đấu thầu</h3>
				</div>
				<ul class="boxed-list-ul">
                                    <c:forEach var="jobGreeting" items="${jg.getJobGreetingByJobId(job.jobId)}">
                                        <li>
						<div class="bid">
							<!-- Avatar -->
							<div class="bids-avatar">
								<div class="freelancer-avatar">
									<div class="verified-badge"></div>
                                                                        <a href="#"><img src="${usermodel.getBidder(jobGreetings.seekerId).avatarUrl}" alt=""></a>
								</div>
							</div>
							
							<!-- Content -->
							<div class="bids-content">
								<!-- Name -->
								<div class="freelancer-name">
									<h4><a href="single-freelancer-profile.html">Tom Smith </a></h4>
								</div>
							</div>
							
							<!-- Bid -->
							<div class="bids-bid">
								<div class="bid-rate">
									<div class="rate"><fmt:formatNumber value="${jobGreeting.price}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" /></div>
								</div>
							</div>
						</div>
					</li>
                                    </c:forEach>
				</ul>
			</div>

		</div>
		

		<!-- Sidebar -->
		<div class="col-xl-4 col-lg-4">
			<div class="sidebar-container">

				<div class="countdown green margin-bottom-35">Ngày hết hạn: ${job.dueDate}</div>

				<div class="sidebar-widget">
					<div class="bidding-widget">
				
						<div class="bidding-inner">
                                                        <!-- Button -->
                                                        <a href="CRUDJobServerlet?command=LOAD&jid=${job.jobId}"><button class="button full-width button-sliding-icon ripple-effect">Cập nhật công việc <i class="icon-feather-edit"></i></button></a>
							<!-- Button -->
                                                        <button class="button full-width button-sliding-icon ripple-effect" title="Xóa" onclick="openPopup(this)" data-jobid="${job.jobId}">Xóa Công Việc <i class="icon-feather-trash-2"></i></button>
                                                        <!-- Button -->
                                                        <a href="CRUDJobServerlet?command=LOADINTERVIEW&jid=${job.jobId}"><button class="button full-width button-sliding-icon ripple-effect">Cập nhật phỏng vấn <i class="icon-feather-video"></i></button></a>
						</div>
					</div>
				</div>

				<!-- Sidebar Widget -->
				<div class="sidebar-widget">
					<h3>Thông tin</h3>
					<ul class="task-info">
						<li><strong>Ngày hết hạn:</strong> ${job.dueDate}</li>
						<li><strong>Địa điểm:</strong> ${job.address}</li>
						<li><strong>Ngân sách:</strong> <fmt:formatNumber value="${job.budget}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" /></li>
                                                <li><strong>Đã đăng bởi:</strong> ${usermodel.getUserNameById(job.userId).userName}</li>
                                                <li><strong>Trạng thái:</strong> ${job.status}</li>
                                                <a href="${job.interviewURL}"><li><strong>Phỏng Vấn</strong></li></a>
                                                <li><strong>Ngày phỏng vấn:</strong> ${job.interviewDate}</li>
					</ul>
				</div>
			</div>
		</div>

	</div>
</div>



<!-- Spacer -->
<div class="margin-top-15"></div>
<!-- Spacer / End-->

<!-- Footer
================================================== -->
<div id="footer">
	
	<!-- Phần Trên Của Footer -->
	<div class="footer-top-section">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">

					<!-- Container Các Hàng Của Footer -->
					<div class="footer-rows-container">
						
						<!-- Bên Trái -->
						<div class="footer-rows-left">
							<div class="footer-row">
								<div class="footer-row-inner footer-logo">
									<img src="images/logo2.png" alt="">
								</div>
							</div>
						</div>
						
						<!-- Bên Phải -->
						<div class="footer-rows-right">

							<!-- Icon Mạng Xã Hội -->
							<div class="footer-row">
								<div class="footer-row-inner">
									<ul class="footer-social-links">
										<li>
											<a href="#" title="Facebook" data-tippy-placement="bottom" data-tippy-theme="light">
												<i class="icon-brand-facebook-f"></i>
											</a>
										</li>
										<li>
											<a href="#" title="Twitter" data-tippy-placement="bottom" data-tippy-theme="light">
												<i class="icon-brand-twitter"></i>
											</a>
										</li>
										<li>
											<a href="#" title="Google Plus" data-tippy-placement="bottom" data-tippy-theme="light">
												<i class="icon-brand-google-plus-g"></i>
											</a>
										</li>
										<li>
											<a href="#" title="LinkedIn" data-tippy-placement="bottom" data-tippy-theme="light">
												<i class="icon-brand-linkedin-in"></i>
											</a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
							</div>
							
							<!-- Chuyển Đổi Ngôn Ngữ -->
							<div class="footer-row">
								<div class="footer-row-inner">
									<select class="selectpicker language-switcher" data-selected-text-format="count" data-size="5">
										<option selected>Tiếng Việt</option>
										<option>Tiếng Anh</option>
										<option>Tiếng Tây Ban Nha</option>
										<option>Tiếng Hàn</option>
									</select>
								</div>
							</div>
						</div>

					</div>
					<!-- Container Các Hàng Của Footer / Kết Thúc -->
				</div>
			</div>
		</div>
	</div>
	<!-- Phần Trên Của Footer / Kết Thúc -->

	<!-- Phần Giữa Của Footer -->
	<div class="footer-middle-section">
		<div class="container">
			<div class="row">

				<!-- Liên Kết -->
				<div class="col-xl-2 col-lg-2 col-md-3">
					<div class="footer-links">
						<h3>Dành Cho Ứng Viên</h3>
						<ul>
							<li><a href="#"><span>Tìm Việc</span></a></li>
							<li><a href="#"><span>Thêm Hồ Sơ</span></a></li>
							<li><a href="#"><span>Thông Báo Việc Làm</span></a></li>
							<li><a href="#"><span>Dấu Trang Của Tôi</span></a></li>
						</ul>
					</div>
				</div>

				<!-- Liên Kết -->
				<div class="col-xl-2 col-lg-2 col-md-3">
					<div class="footer-links">
						<h3>Dành Cho Nhà Tuyển Dụng</h3>
						<ul>
							<li><a href="#"><span>Tìm Ứng Viên</span></a></li>
							<li><a href="#"><span>Đăng Tuyển Dụng</span></a></li>
							<li><a href="#"><span>Đăng Công Việc</span></a></li>
							<li><a href="#"><span>Kế Hoạch & Giá</span></a></li>
						</ul>
					</div>
				</div>

				<!-- Liên Kết -->
				<div class="col-xl-2 col-lg-2 col-md-3">
					<div class="footer-links">
						<h3>Liên Kết Hữu Ích</h3>
						<ul>
							<li><a href="#"><span>Liên Hệ</span></a></li>
							<li><a href="#"><span>Chính Sách Bảo Mật</span></a></li>
							<li><a href="#"><span>Điều Khoản Sử Dụng</span></a></li>
						</ul>
					</div>
				</div>

				<!-- Liên Kết -->
				<div class="col-xl-2 col-lg-2 col-md-3">
					<div class="footer-links">
						<h3>Tài Khoản</h3>
						<ul>
							<li><a href="#"><span>Đăng Nhập</span></a></li>
							<li><a href="#"><span>Tài Khoản Của Tôi</span></a></li>
						</ul>
					</div>
				</div>

				<!-- Bản Tin -->
				<div class="col-xl-4 col-lg-4 col-md-12">
					<h3><i class="icon-feather-mail"></i> Đăng Ký Nhận Bản Tin</h3>
					<p>Thông tin nóng hổi hàng tuần, phân tích và lời khuyên về tìm việc.</p>
					<form action="#" method="get" class="newsletter">
						<input type="text" name="fname" placeholder="Nhập địa chỉ email của bạn">
						<button type="submit"><i class="icon-feather-arrow-right"></i></button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Phần Giữa Của Footer / Kết Thúc -->
	
	<!-- Bản Quyền Footer -->
	<div class="footer-bottom-section">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					© 2024 <strong>JOBTRANS</strong>. All Rights Reserved.
				</div>
			</div>
		</div>
	</div>
	<!-- Bản Quyền Footer / Kết Thúc -->

</div>
<!-- Footer / End -->

</div>
<!-- Wrapper / End -->


<!-- Sign In Popup
================================================== -->
<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide dialog-with-tabs">

	<!--Tabs -->
	<div class="sign-in-form">

		<ul class="popup-tabs-nav">
			<li><a href="#login">Đăng Nhập</a></li>
			<li><a href="#register">Đăng Ký</a></li>
		</ul>

		<div class="popup-tabs-container">

			<!-- Login -->
			<div class="popup-tab-content" id="login">
				
				<!-- Welcome Text -->
				<div class="welcome-text">
					<h3>Chúng tôi rất vui khi thấy bạn trở lại!</h3>
					<span>Bạn chưa có tài khoản? <a href="#" class="register-tab">Đăng Ký!</a></span>
				</div>
					
				<!-- Form -->
				<form method="post" id="login-form">
					<div class="input-with-icon-left">
						<i class="icon-material-baseline-mail-outline"></i>
						<input type="text" class="input-text with-border" name="emailaddress" id="emailaddress" placeholder="Địa chỉ Email" required/>
					</div>

					<div class="input-with-icon-left">
						<i class="icon-material-outline-lock"></i>
						<input type="password" class="input-text with-border" name="password" id="password" placeholder="Mật khẩu" required/>
					</div>
					<a href="#" class="forgot-password">Quên mật khẩu?</a>
				</form>
				
				<!-- Button -->
				<button class="button full-width button-sliding-icon ripple-effect" type="submit" form="login-form">Đăng Nhập <i class="icon-material-outline-arrow-right-alt"></i></button>
				
				<!-- Social Login -->
				<div class="social-login-separator"><span>hoặc</span></div>
				<div class="social-login-buttons">
					<button class="facebook-login ripple-effect"><i class="icon-brand-facebook-f"></i> Đăng Nhập qua Facebook</button>
					<button class="google-login ripple-effect"><i class="icon-brand-google-plus-g"></i> Đăng Nhập qua Google</button>
				</div>

			</div>

			<!-- Register -->
			<div class="popup-tab-content" id="register">
				
				<!-- Welcome Text -->
				<div class="welcome-text">
					<h3>Hãy tạo tài khoản của bạn!</h3>
				</div>

				<!-- Account Type -->
				<div class="account-type">
					<div>
						<input type="radio" name="account-type-radio" id="freelancer-radio" class="account-type-radio" checked/>
						<label for="freelancer-radio" class="ripple-effect-dark"><i class="icon-material-outline-account-circle"></i> Freelancer</label>
					</div>

					<div>
						<input type="radio" name="account-type-radio" id="employer-radio" class="account-type-radio"/>
						<label for="employer-radio" class="ripple-effect-dark"><i class="icon-material-outline-business-center"></i> Nhà Tuyển Dụng</label>
					</div>
				</div>
					
				<!-- Form -->
				<form method="post" id="register-account-form">
					<div class="input-with-icon-left">
						<i class="icon-material-baseline-mail-outline"></i>
						<input type="text" class="input-text with-border" name="emailaddress-register" id="emailaddress-register" placeholder="Địa chỉ Email" required/>
					</div>

					<div class="input-with-icon-left" title="Mật khẩu nên có ít nhất 8 ký tự" data-tippy-placement="bottom">
						<i class="icon-material-outline-lock"></i>
						<input type="password" class="input-text with-border" name="password-register" id="password-register" placeholder="Mật khẩu" required/>
					</div>

					<div class="input-with-icon-left">
						<i class="icon-material-outline-lock"></i>
						<input type="password" class="input-text with-border" name="password-repeat-register" id="password-repeat-register" placeholder="Nhập lại mật khẩu" required/>
					</div>
				</form>
				
				<!-- Button -->
				<button class="margin-top-10 button full-width button-sliding-icon ripple-effect" type="submit" form="register-account-form">Đăng Ký <i class="icon-material-outline-arrow-right-alt"></i></button>
				
				<!-- Social Login -->
				<div class="social-login-separator"><span>hoặc</span></div>
				<div class="social-login-buttons">
					<button class="facebook-login ripple-effect"><i class="icon-brand-facebook-f"></i> Đăng Ký qua Facebook</button>
					<button class="google-login ripple-effect"><i class="icon-brand-google-plus-g"></i> Đăng Ký qua Google+</button>
				</div>

			</div>

		</div>
	</div>
</div>

<!-- Sign In Popup / End -->

<div id="popup" class="popup">
    <div id="overlay">
        <button class="closebtn" style="width: 5px;" onclick="closePopup()"><i class="icon-feather-log-out"></i></button>
        <!-- Nội dung trong Popup -->
        <center>
            <div class="overlay-content">
                <h4>Xác nhận</h4>
                <hr>
                <h4 style="margin-top: 30px;"><i class="icon-feather-alert-circle" style="color: blue;"></i>Bạn xác nhận muốn xóa công việc này không.</h4>
                <br><!-- comment -->

                <table>
                <tr>
                        <td><button class="button full-width button-sliding-icon ripple-effect" onclick="closePopup()">Thoát<i class="icon-feather-log-outo"></i></button></td>
                        <td><a id="confirmDeleteButton" href="#"><button class="button full-width button-sliding-icon ripple-effect">Xác Nhận <i class="icon-feather-trash-2"></i></button></a></td>
                </tr>
                </table>
            </div>
        </center>
    </div>
</div>
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

// Snackbar for "place a bid" button
$('#snackbar-place-bid').click(function() { 
	Snackbar.show({
		text: 'Your bid has been placed!',
	}); 
}); 


// Snackbar for copy to clipboard button
$('.copy-url-button').click(function() { 
	Snackbar.show({
		text: 'Copied to clipboard!',
	}); 
}); 
</script>

<script>
            function openPopup(element) { // Click vào button thì gán style cho Popup là display:block để hiển thị lên
                var jobId = element.getAttribute("data-jobid");
                console.log("Job ID: " + jobId);

                // Cập nhật URL của nút "Xác Nhận"
                var confirmButton = document.getElementById("confirmDeleteButton");
                confirmButton.href = "CRUDJobServerlet?command=DELETE&jid=" + jobId;
                document.getElementById("popup").style.display = "block";
            }

            
</script>

<script>
    function closePopup() { // Click vào close thì gán style cho Popup là display:none để ẩn đi
                document.getElementById("popup").style.display = "none";
            }
</script>
</body>

<!-- Mirrored from www.vasterad.com/themes/hireo_21/single-task-page.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:44 GMT -->
</html>