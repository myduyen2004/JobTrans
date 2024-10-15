<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<!doctype html>
<html lang="en">
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
    <body>
        <style>
            .salary-box{
                width: 300px;
            }
            .salary-type{
                
            }
                .input-container {
    display: flex;            /* Sử dụng Flexbox để sắp xếp các phần tử con trên cùng một dòng */
    align-items: center;       /* Căn giữa theo chiều dọc */
}

.input-container input {
    flex: 1;                   /* Để input chiếm không gian còn lại */
    padding-right: 10 px;       /* Tạo khoảng cách giữa input và span */
}

.input-container span {
    margin-left: 5 px;          /* Tạo khoảng cách giữa input và 'VND' */
}


                
        </style>

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
                                    <div class="header-image"><a href="single-company-profile.html"><img src="images/browse-companies-02.png" alt=""></a></div>
                                    <div class="header-details">
                                        <h3><p>${job.jobTitle}</p></h3>
                                        <h5>Về nhà tuyển dụng</h5>
                                        <ul>
                                            <li><a href="single-company-profile.html"><i class="icon-material-outline-business"></i> Acue</a></li>
                                            <li><div class="star-rating" data-rating="5.0"></div></li>
                                            <li><img class="flag" src="images/flags/de.svg" alt=""> Đức</li>
                                            <li><div class="verified-badge-with-title">Đã xác minh</div></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="right-side">
                                    <div class="salary-box">
                                        <div class="salary-type">Ngân sách dự án</div>
                                        <div class="salary-amount" id="salaryAmount">${job.budget}</div>
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
                                <a href="#" class="attachment-box ripple-effect"><span>Tóm tắt dự án</span><i>PDF</i></a>
                            </div>
                        </div>

                        <!-- Skills -->
                        <div class="single-page-section">                
                        </div>
                        <div class="clearfix"></div>

                        <!-- Freelancers Bidding -->
                        <div class="boxed-list margin-bottom-60">
                            <div class="boxed-list-headline">
                                <h3><i class="icon-material-outline-group"></i> Freelancers đấu thầu</h3>
                            </div>
                            <ul class="boxed-list-ul">
                                <li>
                                    <div class="bid">
                                        <!-- Avatar -->
                                        <div class="bids-avatar">
                                            <div class="freelancer-avatar">
                                                <div class="verified-badge"></div>
                                                <a href="single-freelancer-profile.html"><img src="images/user-avatar-big-01.jpg" alt=""></a>
                                            </div>
                                        </div>

                                        <!-- Content -->
                                        <div class="bids-content">
                                            <!-- Name -->
                                            <div class="freelancer-name">
                                                <h4><a href="single-freelancer-profile.html">Tom Smith <img class="flag" src="images/flags/gb.svg" alt="" title="Vương Quốc Anh" data-tippy-placement="top"></a></h4>
                                                <div class="star-rating" data-rating="4.9"></div>
                                            </div>
                                        </div>

                                        <!-- Bid -->
                                        <div class="bids-bid">
                                            <div class="bid-rate">
                                                <div class="rate">$4,400</div>
                                                <span>trong 7 ngày</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="bid">
                                        <!-- Avatar -->
                                        <div class="bids-avatar">
                                            <div class="freelancer-avatar">
                                                <div class="verified-badge"></div>
                                                <a href="single-freelancer-profile.html"><img src="images/user-avatar-big-02.jpg" alt=""></a>
                                            </div>
                                        </div>

                                        <!-- Content -->
                                        <div class="bids-content">
                                            <!-- Name -->
                                            <div class="freelancer-name">
                                                <h4><a href="single-freelancer-profile.html">David Peterson <img class="flag" src="images/flags/de.svg" alt="" title="Đức" data-tippy-placement="top"></a></h4>
                                                <div class="star-rating" data-rating="4.2"></div>
                                            </div>
                                        </div>

                                        <!-- Bid -->
                                        <div class="bids-bid">
                                            <div class="bid-rate">
                                                <div class="rate">$2,200</div>
                                                <span>trong 14 ngày</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="bid">
                                        <!-- Avatar -->
                                        <div class="bids-avatar">
                                            <div class="freelancer-avatar">
                                                <a href="single-freelancer-profile.html"><img src="images/user-avatar-placeholder.png" alt=""></a>
                                            </div>
                                        </div>

                                        <!-- Content -->
                                        <div class="bids-content">
                                            <!-- Name -->
                                            <div class="freelancer-name">
                                                <h4><a href="single-freelancer-profile.html">Marcin Kowalski <img class="flag" src="images/flags/pl.svg" alt="" title="Ba Lan" data-tippy-placement="top"></a></h4>
                                                <span class="not-rated">Cần tối thiểu 3 đánh giá</span>

                                            </div>
                                        </div>

                                        <!-- Bid -->
                                        <div class="bids-bid">
                                            <div class="bid-rate">
                                                <div class="rate">$3,800</div>
                                                <span>trong 20 ngày</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="bid">
                                        <!-- Avatar -->
                                        <div class="bids-avatar">
                                            <div class="freelancer-avatar">
                                                <a href="single-freelancer-profile.html"><img src="images/user-avatar-placeholder.png" alt=""></a>
                                            </div>
                                        </div>

                                        <!-- Content -->
                                        <div class="bids-content">
                                            <!-- Name -->
                                            <div class="freelancer-name">
                                                <h4><a href="single-freelancer-profile.html">Sebastiano Piccio <img class="flag" src="images/flags/it.svg" alt="" title="Ý" data-tippy-placement="top"></a></h4>
                                                <div class="star-rating" data-rating="4.5"></div>
                                            </div>
                                        </div>

                                        <!-- Bid -->
                                        <div class="bids-bid">
                                            <div class="bid-rate">
                                                <div class="rate">$3,400</div>
                                                <span>trong 10 ngày</span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>

                    </div>


                    <!-- Sidebar -->
                    <div class="col-xl-4 col-lg-4">
                        <div class="sidebar-container">
                            <div class="sidebar-widget">
                                <div class="bidding-widget">
                                    <div class="bidding-headline"><h3>Thông tin chào giá </h3></div>
                                    <div class="bidding-inner">

                                        <!-- Headline -->
                                        <form id="jgretting" action="JobGreetingServlet" method="POST">
                                            
                                            <h3>Đề xuất chào giá</h3>
                                            <input type="hidden" name="userID" value="${user.userId}">
                                            <input type="hidden" name="jobId" value="${job.jobId}">
                                            <label for="price">Bạn muốn nhận (mức chi phí thực nhận cho dự án):</label>
                                            <div class="input-container">
                                                <input type="text" id="price" name="price" oninput="formatCurrency(this)" placeholder="Nhập số tiền">
                                                <span>VND</span>
                                                
                                            </div>

                                            <label for="days">Dự kiến hoàn thành trong:</label>
                                            <div class="input-container">
                                                <input type="number" id="days" name="days"  "style="padding-left: 34px;padding-right: 0px;width: 104px"  style="margin-right: 62px">
                                                <span>Ngày</span>
                                            </div>

                                            <label for="proposal">Đề xuất thuyết phục nhà tuyển dụng:</label>
                                            <textarea id="intro" name="intro" 
                                                      style="width: 316px; height: 182px; text-align: left;" 
                                                      placeholder="- Tôi đã có ... năm kinh nghiệm&#10;- Tôi đã thành thạo ...&#10;- Hãy liên hệ tôi qua...."></textarea>
                                            <label for="fileUpload">Chọn tệp đính kèm:</label>
                                            <input type="file" id="fileUpload" name="fileUpload" accept=".jpg, .jpeg, .png, .pdf" > 
                                            <br>
                                            <input type="submit" value="Ứng tuyển">
                                        </form>





                                    </div>
                                    <div class="bidding-signup">Bạn chưa có tài khoản ? <a href="#sign-in-dialog" class="register-tab sign-in popup-with-zoom-anim">Đăng ký ngay</a></div>
                                </div>
                            </div>



                        </div>
                    </div>
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
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
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

