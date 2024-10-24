<%-- 
    Document   : header
    Created on : Sep 18, 2024, 6:03:21 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import= "jobtrans.utils.CookieUtils" %>
<%@ page import="jobtrans.model.Notification" %>
<!--<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/colors/blue.css">-->
<jsp:useBean id="notiDAO" class="jobtrans.dal.NotificationDAO" scope="session"></jsp:useBean>
    <link rel="stylesheet" href="../css/other.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <style>
        .btn {
            background-color: rgb(42, 65, 232);
            color: white;
            border: none;
            padding: 15px 30px;
            margin: 10px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: rgb(42, 65, 232);
        }

        .seeker {
            background-color: rgb(42, 65, 232);
        }

        .employer {
            background-color: rgb(42, 65, 232);
        }
    </style>

    <header id="header-container" class="fullwidth">

        <div id="header">
            <div class="container">
                <div class="left-side">
                    <div id="logo">
                        <a href="./home"><img src="images/logo.png" alt=""></a>
                    </div>

                    <nav id="navigation">
                        <ul id="responsive">
                            <li><a href="./home?action=home">Trang Chủ</a></li>
                            <li><a href="./home?action=list">Việc làm</a></li>
                            <li><a href="./home?action=viewEmployer">Nhà tuyển dụng</a></li>
                            <li><a href="./page-contact.jsp">Liên Hệ</a></li>
                        </ul>
                    </nav>
                    <div class="clearfix"></div>
                </div>
                <div class="right-side">
                <% 
        Object account = session.getAttribute("account");
            if (account != null) { 
                %>
                <div class="header-widget hide-on-mobile">
                    <div class="header-notifications">
                        <div class="header-notifications-trigger">
                            <a href="#"><i class="icon-feather-bell"></i><span>${notiDAO.getUnreadNotificationsByUserId(sessionScope.userId).size()}</span></a>
                        </div>

                        <!-- Dropdown -->
                        <div class="header-notifications-dropdown">

                            <div class="header-notifications-headline">
                                <h4>Thông báo</h4>
                                <% 
    String message = (String) request.getSession().getAttribute("message");
    if (message != null) { 
%>
    <div class="alert alert-info" id="messageAlert">
        <%= message %>
    </div>
<% 
        // Remove the message after displaying it
        request.getSession().removeAttribute("message"); 
    } 
%>
                                <form action="home" method="GET">
                                    <input type="hidden" name="action" value="markNotification">
                                    <input type="hidden" name="notiList" value="${notiDAO.getUnreadNotificationsByUserId(sessionScope.userId)}">
                                    <button type="submit" class="mark-as-read ripple-effect-dark" title="Đánh dấu tất cả đã đọc" data-tippy-placement="left">
                                        <i class="icon-feather-check-square"></i>
                                    </button>
                                </form>
                            </div>

                            <div class="header-notifications-content">
                                <div class="header-notifications-scroll" data-simplebar>
                                    <ul>
                                        <!-- Notification -->

                                        <c:forEach var="noti" items="${notiDAO.getUnreadNotificationsByUserId(sessionScope.userId)}">
                                            <li class="notifications-not-read">
                                                <a href="#">
                                                    <span class="notification-avatar status-online"><img src="./images/logo.png" alt=""></span>
                                                    <div class="notification-text">
                                                        <strong>${noti.notiTitle}</strong>
                                                        <p class="notification-msg-text">${noti.content}</p>
                                                        <span class="color">${noti.createdTime}</span>
                                                    </div>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- Messages -->
                    
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
                                <li><a href="profile?action=editProfile"><i class="icon-material-outline-settings"></i> Sửa hồ sơ</a></li>
                                <li><a href="profile?action=loadPassword"><i class="icon-line-awesome-futbol-o"></i> Đổi mật khẩu</a></li>
                                <li><a href="profile?action=wallet"><i class="icon-line-awesome-dollar"></i> Nạp thêm tiền</a></li>
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


<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide dialog-with-tabs">

    <!--Tabs -->
    <div class="sign-in-form">

        <%
            String email = CookieUtils.get("cookemail", request);
            String password = CookieUtils.get("cookpass", request);
            String rememberVal = CookieUtils.get("cookrem", request);
        %>

        <ul class="popup-tabs-nav">
            <li><a href="#login">Đăng Nhập</a></li>
            <li><a href="#register">Đăng Ký</a></li>
        </ul>

        <div class="popup-tabs-container">

            <!-- Login -->
            <div class="popup-tab-content" id="login">

                <!-- Welcome Text -->
                <div class="welcome-text">
                    <h3>Chúng tôi rất vui khi gặp lại bạn!</h3>
                    <span>Bạn chưa có tài khoản? <a href="#" class="register-tab">Đăng ký!</a></span>
                </div>

                <!-- Form -->
                <form action="login"  method="post" id="login-form">
                    <div class="input-with-icon-left">
                        <i class="icon-material-baseline-mail-outline"></i>
                        <input type="text" class="input-text with-border" name="emailaddress" id="emailaddress" placeholder="Email Address" required/>
                    </div>

                    <div class="input-with-icon-left">
                        <i class="icon-material-outline-lock"></i>
                        <input type="password" class="input-text with-border" name="password" id="password" placeholder="Password" required/>
                    </div>
                    <input type="checkbox" class name="remember" value="1" style="width: 15px; height: 15px; margin-right: 10px; margin-top: 5px"
                           <%= "1".equals(rememberVal.trim()) ? "checked=\"checked\"" : "" %> />
                    Ghi nhớ mật khẩu

                    <a href="authentication/verify-email.jsp" class="forgot-password">Quên mật khẩu?</a>
                    <button class="button full-width button-sliding-icon ripple-effect" type="submit">Đăng nhập <i class="icon-material-outline-arrow-right-alt"></i></button>
                </form>

                <!-- Button -->


                <!-- Social Login -->
                <div class="social-login-separator"><span>or</span></div>
                <div class="social-login-buttons">
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/JobTrans/login&response_type=code&client_id=1002920823516-m0hv1uhsmimct8nfg7v84imor7mln17n.apps.googleusercontent.com&approval_prompt=force" class="google-login ripple-effect" style="color: #fff">
                        <i class="icon-brand-google-plus-g"></i> Đăng nhập bằng Google
                    </a>
                </div>

            </div>

            <!-- Register -->
            <div class="popup-tab-content" id="register">

                <!-- Welcome Text -->
                <div class="welcome-text">
                    <h3>Tạo Tài Khoản Của Bạn Ngây Bây Giờ!</h3>
                </div>

                <!-- Form -->
                <form method="GET" id="register-account-form" action="./Register">
                    <div class="account-type">
                        <div>
                            <input type="radio" name="account-type-radio" id="freelancer-radio" value = "freelancer" class="account-type-radio" checked/>
                            <label for="freelancer-radio" class="ripple-effect-dark"><i class="icon-material-outline-account-circle"></i> Freelancer</label>
                        </div>

                        <div>
                            <input type="radio" name="account-type-radio" id="employer-radio" value = "employer" class="account-type-radio"/>
                            <label for="employer-radio" class="ripple-effect-dark"><i class="icon-material-outline-business-center"></i> Nhà Tuyển Dụng</label>
                        </div>

                    </div>
                    <div>
                        <input type="hidden" name="cmd" id="cmd" value="1"/>
                    </div>
                    <div class="input-with-icon-left">
                        <i class="icon-material-baseline-mail-outline"></i>
                        <input type="text" class="input-text with-border" name="username-register" id="username-register" placeholder="Tên người dùng" required/>
                        <input type="hidden" class="input-text with-border" name="cmd" id="cmd" value="1"/>

                    </div>
                    <div class="input-with-icon-left">
                        <i class="icon-material-baseline-mail-outline"></i>
                        <input type="text" class="input-text with-border" name="emailaddress-register" id="emailaddress-register" placeholder="Địa chỉ email" required/>
                        <small id="email-error" style="color: red; display: none;">Không đúng định dạng mail</small>
                    </div>

                    <div class="input-with-icon-left" title="Should be at least 8 characters long" data-tippy-placement="bottom">
                        <i class="icon-material-outline-lock"></i>
                        <input type="password" class="input-text with-border" name="password-register" id="password-register" placeholder="Mật khẩu" required/>
                        <small id="password-error" style="color: red; display: none;">Mật khẩu ít nhất phải có 8 ký tự</small>
                    </div>

                    <div class="input-with-icon-left">
                        <i class="icon-material-outline-lock"></i>
                        <input type="password" class="input-text with-border" name="password-repeat-register" id="password-repeat-register" placeholder="Nhập lại mật khẩu" required/>
                        <small id="password-repeat-error" style="color: red; display: none;">Mật khẩu không khớp</small>
                    </div>

                    <!-- Button -->
                    <button class="button full-width button-sliding-icon ripple-effect margin-top-10" type="submit" form="register-account-form">Đăng ký <i class="icon-material-outline-arrow-right-alt"></i></button>
                </form>

                <!-- Button -->

                <!-- Social Login -->
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById('register-account-form').addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent immediate form submission
        let isValid = true;

        // Get form values
        const email = document.getElementById('emailaddress-register').value;
        const password = document.getElementById('password-register').value;
        const passwordRepeat = document.getElementById('password-repeat-register').value;

        // Email validation regex
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            document.getElementById('email-error').style.display = 'block';
            isValid = false;
        } else {
            document.getElementById('email-error').style.display = 'none';
        }

        // Password length validation (at least 8 characters)
        if (password.length < 8) {
            document.getElementById('password-error').style.display = 'block';
            isValid = false;
        } else {
            document.getElementById('password-error').style.display = 'none';
        }

        // Password matching validation
        if (password !== passwordRepeat) {
            document.getElementById('password-repeat-error').style.display = 'block';
            isValid = false;
        } else {
            document.getElementById('password-repeat-error').style.display = 'none';
        }

        // If all validations pass, submit the form
        if (isValid) {
            this.submit();
        }
    });
</script>
<script>
    function initAutocomplete() {
        var options = {
            types: ['(cities)'],
            // componentRestrictions: {country: "us"}
        };

        var input = document.getElementById('autocomplete-input');
        var autocomplete = new google.maps.places.Autocomplete(input, options);
    }

    // Autocomplete adjustment for homepage
    if ($('.intro-banner-search-form')[0]) {
        setTimeout(function () {
            $(".pac-container").prependTo(".intro-search-field.with-autocomplete");
        }, 300);
    }

</script>

<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/jquery-migrate-3.1.0.min.html"></script>
<script src="../js/mmenu.min.js"></script>
<script src="../js/tippy.all.min.js"></script>
<script src="../js/simplebar.min.js"></script>
<script src="../js/bootstrap-slider.min.js"></script>
<script src="../js/bootstrap-select.min.js"></script>
<script src="../js/snackbar.js"></script>
<script src="../js/clipboard.min.js"></script>
<script src="../js/counterup.min.js"></script>
<script src="../js/magnific-popup.min.js"></script>
<script src="../js/slick.min.js"></script>
<script src="../js/custom.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaoOT9ioUE4SA8h-anaFyU4K63a7H-7bc&amp;libraries=places"></script>
