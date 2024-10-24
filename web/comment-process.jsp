<%-- 
    Document   : request-process.jsp
    Created on : 23 thg 10, 2024, 07:42:49
    Author     : mac
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jobtrans.model.Job" %>
<%@ page import="jobtrans.model.JobGreeting" %>
<%@ page import="jobtrans.model.Transaction" %>
<%@ page import="java.time.LocalDateTime, java.time.Duration" %>
<!doctype html>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Công việc của tôi</title>
        <!-- CSS -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/colors/blue.css">
        <link rel="stylesheet" href="css/popup.css">
        <style>
    .progress-container {
    display: flex; /* Sử dụng Flexbox để sắp xếp phần tử con theo hàng ngang */
    align-items: center; /* Căn chỉnh phần tử con theo chiều dọc */
    gap: 10px; /* Khoảng cách giữa các nút */
}

.accept-button {
    background-color: #5cb85c; /* Màu xanh lá tượng trưng cho chấp nhận */
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.accept-button:hover {
    background-color: #4cae4c;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
}

.accept-button:active {
    background-color: #449d44;
    box-shadow: none;
}

/* Nút Từ chối */
.reject-button {
    background-color: #d9534f;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.reject-button:hover {
    background-color: #c9302c;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
}

.reject-button:active {
    background-color: #ac2925;
    box-shadow: none;
}
        
            .reject-button {
    background-color: #d9534f; /* Màu đỏ nhẹ để tượng trưng cho "Từ chối" */
    color: white; /* Màu chữ trắng để tương phản với nền */
    border: none; /* Loại bỏ đường viền mặc định */
    padding: 10px 20px; /* Tạo không gian bên trong nút */
    font-size: 16px; /* Kích thước chữ vừa phải */
    font-weight: bold; /* Chữ đậm để tạo sự nổi bật */
    border-radius: 5px; /* Bo tròn các góc nút */
    cursor: pointer; /* Con trỏ chuột dạng pointer khi hover */
    transition: background-color 0.3s ease, box-shadow 0.3s ease; /* Hiệu ứng chuyển màu và đổ bóng khi hover */
    padding: 5px 10px;
            }

.reject-button:hover {
    background-color: #c9302c; /* Thay đổi màu nền khi hover */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Thêm hiệu ứng đổ bóng khi hover */
}

.reject-button:active {
    background-color: #ac2925; /* Màu tối hơn khi nút bị nhấn */
    box-shadow: none; /* Loại bỏ đổ bóng khi nhấn */
}
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
                margin: 0;
                padding: 0;
            }

            .container-custom {
                margin: 30px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
                max-width: 800px;
                
            }

            .form-group {
                margin-bottom: 40px;
                
            }

            .form-control {
                width: 100%;
                padding: 12px;
                border: 1px solid #ced4da;
                border-radius: 6px;
                font-size: 16px;
                box-shadow: none;
                transition: border-color 0.3s ease;
            }

            .form-control:focus {
                border-color: #007bff;
                outline: none;
            }

            .btn-primary {
                background-color: #007bff;
                border: none;
                color: white;
                padding: 12px 20px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                border-radius: 6px;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }

            .upload-btn {
                margin-top: 15px;
            }

            .footer-custom {
                text-align: center;
                padding: 15px;
                background-color: #f8f9fa;
                border-top: 1px solid #dee2e6;
                font-size: 14px;
                color: #6c757d;
                
            }

            .dashboard-headline h3 {
                font-size: 28px;
                margin-bottom: 20px;
                color: #333;
                text-align: center;
            }

            .sidebar {
                background-color: #007bff;
                padding: 20px;
                border-radius: 8px;
                color: #fff;
                margin-bottom: 30px;
            }

            .sidebar ul {
                list-style-type: none;
                padding-left: 0;
                margin: 0;
            }

            .sidebar ul li {
                padding: 12px 0;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
                transition: background-color 0.3s ease;
            }

            .sidebar ul li:hover {
                background-color: rgba(255, 255, 255, 0.1);
                cursor: pointer;
            }

            .sidebar ul li a {
                color: #fff;
                text-decoration: none;
            }

            .gray {
                background-color: #f8f9fa;
                
            }
            
        </style>
    </head>
    <body class="gray">
        <div id="wrapper">
            <!-- Include Header -->
            <%@include file="/includes/header.jsp" %>
            <div class="clearfix"></div>
            <div class="dashboard-container">
                <!-- Include Sidebar -->
                <%@include file="/includes/sidebar.jsp" %>

                <div class="dashboard-content-container" data-simplebar>
                    <div class="dashboard-content-inner">
                        
                        <h2 style="margin-bottom: 40px;">Tiến trình công việc:   ${j.jobTitle}</h2>
                    
                      
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="dashboard-box margin-top-0 ">
                                    <div class="container">
                                        <div class="col-md-12">
                                        <div class="progress-container">
    <h3 style="margin-bottom: 35px; margin-top: 35px;font-weight: bold;">Tiến trình:</h3>
    <label style="margin-top: 10px;">${name}</label>
    <c:choose>
        <c:when test="${pro.status == 'Đã chấp nhận'}">
            <button class="action-button view-button accept-button">Đã chấp nhận</button>
        </c:when>
        <c:when test="${pro.status == 'Từ chối'}">
            <button class="action-button view-button reject-button">Từ chối</button>
        </c:when>
    </c:choose>
</div>

<form action="myjob" method="POST" enctype="multipart/form-data">
    <!-- Hidden input for processId -->
    <input type="hidden" name="processId" value="${processId}"> <!-- Replace 123 with dynamic processId -->
        
              <div style="margin-bottom: 20px" class="form-group">
                 
                 <div class="progress-container">
                    <label style="margin-bottom: 20px;font-weight: bold;">Nhận xét:</label> 
                    <label style="margin-bottom: 20px">${pro.comments}</label> 
                 </div>  
                      <c:if test="${pro.status == 'Từ chối'}">
      
       
                <label style=""> Nộp lại kết quả:</label>
                <!-- Link để xem file yêu cầu từ employer -->
                
                <a class="btn btn-primary" href="myjob?action=result-process&processId=${pro.processId}&name=${pro.stageName}&jobId=${pro.jobId}" 
       class="action-button submit-button" 
       style="display: inline-block;  background-color: green; margin-left: 0px; padding: 5px 5px">
       Nộp Kết Quả
                </a>
        </c:if>
            </div>
  

</form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Footer -->
                        <%@include file="includes/subfooter.jsp" %>
                    </div>
                </div>
            </div>
        </div>

        <!-- JS -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/jquery-migrate-3.1.0.min.js"></script>
        <script src="js/mmenu.min.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
