<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/single-freelancer-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:45 GMT -->
    <head>
        <jsp:useBean id="jobGreetingDao" class="jobtrans.dal.JobGreetingDAO" scope="session"></jsp:useBean>
        <jsp:useBean id="jobDao" class="jobtrans.dal.JobDAO" scope="session"></jsp:useBean>
        <jsp:useBean id="userDao" class="jobtrans.dal.UserDAO" scope="session"></jsp:useBean>
        <jsp:useBean id="cvDao" class="jobtrans.dal.CVDAO" scope="session"></jsp:useBean>
            <!-- Basic Page Needs
            ================================================== -->
            <title>JobTrans</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

            <!-- CSS
            ================================================== -->
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/colors/blue.css">
            <style>
                .pagination-controls ul {
                    list-style: none;
                    padding: 0;
                    display: flex;
                    justify-content: center;
                    margin-top: 20px;
                }

                .pagination-controls ul li {
                    margin: 0 5px;
                }

                .pagination-controls ul li a,
                .pagination-controls ul li span {
                    display: block;
                    padding: 10px 15px;
                    background-color: #f8f9fa;
                    border: 1px solid #dee2e6;
                    color: #007bff;
                    text-decoration: none;
                    border-radius: 4px;
                    transition: background-color 0.3s, color 0.3s;
                }

                .pagination-controls ul li a:hover {
                    background-color: #007bff;
                    color: #fff;
                }

                .pagination-controls ul li span.active {
                    background-color: #007bff;
                    color: #fff;
                    cursor: default;
                }

                .pagination-controls ul li a.current-page {
                    font-weight: bold;
                }
            </style>


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
                                            <!--                                            <li><div class="star-rating" data-rating="5.0"></div></li>-->
                                            <li>${user.address}</li>
                                            <li><div class="verified-badge-with-title">Đã xác minh</div></li>
                                        </ul>
                                    </div>
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
                            <p style="word-wrap: break-word;">${jobGreetingDao.getJobGreetingBySeekerID(user.userId).introduction}</p>
                        </div>

                        <div class="single-page-section">
                            <h3>Tệp đính kèm</h3>
                            <div class="attachments-container"> 
                                <a href="job?command=downloadJG&fileName=" 
                                   class="attachment-box ripple-effect">
                                    <span>Tóm tắt dự án</span><i>PDF</i>
                                </a>
                            </div>
                        </div>

                        <!-- Danh sách đóng gói -->
                        <div class="boxed-list margin-bottom-60">
                            <div class="boxed-list-headline">
                                <h3><i class="icon-material-outline-business"></i> Lịch sử việc làm</h3>
                            </div>

                            <c:choose>
                                <c:when test="${not empty jobDao.getJobsByJobSeekerId(user.userId)}">
                                    <ul class="boxed-list-ul">
                                        <!-- Số công việc hiển thị trên mỗi trang -->
                                        <c:set var="jobsPerPage" value="5" />
                                        <!-- Tổng số công việc -->
                                        <c:set var="totalJobs" value="${fn:length(jobDao.getJobsByJobSeekerId(user.userId))}" />
                                        <!-- Tổng số trang -->
                                        <c:set var="totalPages" value="${(totalJobs / jobsPerPage) + (totalJobs % jobsPerPage > 0 ? 1 : 0)}" />
                                        <!-- Trang hiện tại -->
                                        <c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
                                        <!-- Chỉ số bắt đầu -->
                                        <c:set var="start" value="${(currentPage - 1) * jobsPerPage}" />
                                        <!-- Chỉ số kết thúc -->
                                        <c:set var="end" value="${start + jobsPerPage}" />
                                        <c:if test="${end > totalJobs}">
                                            <c:set var="end" value="${totalJobs}" />
                                        </c:if>

                                        <!-- Hiển thị công việc trong khoảng từ start đến end -->
                                        <c:forEach var="job" begin="${start}" end="${end - 1}" items="${jobDao.getJobsByJobSeekerId(user.userId)}">
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

                                    <!-- Hiển thị liên kết phân trang -->
                                    <div id="paginationControls" class="pagination-controls">
                                        <c:if test="${totalPages > 1}">
                                            <ul>
                                                <c:forEach var="i" begin="1" end="${totalPages}">
                                                    <li>
                                                        <c:choose>
                                                            <c:when test="${i == currentPage}">
                                                                <span class="active current-page">${i}</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="?page=${i}" class="ripple-effect">${i}</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </c:if>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <p>Chưa có công việc nào trước đây.</p>
                                </c:otherwise>
                            </c:choose>


                            <!--                             Phân trang 
                                                        <div class="clearfix"></div>
                                                        <div class="pagination-container margin-top-40 margin-bottom-10">
                                                            <nav class="pagination">
                                                                <ul>
                                                                    <li><a href="#" class="ripple-effect current-page">1</a></li>
                                                                    <li><a href="#" class="ripple-effect">2</a></li>
                                                                    <li class="pagination-arrow"><a href="#" class="ripple-effect"><i class="icon-material-outline-keyboard-arrow-right"></i></a></li>
                                                                </ul>
                                                            </nav>
                                                        </div>-->
                            <div class="clearfix"></div>
                            <!-- Phân trang / Kết thúc -->

                        </div>
                        <!-- Danh sách đóng gói / Kết thúc -->

                        <!-- Danh sách đóng gói -->
                        <!--                        <div class="boxed-list margin-bottom-60">
                                                    <div class="boxed-list-headline">
                                                        <h3><i class="icon-material-outline-business"></i> Lịch sử việc làm</h3>
                                                    </div>
                                                    <ul class="boxed-list-ul">
                                                        <li>
                                                            <div class="boxed-list-item">
                                                                 Hình đại diện 
                                                                <div class="item-image">
                                                                    <img src="images/browse-companies-03.png" alt="">
                                                                </div>
                        
                                                                 Nội dung 
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
                                                                 Hình đại diện 
                                                                <div class="item-image">
                                                                    <img src="images/browse-companies-04.png" alt="">
                                                                </div>
                        
                                                                 Nội dung 
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
                                                </div>-->
                        <!-- Danh sách đóng gói / Kết thúc -->

                    </div>


                    <!-- Thanh bên -->
                    <div class="col-xl-4 col-lg-4">
                        <div class="sidebar-container">

                            <!-- Button -->
                            <!--href="CV?action=view&cvId={cvDao.getCVByUserId(user.userId).cvId}"-->
                            <a href="" class="apply-now-button popup-with-zoom-anim margin-bottom-50">Xem CV</a>


                            <!-- Tổng quan hồ sơ -->
                            <div class="profile-overview">
                                <div class="overview-item" style="text-align: center"><strong>Số lượng dự án hoàn thành</strong> ${jobDao.getQuantityOfJobSuccessful(user.userId)}</div>
                                <div class="overview-item" style="text-align: center"><strong>Số lượng khách hàng</strong> ${jobDao.getQuantityEmployerOfSeeker(user.userId)}</div>
                            </div>

                            <!-- Thống kê / Lịch sử việc làm -->
                            <div class="sidebar-widget">
                                <h3 class="margin-top-0 margin-bottom-30">Danh sách khách hàng</h3>
                                <ul class="dashboard-box-list">
                                    <c:choose>
                                        <c:when test="${not empty userDao.getEmployersOfSeeker(user.userId)}">
                                            <!-- Số khách hàng hiển thị trên mỗi trang -->
                                            <c:set var="employersPerPage" value="5" />
                                            <!-- Tổng số khách hàng -->
                                            <c:set var="totalEmployers" value="${fn:length(userDao.getEmployersOfSeeker(user.userId))}" />
                                            <!-- Tổng số trang -->
                                            <c:set var="totalPages" value="${(totalEmployers / employersPerPage) + (totalEmployers % employersPerPage > 0 ? 1 : 0)}" />
                                            <!-- Trang hiện tại -->
                                            <c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
                                            <!-- Chỉ số bắt đầu -->
                                            <c:set var="start" value="${(currentPage - 1) * employersPerPage}" />
                                            <!-- Chỉ số kết thúc -->
                                            <c:set var="end" value="${start + employersPerPage}" />
                                            <c:if test="${end > totalEmployers}">
                                                <c:set var="end" value="${totalEmployers}" />
                                            </c:if>

                                            <!-- Hiển thị danh sách khách hàng trong khoảng từ start đến end -->
                                            <c:forEach var="employer" begin="${start}" end="${end - 1}" items="${userDao.getEmployersOfSeeker(user.userId)}">
                                                <li>
                                                    <div class="dashboard-box-list-item">
                                                        <img src="${employer.avatarUrl}" alt="">
                                                        <div class="item-content">
                                                            <h4>${employer.userName}</h4>
                                                            <span>Khách hàng</span>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        
                                </ul>

                                        <!-- Hiển thị các liên kết phân trang -->
                                        <div id="paginationControls" class="pagination-controls">
                                            <c:if test="${totalPages > 1}">
                                                <ul>
                                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                                        <li>
                                                            <c:choose>
                                                                <c:when test="${i == currentPage}">
                                                                    <span class="active current-page">${i}</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <a href="?page=${i}" class="ripple-effect">${i}</a>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <p>Chưa có khách hàng nào làm việc cùng.</p>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
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

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const rowsPerPage = 5; // Số hàng trên mỗi trang
                const table = document.getElementById('UserTable');
                const tbody = document.getElementById('tableBody');
                const paginationControls = document.getElementById('paginationControls');

                let currentPage = 1;
                const rows = Array.from(tbody.getElementsByTagName('tr'));
                const totalPages = Math.ceil(rows.length / rowsPerPage);

                function displayRows(page) {
                    const start = (page - 1) * rowsPerPage;
                    const end = start + rowsPerPage;

                    rows.forEach((row, index) => {
                        row.style.display = (index >= start && index < end) ? '' : 'none';
                    });
                }

                function setupPagination() {
                    paginationControls.innerHTML = '';
                    for (let i = 1; i <= totalPages; i++) {
                        const button = document.createElement('button');
                        button.textContent = i;
                        button.classList.add('pagination-button');
                        if (i === currentPage) {
                            button.classList.add('active');
                        }
                        button.addEventListener('click', function () {
                            currentPage = i;
                            displayRows(currentPage);
                            updatePaginationButtons();
                        });
                        paginationControls.appendChild(button);
                    }
                }

                function updatePaginationButtons() {
                    const buttons = paginationControls.getElementsByTagName('button');
                    for (let button of buttons) {
                        button.classList.remove('active');
                    }
                    buttons[currentPage - 1].classList.add('active');
                }

                displayRows(currentPage);
                setupPagination();
            });


            document.addEventListener('DOMContentLoaded', function () {
            const rowsPerPageBan = 5; // Số hàng trên mỗi trang
                    const tableBodyBan = document.getElementById('tableBodyBan');
                    const paginationControlsBan = document.getElementById('paginationControlsBan');
                    let currentPageBan = 1;
                    const rowsBan = Array.from(tableBodyBan.getElementsByTagName('tr'));
                    const totalPagesBan = Math.ceil(rowsBan.length / rowsPerPageBan);
                    function displayRowsBan(page) {
                    const start = (page - 1) * rowsPerPageBan;
                            const end = start + rowsPerPageBan;
                            rowsBan.forEach((row, index) => {
                            row.style.display = (index >= start && index < end) ? '' : 'none';
                            });
                    }

            function setupPaginationBan() {
            paginationControlsBan.innerHTML = '';
                    for (let i = 1; i <= totalPagesBan; i++) {
            const buttonBan = document.createElement('button');
                    buttonBan.textContent = i;
                    buttonBan.classList.add('pagination-button');
                    if (i === currentPageBan) {
            buttonBan.classList.add('active');
            }
            buttonBan.addEventListener('click', function () {
            currentPageBan = i;
                    displayRowsBan(currentPageBan);
                    </body>

<!-- Mirrored from www.vasterad.com/themes/hireo_21/single-freelancer-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:45 GMT -->
                    </html>