<%-- 
    Document   : view-progress-of-job
    Created on : Oct 22, 2024, 12:29:51 AM
    Author     : qn407
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
            <style>

                body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                    background-color: #f4f4f4;
                }
                .container {
                    width: 90%;
                    max-width: 1200px;
                    margin: 50px auto;
                    background-color: white;
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }
                h2 {
                    text-align: center;
                    margin-bottom: 20px;
                }
                table {

                    width: 100%;
                    border-collapse: collapse;
                    margin-bottom: 20px;
                    padding-left: 10px;
                    padding-right: 10px;
                    margin-left: 0px;
                    margin-right: 0px;
                }
                th, td {
                    padding: 15px;
                    text-align: center;
                    border-bottom: 1px solid #ddd;
                }
                th {
                    background-color: blue;
                    color: white;
                }
                tr:nth-child(even) {
                    background-color: #f2f2f2;
                }
                .action-button {
                    padding: 8px 12px;
                    margin: 5px;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                }
                .view-button {
                    background-color: blue;
                    color: white;
                }
                .submit-button {
                    background-color: #4CAF50;
                    color: white;
                }
                .status-accepted {
                    color: green;
                }
                .status-rejected {
                    color: red;
                }

            </style>
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
                            <h3 style="margin-bottom: -50px;">Quản lý tiến trình - ${jobDAO.getJobByJobId(jobId).jobTitle}
                                <span style=>Để quá trình làm việc online minh bạch, rõ ràng tôi khuyến khích bạn chia các giai đoạn để theo dõi quá trình của người làm việc</span>
                            </h3>         
                            <br>
                        </div>

                        <div class="row">

                            <!-- Dashboard Box -->
                            <div class="col-xl-12">
                                <div class="col-xl-11" style="margin-left: 43px">
                                    <a href="myjob?action=load-creating&jobId=${jobId}" class="button ripple-effect big full-width">Tạo mới giai đoạn</a></div>
                                <!--<div class="dashboard-box margin-top-0">-->
                                <div class="container">


                                    <table>
                                        <thead>
                                            <tr>
                                                <th>No.</th> <!-- Cột mới cho số thứ tự -->
                                                <th>Tên Giai Đoạn</th>
                                                <th>Ngày Kết Thúc</th>
                                                <th>Hành Động</th>
                                                <th>Tình Trạng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="p" items="${processes}" varStatus="status">
                                                <tr>
                                                    <td>${status.index + 1}</td> <!-- Hiển thị số thứ tự, bắt đầu từ 1 -->
                                                    <td>${p.stageName}</td>
                                                    <td>${p.endDate}</td>
                                                    <td>
                                                        <!-- Yêu Cầu Button -->
                                                        <a href="myjob?action=request-process&processId=${p.processId}&name=${p.stageName}&jobId=${p.jobId}" class="action-button view-button" onclick="toggleRequestTable(${status.index})">Xem kết quả</a>
                                                        <a href="aplly?action=edit-process-employer&processId=${p}" title="Chỉnh Sửa" data-tippy-placement="top"><i class="icon-feather-edit"></i></a>
                                                        <a class="button gray ripple-effect ico" title="Xóa" data-tippy-placement="top" onclick="openPopup(this)" data-process-id="${p.processId}"><i class="icon-feather-trash-2"></i></a>
                                                    </td>
                                                    <td class="status-accepted">
                                                         <p >${p.status}</p>

                                                    </td>
                                                    
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
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
            var processId = element.getAttribute("data-process-id");
            console.log("Process ID: " + processId);

            // Cập nhật URL của nút "Xác Nhận"
            var confirmButton = document.getElementById("confirmDeleteButton");
            confirmButton.href = "aplly?action=delete-process-employer&processId=" + processId;
            document.getElementById("popup").style.display = "block";
        }


    </script>

    <script>
        function closePopup() { // Click vào close thì gán style cho Popup là display:none để ẩn đi
            document.getElementById("popup").style.display = "none";
        }
    </script>
    <!--        <script>
        function toggleRequestTable(index) {
            // Get the request table row for the clicked button
            const requestTable = document.getElementById(`requestTable${index}`);
            
            // Toggle the display of the table (show/hide)
            if (requestTable.style.display === "none" || requestTable.style.display === "") {
                requestTable.style.display = "table-row";
            } else {
                requestTable.style.display = "none";
            }
        }
    </script>-->
</body>
</html>