// Snackbar for "place a bid" button
    $('#snackbar-place-bid').click(function () {
        Snackbar.show({
            text: 'Your bid has been placed!',
        });
    });


// Snackbar for copy to clipboard button
    $('.copy-url-button').click(function () {
        Snackbar.show({
            text: 'Copied to clipboard!',
        });
    });
</script>


    <script>
        toastr.options.positionClass = "toast-bottom-right"; // Đặt vị trí thông báo

        // Xử lý sự kiện submit form
        $("#myForm").on("submit", function(event) {
            event.preventDefault(); // Ngăn chặn hành vi mặc định của form
            
            // Giả lập xử lý form thành công hoặc thất bại
            var isSuccess = Math.random() >= 0.5; // Giả lập ngẫu nhiên thành công hoặc thất bại
            
            if (isSuccess) {
                toastr.success("Đăng ký thành công!"); // Hiển thị thông báo thành công
            } else {
                toastr.error("Đăng ký thất bại. Vui lòng thử lại."); // Hiển thị thông báo thất bại
            }
        });
    </script>

    
            <script>
            // Thiết lập Toastr options
            toastr.options = {
                "positionClass": "toast-bottom-right", // Vị trí hiển thị
                "timeOut": "3000", // Thời gian tự động đóng (tính bằng ms)
                "closeButton": true, // Hiển thị nút đóng
                "progressBar": true // Hiển thị thanh tiến trình
            };

            <% if (request.getAttribute("success") != null) { %>
    toastr.success('<%= request.getAttribute("success") %>');
            <% } %>

        </script>
      <script>
            
    function formatCurrency(input) {
    // Lấy giá trị của input và loại bỏ các ký tự không phải số
    var inputVal = input.value.replace(/[^0-9]/g, '');

    // Chuyển giá trị thành số nguyên
    var number = parseInt(inputVal);

    // Nếu không phải số hợp lệ
    if (isNaN(number)) {
        // Hiển thị thông báo lỗi
        input.value = '';
        alert('Vui lòng nhập số hợp lệ.');
    } else {
        // Định dạng số mà không hiển thị ký hiệu tiền tệ
        var formatted = new Intl.NumberFormat('vi-VN').format(number); // Không dùng { style: 'currency', currency: 'VND' }
        input.value = formatted;
    }
}



        </script>
    
    <script>
        //dinh dang so tien 
    function formatCurrencyVND(amount) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount);
    }

    // Định dạng giá trị job.budget
    document.addEventListener("DOMContentLoaded", function() {
        var budgetElement = document.getElementById('salaryAmount');
        var budget = parseFloat(budgetElement.textContent);  // Chuyển đổi chuỗi thành số
        budgetElement.textContent = formatCurrencyVND(budget);  // Định dạng lại và hiển thị
    });
</script>
</body>

<!-- Mirrored from www.vasterad.com/themes/hireo_21/single-task-page.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:44 GMT -->
</html>