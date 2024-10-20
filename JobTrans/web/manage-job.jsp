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
<%@ page import="java.time.LocalDateTime, java.time.Duration" %>
<!doctype html>
<html lang="en">
<head>
    <jsp:useBean id="jobDAO" class="jobtrans.dal.JobDAO" scope="session"></jsp:useBean>
    <jsp:useBean id="jgDAO" class="jobtrans.dal.JobGreetingDAO" scope="session"></jsp:useBean>
<title>Danh sách bài đăng</title>
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
				<h3>Quản Lý Nhiệm Vụ</h3>
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
									<!-- Job Listing -->
									<div class="job-listing width-adjustment">

										<!-- Job Listing Details -->
										<div class="job-listing-details">

											<!-- Details -->
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
									
									<!-- Task Details -->
									<ul class="dashboard-task-info">
                                                                            <li><strong>${jgDAO.getJobGreetingByJobId(myJob.jobId).size()}</strong><span>Lượt Chào Giá</span></li>
                                                                            <li><strong><fmt:formatNumber value="${jgDAO.getAveragePriceByJobId(myJob.jobId)}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" /></strong><span>Giá Thầu Trung Bình</span></li>
									</ul>

									<!-- Buttons -->
									<div class="buttons-to-right always-visible">
										<a href="job?command=manageSeeker&jobId=${myJob.jobId}" class="button ripple-effect"><i class="icon-material-outline-supervisor-account"></i> Quản Lý Tuyển Dụng </a>
										<a href="job?command=LOAD&jid=${myJob.jobId}" class="button gray ripple-effect ico" title="Chỉnh Sửa" data-tippy-placement="top"><i class="icon-feather-edit"></i></a>
										<a class="button gray ripple-effect ico" title="Xóa" data-tippy-placement="top" onclick="openPopup(this)" data-jobid="${myJob.jobId}"><i class="icon-feather-trash-2"></i></a>
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

<!-- Dashboard Container / End -->

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
$('#snackbar-user-status label').click(function() { 
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

<!-- Mirrored from www.vasterad.com/themes/hireo_21/dashboard-manage-tasks.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:48 GMT -->
</html>