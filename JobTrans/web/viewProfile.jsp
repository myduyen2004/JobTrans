<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/dashboard-settings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:35:14 GMT -->
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
            <%@include file="/includes/header.jsp" %>
            <div class="clearfix"></div>
            <!-- Header Container / End -->


            <!-- Dashboard Container -->
            <div class="dashboard-container">

                <!-- Dashboard Sidebar
                ================================================== -->
                <%@include file="/includes/sidebar.jsp" %>

                <!-- Dashboard Sidebar / End -->


                <!-- Dashboard Content
                ================================================== -->
                <div class="dashboard-content-container" data-simplebar>
                    <div class="dashboard-content-inner" >

                        <!-- Dashboard Headline -->
                        <div class="dashboard-headline">
                            <h3>Settings</h3>

                            <!-- Breadcrumbs -->
                            <nav id="breadcrumbs" class="dark">
                                <ul>
                                    <li><a href="#">Trang Chủ</a></li>
                                    <li><a href="#">Bảng Điều Khiển</a></li>
                                    <li>Cài Đặt</li>
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
                                        <h3><i class="icon-material-outline-account-circle"></i> Trang Cá Nhân Của Tôi</h3>
                                    </div>

                                    <div class="content with-padding padding-bottom-0">

                                        <div class="row">
                                            <div class="col-auto">
                                                <div class="avatar-wrapper" data-tippy-placement="bottom" title="Change Avatar">

                                                    <img class="profile-pic" src="${user.avatarUrl != null ? user.avatarUrl : 'images/user-avatar-placeholder.png'}" alt="Profile Picture" />

                                                    <div class="upload-button"></div>
                                                    <input class="file-upload" type="file" accept="image/*"/>
                                                </div>
                                            </div>

                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-xl-6">
                                                        <div class="submit-field">

                                                            <% 
                                                             role = session.getAttribute("role");
                                                            if (role.equals("Employer")) { 
                                                            %>
                                                            <h5>Tên Nhà Tuyển Dụng</h5>
                                                            <%}%>
                                                            <%if (role.equals("Seeker")) { %>
                                                            <h5>Họ và Tên</h5>
                                                            <%}%>
                                                            <%if (role.equals("Admin")) { %>
                                                            <h5>Quản Trị Viên</h5>
                                                            <%}%>
                                                            <span class="with-border">${user.userName}</span> <!-- Hiển thị tên người dùng -->
                                                        </div>
                                                    </div>

                                                    <div class="col-xl-6">
                                                        <div class="submit-field">
                                                            <h5>Email</h5>
                                                            <span class="with-border">${user.email}</span> <!-- Hiển thị email -->
                                                        </div>
                                                    </div>

                                                    <div class="col-xl-6">
                                                        <!-- Account Type -->
                                                        <div class="submit-field">
                                                            <h5>Vai Trò</h5>
                                                            <div class="account-type">
                                                                <div>
                                                                    <span class="with-border">
                                                                        <i class="icon-material-outline-account-circle"></i> 
                                                                        ${user.role}
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-xl-6">
                                                        <div class="submit-field">
                                                            <h5>Mật Khẩu</h5>
                                                            <% 
                                                        Object password = session.getAttribute("oauthId");
                                                            if (password == null) { 
                                                            %>
                                                            <div class="password-container">
                                                                <span id="password">${user.password}</span>
                                                                <button type="button" id="togglePassword" class="btn btn-outline-secondary">
                                                                    <i id="passwordIcon" class="fas fa-eye"></i>
                                                                </button>
                                                            </div>
                                                                <%}%>
                                                               
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <!-- Dashboard Box -->
                            <div class="col-xl-12">
                                <div class="dashboard-box">

                                    <!-- Headline -->
                                    <div class="headline">
                                        <h3><i class="icon-material-outline-face"></i> Thông Tin Của Tôi</h3>
                                    </div>

                                    <div class="content">
                                        <ul class="fields-ul">
                                            <li>
                                                <div class="row">
                                                    <div class="col-xl-4">
                                                        <div class="submit-field">
                                                            <div class="bidding-widget">
                                                                <!-- Headline -->
                                                                <%if (role.equals("Employer")) { %>
                                                                <span class="bidding-detail">Số Lượng <strong>Công Việc Đã Đăng</strong></span>
                                                                <span class="with-border">${user.getQuantityOfPostedJob()}</span>
                                                                <%}%>
                                                                <%if (role.equals("Seeker")) { %>
                                                                <span class="bidding-detail">Số Lượng <strong>Công Việc Đã Ứng Tuyển</strong></span>
                                                                <span class="with-border">${user.getQuantityOfAppliedJob()}</span>
                                                                <%}%>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-xl-4">
                                                        <div class="submit-field">
                                                            <h5>Số Dư </h5>
                                                            <span class="with-border">
                                                                <span>&#36;</span>
                                                                ${user.balance}</span>

                                                        </div>
                                                    </div>

                                                    <div class="col-xl-4">
                                                        <div class="submit-field">
                                                            <h5>Chuyên Môn</h5>

                                                            <!-- Specification -->
                                                            <div class="attachments-container margin-top-0 margin-bottom-0">
                                                                <span class="with-border">${user.specification}</span>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="row">

                                                    <!-- Tagline Field -->
                                                    <div class="col-xl-6">
                                                        <div class="submit-field">
                                                            <h5>Vai Trò</h5>
                                                            <span class="with-border">${user.role}</span>  
                                                        </div>
                                                    </div>

                                                    <!-- Nationality Field -->
                                                    <div class="col-xl-6">
                                                        <div class="submit-field">
                                                            <h5>Địa Chỉ</h5>
                                                            <span class="with-border">${user.address}</span>
                                                        </div>
                                                    </div>

                                                    <!-- Introduction Field -->
                                                    <div class="col-xl-12">
                                                        <div class="submit-field">
                                                            <h5>Mô Tả Về Chúng Tôi</h5>
                                                            <span class="with-border">${user.description}</span>
                                                        </div>
                                                    </div>

                                                </div>

                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>


                            <!-- Button -->
                            <div class="col-xl-6">
                                <a href="profile?action=loadPassword" class="button ripple-effect big margin-top-30">Đổi Mật Khẩu</a>
                            </div>

                            <div class="col-xl-6">
                                <a href="UpdateServlet?action=load" class="button ripple-effect big margin-top-30">Chỉnh Sửa Thông Tin</a>
                            </div>
                        </div>

                        <!-- Row / End -->

                        <!-- Footer -->
                        <div class="dashboard-footer-spacer"></div>
                        <div class="small-footer margin-top-15">
                            <div class="small-footer-copyrights">
                                © 2024<strong>JOBTRANS</strong>. All Rights Reserved.
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
                            data: [196, 132, 215, 362, 210, 252],
                            pointRadius: 5,
                            pointHoverRadius: 5,
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

                    legend: {display: false},
                    title: {display: false},

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
                                scaleLabel: {display: false},
                                gridLines: {display: false},
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
                    setTimeout(function () {
                        $(".pac-container").prependTo("#autocomplete-container");
                    }, 300);
                }
            }
        </script>


        <!-- Ẩn và hiện mật khẩu -->
        <script>
            document.getElementById('togglePassword').addEventListener('click', function () {
                var passwordField = document.getElementById('password');
                var passwordIcon = document.getElementById('passwordIcon');
                if (passwordField.type === 'password') {
                    passwordField.type = 'text';
                    passwordIcon.classList.remove('fa-eye');
                    passwordIcon.classList.add('fa-eye-slash');
                } else {
                    passwordField.type = 'password';
                    passwordIcon.classList.remove('fa-eye-slash');
                    passwordIcon.classList.add('fa-eye');
                }
            });
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaoOT9ioUE4SA8h-anaFyU4K63a7H-7bc&amp;libraries=places&amp;callback=initAutocomplete"></script>
    </body>
</html>
