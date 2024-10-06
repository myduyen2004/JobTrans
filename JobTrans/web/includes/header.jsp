<%-- 
    Document   : header
    Created on : Sep 18, 2024, 6:03:21 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/colors/blue.css">

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
                        <li><a href="#" class="current">Trang Chủ</a></li>
                        <li><a href="#">Việc làm</a></li>
                        <li><a href="#">Nhà tuyển dụng</a></li>
                        <li><a href="jobController?userId=${userId}">Quản Lý Công Việc</a></li> 
                        <li><a href="#">Liên Hệ</a></li>
                    </ul>
                </nav>

                <div class="clearfix"></div>
                <!-- Main Navigation / End -->

            </div>
            <!-- Left Side Content / End -->

            <!-- Right Side Content / End -->
            <div class="right-side">
                <% 
        Object account = session.getAttribute("account");
            if (account != null) { 
                %>
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
                                <h4>Thông báo</h4>
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
                                                    <strong>Michael Shannah</strong> đã nộp đơn cho công việc <span class="color">Kỹ Sư Phần Mềm Toàn Diện</span>
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
                                <h4>Tin nhắn</h4>
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
                                                    <p class="notification-msg-text">Cảm ơn vì đã liên hệ. Tôi khá bận rộn với nhiều việc...</p>
                                                    <span class="color">4 giờ trước</span>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- Notification -->
                                    </ul>
                                </div>
                            </div>

                            <a href="dashboard-messages.html" class="header-notifications-button ripple-effect button-sliding-icon">Xem tất cả tin nhắn<i class="icon-material-outline-arrow-right-alt"></i></a>
                        </div>
                    </div>
                    <div class="header-notifications">
                        <div class="header-notifications-trigger">
                            <a href="#"><i class="icon-material-outline-account-balance-wallet"></i><span>3</span></a>
                        </div>
                        <!-- Dropdown -->
                        <div class="header-notifications-dropdown">
                            <div class="header-notifications-headline">
                                <h4>Ví JobTrans</h4>
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
                                                    <p class="notification-msg-text">Cảm ơn vì đã liên hệ. Tôi khá bận rộn với nhiều việc...</p>
                                                    <span class="color">4 giờ trước</span>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- Notification -->
                                    </ul>
                                </div>
                            </div>

                            <a href="dashboard-messages.html" class="header-notifications-button ripple-effect button-sliding-icon">Xem lịch sử giao dịch<i class="icon-material-outline-arrow-right-alt"></i></a>
                        </div>
                    </div>

                </div>
                <!--  User Notifications / End -->

                <!-- User Menu -->

                <div class="header-widget">

                    <!-- Messages -->
                    <div class="header-notifications user-menu">
                        <div class="header-notifications-trigger">
                            <a href="#"><div class="user-avatar status-online"><img src="${avatarUrl}" alt=""></div></a>
                        </div>

                        <!-- Dropdown -->
                        <div class="header-notifications-dropdown">

                            <!-- User Status -->
                            <div class="user-status">

                                <!-- User Name / Avatar -->
                                <div class="user-details">
                                    <div class="user-avatar status-online"><img src="${avatarUrl}" alt=""></div>
                                    <div class="user-name">
                                        ${userName} <span>${role}</span>
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
                                <li><a href="profile?action=view"><i class="icon-material-outline-dashboard"></i> Thông tin</a></li>
                                <li><a href="UpdateServlet?action=load"><i class="icon-material-outline-settings"></i> Sửa hồ sơ</a></li>
                                <li><a href="profile?action=loadPassword"><i class="icon-line-awesome-futbol-o"></i> Đổi mật khẩu</a></li>
                                <li><a href="#"><i class="icon-line-awesome-dollar"></i> Nạp thêm tiền</a></li>
                                <li><a href="logout"><i class="icon-material-outline-power-settings-new"></i> Đăng Xuất</a></li>
                            </ul>

                        </div>
                    </div>

                </div>
                <!-- Mobile Navigation Button -->
                <span class="mmenu-trigger">
                    <button class="hamburger hamburger--collapse" type="button">
                        <span class="hamburger-box">
                            <span class="hamburger-inner"></span>
                        </span>
                    </button>
                </span>
                
                <%}else{%>
                
            </div>
            <div class="right-side">
                <div class="header-widget">
                    <a href="#sign-in-dialog" class="popup-with-zoom-anim log-in-button"><i class="icon-feather-log-in"></i> <span>Đăng Nhập / Đăng Ký</span></a>
                </div>
                <!-- Mobile Navigation Button -->
                <span class="mmenu-trigger">
                    <button class="hamburger hamburger--collapse" type="button">
                        <span class="hamburger-box">
                            <span class="hamburger-inner"></span>
                        </span>
                    </button>
                </span>

            </div>
                
            <%}%>
            <!-- Right Side Content / End -->
        </div>
    </div>
    <!-- Header / End -->

</header>

<div class="clearfix"></div>
