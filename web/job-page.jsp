<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="jobtrans.model.Job" %>
<%@ page import="jobtrans.model.User" %>
<%@ page import="jobtrans.model.CV" %>
<%@ page import="jobtrans.model.JobGreeting" %>
<!doctype html>
<html lang="en">
    <head>
        <jsp:useBean id="jg" class="jobtrans.dal.JobGreetingDAO" scope="session"></jsp:useBean>
        <jsp:useBean id="userDAO" class="jobtrans.dal.UserDAO" scope="session"></jsp:useBean>
        <jsp:useBean id="cvDAO" class="jobtrans.dal.CVDAO" scope="session"></jsp:useBean>
            <title>Ứng tuyển ngay</title>
            <meta charset="utf-8">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/colors/blue.css">
            <link rel="stylesheet" href="css/other.css">
        </head>
        <body class="gray">
            <div id="wrapper">
            <%@include file="includes/header.jsp" %>    
            <div class="clearfix"></div>
            <div class="single-page-header" data-background-image="images/single-task.jpg">
                <div class="container">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="single-page-header-inner">
                                    <div class="left-side">
                                        <div class="header-image"><a href="single-company-profile.html"><img src="${userDAO.getUserById(job.userId).avatarUrl}" alt=""></a></div>
                                        <div class="header-details">
                                            <h3><p>${job.jobTitle}</p></h3>
                                            <h5>Về nhà tuyển dụng</h5>
                                            <ul>
                                                <li><a href="single-company-profile.html"><i class="icon-material-outline-business"></i> ${userDAO.getUserById(job.userId).userName}</a></li>
                                                <li><img class="flag" src="images/flags/vn.png" alt=""> Việt Nam</li>
                                                    <c:if test="${job.labelVerify == 'Được duyệt'}">
                                                    <li><div class="verified-badge-with-title">Phê duyệt bởi QTV</div></li>
                                                    </c:if>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="right-side">
                                        <div class="salary-box">
                                            <div class="salary-type">Ngân sách dự án</div>
                                            <div class="salary-amount" id="salaryAmount">
                                                <fmt:formatNumber value="${job.budget}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-xl-8 col-lg-8 content-right-offset">
                        <div class="single-page-section">
                            <h3 class="margin-bottom-25">Mô tả dự án</h3>
                            <p>${job.description}</p>
                        </div>
                        <div class="single-page-section">
                            <h3>Tệp đính kèm</h3>
                            <div class="attachments-container">
                                <a href="home?action=download&fileName=${job.docUrl}&jobId=${job.jobId}" class="attachment-box ripple-effect"><span>Tóm tắt dự án</span><i>PDF</i></a>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="boxed-list margin-bottom-60">
                            <div class="boxed-list-headline">
                                <h3 style="font-weight: bold; color: #2a41e8"><i class="icon-material-outline-group"></i> Danh sách chào giá</h3>
                            </div>
                            <ul class="boxed-list-ul">
                                <c:forEach var="jobGreeting" items="${jg.getJobGreetingByJobId(job.jobId)}">
                                    <li>

                                        <div class="bid">
                                            <!-- Avatar -->
                                            <div class="bids-avatar">
                                                <div class="freelancer-avatar">
                                                    <c:if test="${jobGreeting.status == 'Được chấp nhận'}">
                                                        <div class="verified-badge"></div>
                                                    </c:if>
                                                    <a href="#"><img src="${userDAO.getUserById(jobGreeting.jobSeekerId).avatarUrl}" alt=""></a>
                                                </div>
                                            </div>
                                            <div class="bids-content">
                                                <div class="freelancer-name">
                                                    <h4><a href="job?command=bidderDetail&userId=${userDAO.getUserById(jobGreeting.jobSeekerId).userId}">${userDAO.getUserById(jobGreeting.jobSeekerId).userName}</a></h4>
                                                </div>
                                            </div>

                                            <div class="bids-bid">
                                                <div class="bid-rate">
                                                    <div class="rate"><fmt:formatNumber value="${jobGreeting.price}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" /></div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>

                            </ul>
                        </div>

                    </div>

                    <div class="col-xl-4 col-lg-4">
                        <div class="sidebar-container">

                            <div class="countdown green margin-bottom-35">Thời hạn: ${due} ngày</div>
                            <div class="sidebar-widget">
                                <h3 style="font-weight: bold">Thông tin</h3>
                                <ul>
                                    <li><strong>Ngày hết hạn:</strong> ${job.dueDate}</li>
                                    <li><strong>Địa điểm:</strong> ${job.address}</li>
                                    <li><strong>Loại:</strong> Làm việc online</li>
                                    <li><strong>Đã đăng bởi:</strong> ${userDAO.getUserById(job.userId).userName}</li>
                                </ul>
                            </div>

                            <div class="sidebar-widget">
                                <h3 style="font-weight: bold">Thông tin chào giá</h3>
                                <div>

                                    <c:if test="${user != null && user.role == 'Seeker'}">

                                        <c:if test="${cvDAO.getCVByUserId(user.userId).isEmpty()}">
                                            <p>Hãy tạo ít nhất 1 CV trên hệ thống để ứng tuyển cho công việc này</p>
                                            <a href="CV?action=load-creating">Tạo CV</a>
                                        </c:if>
                                        <c:if test="${!cvDAO.getCVByUserId(user.userId).isEmpty()}">
                                            <c:if test="${jg.getJobGreetingBySeekerAndJob(user.userId,job.jobId) == null && user.role == 'Seeker'}">
                                                <form id="jgretting" action="apply" method="POST" enctype="multipart/form-data">
                                                    <h3>Đề xuất chào giá</h3>
                                                    <input type="hidden" name="userID" value="${user.userId}">
                                                    <input type="hidden" name="jobId" value="${job.jobId}">
                                                    <label for="price"><strong>Bạn muốn nhận (mức chi phí thực nhận cho dự án):</strong></label>
                                                    <div class="input-container">
                                                        <input type="text" id="price" name="price" oninput="formatCurrency(this)" placeholder="Nhập số tiền" required>
                                                    </div>

                                                    <label for="days"><strong>Dự kiến hoàn thành trong:</strong></label>
                                                    <div class="input-container">
                                                        <input type="number" id="days" name="days" style="padding-left: 34px;padding-right: 0px;width: 104px" required>
                                                    </div>
                                                    <label for="days"><strong>Chọn CV ứng tuyển (có sẵn từ hệ thống):</strong></label>
                                                    <div class="input-container">
                                                        <select name="cv" title="CV Jobtrans" required>
                                                            <c:forEach var="cv" items="${cvDAO.getCVByUserId(user.userId)}">
                                                                <option value="${cvDAO.getCvIdByTitleAndUserId(cv.title,user.userId)}">${cv.title}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <label for="proposal"><strong>Đề xuất thuyết phục nhà tuyển dụng:</strong></label>
                                                    <textarea id="intro" name="intro" 
                                                              style="width: 316px; height: 182px; text-align: left;" 
                                                              placeholder="- Tôi đã có ... năm kinh nghiệm&#10;- Tôi đã thành thạo ...&#10;- Hãy liên hệ tôi qua...." required></textarea>
                                                    <input class="uploadButton-input" type="file" id="upload" name="file" multiple/>
                                                    <label class="uploadButton-button" for="upload"><strong>Chọn tệp đính kèm:</strong></label>

                                                    <br>
                                                    <input type="submit" value="Ứng tuyển">
                                                </form>
                                            </c:if>
                                            <c:if test="${jg.getJobGreetingBySeekerAndJob(user.userId,job.jobId) != null}">
                                                <h3>Đề xuất của bạn</h3>
                                                <strong>Bạn muốn nhận (mức chi phí thực nhận cho dự án): 
                                                    <fmt:formatNumber value="${jg.getJobGreetingBySeekerAndJob(user.userId,job.jobId).price}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" /> VNĐ
                                                </strong>
                                                <label for="days"><strong>Dự kiến hoàn thành trong: 
                                                        ${jg.getJobGreetingBySeekerAndJob(user.userId,job.jobId).expectedDay} ngày
                                                    </strong>
                                                </label>
                                                <label for="days"><strong>CV ứng tuyển (có sẵn từ hệ thống): <a href="CV?action=view&cvId=${jg.getJobGreetingBySeekerAndJob(user.userId,job.jobId).cvId}">Xem CV</a></strong></label>
                                                <label for="proposal"><strong>Đề xuất thuyết phục nhà tuyển dụng:</strong></label>
                                                <p>${jg.getJobGreetingBySeekerAndJob(user.userId,job.jobId).introduction}</p>


                                                <label for="fileUpload"><strong>Xem tệp đính kèm:</strong></label>
                                                <a href="home?action=downloadJG&fileName=${jg.getJobGreetingBySeekerAndJob(user.userId,job.jobId).attachment}&jobId=${job.jobId}" class="attachment-box ripple-effect"><span>Tệp đính kèm</span><i>PDF</i></a>

                                                <br>
                                            </c:if>
                                        </c:if>

                                    </c:if>
                                    <c:if test="${user == null}">
                                        <p>Vui lòng đăng nhập để thực hiện ứng tuyển</p>
                                    </c:if>
                                </div>
                            </div>


                        </div>
                    </div>

                </div>
            </div>
            <div class="margin-top-15"></div>

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

            // Snackbar for "place a bid" button
            $('#snackbar-place-bid').click(function () {
                Snackbar.show({
                    text: 'Your bid has been placed!',
                });
            });


            // Snackbar for copy to clipboard button
            $('.copy-url-button').click(function () {
                Snackbar.show({
                    text: 'Copied to clipboard!',
                });
            });


        </script>
    </body>
    <%@include file="includes/footer.jsp" %>
</html>