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

                                        <ul data-submenu-title="Bắt Đầu">
                                            <li><a href="dashboard.html"><i class="icon-material-outline-dashboard"></i> Bảng Điều Khiển</a></li>
                                            <li><a href="dashboard-messages.html"><i class="icon-material-outline-question-answer"></i> Tin nhắn <span class="nav-tag">2</span></a></li>
                                            <li><a href="dashboard-bookmarks.html"><i class="icon-material-outline-star-border"></i> Đánh Dấu</a></li>
                                            <li><a href="dashboard-reviews.html"><i class="icon-material-outline-rate-review"></i> Đánh Giá</a></li>
                                        </ul>

						<% 
                                                        Object role = session.getAttribute("role");
                                                            if (role.equals("Employer")) { 
                                                            %>
						<ul data-submenu-title="Organize and Manage">
							<li><a href="#"><i class="icon-material-outline-business-center"></i> Quản Lí Công Việc</a>
								<ul>
									<li><a href="dashboard-manage-jobs.html">Các Việc Đã Đăng <span class="nav-tag">3</span></a></li>
									<li><a href="dashboard-manage-candidates.html">Danh Sách Ứng Viên Chào Giá</a></li>
									<li><a href="dashboard-post-a-job.html">Đăng Tin Tuyển Dụng</a></li>
								</ul>	
							</li>
							
						</ul>
                                                <%}%>
                                                <% 
                                                         role = session.getAttribute("role");
                                                            if (role.equals("Seeker")) { 
                                                            %>
						<ul data-submenu-title="Organize and Manage">
							<li><a href="#"><i class="icon-material-outline-business-center"></i> Quản Lí Công Việc</a>
								<ul>
									<li><a href="dashboard-manage-jobs.html">Danh Sách Các Việc Đã Ứng Tuyển <span class="nav-tag">3</span></a></li>
									<li><a href="create?action=load&cid=${sessionScope.id}">Tạo CV</a></li>
                                                                        <li><a href="dashboard-manage-candidates.html">Update CV</a></li>
								</ul>	
							</li>
							
						</ul>
                                                <%}%>
						<ul data-submenu-title="Account">
                                                    <li ><a href=""><i class="icon-material-outline-settings"></i> Nạp tiền vào ví</a></li>
							<li><a href="UpdateServlet?action=load"><i class="icon-material-outline-settings"></i> Cài Đặt</a></li>
							<li><a href="logout"><i class="icon-material-outline-power-settings-new"></i> Đăng Xuất</a></li>
						</ul>
						
					</div>
				</div>
				<!-- Navigation / End -->

			</div>
		</div>
	</div>
	<!-- Dashboard Sidebar / End -->