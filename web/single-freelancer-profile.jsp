<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/single-freelancer-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:45 GMT -->
    <head>
        
        <jsp:useBean id="jobGreetingDao" class="jobtrans.dal.JobGreetingDAO" scope="session"></jsp:useBean>
        <jsp:useBean id="jobDao" class="jobtrans.dal.JobDAO" scope="session"></jsp:useBean>
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
        <body>

            <!-- Wrapper -->
            <div id="wrapper">
            <%@include file="includes/header.jsp" %>
            <div class="clearfix"></div>    



            <!-- Titlebar
            ================================================== -->
            <div class="single-page-header freelancer-header" data-background-image="images/single-freelancer.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="single-page-header-inner">
                                <div class="left-side">
                                    <div class="header-image freelancer-avatar"><img src="${user.avatarUrl}" alt=""></div>
                                    <div class="header-details">
                                        <h3>${user.userName} <span>${user.specification}</span></h3>
                                        <ul>
                                            <li><div class="star-rating" data-rating="5.0"></div></li>
                                            <li>${user.address}</li>
                                            <li><div class="verified-badge-with-title">Đã xác minh</div></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="right-side">
                                        
                  <form id="banForm" action="AccountManagement" method="get">
    <input type="hidden" name="userId" value="${user.userId}">
    
    <!-- Nút Xem Chi Tiết -->
    <button type="submit" name="action" value="viewComplain" class="button ripple-effect" style="margin-right: 10px;">
        Xem chi tiết khiếu nại
    </button>

    <!-- Nút Chặn sẽ gọi hàm confirmBan() để hiển thị pop-up xác nhận -->
   <button type="submit" name="action"  class="button ripple-effect" onclick="confirmBan(event)">Chặn </button> 
</form>

<script>
    // Hàm hiển thị pop-up xác nhận
    function confirmBan(event) {
        event.preventDefault(); // Ngăn chặn việc submit form ngay lập tức

        // Hiển thị hộp thoại xác nhận
        var confirmation = confirm("Bạn có chắc chắn muốn chặn người dùng này không?");
        
        // Nếu người dùng xác nhận, submit form
             if (confirmation) {
            // Thay đổi giá trị action của form để hướng đến banUser
            var form = document.getElementById("banForm");
            var actionInput = document.createElement("input"); // Tạo một input ẩn
            actionInput.type = "hidden"; // Thiết lập type là hidden
            actionInput.name = "action"; // Thiết lập tên cho input
            actionInput.value = "banUser"; // Thiết lập giá trị là "banUser"
            form.appendChild(actionInput); // Thêm input vào form
            form.submit(); // Submit form
        }
    }
