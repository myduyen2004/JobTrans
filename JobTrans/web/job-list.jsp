<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="en">

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/tasks-grid-layout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:39 GMT -->
    <head>

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
                                            <li><a href="Jobinfor">Trang công việc</a></li>
                                            <li><a href="single-task-page.html">Trang Nhiệm Vụ</a></li>
                                            <li><a href="employer">Hồ Sơ Công Ty</a></li>
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
                                            <h4>Notifications</h4>
                                            <button class="mark-as-read ripple-effect-dark" title="Mark all as read" data-tippy-placement="left">
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
                                                                <strong>Michael Shannah</strong> applied for a job <span class="color">Full Stack Software Engineer</span>
                                                            </span>
                                                        </a>
                                                    </li>

                                                    <!-- Notification -->
                                                    <li>
                                                        <a href="dashboard-manage-bidders.html">
                                                            <span class="notification-icon"><i class=" icon-material-outline-gavel"></i></span>
                                                            <span class="notification-text">
                                                                <strong>Gilbert Allanis</strong> placed a bid on your <span class="color">iOS App Development</span> project
                                                            </span>
                                                        </a>
                                                    </li>

                                                    <!-- Notification -->
                                                    <li>
                                                        <a href="dashboard-manage-jobs.html">
                                                            <span class="notification-icon"><i class="icon-material-outline-autorenew"></i></span>
                                                            <span class="notification-text">
                                                                Your job listing <span class="color">Full Stack PHP Developer</span> is expiring.
                                                            </span>
                                                        </a>
                                                    </li>

                                                    <!-- Notification -->
                                                    <li>
                                                        <a href="dashboard-manage-candidates.html">
                                                            <span class="notification-icon"><i class="icon-material-outline-group"></i></span>
                                                            <span class="notification-text">
                                                                <strong>Sindy Forrest</strong> applied for a job <span class="color">Full Stack Software Engineer</span>
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
                                            <h4>Messages</h4>
                                            <button class="mark-as-read ripple-effect-dark" title="Mark all as read" data-tippy-placement="left">
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
                                                                <p class="notification-msg-text">Thanks for reaching out. I'm quite busy right now on many...</p>
                                                                <span class="color">4 hours ago</span>
                                                            </div>
                                                        </a>
                                                    </li>

                                                    <!-- Notification -->
                                                    <li class="notifications-not-read">
                                                        <a href="dashboard-messages.html">
                                                            <span class="notification-avatar status-offline"><img src="images/user-avatar-small-02.jpg" alt=""></span>
                                                            <div class="notification-text">
                                                                <strong>Sindy Forest</strong>
                                                                <p class="notification-msg-text">Hi Tom! Hate to break it to you, but I'm actually on vacation until...</p>
                                                                <span class="color">Yesterday</span>
                                                            </div>
                                                        </a>
                                                    </li>

                                                    <!-- Notification -->
                                                    <li class="notifications-not-read">
                                                        <a href="dashboard-messages.html">
                                                            <span class="notification-avatar status-online"><img src="images/user-avatar-placeholder.png" alt=""></span>
                                                            <div class="notification-text">
                                                                <strong>Marcin Kowalski</strong>
                                                                <p class="notification-msg-text">I received payment. Thanks for cooperation!</p>
                                                                <span class="color">Yesterday</span>
                                                            </div>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>

                                        <a href="dashboard-messages.html" class="header-notifications-button ripple-effect button-sliding-icon">View All Messages<i class="icon-material-outline-arrow-right-alt"></i></a>
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
                                                    Tom Smith <span>Freelancer</span>
                                                </div>
                                            </div>

                                            <!-- User Status Switcher -->
                                            <div class="status-switch" id="snackbar-user-status">
                                                <label class="user-online current-status">Online</label>
                                                <label class="user-invisible">Invisible</label>
                                                <!-- Status Indicator -->
                                                <span class="status-indicator" aria-hidden="true"></span>
                                            </div>	
                                        </div>

                                        <ul class="user-menu-small-nav">
                                            <li><a href="dashboard.html"><i class="icon-material-outline-dashboard"></i> Dashboard</a></li>
                                            <li><a href="dashboard-settings.html"><i class="icon-material-outline-settings"></i> Settings</a></li>
                                            <li><a href="index-logged-out.html"><i class="icon-material-outline-power-settings-new"></i> Logout</a></li>
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

            <!-- Spacer -->
            <div class="margin-top-90"></div>
            <!-- Spacer / End-->

            <!-- Page Content
            ================================================== -->
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-4">
                        <div class="sidebar-container">



                            <!-- Category -->
                            <div class="sidebar-widget">
                                <h3>Category</h3>
                                <select class="selectpicker default" multiple data-selected-text-format="count" data-size="7" title="All Categories" >
                                    <option>Admin Support</option>
                                    <option>Customer Service</option>
                                    <option>Data Analytics</option>
                                    <option>Design & Creative</option>
                                    <option>Legal</option>
                                    <option>Software Developing</option>
                                    <option>IT & Networking</option>
                                    <option>Writing</option>
                                    <option>Translation</option>
                                    <option>Sales & Marketing</option>
                                </select>
                            </div>




                            <!-- More Skills -->

                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-8 content-left-offset" style="margin-bottom: 109px">

                        <h3 class="page-title">Search Results</h3>

                        <div class="notify-box margin-top-15">
                            <div class="switch-container">
                                <label class="switch"><input type="checkbox"><span class="switch-button"></span><span class="switch-text">Turn on email alerts for this search</span></label>
                            </div>

                            <div class="sort-by">
                                <span>Sort by:</span>
                                <select class="selectpicker hide-tick">
                                    <option>Relevance</option>
                                    <option>Newest</option>
                                    <option>Oldest</option>
                                    <option>Random</option>
                                </select>
                            </div>
                        </div>

                        <!-- Tasks Container -->
  <div class="container tasks-list-container margin-top-15">
    <table id="jobTable" class="display" style="width:100%">
        <thead>
            <tr>
                <th>Tiêu đề công việc</th>
                <th>Thời hạn</th>
                <th>Ngân sách</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${jobList}" var="o">
                <tr>
                    <td>
                        <h3 class="task-listing-title">${o.jobTitle}</h3>
                    </td>
                    <td><fmt:formatDate value="${o.dueDate}" pattern="dd/MM/yyyy"/></td>

                    <td id="salaryAmount-${o.jobId}">${o.budget}</td>
                    <td>
                        <div class="task-listing-bid-inner">
                            <a href="JobDetail?jobId=${o.jobId}" class="task-listing">
                                <span class="button button-sliding-icon ripple-effect">Chào giá<i class="icon-material-outline-arrow-right-alt"></i></span>
                            </a>
                        </div>

                    </td>
                </tr>
            </c:forEach>
                
        </tbody>
    </table>
