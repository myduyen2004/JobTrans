<%-- 
    Document   : index-login-logout
    Created on : Sep 17, 2024, 10:15:11 AM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import= "jobtrans.utils.CookieUtils" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="jobtrans.model.Job" %>
<%@ page import="jobtrans.model.User" %>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
    <head>
        <jsp:useBean id="job" class="jobtrans.dal.JobDAO" scope="session"></jsp:useBean>
        <jsp:useBean id="user" class="jobtrans.dal.UserDAO" scope="session"></jsp:useBean>
            <title>JobTrans</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/colors/blue.css">
            <link rel="stylesheet" href="css/other.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

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
                                    <label for="autocomplete-input" class="field-title ripple-effect">Bạn muốn trở thành: </label>
                                    <form action="role" method="GET">
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
                            <form action="home" method="get" class="intro-banner-search-form margin-top-95">
                                <div class="intro-search-field">
                                    <label for="intro-keywords" class="field-title ripple-effect">Bạn muốn công việc gì?</label>
                                    <input id="intro-keywords" name="keyword" type="text" placeholder="Tiêu đề công việc hoặc từ khóa">
                                </div>

                                <!-- Button -->
                                <div class="intro-search-button">
                                    <button type="submit" class="button ripple-effect">Tìm kiếm</button>
                                </div>

                                <!-- Hidden field for action -->
                                <input type="hidden" name="action" value="search">
                            </form>
                        </div>
                    </div>
                    <!-- Stats -->

                    <div class="row">
                        <div class="col-md-12">
                            <ul class="intro-stats margin-top-45 hide-under-992px">
                                <li>
                                    <strong class="counter">${jobList.size()}</strong>
                                    <span>Công việc đã đăng</span>
                                </li>
                                <li>
                                    <strong class="counter">${userList.size()}</strong>
                                    <span>Người dùng</span>
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
                                <c:forEach var="cat" items = "${categoryList}">
                                    <a href="jobs-grid-layout-full-page.html" class="category-box">
                                        <c:if test="${cat.categoryName == 'Hỗ Trợ Quản Trị'}">
                                            <div class="category-box-icon">
                                                <i class="icon-line-awesome-file-code-o"></i>
                                            </div>
                                        </c:if>
                                        <c:if test="${cat.categoryName == 'Dịch Vụ Khách Hàng'}">
                                            <div class="category-box-icon">
                                                <i class="icon-line-awesome-cloud-upload"></i>
                                            </div>
                                        </c:if>
                                        <c:if test="${cat.categoryName == 'Phân Tích Dữ Liệu'}">
                                            <div class="category-box-icon">
                                                <i class="icon-line-awesome-suitcase"></i>
                                            </div>
                                        </c:if>
                                        <c:if test="${cat.categoryName == 'Thiết Kế & Sáng Tạo'}">
                                            <div class="category-box-icon">
                                                <i class="icon-line-awesome-pencil"></i>
                                            </div>
                                        </c:if>
                                        <c:if test="${cat.categoryName == 'Pháp Lý'}">
                                            <div class="category-box-icon">
                                                <i class="icon-line-awesome-pie-chart"></i>
                                            </div>
                                        </c:if>
                                        <c:if test="${cat.categoryName == 'Phát Triển Phần Mềm'}">
                                            <div class="category-box-icon">
                                                <i class="icon-line-awesome-image"></i>
                                            </div>
                                        </c:if>
                                        <c:if test="${cat.categoryName == 'Công Nghệ Thông Tin & Mạng'}">
                                            <div class="category-box-icon">
                                                <i class="icon-line-awesome-bullhorn"></i>
                                            </div>
                                        </c:if>
                                        <c:if test="${cat.categoryName == 'Soạn Thảo Văn Bản'}">
                                            <div class="category-box-icon">
                                                <i class="icon-line-awesome-graduation-cap"></i>
                                            </div>
                                        </c:if>
                                        <c:if test="${cat.categoryName == 'Biên Dịch'}">
                                            <div class="category-box-icon">
                                                <i class="icon-line-awesome-pie-chart"></i>
                                            </div>
                                        </c:if>
                                        <c:if test="${cat.categoryName == 'Bán Hàng & Tiếp Thị'}">
                                            <div class="category-box-icon">
                                                <i class="icon-line-awesome-suitcase"></i>
                                            </div>
                                        </c:if>
                                        <c:if test="${cat.categoryName == 'Không xác định'}">
                                            <div class="category-box-icon">
                                                <i class="icon-line-awesome-file-code-o"></i>
                                            </div>
                                        </c:if>
                                        <div class="category-box-counter">${job.getJobByCategory(cat.categoryId).size()}</div>
                                        <div class="category-box-content">
                                            <h3>${cat.categoryName}</h3>
                                            <p>${cat.description}</p>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="section gray margin-top-45 padding-top-65 padding-bottom-75">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">

                            <!-- Section Headline -->
                            <div class="section-headline margin-top-0 margin-bottom-35">
                                <h3>Công Việc Nổi Bật</h3>
                                <a href="Jobinfor" class="headline-link">Xem Tất Cả Công Việc</a>
                            </div>

                            <!-- Jobs Container -->
                            <div class="listings-container compact-list-layout margin-top-35">

                                <!-- Job Listing -->
                                <c:forEach var="job" items="${top5Job}">
                                    <a href="single-job-page.html" class="job-listing with-apply-button">

                                        <!-- Job Listing Details -->
                                        <div class="job-listing-details">

                                            <!-- Logo -->
                                            <div class="job-listing-company-logo">
                                                <img src="${user.getUserById(job.userId).avatarUrl}" alt="">
                                            </div>

                                            <!-- Details -->
                                            <div class="job-listing-description">
                                                <h3 class="job-listing-title">${job.jobTitle}</h3>

                                                <!-- Job Listing Footer -->
                                                <div class="job-listing-footer">
                                                    <ul>
                                                        <li><i class="icon-material-outline-business"></i> ${user.getUserById(job.userId).userName} <div class="verified-badge" title="Nhà tuyển dụng đã xác minh" data-tippy-placement="top"></div></li>
                                                        <li><i class="icon-material-outline-location-on"></i> ${job.address}</li>
                                                        <li><i class="icon-material-outline-business-center"></i> ${job.budget}</li>
                                                        <li><i class="icon-material-outline-access-time"></i> ${job.dueDate}</li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <!-- Apply Button -->
                                            <span class="list-apply-button ripple-effect">Nộp Đơn Ngay</span>
                                        </div>
                                    </a>	
                                </c:forEach>

                            </div>
                            <!-- Jobs Container / End -->

                        </div>
                    </div>
                </div>
            </div>
            <!-- Featured Jobs / End -->


            <!-- Footer
            ================================================== -->
        </div>
        <!-- Wrapper / End -->
        <%@include file="/includes/footer.jsp" %>

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