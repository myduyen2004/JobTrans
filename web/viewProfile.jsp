<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jobtrans.model.User" %>
<!doctype html>
<html lang="en">
    <head>
        <jsp:useBean id="userDAO" class="jobtrans.dal.UserDAO" scope="session"></jsp:useBean>
            <title>Hồ sơ của tôi</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/colors/blue.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        </head>
        <body class="gray">
            <!-- Wrapper -->
            <div id="wrapper">

            <%@include file="/includes/header.jsp" %>
            <div class="dashboard-container">
                <%@include file="/includes/sidebar.jsp" %>
                <div class="dashboard-content-container" data-simplebar>
                    <div class="dashboard-content-inner" >
                        <div class="dashboard-headline">
                            <h3>Thông tin</h3>
                        </div>
                        <!-- Row -->
                        <div class="row">

                            <!-- Dashboard Box -->
                            <div class="col-xl-12">
                                <div class="dashboard-box margin-top-0">

                                    <!-- Headline -->
                                    <div class="headline">
                                        <h3><i class="icon-material-outline-account-circle"></i> Trang Cá Nhân Của Tôi </h3>
                                    </div>

                                    <div class="content with-padding padding-bottom-0">

                                        <div class="row">

                                            <div class="col-auto">
                                                <div class="avatar-wrapper" data-tippy-placement="bottom">
                                                    <img class="profile-pic" src="${user.avatarUrl}" alt="Profile Picture" />

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
                                                                        <%if (role.equals("Employer")) { %>
                                                                        <i class="icon-material-outline-account-circle"></i> Nhà tuyển dụng
                                                                        <%}%>
                                                                        <%if (role.equals("Seeker")) { %>
                                                                        <i class="icon-material-outline-account-circle"></i> Người tìm việc
                                                                        <%}%>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="col-xl-6">
                                                        <div class="submit-field">
                                                            <h5>Địa chỉ</h5>
                                                            <span class="with-border">${user.address}</span>
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

                                                            <!-- Headline -->
                                                            <%if (role.equals("Employer")) { %>
                                                            <h5>Số Lượng Công Việc Đã Đăng</h5>
                                                            <span class="with-border">${userDAO.getQuantityOfPostedJob(user)}</span>
                                                            <%}%>
                                                            <%if (role.equals("Seeker")) { %>
                                                            <h5>Số Lượng Công Việc Đã Ứng Tuyển</h5>
                                                            <span class="with-border">${userDAO.getQuantityOfAppliedJob(user)}</span>
                                                            <%}%>
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

                                                    <div class="col-xl-12">
                                                        <div class="submit-field">
                                                            <h5>Mô Tả Về Chúng Tôi</h5>
                                                                <p class="with-border" style="word-wrap: break-word;">${user.description}</p>

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
                                <a href="profile?action=editProfile" class="button ripple-effect big margin-top-30">Chỉnh Sửa Thông Tin</a>
                            </div>
                        </div>
                        <%@include file="/includes/subfooter.jsp" %>
                    </div>
                </div>

            </div>

        </div>
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
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaoOT9ioUE4SA8h-anaFyU4K63a7H-7bc&amp;libraries=places&amp;callback=initAutocomplete"></script>
    </body>
</html>