</script>

                                       
                                    
                                </div> 
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!-- Nội dung trang
            ================================================== -->
            <div class="container">
                <div class="row">

                    <!-- Nội dung -->
                    <div class="col-xl-8 col-lg-8 content-right-offset">

                        <!-- Nội dung trang -->
                        <div class="single-page-section">
                            <h3 class="margin-bottom-25">Giới thiệu về tôi</h3>
                            <p style="word-wrap: break-word;">${user.description}</p>
                        </div

                        <!-- Danh sách đóng gói -->
                        <div class="boxed-list margin-bottom-60">
                            <div class="boxed-list-headline">
                                <h3><i class="icon-material-outline-business"></i> Lịch sử việc làm</h3>
                            </div>


                            <c:choose>
                                <c:when test="${not empty jobDao.getJobsByJobSeekerId(user.userId)}">
                                    <ul class="boxed-list-ul">
                                        <c:forEach var="job" items="${jobDao.getJobsByJobSeekerId(user.userId)}">
                                            <li>
                                                <div class="boxed-list-item">
                                                    <div class="item-content">
                                                        <h4>${job.jobTitle} <span>Trạng thái: ${jobGreetingDao.getJobGreetingBySeekerID(user.userId).status}</span></h4>
                                                        <div class="item-details margin-top-7">
                                                            <div class="detail-item"><i class="icon-material-outline-date-range"></i>Ngày hoàn thành: ${job.dueDate}</div>
                                                        </div>
                                                        <div class="item-description">
                                                            <p>Lập trình viên xuất sắc - hoàn thành dự án của tôi một cách rất chuyên nghiệp.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>

                                    <!-- Hiển thị các liên kết phân trang -->
                                    <div class="pagination">

                                    </div>

                                </c:when>
                                <c:otherwise>
                                    <p>Chưa có công việc nào trước đây.</p>
                                </c:otherwise>
                            </c:choose>

                            <!-- Phân trang -->
                            <div class="clearfix"></div>
                            <div class="pagination-container margin-top-40 margin-bottom-10">
                                <nav class="pagination">
                                    <ul>
                                        <li><a href="#" class="ripple-effect current-page">1</a></li>
                                        <li><a href="#" class="ripple-effect">2</a></li>
                                        <li class="pagination-arrow"><a href="#" class="ripple-effect"><i class="icon-material-outline-keyboard-arrow-right"></i></a></li>
                                    </ul>
                                </nav>
                            </div>
                            <div class="clearfix"></div>
                            <!-- Phân trang / Kết thúc -->

                        </div>
                        <!-- Danh sách đóng gói / Kết thúc -->

                        <!-- Danh sách đóng gói -->
                        <div class="boxed-list margin-bottom-60">
                            <div class="boxed-list-headline">
                                <h3><i class="icon-material-outline-business"></i> Lịch sử việc làm</h3>
                            </div>
                            <ul class="boxed-list-ul">
                                <li>
                                    <div class="boxed-list-item">
                                        <!-- Hình đại diện -->
                                        <div class="item-image">
                                            <img src="images/browse-companies-03.png" alt="">
                                        </div>

                                        <!-- Nội dung -->
                                        <div class="item-content">
                                            <h4>Trưởng nhóm phát triển</h4>
                                            <div class="item-details margin-top-7">
                                                <div class="detail-item"><a href="#"><i class="icon-material-   outline-business"></i> Acodia</a></div>
                                                <div class="detail-item"><i class="icon-material-outline-date-range"></i> Tháng 5 năm 2019 - Hiện tại</div>
                                            </div>
                                            <div class="item-description">
                                                <p>Tập trung đội ngũ vào các nhiệm vụ hiện tại hoặc yêu cầu của khách hàng bên trong và bên ngoài.</p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="boxed-list-item">
                                        <!-- Hình đại diện -->
                                        <div class="item-image">
                                            <img src="images/browse-companies-04.png" alt="">
                                        </div>

                                        <!-- Nội dung -->
                                        <div class="item-content">
                                            <h4><a href="#">Trưởng bộ phận thiết kế UX/UI</a></h4>
                                            <div class="item-details margin-top-7">
                                                <div class="detail-item"><a href="#"><i class="icon-material-outline-business"></i> Acorta</a></div>
                                                <div class="detail-item"><i class="icon-material-outline-date-range"></i> Tháng 4 năm 2014 - Tháng 5 năm 2019</div>
                                            </div>
                                            <div class="item-description">
                                                <p>Tôi đã thiết kế và triển khai hơn 10 hệ thống CRM dựa trên web, hệ thống quy trình công việc, giải pháp thanh toán và ứng dụng di động tùy chỉnh.</p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- Danh sách đóng gói / Kết thúc -->

                    </div>


                    <!-- Thanh bên -->
                    <div class="col-xl-4 col-lg-4">
                        <div class="sidebar-container">

                            <!-- Tổng quan hồ sơ -->
                            <div class="profile-overview">
                                <div class="overview-item"><strong>Thời gian làm việc</strong> 2019 - hiện tại</div>
                                <div class="overview-item"><strong>Số lượng dự án hoàn thành</strong> 46</div>
                                <div class="overview-item"><strong>Số lượng khách hàng</strong> 34</div>
                            </div>

                            <!-- Thống kê / Lịch sử việc làm -->
                            <div class="sidebar-widget">
                                <h3 class="margin-top-0 margin-bottom-30">Khách hàng của tôi</h3>
                                <ul class="dashboard-box-list">
                                    <li>
                                        <div class="dashboard-box-list-item">
                                            <img src="images/user-avatar-02.jpg" alt="">
                                            <div class="item-content">
                                                <h4>Jonathon Doe</h4>
                                                <span>Khách hàng</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dashboard-box-list-item">
                                            <img src="images/user-avatar-03.jpg" alt="">
                                            <div class="item-content">
                                                <h4>Peter Parker</h4>
                                                <span>Khách hàng</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dashboard-box-list-item">
                                            <img src="images/user-avatar-04.jpg" alt="">
                                            <div class="item-content">
                                                <h4>Mary Smith</h4>
                                                <span>Khách hàng</span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                        </div>
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


        <!-- Make an Offer Popup
        ================================================== -->
        <div id="small-dialog" class="zoom-anim-dialog mfp-hide dialog-with-tabs">

            <!--Tabs -->
            <div class="sign-in-form">

                <ul class="popup-tabs-nav">
                    <li><a href="#tab">Gửi Đề Nghị</a></li>
                </ul>

                <div class="popup-tabs-container">

                    <!-- Tab -->
                    <div class="popup-tab-content" id="tab">

                        <!-- Welcome Text -->
                        <div class="welcome-text">
                            <h3>Thảo luận về dự án của bạn với David</h3>
                        </div>

                        <!-- Form -->
                        <form method="post">

                            <div class="input-with-icon-left">
                                <i class="icon-material-outline-account-circle"></i>
                                <input type="text" class="input-text with-border" name="name" id="name" placeholder="Họ và Tên"/>
                            </div>

                            <div class="input-with-icon-left">
                                <i class="icon-material-baseline-mail-outline"></i>
                                <input type="text" class="input-text with-border" name="emailaddress" id="emailaddress" placeholder="Địa Chỉ Email"/>
                            </div>

                            <textarea name="textarea" cols="10" placeholder="Tin Nhắn" class="with-border"></textarea>

                            <div class="uploadButton margin-top-25">
                                <input class="uploadButton-input" type="file" accept="image/*, application/pdf" id="upload" multiple/>
                                <label class="uploadButton-button ripple-effect" for="upload">Thêm Tệp Đính Kèm</label>
                                <span class="uploadButton-file-name">Các loại tệp được phép: zip, pdf, png, jpg <br> Kích thước tối đa: 50 MB.</span>
                            </div>

                        </form>

                        <!-- Button -->
                        <button class="button margin-top-35 full-width button-sliding-icon ripple-effect" type="submit">Gửi Đề Nghị <i class="icon-material-outline-arrow-right-alt"></i></button>

                    </div>
                    <!-- Login -->
                    <div class="popup-tab-content" id="loginn">

                        <!-- Welcome Text -->
                        <div class="welcome-text">
                            <h3>Thảo luận về dự án của bạn với Tom</h3>
                        </div>

                        <!-- Form -->
                        <form method="post" id="make-an-offer-form">

                            <div class="input-with-icon-left">
                                <i class="icon-material-outline-account-circle"></i>
                                <input type="text" class="input-text with-border" name="name2" id="name2" placeholder="Họ và Tên" required/>
                            </div>

                            <div class="input-with-icon-left">
                                <i class="icon-material-baseline-mail-outline"></i>
                                <input type="text" class="input-text with-border" name="emailaddress2" id="emailaddress2" placeholder="Địa Chỉ Email" required/>
                            </div>

                            <textarea name="textarea" cols="10" placeholder="Tin Nhắn" class="with-border"></textarea>

                            <div class="uploadButton margin-top-25">
                                <input class="uploadButton-input" type="file" accept="image/*, application/pdf" id="upload-cv" multiple/>
                                <label class="uploadButton-button" for="upload-cv">Thêm Tệp Đính Kèm</label>
                                <span class="uploadButton-file-name">Các loại tệp được phép: zip, pdf, png, jpg <br> Kích thước tối đa: 50 MB.</span>
                            </div>

                        </form>

                        <!-- Button -->
                        <button class="button full-width button-sliding-icon ripple-effect" type="submit" form="make-an-offer-form">Gửi Đề Nghị <i class="icon-material-outline-arrow-right-alt"></i></button>

                    </div>

                </div>
            </div>
        </div>

        <!-- Make an Offer Popup / End -->



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

    </body>

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/single-freelancer-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:45 GMT -->
</html>