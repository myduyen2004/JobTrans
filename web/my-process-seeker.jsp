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
        .container {
            width: 100%;
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
                            <h3 style="margin-bottom: -50px;">Tiến trình công việc : ${j.jobTitle} </h3>                           
                        </div>
                        <div class="row">

                            <!-- Dashboard Box -->
                            <div class="col-xl-12">
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
            <th>Nhận Xét</th>
        </tr>
    </thead>
    <tbody>
<c:forEach var="pl" items="${processList}" varStatus="status">
    <tr>
        <td>${status.index + 1}</td> <!-- Hiển thị số thứ tự, bắt đầu từ 1 -->
        <td>${pl.stageName}</td>
        <td>${pl.endDate}</td>
        <td>
            <!-- Yêu Cầu Button -->
            
            <a href="myjob?action=request-process&processId=${pl.processId}&name=${pl.stageName}&jobId=${pl.jobId}" class="action-button view-button" onclick="toggleRequestTable(${status.index})">Yêu Cầu</a>

            <!-- Nộp Kết Quả Button (sửa thành <a>) -->
            <a href="myjob?action=result-process&processId=${pl.processId}&name=${pl.stageName}&jobId=${pl.jobId}" class="action-button submit-button">Nộp Kết Quả</a>
        </td>
       <td class="status-accepted">
    <c:choose>
        <c:when test="${pl.status == 'Đã nộp'}">
            <span style="color:#ffc107;font-weight: bold;">${pl.status}</span>
        </c:when>
        <c:when test="${pl.status == 'Từ chối'}">
            <span style="color: red;font-weight: bold;">${pl.status}</span>
        </c:when>
        <c:when test="${pl.status == 'Chưa nộp'}">
            <span style="color:blueviolet;font-weight: bold;">${pl.status}</span>
        </c:when>
        <c:when test="${pl.status == 'Đã chấp nhận'}">
            <span style="color: green;font-weight: bold;">${pl.status}</span>
        </c:when>
        <c:otherwise>
            <span>${pl.status}</span> <!-- Default color if status doesn't match -->
        </c:otherwise>
    </c:choose>
</td>   
         <c:if test="${not empty pl.comments}">
        <td>           
            <a href="myjob?action=comments-process&processId=${pl.processId}&name=${pl.stageName}&jobId=${pl.jobId}"   class="action-button view-button"">Xem</a>
        </td>
        </c:if>
                 <c:if test="${empty pl.comments}">
        <td>           
            <button class="action-button view-button" style="background-color: gray">Xem</button>
        </td>
        </c:if>
       
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
