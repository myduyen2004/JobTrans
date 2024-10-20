<%-- 
    Document   : dashboard-settings
    Created on : Sep 17, 2024, 10:27:27 AM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Chỉnh sửa hồ sơ</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/colors/blue.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    </head>
    <body class="gray">
        <div id="wrapper">
            <%@include file="/includes/header.jsp" %>
            <div class="dashboard-container">
                <%@include file="/includes/sidebar.jsp" %>
                <div class="dashboard-content-container" data-simplebar>
                    <form action="profile" method="post" enctype="multipart/form-data">
                        <div class="dashboard-content-inner" >
                            <div class="dashboard-headline">
                                <h3>Sửa thông tin</h3>
                            </div>
                            <div class="row">

                                <div class="col-xl-12">
                                    <div class="dashboard-box margin-top-0">
                                        <div class="headline">
                                            <h3><i class="icon-material-outline-account-circle"></i> Tài Khoản Của Tôi</h3>
                                        </div>
                                        <div class="content with-padding padding-bottom-0">
                                            <div class="row">
                                                <div class="col-auto">
                                                    <div class="avatar-wrapper" data-tippy-placement="bottom" title="Change Avatar">
                                                        <img class="profile-pic" src="${User.avatarUrl}" alt="" />
                                                        <div class="upload-button"></div>
                                                        <input class="file-upload" type="file" name="avatar" value="${User.avatarUrl}" accept="image/*"/>
                                                        <input type="hidden" name="avatemp" value="${User.avatarUrl}" accept="image/*"/>
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
                                                                <input type="text" name="specification" class="with-border" value="${User.specification}">
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-6">
                                                            <div class="submit-field">
                                                                <h5>Địa Chỉ: </h5>
                                                                <input type="text" name="address" class="with-border" value="${User.address}">
                                                            </div>
                                                        </div>
                                                        <div class="col-xl-6">
                                                            <div class="submit-field">
                                                                <h5>Ngày Sinh: </h5>
                                                                <input type="date" name="birthdate" class="with-border" value="${User.dateOfBirth}">
                                                            </div>
                                                        </div>


                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-12">
                                    <div class="dashboard-box">
                                        <div class="col-xl-12">
                                            <div class="submit-field">
                                                <h5>Giới Thiệu Bản Thân</h5>
                                                <textarea cols="30" rows="5"  placeholder="Nhập mô tả" name="description" class="with-border" value="${User.description}"></textarea>
                                            </div>
                                        </div>

                                    </div>
                                    </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <input type="submit" class="button ripple-effect big margin-top-30" value="Thay đổi"></a>
                        </div>
                    </form>
                    <%@include file="/includes/subfooter.jsp" %>
                </div>
                <!-- Row / End -->

                <!-- Footer -->

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