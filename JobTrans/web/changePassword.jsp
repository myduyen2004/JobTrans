<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Đổi Mật Khẩu</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/colors/blue.css">
    </head>

    <body class="gray">
        <div id="wrapper">
            <%@include file="/includes/header.jsp" %>
            <div class="clearfix"></div>
            <div class="dashboard-container">

                <%@include file="/includes/sidebar.jsp" %>
                <div class="dashboard-content-container" data-simplebar>
                    <div class="dashboard-content-inner" >
                        <div class="dashboard-headline">
                            <h3>Đổi mật khẩu</h3>
                        </div>
                        <div class="row">
                            <div class="col-xl-12">
                                <div id="test1" class="dashboard-box">
                                    <div class="headline">
                                        <h3><i class="icon-material-outline-lock"></i> Mật khẩu & Bảo mật</h3>
                                    </div>

                                    <form action="profile" method="GET">
                                        <div class="content with-padding">
                                            <div class="row">
                                                <!-- Mật khẩu hiện tại -->
                                                <div class="col-xl-4">
                                                    <input type="hidden" class="with-border" id="action" name="action" value="changePassword" required>
                                                    <div class="submit-field">
                                                        <h5>Mật khẩu hiện tại</h5>
                                                        <input type="password" class="with-border" id="currentPassword" name="currentPassword">
                                                    </div>
                                                </div>

                                                <!-- Mật khẩu mới -->
                                                <div class="col-xl-4">
                                                    <div class="submit-field">
                                                        <h5>Mật khẩu mới</h5>
                                                        <input type="password" class="with-border" id="newPassword" name="newPassword" required>
                                                    </div>
                                                </div>

                                                <!-- Nhập lại mật khẩu mới -->
                                                <div class="col-xl-4">
                                                    <div class="submit-field">
                                                        <h5>Nhập lại mật khẩu mới</h5>
                                                        <input type="password" class="with-border" id="repeatNewPassword" name="repeatNewPassword" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <input type="submit" class="button ripple-effect big margin-top-30" value="Thay đổi">
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>

                        </div>
                        <!-- Row / End -->

                        <!-- Footer -->
                        <%@include file="/includes/subfooter.jsp" %>
                    </div>
                </div>
            </div>
            <!-- Dashboard Content / End -->

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
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaoOT9ioUE4SA8h-anaFyU4K63a7H-7bc&amp;libraries=places&amp;callback=initAutocomplete"></script>
    </body>
