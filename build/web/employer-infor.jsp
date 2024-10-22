<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">
    <head>
        <title>Chi tiết nhà tuyển dụng</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/colors/blue.css">
        <link rel="stylesheet" href="css/other.css">

    </head>
    <body>
        <div id="wrapper">
            <%@include file="includes/header.jsp" %>
            <div class="clearfix"></div>
            <div class="single-page-header" data-background-image="images/single-company.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="single-page-header-inner">
                                <div class="left-side">
                                    <div class="header-image"><img src="${detail.avatarUrl}" alt=""></div>
                                    <div class="header-details">
                                        <h3>${detail.userName}<span></span></h3>
                                        <ul>
                                            <li><img class="flag" src="images/flags/vn.png" alt=""> ${detail.address}</li>
                                            <li><div class="verified-badge-with-title">Đã Xác Minh</div></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="right-side">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Nội Dung Trang -->
            <div class="container">
                <div class="row">

                    <!-- Nội Dung -->
                    <div class="col-xl-12 col-lg-12 content-right-offset">

                        <div class="single-page-section">
                            <h3 class="margin-bottom-25">Giới Thiệu Về Nhà Tuyển Dụng</h3>
                            <p style="word-wrap: break-word;">${detail.description}</p>
                        </div>

                        <!-- Danh Sách Công Việc -->
                        <div class="boxed-list margin-bottom-60">
                            <div class="boxed-list-headline">
                                <h3><i class="icon-material-outline-business-center"></i> Các công việc đã đăng</h3>
                            </div>

                            <div class="listings-container compact-list-layout">

                                <c:forEach items="${posted}" var="post">
                                <!-- Công Việc -->
                                <a href="home?action=jobDetail&jobId=${post.jobId}" class="job-listing">
                                    
                                    <div class="job-listing-details col-10">
                                        <div class="job-listing-description">
                                            <h3 class="job-listing-title">${post.jobTitle}</h3>
                                            <div class="job-listing-footer">
                                                <ul>
                                                    <li><i class="icon-material-outline-location-on"></i> ${post.address}</li>
                                                    <li><i class="icon-material-outline-access-time"></i>  ${post.dueDate}</li>
                                                    <li><div class="verified-badge-with-title">Đã Xác Minh</div></li>
                                                </ul>
                                            </div>
                                        </div>
                                         <div class="task-offers">
                                             <div style="font-size: 20px; color: black">
                                                                <fmt:formatNumber value="${post.budget}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" /> VNĐ</div>
                                                        </div>
                                                </div>
                                </a>
                                                
                                </c:forEach>
                            </div>

                        </div>
                        
                        <div class="boxed-list margin-bottom-60">
                            <div class="boxed-list-headline">
                                <h3><i class="icon-material-outline-thumb-up"></i> Đánh Giá</h3>
                            </div>
                            <ul class="boxed-list-ul">
                                <c:forEach items="${posted}" var="post">
                                    <c:if test="${post.status == 'Đã trả lương'}">
                                        <li>
                                    <div class="boxed-list-item">
                                        <div class="item-content">
                                            <h4>${post.jobTitle} <span>${post.status}</span></h4>
                                            <div class="item-description">
                                                <p>${post.employerFeedback}</p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                    </c:if>
                                
                                </c:forEach>
                            </ul>
                            
                            <div class="centered-button margin-top-35">
                                <a href="#small-dialog" class="popup-with-zoom-anim button button-sliding-icon">Để Lại Đánh Giá <i class="icon-material-outline-arrow-right-alt"></i></a>
                            </div>

                        </div>
                        <!-- Đánh Giá / Kết Thúc -->

                    </div>

                </div>
            </div>



            <!-- Spacer -->
            <div class="margin-top-15"></div>
            <!-- Spacer / End-->

            <!-- Footer
            ================================================== -->
            <%@include file="includes/footer.jsp" %>%>

            <!-- Footer / End -->

        </div>
        <!-- Wrapper / End -->


        <!-- Leave a Review Popup
        ================================================== -->
        <div id="small-dialog" class="zoom-anim-dialog mfp-hide dialog-with-tabs">

            <!--Tabs -->
            <div class="sign-in-form">

                <ul class="popup-tabs-nav">
                    <li><a href="#tab">Để Lại Đánh Giá</a></li>
                </ul>

                <div class="popup-tabs-container">

                    <!-- Tab -->
                    <div class="popup-tab-content" id="tab">

                        <!-- Welcome Text -->
                        <div class="welcome-text">
                            <h3>Làm việc tại Acodia như thế nào?</h3>

                            <!-- Form -->
                            <form method="post" id="leave-company-review-form">

                                <!-- Để Lại Đánh Giá -->
                                <div class="clearfix"></div>
                                <div class="leave-rating-container">
                                    <div class="leave-rating margin-bottom-5">
                                        <input type="radio" name="rating" id="rating-1" value="1" required>
                                        <label for="rating-1" class="icon-material-outline-star"></label>
                                        <input type="radio" name="rating" id="rating-2" value="2" required>
                                        <label for="rating-2" class="icon-material-outline-star"></label>
                                        <input type="radio" name="rating" id="rating-3" value="3" required>
                                        <label for="rating-3" class="icon-material-outline-star"></label>
                                        <input type="radio" name="rating" id="rating-4" value="4" required>
                                        <label for="rating-4" class="icon-material-outline-star"></label>
                                        <input type="radio" name="rating" id="rating-5" value="5" required>
                                        <label for="rating-5" class="icon-material-outline-star"></label>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <!-- Để Lại Đánh Giá / Kết Thúc-->

                        </div>


                        <div class="row">
                            <div class="col-xl-12">
                                <div class="input-with-icon-left" title="Để trống để đánh giá ẩn danh" data-tippy-placement="bottom">
                                    <i class="icon-material-outline-account-circle"></i>
                                    <input type="text" class="input-text with-border" name="name" id="name" placeholder="Tên và Họ"/>
                                </div>
                            </div>

                            <div class="col-xl-12">
                                <div class="input-with-icon-left">
                                    <i class="icon-material-outline-rate-review"></i>
                                    <input type="text" class="input-text with-border" name="reviewtitle" id="reviewtitle" placeholder="Tiêu Đề Đánh Giá" required/>
                                </div>
                            </div>
                        </div>

                        <textarea class="with-border" placeholder="Đánh Giá" name="message" id="message" cols="7" required></textarea>

                        </form>

                        <!-- Nút -->
                        <button class="button margin-top-35 full-width button-sliding-icon ripple-effect" type="submit" form="leave-company-review-form">Gửi Đánh Giá <i class="icon-material-outline-arrow-right-alt"></i></button>

                    </div>

                </div>
            </div>
        </div>

        <!-- Leave a Review Popup / End -->


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

        // Snackbar for "place a bid" button
            $('#snackbar-place-bid').click(function () {
                Snackbar.show({
                    text: 'Your bid has been placed!',
                });
            });


        // Snackbar for copy to clipboard button
            $('.copy-url-button').click(function () {
                Snackbar.show({
                    text: 'Copied to clipboard!',
                });
            });
        </script>

        <!-- Google API & Maps -->
        <!-- Geting an API Key: https://developers.google.com/maps/documentation/javascript/get-api-key -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaoOT9ioUE4SA8h-anaFyU4K63a7H-7bc&amp;libraries=places"></script>
        <script src="js/infobox.min.js"></script>
        <script src="js/markerclusterer.js"></script>
        <script src="js/maps.js"></script>

    </body>

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/single-company-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:45 GMT -->
</html>