</div>




                        <!-- Tasks Container / End -->


                        <!-- Pagination -->
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12">
                                <!-- Pagination -->
                                
                            </div>
                        </div>
                        <!-- Pagination / End -->

                    </div>
                </div>
            </div>


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
        <!-- Bao gồm jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- Bao gồm DataTables CSS và JS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css"/>
<script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>


        <!-- Snackbar // documentation: https://www.polonel.com/snackbar/ -->
        <script>
        // Snackbar for user status switcher
            $('#snackbar-user-status label').click(function () {
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

        <!-- Google Autocomplete -->
        <script>
            function initAutocomplete() {
                var options = {
                    types: ['(cities)'],
                    // componentRestrictions: {country: "us"}
                };

                var input = document.getElementById('autocomplete-input');
                var autocomplete = new google.maps.places.Autocomplete(input, options);
            }
            
            
            
            // Định dạng số tiền VND
function formatCurrencyVND(amount) {
    return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount);
}

// Định dạng giá trị budget sau khi trang tải
document.addEventListener("DOMContentLoaded", function() {
    // Lấy tất cả các phần tử chứa budget dựa trên id
    var budgetElements = document.querySelectorAll('[id^="salaryAmount-"]');

    // Lặp qua các phần tử và định dạng giá trị
    budgetElements.forEach(function(budgetElement) {
        var budget = parseFloat(budgetElement.textContent);  // Chuyển đổi chuỗi thành số
        budgetElement.textContent = formatCurrencyVND(budget);  // Định dạng lại và hiển thị
    });
});

        </script>
        <script>
            //phân trang và tìm kiếm
$(document).ready(function () {
    $('#jobTable').DataTable({
        "pageLength": 3,  // Số hàng trên mỗi trang
        "ordering": true, // Cho phép sắp xếp
        "searching": true, // Cho phép tìm kiếm
        lengthChange: false,
        "pagingType": "simple_numbers", // Phân trang kiểu số
        "language": {
            
            "zeroRecords": "Không tìm thấy kết quả",
            "info": "Hiển thị trang _PAGE_ của _PAGES_",
            "infoEmpty": "Không có công việc nào",
            "infoFiltered": "(lọc từ _MAX_ công việc)",
            "search": "Tìm kiếm:",
            "paginate": {
                "first": "Đầu",
                "last": "Cuối",
                "next": "Tiếp",
                "previous": "Trước"
            }
        }
    });
});
</script>
        <!-- Google API & Maps -->
        <!-- Geting an API Key: https://developers.google.com/maps/documentation/javascript/get-api-key -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaoOT9ioUE4SA8h-anaFyU4K63a7H-7bc&amp;libraries=places"></script>

    </body>

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/tasks-grid-layout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:39 GMT -->
</html>