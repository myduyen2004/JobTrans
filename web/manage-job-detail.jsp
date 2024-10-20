<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jobtrans.model.Job" %>
<%@ page import="jobtrans.model.JobGreeting" %>
<%@ page import="jobtrans.model.User" %>
<%@ page import="jobtrans.model.JobGreeting" %>
<!doctype html>
<html lang="en">
    <head>
        <jsp:useBean id="jgDAO" class="jobtrans.dal.JobGreetingDAO" scope="session"></jsp:useBean>
        <jsp:useBean id="userDAO" class="jobtrans.dal.UserDAO" scope="session"></jsp:useBean>
            <title>Quản lí bài đăng</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/colors/blue.css">
            <link rel="stylesheet" href="css/popup.css">

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
                    <div class="single-page-header" data-background-image="images/single-task.jpg">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="single-page-header-inner">
                                        <div class="left-side">
                                            <div class="header-image"><a href="${employer.avatarUrl}"><img src=${employer.avatarUrl} alt="avatar"></a></div>
                                            <div class="header-details">
                                                <h3>${job.jobTitle}</h3>
                                                <h5>Về nhà tuyển dụng</h5>
                                                <ul>
                                                    <li><a href="single-company-profile.html"><i class="icon-material-outline-business"></i>${employer.userName}</a></li>

                                                    <li><div class="dashboard-status-button yellow">Trạng thái: ${job.status}</div></li>
                                                        <c:if test="${job.labelVerify == 'Được duyệt'}">
                                                        <li><div class="verified-badge-with-title">Phê duyệt bởi QTV</div></li>
                                                        </c:if>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="right-side">
                                            <div class="salary-box">
                                                <div class="salary-type">Ngân sách dự án</div>
                                                <div class="salary-amount"><fmt:formatNumber value="${job.budget}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" /></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">

                            <!-- Content -->
                            <div class="col-xl-8 col-lg-8 content-right-offset">

                                <!-- Description -->
                                <div class="single-page-section">
                                    <h3 class="margin-bottom-25">Mô tả dự án</h3>
                                    <p>${job.description}</p>
                                </div>

                                <!-- Atachments -->
                                <div class="single-page-section">
                                    <h3>Tệp đính kèm</h3>
                                    <div class="attachments-container">
                                        <a href="job?fileName=${job.docUrl}&command=DOWNLOAD" class="attachment-box ripple-effect"><span>Tóm tắt dự án</span><i>PDF</i></a>
                                    </div>
                                </div>

                                <div class="clearfix"></div>

                                <!-- Freelancers Bidding -->
                                <div class="boxed-list margin-bottom-60">
                                    <div class="boxed-list-headline">
                                        <h3><i class="icon-material-outline-group"></i> Danh sách ứng viên</h3>
                                    </div>
                                    <ul class="boxed-list-ul">
                                        <c:forEach var="jobGreeting" items="${jgDAO.getJobGreetingByJobId(job.jobId)}">
                                            <li>
                                                <div class="bid">
                                                    <!-- Avatar -->
                                                    <div class="bids-avatar">
                                                        <div class="freelancer-avatar">
                                                            <c:if test="${jobGreeting.status == 'Được chấp nhận'}">
                                                                            <div class="verified-badge"></div>
                                                                        </c:if>
                                                            <a href="#"><img src="${userDAO.getUserById(jobGreeting.jobSeekerId).avatarUrl}" alt=""></a>
                                                        </div>
                                                    </div>

                                                    <!-- Content -->
                                                    <div class="bids-content">
                                                        <!-- Name -->
                                                        <div class="freelancer-name">
                                                            <h4><a href="single-freelancer-profile.html">${userDAO.getUserById(jobGreeting.jobSeekerId).userName}</a></h4>
                                                        </div>
                                                    </div>

                                                    <!-- Bid -->
                                                    <div class="bids-bid">
                                                        <div class="bid-rate">
                                                            <div class="rate"><fmt:formatNumber value="${jobGreeting.price}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" /></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>

                            </div>


                            <!-- Sidebar -->
                            <div class="col-xl-4 col-lg-4">
                                <div class="sidebar-container">

                                    <div class="countdown green margin-bottom-35">Thời hạn: ${due} ngày</div>

                                    <div class="sidebar-widget">
                                        <div class="bidding-widget">

                                            <div class="bidding-inner">
                                                <!-- Button -->
                                                <a href="job?command=LOAD&jid=${job.jobId}"><button class="button full-width button-sliding-icon ripple-effect">Cập nhật công việc <i class="icon-feather-edit"></i></button></a>
                                                <!-- Button -->
                                                <button class="button full-width button-sliding-icon ripple-effect" title="Xóa" onclick="openPopup(this)" data-jobid="${job.jobId}">Xóa Công Việc <i class="icon-feather-trash-2"></i></button>
                                                <!-- Button -->
                                                <a href="job?command=LOADINTERVIEW&jid=${job.jobId}"><button class="button full-width button-sliding-icon ripple-effect">Cập nhật phỏng vấn <i class="icon-feather-video"></i></button></a>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Sidebar Widget -->
                                    <div class="sidebar-widget">
                                        <h3>Thông tin</h3>
                                        <ul class="task-info">
                                            <li><strong>Ngày hết hạn:</strong> ${job.dueDate}</li>
                                            <li><strong>Địa điểm:</strong> ${job.address}</li>
                                            <li><strong>Ngân sách:</strong> <fmt:formatNumber value="${job.budget}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" /></li>
                                            <li><strong>Đã đăng bởi:</strong> ${employer.userName}</li>
                                            <li><strong>Trạng thái:</strong> ${job.status}</li>
                                            <a href="${job.interviewUrl}"><li><strong>Phỏng Vấn</strong></li></a>
                                            <li><strong>Ngày phỏng vấn:</strong> ${job.interviewDate}</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <%@include file="includes/subfooter.jsp" %>
                    </div>
                </div>
                <!-- Dashboard Content / End -->

            </div>

            <!-- Dashboard Container / End -->

        </div>
        <!-- Wrapper / End -->
        <div id="popup" class="popup">
            <div id="overlay">
                <button class="closebtn" onclick="closePopup()">
                    <i class="icon-feather-log-out"></i>
                </button>
                <!-- Nội dung trong Popup -->
                <center>
                    <div class="overlay-content">
                        <h4>Xác nhận</h4>
                        <hr>
                        <h4 style="margin-top: 30px;">
                            <i class="icon-feather-alert-circle" style="color: blue;"></i>
                            Bạn xác nhận muốn xóa công việc này không.
                        </h4>
                        <br>

                        <table>
                            <tr>
                                <td>
                                    <!-- Sử dụng nút Bootstrap -->
                                    <button class="btn btn-secondary btn-custom" onclick="closePopup()">Thoát
                                        <i class="icon-feather-log-out"></i>
                                    </button>
                                </td>
                                <td>
                                    <a id="confirmDeleteButton" href="#">
                                        <button class="btn btn-danger btn-custom">Xác Nhận
                                            <i class="icon-feather-trash-2"></i>
                                        </button>
                                    </a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </center>
            </div>
        </div>
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

        <script>
            function openPopup(element) { // Click vào button thì gán style cho Popup là display:block để hiển thị lên
                var jobId = element.getAttribute("data-jobid");
                console.log("Job ID: " + jobId);

                // Cập nhật URL của nút "Xác Nhận"
                var confirmButton = document.getElementById("confirmDeleteButton");
                confirmButton.href = "job?command=DELETE&jid=" + jobId;
                document.getElementById("popup").style.display = "block";
            }


        </script>

        <script>
            function closePopup() { // Click vào close thì gán style cho Popup là display:none để ẩn đi
                document.getElementById("popup").style.display = "none";
            }
        </script>

    </body>

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/dashboard-manage-tasks.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:48 GMT -->
</html>