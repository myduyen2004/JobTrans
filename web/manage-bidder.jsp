<%-- 
    Document   : manage-bidder
    Created on : Sep 22, 2024, 11:53:23 AM
    Author     : admin
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="jobtrans.model.Job" %>
<!doctype html>
<html lang="en">
    <head>
        <jsp:useBean id="userDao" class="jobtrans.dal.UserDAO" scope="session"></jsp:useBean>
            <title>JobTrans</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/colors/blue.css">
            <link rel="stylesheet" href="css/popup.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

        </head>
    <%@include file="/includes/header.jsp" %>
    <body class="gray">

        <div id="wrapper">

            <div class="clearfix"></div>

            <div class="dashboard-container">

                <%@include file="/includes/sidebar.jsp" %>
                <div class="dashboard-content-container" data-simplebar>
                    <div class="dashboard-content-inner" >

                        <div class="dashboard-headline">
                            <h3>Quản Lý Người Đấu Thầu</h3>

                        </div>

                        <div class="row">
                            <!-- Dashboard Box -->
                            <div class="col-xl-12">
                                <div class="dashboard-box margin-top-0">

                                    <div class="content">
                                        <c:choose>
                                            <c:when test="${not empty jobGreetings}">
                                                <ul class="dashboard-box-list">
                                                    <c:forEach var="greeting" items="${jobGreetings}">
                                                        <li>
                                                            <div class="freelancer-overview manage-candidates">
                                                                <div class="freelancer-overview-inner">

                                                                    <div class="freelancer-avatar">
                                                                        <c:if test="${greeting.status == 'Được chấp nhận'}">
                                                                            <div class="verified-badge"></div>
                                                                        </c:if>

                                                                        <a href="${userDao.getUserById(greeting.jobSeekerId).avatarUrl}"><img src="${userDao.getUserById(greeting.jobSeekerId).avatarUrl}" alt=""></a>
                                                                    </div>
                                                                    <div class="freelancer-name">
                                                                        <h4><a href="#">Ứng Viên: ${userDao.getUserById(greeting.getJobSeekerId()).userName}</a></h4>
                                                                        <span class="freelancer-detail-item"><a href="#"><i class="icon-feather-mail"></i> Trạng thái: ${greeting.status}</a></span>

                                                                        <ul class="dashboard-task-info bid-info">
                                                                            <li><strong><fmt:formatNumber value="${greeting.price}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" /></strong><span>Giá Đề Xuất</span></li>
                                                                            <li><strong>${greeting.expectedDay} Ngày</strong><span>Thời Gian Dự Kiến</span></li>
                                                                        </ul>

                                                                        <div class="buttons-to-right always-visible margin-top-25 margin-bottom-0">
                                                                            <c:if test="${greeting.status == 'Được chấp nhận'}">
                                                                                <a href="#" 
                                                                                   class="button ripple-effect" 
                                                                                   style="background-color: #28a745; color: white;">
                                                                                    <i class="icon-material-outline-check"></i> Được chọn
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${greeting.status == 'Chưa phản hồi'}">
                                                                                <a href="job?command=accept-bidder&jobId=${greeting.jobId}&jgId=${greeting.greetingId}" class="button ripple-effect" >Duyệt Đề Nghị</a>
                                                                                <a href="job?command=reject-bidder&jobId=${greeting.jobId}&jgId=${greeting.greetingId}" 
                                                                                   class="button ripple-effect" 
                                                                                   style="background-color: #d32f2f; color: white;">
                                                                                   Từ Chối
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${greeting.status == 'Chờ phỏng vấn'}">
                                                                                <a href="job?command=accept-interview&jobId=${greeting.jobId}&jgId=${greeting.greetingId}" 
                                                                                   class="button ripple-effect" 
                                                                                   style="background-color: #f57c00; color: white;">
                                                                                    Duyệt phỏng vấn
                                                                                </a>
                                                                                <a href="job?command=reject-interview&jobId=${greeting.jobId}&jgId=${greeting.greetingId}" 
                                                                                   class="button ripple-effect" 
                                                                                   style="background-color: #d32f2f; color: white;">
                                                                                   Trượt phỏng vấn
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${greeting.status == 'Bị từ chối'}">
                                                                                <a href="#" 
                                                                                   class="button ripple-effect" 
                                                                                   style="background-color: #d32f2f; color: white;">
                                                                                   Đã Từ Chối
                                                                                </a>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </c:when>
                                            <c:otherwise>
                                                <p>Không có lời chào nào cho công việc này.</p>
                                            </c:otherwise>
                                        </c:choose>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="dashboard-footer-spacer"></div>
                        <%@include file="includes/subfooter.jsp" %>

                    </div>
                </div>
            </div>
        </div>
        <div id="popup" class="popup">
            <div id="overlay">
                <button class="closebtn" style="width: 5px;" onclick="closePopup()"><i class="icon-feather-log-out"></i></button>
                <!-- Nội dung trong Popup -->
                <center>
                    <div class="overlay-content">
                        <h4>Xác nhận</h4>
                        <hr>
                        <h4 style="margin-top: 30px;"><i class="icon-feather-alert-circle" style="color: blue;"></i>Bạn xác nhận muốn xóa công việc này không.</h4>
                        <br><!-- comment -->

                        <table>
                            <tr>
                                <td><button class="button full-width button-sliding-icon ripple-effect" onclick="closePopup()">Thoát<i class="icon-feather-log-outo"></i></button></td>
                                <td><a id="confirmDeleteButton" href="#"><button class="button full-width button-sliding-icon ripple-effect">Xác Nhận <i class="icon-feather-trash-2"></i></button></a></td>
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
                confirmButton.href = "job?action=confirmSeeker&" + jobId;
                document.getElementById("popup").style.display = "block";
            }


        </script>

        <script>
            function closePopup() { // Click vào close thì gán style cho Popup là display:none để ẩn đi
                document.getElementById("popup").style.display = "none";
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

    </body>

</html>
