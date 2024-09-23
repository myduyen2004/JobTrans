<%-- 
    Document   : choose-role-form
    Created on : Sep 18, 2024, 4:25:12 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

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
            .container1 {
                text-align: center;
                background-color: url('images/home-background.jpg');
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            h1 {
                margin-bottom: 20px;
                color: #333;
            }

            .button-group {
                display: flex;
                justify-content: space-between;
            }

            .btn {
                background-color: #007BFF;
                color: white;
                border: none;
                padding: 15px 30px;
                margin: 10px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .btn:hover {
                background-color: #0056b3;
            }

            .seeker {
                background-color: #007BFF;
            }

            .employer {
                background-color: #007BFF;
            }
        </style>
    </head>
    <%@include file="/includes/header.jsp" %>

    <body>
        <!-- Intro Banner
================================================== -->
        <div class="intro-banner dark-overlay" data-background-image="images/home-background.jpg">

            <!-- Transparent Header Spacer -->
            <div class="transparent-header-spacer"></div>

            <div class="container">

                <!-- Intro Headline -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="banner-headline">
                            <h3>
                                <strong>Nền tảng tuyển dụng và tìm kiếm việc làm Online</strong>
                                <br>
                                <span>JobTrans - hỗ trợ cho người tuyển và người đi tìm việc</span>
                            </h3>
                        </div>
                    </div>
                </div>

                <!-- Search Bar -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="intro-banner-search-form margin-top-95">
                            <div class="container1">
                                <h1>Chọn loại người dùng</h1>
                                <form action="RoleServlet" method="post">
                                    <div class="button-group">
                                        <input name="email" value="${email}" type="hidden"><!-- comment -->
                                        <button type="submit" name="role" value="Seeker" class="btn seeker">Người Tìm Việc</button>
                                        <button type="submit" name="role" value="Employer" class="btn employer">Nhà Tuyển Dụng</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Stats -->
                <div class="row">
                    <div class="col-md-12">
                        <ul class="intro-stats margin-top-45 hide-under-992px">
                            <li>
                                <strong class="counter">1,586</strong>
                                <span>Công Việc Đã Đăng</span>
                            </li>
                            <li>
                                <strong class="counter">3,543</strong>
                                <span>Nhiệm Vụ Đã Đăng</span>
                            </li>
                            <li>
                                <strong class="counter">1,232</strong>
                                <span>Freelancers</span>
                            </li>
                        </ul>
                    </div>
                </div>


            </div>
        </div>
    </body>
</html>
