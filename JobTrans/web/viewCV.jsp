<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <!-- Row -->
			<div class="row">

				<!-- Dashboard Box -->
				<div class="col-xl-12">
					<div class="dashboard-box margin-top-0">

						<!-- Headline -->
						<div class="headline">
							<h3><i class="icon-material-outline-business-center"></i> Danh sách CV đã được tạo</h3>
						</div>

						<div class="content">
							<ul class="dashboard-box-list">
								<li>
									<!-- Job Listing -->
									<div class="job-listing">

										<!-- Job Listing Details -->
										<div class="job-listing-details">

											
											
                                                                                         
											<!-- Details -->
											<div class="job-listing-description">
                                                                                                <c:forEach items="${listcv}" var="o">
                                                                                                    <div class="headline">
												<h3 class="job-listing-title"><a href="#"></a>${o.createdAt}</h3>

												<!-- Job Listing Footer -->
												<div class="job-listing-footer">
													<ul>
														<li><i class="icon-material-outline-business"></i> ${o.title}</li>
													
													</ul>
												</div> 
<!--                                                                                                <div class="buttons-to-right">
										                <a href="#" class="button red ripple-effect ico" title="Remove" data-tippy-placement="left"><i class="icon-feather-trash-2"></i></a>
                                                                                             
									                        </div>-->
                                                                                                <div>
                                                                                                    <a href="detailCV?action=view&cvId=${o.cvId}" class="button ripple-effect big margin-top-30">Xem CV</a>

                                                                                                    <a href="detailCV?action=delete&cvId=${o.cvId}" class="button ripple-effect big margin-top-30">Xoá CV</a>

                                                                                                
                                                                                                  </div>              
                                                                                                    </div>
                                                                                                                
                                                                                                                
                                                                                                                 </c:forEach> 
                                                                                                               
											                                                                                                                </div>
                                                                                        
										</div>
                                                                                                               
									</div>
									<!-- Buttons -->
									
                                                                        
                                                                </li>					

							</ul>
						</div>
					</div>
				</div>


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
