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
                                            <!--<div class="container-custom">-->
                                                <h3 style="margin-bottom: 35px; margin-top: 35px"> ${name}     -     Yêu cầu tiến trình: ${pro.requirements} </h3>
                                                
<form action="myjob" method="POST" enctype="multipart/form-data">
    <!-- Hidden input for processId -->
    <input type="hidden" name="processId" value="${processId}"> <!-- Replace 123 with dynamic processId -->
          <c:if test="${not empty pro.requirement_url}">
              <div style="margin-bottom: 20px" class="form-group">
                <label style="margin-bottom: 20px">File Yêu Cầu:</label>
                <!-- Link để xem file yêu cầu từ employer -->
                <div>
                <a style="margin-left: 0px;" href="${pro.requirement_url}" target="_blank" class="btn btn-primary">
                    Xem File Yêu Cầu
                 </a>      
                <a href="myjob?action=downloadRequirement&url=${pro.requirement_url}" style="color: white" target="_blank" class="btn btn-primary" name="url" value="${pro.requirement_url}"> 
                    Lưu File Yêu Cầu
                </a>    
                
            </div>
        </c:if>

        <!-- Hiển thị thông báo nếu không có file yêu cầu -->
        <c:if test="${empty pro.requirement_url}">
            <p>Không có file yêu cầu từ employer.</p>
        </c:if>
      
    <!--<a   href="myjob?action=result-process&processId=${pro.processId}&name=${pro.stageName}&jobId=${pro.jobId}" class="action-button submit-button">Nộp Kết Quả</a>-->
<a href="myjob?action=result-process&processId=${pro.processId}&name=${pro.stageName}&jobId=${pro.jobId}" 
       class="action-button submit-button" 
       style="display: inline-block; margin-top: 20px;">
       Nộp Kết Quả
    </a>
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
