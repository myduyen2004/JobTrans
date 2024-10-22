<%-- 
    Document   : sidebar
    Created on : Sep 19, 2024, 11:19:26 AM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/colors/blue.css">
<div class="dashboard-sidebar">
    <div class="dashboard-sidebar-inner" data-simplebar>
        <div class="dashboard-nav-container">
            <!-- Responsive Navigation Trigger -->
            <a href="#" class="dashboard-responsive-nav-trigger">
                <span class="hamburger hamburger--collapse">
                    <span class="hamburger-box">
                        <span class="hamburger-inner"></span>
                    </span>
                </span>
                <span class="trigger-title">Điều Hướng Bảng Điều Khiển</span>
            </a>

            <!-- Navigation -->
            <div class="dashboard-nav">
                <div class="dashboard-nav-inner">

                    

                    <% 
                            Object role = session.getAttribute("role");
                                if (role.equals("Employer")) { 
                    %>
                    <ul data-submenu-title="Bắt Đầu">
                        <li><a href="dashboard-messages.html"><i class="icon-material-outline-question-answer"></i> Tin nhắn <span class="nav-tag">2</span></a></li>
                        <li><a href="dashboard-reviews.html"><i class="icon-material-outline-rate-review"></i> Đánh Giá</a></li>
                    </ul>
                    <ul data-submenu-title="Quản lí công việc">
                        <li><a href="#"><i class="icon-material-outline-business-center"></i> Quản Lí Công Việc</a>
                            <ul>
                                <li><a href="job?command=LIST">Các Việc Đã Đăng</a></li>
                                <li><a href="myjob?action=list-employer">Công Việc Của Tôi</a></li>
                                <li><a href="job?command=load-creating">Đăng Tin Tuyển Dụng</a></li>
                            </ul>	
                        </li>

                    </ul>
                    <%}%>
                    <% 
                             role = session.getAttribute("role");
                                if (role.equals("Seeker")) { 
                    %>
                    <ul data-submenu-title="Bắt Đầu">
                        <li><a href="dashboard-messages.html"><i class="icon-material-outline-question-answer"></i> Tin nhắn <span class="nav-tag">2</span></a></li>
                        <li><a href="dashboard-reviews.html"><i class="icon-material-outline-rate-review"></i> Đánh Giá</a></li>
                    </ul>
                    <ul data-submenu-title="Quản lí công việc">
                        <li><a href="#"><i class="icon-material-outline-business-center"></i> Quản Lí Công Việc</a>
                            <ul>
                                <li><a href="job?command=appliedList">Danh Sách Các Việc Đã Ứng Tuyển </a></li>
                                <li><a href="myjob?action=list-seeker">Công Việc Của Tôi</a></li>
                                <li><a href="CV?action=list">Quản lí CV</a></li>
                            </ul>	
                        </li>

                    </ul>
                    <%}%>

                    <% 
                             role = session.getAttribute("role");
                                if (role.equals("Admin")) { 
                    %>
                    <ul data-submenu-title="Quản lí">
                        <li><a href="#"><i class="icon-material-outline-business-center"></i> Quản Lí</a>
                            <ul>
                                <li><a href="AccountManagement">Quản lí người dùng</a></li>
                                <li><a href="JobManagement?command=LIST">Quản lí bài đăng tuyển</a></li>
                            </ul>	
                        </li>

                    </ul>
                    <%}%>
                    <ul data-submenu-title="Tài khoản">
                        <li ><a href=""><i class="icon-line-awesome-dollar"></i> Nạp tiền vào ví</a></li>
                        <li><a href="UpdateServlet?action=load"><i class="icon-material-outline-settings"></i>Sửa thông tin</a></li>
                        <li><a href="logout"><i class="icon-material-outline-power-settings-new"></i> Đăng Xuất</a></li>
                    </ul>

                </div>
            </div>
            <!-- Navigation / End -->

        </div>
    </div>
</div>
<!-- Dashboard Sidebar / End -->