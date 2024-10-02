<%-- 
    Document   : dashboard-settings
    Created on : Sep 17, 2024, 10:27:27 AM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

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
                <div class="dashboard-sidebar">
                    <div class="dashboard-sidebar-inner" data-simplebar>
                            <div class="dashboard-nav-container">

                                    <!-- Responsive Navigation Trigger -->
                                    <a href="#" class="dashboard-responsive-nav-trigger">
                                            <span class="hamburger hamburger--collapse">
                                                    <span class="hamburger-box">
                                                            <span class="hamburger-inner"></span>
                                                    </span>
                                            </span>
                                            <span class="trigger-title">Điều Hướng</span>
                                    </a>

                                    <!-- Navigation -->
                                    <div class="dashboard-nav">
                                            <div class="dashboard-nav-inner">

                                                    <ul data-submenu-title="Bắt đầu">
                                                            <li><a href="dashboard.html"><i class="icon-material-outline-dashboard"></i> Bảng Điều Khiển</a></li>
                                                            <li><a href="dashboard-messages.html"><i class="icon-material-outline-question-answer"></i> Tin Nhắn <span class="nav-tag">2</span></a></li>
                                                            <li><a href="dashboard-bookmarks.html"><i class="icon-material-outline-star-border"></i> Đánh Dấu</a></li>
                                                            <li><a href="dashboard-reviews.html"><i class="icon-material-outline-rate-review"></i> Đánh Giá</a></li>
                                                    </ul>

                                                    <ul data-submenu-title="Tổ chức và Quản lý">
                                                            <li><a href="#"><i class="icon-material-outline-business-center"></i> Công Việc</a>
                                                                    <ul>
                                                                            <li><a href="dashboard-manage-jobs.html">Quản Lý Công Việc <span class="nav-tag">3</span></a></li>
                                                                            <li><a href="dashboard-manage-candidates.html">Quản Lý Ứng Viên</a></li>
                                                                            <li><a href="dashboard-post-a-job.html">Đăng Vông Việc</a></li>
                                                                    </ul>	
                                                            </li>
                                                            <li><a href="#"><i class="icon-material-outline-assignment"></i> Nhiệm Vụ</a>
                                                                    <ul>
                                                                            <li><a href="dashboard-manage-tasks.html">Quản Lý Nhiệm Vụ <span class="nav-tag">2</span></a></li>
                                                                            <li><a href="dashboard-manage-bidders.html">Quản Lý Người Đấu Thầu</a></li>
                                                                            <li><a href="dashboard-my-active-bids.html">Đấu Thầu Đang Hoạt Động <span class="nav-tag">4</span></a></li>
                                                                            <li><a href="dashboard-post-a-task.html">Đăng Nhiệm Vụ</a></li>
                                                                    </ul>	
                                                            </li>
                                                    </ul>

                                                    <ul data-submenu-title="Tài khoản">
                                                            <li class="active"><a href="dashboard-settings.html"><i class="icon-material-outline-settings"></i> Cài Đặt</a></li>
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
                    <form action="UpdateServlet" method="post" enctype="multipart/form-data">
                    <div class="dashboard-content-inner" >

                        <!-- Dashboard Headline -->
                        <div class="dashboard-headline">
                            <h3>Cài Đặt</h3>

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
                                        <h3><i class="icon-material-outline-account-circle"></i> Tài Khoản Của Tôi</h3>
                                    </div>

                                    <div class="content with-padding padding-bottom-0">
                                        
                                        <div class="row">

                                            <div class="col-auto">
                                                <div class="avatar-wrapper" data-tippy-placement="bottom" title="Change Avatar">
                                                    <img class="profile-pic" src="${User.avatarUrl != null ? User.avatarUrl : 'images/user-avatar-placeholder.png'}" alt="" />
                                                    <div class="upload-button"></div>
                                                    <input class="file-upload" type="file" name="avatar" accept="image/*"/>
                                                </div>
                                            </div>

                                            <div class="col">
                                                <div class="row">

                                                    <div class="col-xl-6">
                                                        <div class="submit-field">
                                                            <h5>Tên Người Dùng: </h5>
                                                            <input type="text" class="with-border" name="user_name" value="${User.userName}">
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6">
                                                        <div class="submit-field">
                                                            <h5>Chuyên Môn: </h5>
                                                            <input type="text" name="specification" class="with-border" }">
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-6">
                                                        <div class="submit-field">
                                                            <h5>Địa Chỉ: </h5>
                                                            <input type="text" name="address" class="with-border" }">
                                                        </div>
                                                    </div>


                                                    <div class="col-xl-6">
                                                        <!-- Account Type -->
                                                        <div class="submit-field">
                                                            <h5>Loại tài khoản</h5>
                                                            <div class="account-type">
                                                                <div>
                                                                    <input type="radio" name="account-type-radio" value ="Seeker" id="freelancer-radio" class="account-type-radio" checked/>
                                                                    <label for="freelancer-radio" class="ripple-effect-dark"><i class="icon-material-outline-account-circle"></i> Freelancer</label>
                                                                </div>

                                                                <div>
                                                                    <input type="radio" name="account-type-radio" value ="Employer" id="employer-radio" class="account-type-radio"/>
                                                                    <label for="employer-radio" class="ripple-effect-dark"><i class="icon-material-outline-business-center"></i> Nhà Tuyển Dụng</label>
                                                                </div>
                                                            </div>
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
                                    <div class="col-xl-12">
                                        <div class="submit-field">
                                            <h5>Giới Thiệu Bản Thân</h5>
                                            <textarea cols="30" rows="5"  placeholder="Nhập mô tả" name="description" class="with-border"}"></textarea>
                                        </div>
                                    </div>

                                </div>
                                </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-12">
                        <input type="submit" class="button ripple-effect big margin-top-30"></a>
                    </div>
</form>
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

<!-- Google API -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaoOT9ioUE4SA8h-anaFyU4K63a7H-7bc&amp;libraries=places&amp;callback=initAutocomplete"></script>
<script>
        // Kiểm tra xem có thông báo thành công hay không
            <% if (request.getAttribute("success") != null) { %>
                toastr.success('<%= request.getAttribute("success") %>');
            <% } %>
            <% if (request.getAttribute("error") != null) { %>
                toastr.error('<%= request.getAttribute("error") %>');
            <% } %>
</script>

</body>

<!-- Mirrored from www.vasterad.com/themes/hireo_21/dashboard-settings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:35:14 GMT -->
</html>