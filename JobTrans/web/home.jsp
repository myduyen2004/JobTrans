<%-- 
    Document   : index-login-logout
    Created on : Sep 17, 2024, 10:15:11 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "jobtrans.utils.CookieUtils" %>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/index-logged-out.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:35:00 GMT -->
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
        <link rel="stylesheet" href="css/other.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <style>
/*            .button-group {
                display: flex;
                justify-content: space-between;
            }*/

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
    </head>
    <body>
        <%@include file="/includes/header.jsp" %>
        <!-- Wrapper -->
        <div id="wrapper">
            <div class="intro-banner" data-background-image="images/home-background.jpg">
                <div class="container">
                    <% 
        Object role = session.getAttribute("role");
        
            if (role == null && account !=null) { 
                %>
                    <!-- Intro Headline -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="banner-headline">
                                <h3>
                                    <strong>Nền tảng tuyển dụng và tìm kiếm việc làm Online</strong>
                                    <br>
                                    <span>Hỗ trợ cho người tuyển và người đi tìm việc <strong class="color">JobTrans</strong></span>
                                </h3>
                            </div>
                        </div>
                    </div>

                    <!-- Search Bar -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="intro-banner-search-form margin-top-95">

                                <!-- Search Field -->
                                <div class="intro-search-field with-autocomplete">
                                    <label for="autocomplete-input" class="field-title ripple-effect">Bạn muốn: </label>
                                    <form action="role" method="post">
                                    <!--<div class="button-group">-->
                                        <input name="email" value="${email}" type="hidden"><!-- comment -->
                                        <button type="submit" name="role" value="Seeker" class="btn seeker">Người tìm việc</button>
                                        <button type="submit" name="role" value="Employer" class="btn employer">Người tuyển dụng</button>
                                    <!--</div>-->
                                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                                        
                    <%}else{%>
                    <!-- Intro Headline -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="banner-headline">
                                <h3>
                                    <strong>Tuyển chuyên gia hoặc được tuyển cho bất kỳ công việc nào, bất kỳ lúc nào.</strong>
                                    <br>
                                    <span>Hàng nghìn doanh nghiệp nhỏ sử dụng <strong class="color">JobTrans</strong> để biến ý tưởng của họ thành hiện thực.</span>
                                </h3>
                            </div>
                        </div>
                    </div>

                    <!-- Search Bar -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="intro-banner-search-form margin-top-95">

                                <!-- Search Field -->
                                <div class="intro-search-field with-autocomplete">
                                    <label for="autocomplete-input" class="field-title ripple-effect">Ở đâu?</label>
                                    <div class="input-with-icon">
                                        <input id="autocomplete-input" type="text" placeholder="Công việc trực tuyến">
                                        <i class="icon-material-outline-location-on"></i>
                                    </div>
                                </div>

                                <!-- Search Field -->
                                <div class="intro-search-field">
                                    <label for ="intro-keywords" class="field-title ripple-effect">Bạn muốn công việc gì?</label>
                                    <input id="intro-keywords" type="text" placeholder="Tiêu đề công việc hoặc từ khóa">
                                </div>

                                <!-- Button -->
                                <div class="intro-search-button">
                                    <button class="button ripple-effect" onclick="window.location.href = 'jobs-list-layout-full-page-map.html'">Tìm kiếm</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Stats -->
                    
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="intro-stats margin-top-45 hide-under-992px">
                                <li>
                                    <strong class="counter">1,586</strong>
                                    <span>Công việc đã đăng</span>
                                </li>
                                <li>
                                    <strong class="counter">3,543</strong>
                                    <span>Nhiệm vụ đã đăng</span>
                                </li>
                                <li>
                                    <strong class="counter">1,232</strong>
                                    <span>Freelancer</span>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>


            <!-- Content
            ================================================== -->
            <!-- Category Boxes -->
            <div class="section margin-top-65">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">

                            <div class="section-headline centered margin-bottom-15">
                                <h3>Các Danh Mục Công Việc Phổ Biến</h3>
                            </div>

                            <!-- Category Boxes Container -->
                            <div class="categories-container">

                                <!-- Category Box -->
                                <a href="jobs-grid-layout-full-page.html" class="category-box">
                                    <div class="category-box-icon">
                                        <i class="icon-line-awesome-file-code-o"></i>
                                    </div>
                                    <div class="category-box-counter">612</div>
                                    <div class="category-box-content">
                                        <h3>Phát Triển Web & Phần Mềm</h3>
                                        <p>Kỹ sư Phần mềm, Nhà phát triển Web / Di động & Nhiều hơn nữa</p>
                                    </div>
                                </a>

                                <!-- Category Box -->
                                <a href="jobs-list-layout-full-page-map.html" class="category-box">
                                    <div class="category-box-icon">
                                        <i class="icon-line-awesome-cloud-upload"></i>
                                    </div>
                                    <div class="category-box-counter">113</div>
                                    <div class="category-box-content">
                                        <h3>Khoa Học Dữ Liệu & Phân Tích</h3>
                                        <p>Chuyên gia Dữ liệu / Nhà khoa học, Nhà phân tích Dữ liệu & Nhiều hơn nữa</p>
                                    </div>
                                </a>

                                <!-- Category Box -->
                                <a href="jobs-list-layout-full-page-map.html" class="category-box">
                                    <div class="category-box-icon">
                                        <i class="icon-line-awesome-suitcase"></i>
                                    </div>
                                    <div class="category-box-counter">186</div>
                                    <div class="category-box-content">
                                        <h3>Kế Toán & Tư Vấn</h3>
                                        <p>Kiểm toán viên, Kế toán viên, Nhà phân tích Tài chính & Nhiều hơn nữa</p>
                                    </div>
                                </a>

                                <!-- Category Box -->
                                <a href="jobs-list-layout-1.html" class="category-box">
                                    <div class="category-box-icon">
                                        <i class="icon-line-awesome-pencil"></i>
                                    </div>
                                    <div class="category-box-counter">298</div>
                                    <div class="category-box-content">
                                        <h3>Viết Lách & Dịch Thuật</h3>
                                        <p>Người viết quảng cáo, Nhà văn sáng tạo, Người dịch & Nhiều hơn nữa</p>
                                    </div>
                                </a>

                                <!-- Category Box -->
                                <a href="jobs-list-layout-2.html" class="category-box">
                                    <div class="category-box-icon">
                                        <i class="icon-line-awesome-pie-chart"></i>
                                    </div>
                                    <div class="category-box-counter">549</div>						
                                    <div class="category-box-content">
                                        <h3>Bán Hàng & Tiếp Thị</h3>
                                        <p>Quản lý Thương hiệu, Điều phối viên Tiếp thị & Nhiều hơn nữa</p>
                                    </div>
                                </a>

                                <!-- Category Box -->
                                <a href="jobs-list-layout-1.html" class="category-box">
                                    <div class="category-box-icon">
                                        <i class="icon-line-awesome-image"></i>
                                    </div>
                                    <div class="category-box-counter">873</div>
                                    <div class="category-box-content">
                                        <h3>Đồ Họa & Thiết Kế</h3>
                                        <p>Giám đốc Sáng tạo, Nhà thiết kế Web & Nhiều hơn nữa</p>
                                    </div>
                                </a>

                                <!-- Category Box -->
                                <a href="jobs-list-layout-2.html" class="category-box">
                                    <div class="category-box-icon">
                                        <i class="icon-line-awesome-bullhorn"></i>
                                    </div>
                                    <div class="category-box-counter">125</div>
                                    <div class="category-box-content">
                                        <h3>Tiếp Thị Kỹ Thuật Số</h3>
                                        <p>Nhà phân tích Tiếp thị, Quản trị Hồ sơ Xã hội & Nhiều hơn nữa</p>
                                    </div>
                                </a>

                                <!-- Category Box -->
                                <a href="jobs-grid-layout-full-page.html" class="category-box">
                                    <div class="category-box-icon">
                                        <i class="icon-line-awesome-graduation-cap"></i>
                                    </div>
                                    <div class="category-box-counter">445</div>
                                    <div class="category-box-content">
                                        <h3>Giáo Dục & Đào Tạo</h3>
                                        <p>Cố vấn, Huấn luyện viên, Điều phối viên Giáo dục & Nhiều hơn nữa</p>
                                    </div>
                                </a>

                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!-- Category Boxes / End -->


            <!-- Features Jobs -->
            <div class="section gray margin-top-45 padding-top-65 padding-bottom-75">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">

                            <!-- Section Headline -->
                            <div class="section-headline margin-top-0 margin-bottom-35">
                                <h3>Công Việc Nổi Bật</h3>
                                <a href="jobs-list-layout-full-page-map.html" class="headline-link">Xem Tất Cả Công Việc</a>
                            </div>

                            <!-- Jobs Container -->
                            <div class="listings-container compact-list-layout margin-top-35">

                                <!-- Job Listing -->
                                <a href="single-job-page.html" class="job-listing with-apply-button">

                                    <!-- Job Listing Details -->
                                    <div class="job-listing-details">

                                        <!-- Logo -->
                                        <div class="job-listing-company-logo">
                                            <img src="images/company-logo-01.png" alt="">
                                        </div>

                                        <!-- Details -->
                                        <div class="job-listing-description">
                                            <h3 class="job-listing-title">Chuyên Viên Hỗ Trợ Sự Kiện Bilingual</h3>

                                            <!-- Job Listing Footer -->
                                            <div class="job-listing-footer">
                                                <ul>
                                                    <li><i class="icon-material-outline-business"></i> Hexagon <div class="verified-badge" title="Nhà tuyển dụng đã xác minh" data-tippy-placement="top"></div></li>
                                                    <li><i class="icon-material-outline-location-on"></i> San Francisco</li>
                                                    <li><i class="icon-material-outline-business-center"></i> Toàn thời gian</li>
                                                    <li><i class="icon-material-outline-access-time"></i> 2 ngày trước</li>
                                                </ul>
                                            </div>
                                        </div>

                                        <!-- Apply Button -->
                                        <span class="list-apply-button ripple-effect">Nộp Đơn Ngay</span>
                                    </div>
                                </a>	

                                <!-- Job Listing -->
                                <a href="single-job-page.html" class="job-listing with-apply-button">

                                    <!-- Job Listing Details -->
                                    <div class="job-listing-details">

                                        <!-- Logo -->
                                        <div class="job-listing-company-logo">
                                            <img src="images/company-logo-05.png" alt="">
                                        </div>

                                        <!-- Details -->
                                        <div class="job-listing-description">
                                            <h3 class="job-listing-title">Nhân Viên Pháp Luật Cạnh Tranh</h3>

                                            <!-- Job Listing Footer -->
                                            <div class="job-listing-footer">
                                                <ul>
                                                    <li><i class="icon-material-outline-business"></i> Laxo</li>
                                                    <li><i class="icon-material-outline-location-on"></i> San Francisco</li>
                                                    <li><i class="icon-material-outline-business-center"></i> Toàn thời gian</li>
                                                    <li><i class="icon-material-outline-access-time"></i> 2 ngày trước</li>
                                                </ul>
                                            </div>
                                        </div>

                                        <!-- Apply Button -->
                                        <span class="list-apply-button ripple-effect">Nộp Đơn Ngay</span>
                                    </div>
                                </a>

                                <!-- Job Listing -->
                                <a href="single-job-page.html" class="job-listing with-apply-button">

                                    <!-- Job Listing Details -->
                                    <div class="job-listing-details">

                                        <!-- Logo -->
                                        <div class="job-listing-company-logo">
                                            <img src="images/company-logo-02.png" alt="">
                                        </div>

                                        <!-- Details -->
                                        <div class="job-listing-description">
                                            <h3 class="job-listing-title">Barista và Nhân Viên Thu Ngân</h3>

                                            <!-- Job Listing Footer -->
                                            <div class="job-listing-footer">
                                                <ul>
                                                    <li><i class="icon-material-outline-business"></i> Coffee</li>
                                                    <li><i class="icon-material-outline-location-on"></i> San Francisco</li>
                                                    <li><i class="icon-material-outline-business-center"></i> Toàn thời gian</li>
                                                    <li><i class="icon-material-outline-access-time"></i> 2 ngày trước</li>
                                                </ul>
                                            </div>
                                        </div>

                                        <!-- Apply Button -->
                                        <span class="list-apply-button ripple-effect">Nộp Đơn Ngay</span>
                                    </div>
                                </a>

                                <!-- Job Listing -->
                                <a href="single-job-page.html" class="job-listing with-apply-button">

                                    <!-- Job Listing Details -->
                                    <div class="job-listing-details">

                                        <!-- Logo -->
                                        <div class="job-listing-company-logo">
                                            <img src="images/company-logo-03.png" alt="">
                                        </div>

                                        <!-- Details -->
                                        <div class="job-listing-description">
                                            <h3 class="job-listing-title">Giám Đốc Nhà Hàng</h3>

                                            <!-- Job Listing Footer -->
                                            <div class="job-listing-footer">
                                                <ul>
                                                    <li><i class="icon-material-outline-business"></i> King <div class="verified-badge" title="Nhà tuyển dụng đã xác minh" data-tippy-placement="top"></div></li>
                                                    <li><i class="icon-material-outline-location-on"></i> San Francisco</li>
                                                    <li><i class="icon-material-outline-business-center"></i> Toàn thời gian</li>
                                                    <li><i class="icon-material-outline-access-time"></i> 2 ngày trước</li>
                                                </ul>
                                            </div>
                                        </div>

                                        <!-- Apply Button -->
                                        <span class="list-apply-button ripple-effect">Nộp Đơn Ngay</span>
                                    </div>
                                </a>

                                <!-- Job Listing -->
                                <a href="single-job-page.html" class="job-listing with-apply-button">

                                    <!-- Job Listing Details -->
                                    <div class="job-listing-details">

                                        <!-- Logo -->
                                        <div class="job-listing-company-logo">
                                            <img src="images/company-logo-05.png" alt="">
                                        </div>

                                        <!-- Details -->
                                        <div class="job-listing-description">
                                            <h3 class="job-listing-title">Điều Phối Viên Tiếp Thị Quốc Tế</h3>

                                            <!-- Job Listing Footer -->
                                            <div class="job-listing-footer">
                                                <ul>
                                                    <li><i class="icon-material-outline-business"></i> Skyist</li>
                                                    <li><i class="icon-material-outline-location-on"></i> San Francisco</li>
                                                    <li><i class="icon-material-outline-business-center"></i> Toàn thời gian</li>
                                                    <li><i class="icon-material-outline-access-time"></i> 2 ngày trước</li>
                                                </ul>
                                            </div>
                                        </div>

                                        <!-- Apply Button -->
                                        <span class="list-apply-button ripple-effect">Nộp Đơn Ngay</span>
                                    </div>
                                </a>

                            </div>
                            <!-- Jobs Container / End -->

                        </div>
                    </div>
                </div>
            </div>
            <!-- Featured Jobs / End -->

            <!-- Features Cities -->
            <div class="section margin-top-65 margin-bottom-65">
                <div class="container">
                    <div class="row">

                        <!-- Section Headline -->
                        <div class="col-xl-12">
                            <div class="section-headline centered margin-top-0 margin-bottom-45">
                                <h3>Các Thành Phố Nổi Bật</h3>
                            </div>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <!-- Photo Box -->
                            <a href="jobs-list-layout-1.html" class="photo-box" data-background-image="images/featured-city-01.jpg">
                                <div class="photo-box-content">
                                    <h3>San Francisco</h3>
                                    <span>376 Công Việc</span>
                                </div>
                            </a>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <!-- Photo Box -->
                            <a href="jobs-list-layout-full-page-map.html" class="photo-box" data-background-image="images/featured-city-02.jpg">
                                <div class="photo-box-content">
                                    <h3>New York</h3>
                                    <span>645 Công Việc</span>
                                </div>
                            </a>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <!-- Photo Box -->
                            <a href="jobs-grid-layout-full-page.html" class="photo-box" data-background-image="images/featured-city-03.jpg">
                                <div class="photo-box-content">
                                    <h3>Los Angeles</h3>
                                    <span>832 Công Việc</span>
                                </div>
                            </a>
                        </div>

                        <div class="col-xl-3 col-md-6">
                            <!-- Photo Box -->
                            <a href="jobs-list-layout-2.html" class="photo-box" data-background-image="images/featured-city-04.jpg">
                                <div class="photo-box-content">
                                    <h3>Miami</h3>
                                    <span>513 Công Việc</span>
                                </div>
                            </a>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Features Cities / End -->

            <!-- Footer
            ================================================== -->
        </div>
        <!-- Wrapper / End -->
        

        <!-- Sign In Popup
        ================================================== -->
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

                        <!-- Account Type -->


                        <!-- Form -->
                        <form method="post" id="register-account-form" action="./Register">
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
                                   <%
                                       }
                                   %>
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

            // Autocomplete adjustment for homepage
            if ($('.intro-banner-search-form')[0]) {
                setTimeout(function () {
                    $(".pac-container").prependTo(".intro-search-field.with-autocomplete");
                }, 300);
            }

        </script>

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

            <% if (request.getAttribute("error") != null) { %>
            // Thiết lập lại vị trí cho error nếu bị ghi đè
    toastr.error('<%= request.getAttribute("error") %>');
            <% } %>
        </script>

        <!-- Google API & Maps -->
        <!-- Geting an API Key: https://developers.google.com/maps/documentation/javascript/get-api-key -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaoOT9ioUE4SA8h-anaFyU4K63a7H-7bc&amp;libraries=places"></script>

    </body>

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/index-logged-out.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:35:00 GMT -->
</html>