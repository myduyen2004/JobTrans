<%-- 
    Document   : manage-job
    Created on : Sep 22, 2024, 11:51:30 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jobtrans.model.Job" %>
<%@ page import="jobtrans.model.JobGreeting" %>
<%@ page import="jobtrans.model.Transaction" %>
<%@ page import="java.time.LocalDateTime, java.time.Duration" %>
<!doctype html>
<html lang="en">
    <head>
        <jsp:useBean id="jobDAO" class="jobtrans.dal.JobDAO" scope="session"></jsp:useBean>
        <jsp:useBean id="jgDAO" class="jobtrans.dal.JobGreetingDAO" scope="session"></jsp:useBean>
        <jsp:useBean id="transDAO" class="jobtrans.dal.TransactionDAO" scope="session"></jsp:useBean>
            <title>Công việc của tôi</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/colors/blue.css">
            <link rel="stylesheet" href="css/popup.css">
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
                            <h3>Công việc của tôi</h3>
                        </div>
                        <div class="row">

                            <!-- Dashboard Box -->
                            <div class="col-xl-12">
                                <div class="dashboard-box margin-top-0">

                                    <!-- Headline -->
                                    <div class="headline">
                                        <h3><i class="icon-material-outline-assignment"></i> Công Việc Của Tôi</h3>
                                    </div>

                                    <div class="content">
                                        <ul class="dashboard-box-list">
                                            <c:forEach var="myJob" items="${jobList}">
                                                <li>
                                                    <div class="job-listing width-adjustment">
                                                        <div class="job-listing-details">
                                                            <div class="job-listing-description">
                                                                <h3 class="job-listing-title"><a href="job?command=VIEW&jid=${myJob.jobId}">${myJob.jobTitle}</a> <span class="dashboard-status-button yellow">${myJob.status}</span> </h3>



                                                                <!-- Job Listing Footer -->
                                                                <div class="job-listing-footer">
                                                                    <ul>
                                                                        <li><i class="icon-material-outline-access-time"></i>Ngày hết hạn: ${myJob.dueDate}</li>
                                                                            <c:if test="${myJob.labelVerify == 'Được duyệt'}">
                                                                            <li><div class="verified-badge-with-title">Phê duyệt bởi QTV</div></li>
                                                                            </c:if>

                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Buttons -->
                                                    <div class="buttons-to-right always-visible">
                                                        <c:if test="${myJob.status == 'Chờ đặt cọc'}">
                                                            <c:if test="${!transDAO.checkTransactionExists(myJob.jobId,'Trả trước')}">
                                                            <a href="myjob?action=load-prepay&jobId=${myJob.jobId}" 
                                                               class="button ripple-effect" 
                                                               style="background-color: #d32f2f; color: white;">
                                                                Trả trước để làm việc
                                                            </a>
                                                            </c:if>
                                                            <c:if test="${transDAO.checkTransactionExists(myJob.jobId,'Trả trước')}">
                                                            <a href="myjob?action=load-prepay&jobId=${myJob.jobId}" 
                                                               class="button ripple-effect" 
                                                               style="background-color: #ffc107; color: white;">
                                                                Trả trước để làm việc
                                                            </a>
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${myJob.status != 'Chờ đặt cọc'}">
                                                            <div class="buttons-to-right always-visible" style="display: flex; flex-wrap: wrap; justify-content: space-between; align-items: center; margin-top: 10px;">
                                                                <!-- Các nút thông tin -->
                                                                <div style="display: flex; gap: 10px;">
                                                                    <a href="" class="button ripple-effect" style="background-color: #2a41e8; color: white; padding: 10px 15px; border-radius: 4px; text-decoration: none; display: flex; align-items: center;">
                                                                        <i class="icon-material-outline-rate-review" style="margin-right: 5px;"></i> Quản lí tiến trình
                                                                    </a>
                                                                    <a href="" class="button ripple-effect" style="background-color: #2a41e8; color: white; padding: 10px 15px; border-radius: 4px; text-decoration: none; display: flex; align-items: center;">
                                                                        CHAT
                                                                    </a>
                                                                    <a href="" class="button ripple-effect" style="background-color: #2a41e8; color: white; padding: 10px 15px; border-radius: 4px; text-decoration: none; display: flex; align-items: center;">
                                                                        Sản phẩm
                                                                    </a>
                                                                    <a href="" class="button ripple-effect" style="background-color: #ffc107; color: white; padding: 10px 15px; border-radius: 4px; text-decoration: none; display: flex; align-items: center;">
                                                                        Khiếu nại
                                                                    </a>
                                                                </div>

                                                                <!-- Nút Hoàn tất thanh toán nằm ở lề phải -->
                                                                <a href="#" class="button ripple-effect" style="background-color: #28a745; color: white; padding: 10px 20px; border-radius: 4px; text-decoration: none; display: flex; align-items: center; margin-left: auto;">
                                                                    <i class="icon-material-outline-check" style="margin-right: 5px;"></i> Đã trả trước
                                                                </a>
                                                            </div>

                                                        </c:if>
                                                    </div>
                                                    <div style="position: absolute; top: 20px; right: 20px;">
                                                        <c:if test="${myJob.status == 'Chờ đặt cọc'}">
                                                            <c:if test="${!transDAO.checkTransactionExists(myJob.jobId,'Trả trước')}">
                                                            <span style="background-color: #d32f2f; color: white; padding: 8px 12px; border-radius: 4px; font-size: 12px;">
                                                                Bạn chưa trả trước cho công việc này
                                                            </span>
                                                            </c:if>
                                                            <c:if test="${transDAO.checkTransactionExists(myJob.jobId,'Trả trước')}">
                                                                <span style="background-color: #2a41e8; color: white; padding: 8px 12px; border-radius: 4px; font-size: 12px;">
                                                                Bạn đã trả trước, đang đợi đối tác đặt cọc
                                                            </span>
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${myJob.status == 'Đang làm việc'}">
                                                            <span style="background-color: #28a745; color: white; padding: 8px 12px; border-radius: 4px; font-size: 12px;">
                                                                Thanh toán đã hoàn tất
                                                            </span>
                                                        </c:if>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- Row / End -->

                        <!-- Footer -->
                        <%@include file="includes/subfooter.jsp" %>
                        <!-- Footer / End -->

                    </div>
                </div>
            </div>
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
</html>