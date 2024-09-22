<%-- 
    Document   : sidebar
    Created on : Sep 19, 2024, 11:19:26 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/colors/blue.css">
<div class="dashboard-sidebar">
		<div class="dashboard-sidebar-inner" data-simplebar>
			<div class="dashboard-nav-container">
				<!-- Responsive Navigation Trigger -->
				<a href="#" class="dashboard-responsive-nav-trigger">
					<span class="hamburger hamburger--collapse" >
						<span class="hamburger-box">
							<span class="hamburger-inner"></span>
						</span>
					</span>
					<span class="trigger-title">Dashboard Navigation</span>
				</a>
				
				<!-- Navigation -->
				<div class="dashboard-nav">
					<div class="dashboard-nav-inner">

						<ul data-submenu-title="Start">
							<li><a href="dashboard.html"><i class="icon-material-outline-dashboard"></i> Dashboard</a></li>
							<li><a href="dashboard-messages.html"><i class="icon-material-outline-question-answer"></i> Messages <span class="nav-tag">2</span></a></li>
							<li><a href="dashboard-bookmarks.html"><i class="icon-material-outline-star-border"></i> Bookmarks</a></li>
							<li><a href="dashboard-reviews.html"><i class="icon-material-outline-rate-review"></i> Reviews</a></li>
						</ul>
						<% 
                                                        Object role = session.getAttribute("role");
                                                            if (role.equals("Employer")) { 
                                                            %>
						<ul data-submenu-title="Organize and Manage">
							<li><a href="#"><i class="icon-material-outline-business-center"></i> Quản lí công việc</a>
								<ul>
									<li><a href="dashboard-manage-jobs.html">Các việc đã đăng <span class="nav-tag">3</span></a></li>
									<li><a href="dashboard-manage-candidates.html">Danh sách ứng viên chào giá</a></li>
									<li><a href="dashboard-post-a-job.html">Đăng tin tuyển dụng</a></li>
								</ul>	
							</li>
							
						</ul>
                                                <%}%>
                                                <% 
                                                         role = session.getAttribute("role");
                                                            if (role.equals("Seeker")) { 
                                                            %>
						<ul data-submenu-title="Organize and Manage">
							<li><a href="#"><i class="icon-material-outline-business-center"></i> Quản lí công việc</a>
								<ul>
									<li><a href="dashboard-manage-jobs.html">Danh sách các việc đã ứng tuyển <span class="nav-tag">3</span></a></li>
									<li><a href="dashboard-manage-candidates.html">Tạo CV</a></li>
                                                                        <li><a href="dashboard-manage-candidates.html">Update CV</a></li>
								</ul>	
							</li>
							
						</ul>
                                                <%}%>
						<ul data-submenu-title="Account">
							<li class="active"><a href="UpdateServlet?action=load"><i class="icon-material-outline-settings"></i> Settings</a></li>
							<li><a href="logout"><i class="icon-material-outline-power-settings-new"></i> Logout</a></li>
						</ul>
						
					</div>
				</div>
				<!-- Navigation / End -->

			</div>
		</div>
	</div>
	<!-- Dashboard Sidebar / End -->