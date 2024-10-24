<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jobtrans.model.JobCategory" %>
<%@page import="jobtrans.utils.CookieUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/tasks-grid-layout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:39 GMT -->
    <head>
        <jsp:useBean id="category" class="jobtrans.dal.JobCategoryDAO" scope="session"></jsp:useBean>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/colors/blue.css">
            <link rel="stylesheet" href="css/other.css">
            <link rel="stylesheet" href="css/popup.css">

            <style>
                #job tr:nth-child(even){
                    background-color: #DCDCDC;
                }

                .dropdown-toggle::after {
                    content: none; /* Loại bỏ nội dung */
                    display: none; /* Ẩn phần tử */
                }
                
                nav {
                    display: flex;
                    justify-content: center;
                }
            </style>
        </head>
        <body class="gray">
            
            <!-- Wrapper -->
            <div id="wrapper">
            <%@include file="includes/header.jsp" %>
            <div class="clearfix"></div>
            <div class="dashboard-container">
                <%@include file="/includes/sidebar.jsp" %>
                <div class="dashboard-content-container" data-simplebar>
                    <div class="dashboard-content-inner" >
                        <div class="container">
                            <div class="row">    
                                <div class="col-xl-12 col-lg-12 content-left-offset">
                                    <div class="row">
                                        <div class="col-xl-3"></div>
                                        <div class="col-xl-6">
                                            <h2 class="text-center page-title">Quản Lý Công Việc</h2>
                                        </div>
                                        <div class="col-xl-3">
                                            <div class="sidebar-container" style="margin-bottom: 0">
                                                <div class="sidebar-widget" style="margin-bottom: 0">
                                                    <select class="selectpicker default" multiple data-selected-text-format="count" data-size="8" title="Tất cả trạng thái" onchange="filterJobsByCategory()">
                                                        <option value="Đã trả lương">Đã trả lương</option>
                                                        <option value="Đã hoàn tiền">Đã hoàn tiền</option>
                                                        <option value="Đã hoàn thành">Đã hoàn thành</option>
                                                        <option value="Đã nộp sản phẩm">Đã nộp sản phẩm</option>
                                                        <option value="Bị khiếu nại">Bị khiếu nại</option>
                                                        <option value="Đang làm việc">Đang làm việc</option>
                                                        <option value="Chờ đặt cọc">Chờ đặt cọc</option>
                                                        <option value="Đang tuyển">Đang tuyển</option>
                                                    </select>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container tasks-list-container margin-top-15">
                                        <div class="row" id="jobListContainer">
                                            <!-- Task -->
                                            <table id="job" class="align-content-center table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" style="color: white; background-color: #2a41e8;">Tên Công Việc</th>
                                                        <th scope="col" style="color: white; background-color: #2a41e8;">Phân Loại</th>
                                                        <th scope="col" style="color: white; background-color: #2a41e8;">Tình Trạng</th>
                                                        <th scope="col" style="color: white; background-color: #2a41e8;">Hành Động</th>
                                                        <th scope="col" style="color: white; background-color: #2a41e8;">Duyệt</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${jobList}" var="o">
                                                        <tr>
                                                            <td class="align-content-center" ><h4>${o.jobTitle}</h4></td>
                                                            <td class="align-content-center" ><h4>${category.getCategoryById(o.categoryId).categoryName}</h4></td>
                                                            <td class="align-content-center" ><h4>${o.status}</h4></td>
                                                            <td class="align-content-center" >
                                                                <table>
                                                                    <tr>
                                                                        <td class="align-content-center" >
                                                                            <a href="JobManagement?jid=${o.jobId}&command=DETAIL"><button class="btn btn-secondary" style="font-size: 14px; padding: 10px 5px 10px 5px;">Xem chi tiết</button></a>
                                                                        </td>
                                                                        <td class="align-content-center" >
                                                                            <a class="button gray ripple-effect ico border border-primary" title="Xóa" data-tippy-placement="top" onclick="openPopup(this)" data-jobid="${o.jobId}"><i class="icon-feather-trash-2"></i></a>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td class="align-content-center" >
                                                                <c:if test="${o.labelVerify == 'Được duyệt'}">
                                                                    <button type="button" style="background-color: green; font-size: 14px; padding: 10px 5px 10px 5px;" class="btn btn-success">Đã Duyệt</button>
                                                                </c:if>
                                                                <c:if test="${o.labelVerify != 'Được duyệt'}">
                                                                    <a href="JobManagement?jid=${o.jobId}&command=VERIFY"><button type="button" style="background-color: red; font-size: 14px; padding: 10px 5px 10px 5px;" class="btn btn-danger">Chưa Duyệt</button></a>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <nav id="pageDevide">
                                        <ul class="pagination">
                                            <c:if test="${currentPage != 1}">
                                                <c:if test="${sessionScope.conditionPage == 'true'}">
                                                    <li class="page-item"><a class="page-link" currentPage="${currentPage-1}" onclick="filterJobsByStatus(this)">PreviousFilter</a></li>
                                                </c:if>
                                                <c:if test="${sessionScope.conditionPage == 'false'}">
                                                    <li class="page-item"><a class="page-link" href="JobManagement?command=LIST&currentPage=${currentPage-1}">Previous</a></li>
                                                </c:if>
                                            </c:if>

                                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                                <c:choose>
                                                    <c:when test="${currentPage eq i}">
                                                        <li class="page-item active">
                                                            <a class="page-link">${i} <span class="sr-only">(current)</span></a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:if test="${sessionScope.conditionPage == 'true'}">
                                                            <li class="page-item"><a class="page-link" currentPage="${i}" onclick="filterJobsByStatus(this)">${i}</a></li>
                                                        </c:if>
                                                        <c:if test="${sessionScope.conditionPage == 'false'}">
                                                            <li class="page-item"><a class="page-link" href="JobManagement?command=LIST&currentPage=${i}">${i}</a></li>
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>

                                            <c:if test="${currentPage lt noOfPages}">
                                                <c:if test="${sessionScope.conditionPage == 'true'}">
                                                    <li class="page-item"><a class="page-link" currentPage="${currentPage+1}" onclick="filterJobsByStatus(this)">Next</a></li>
                                                </c:if>
                                                <c:if test="${sessionScope.conditionPage == 'false'}">
                                                    <li class="page-item"><a class="page-link" href="JobManagement?command=LIST&currentPage=${currentPage+1}">Next</a></li>
                                                </c:if>
                                            </c:if>
                                        </ul>
                                    </nav>
                                        </div>
                                        
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Footer
                    ================================================== -->
                    <%@include file="includes/subfooter.jsp" %>
                    <!-- Footer / End -->
                </div>
            </div>

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
        <!-- Scripts
        ================================================== -->
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

        <!-- Google Autocomplete -->
        <script>
            function initAutocomplete() {
                var options = {
                    types: ['(cities)'],
                    // componentRestrictions: {country: "us"}
                };

                var input = document.getElementById('autocomplete-input');
                var autocomplete = new google.maps.places.Autocomplete(input, options);
            }



            // Định dạng số tiền VND
            function formatCurrencyVND(amount) {
                return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(amount);
            }

            // Định dạng giá trị budget sau khi trang tải
            document.addEventListener("DOMContentLoaded", function () {
                // Lấy tất cả các phần tử chứa budget dựa trên id
                var budgetElements = document.querySelectorAll('[id^="salaryAmount-"]');

                // Lặp qua các phần tử và định dạng giá trị
                budgetElements.forEach(function (budgetElement) {
                    var budget = parseFloat(budgetElement.textContent);  // Chuyển đổi chuỗi thành số
                    budgetElement.textContent = formatCurrencyVND(budget);  // Định dạng lại và hiển thị
                });
            });

        </script>
        <script>
            const textElement = document.getElementById("taskText");
            const maxLength = 100; // Số ký tự bạn muốn giới hạn
            let text = textElement.innerText;

            if (text.length > maxLength) {
                textElement.innerText = text.substring(0, maxLength) + "...";
            }
        </script>
        <script>
            function filterJobsByCategory() {
                var selectedStatuses = $('.selectpicker').val();
                var statuses = JSON.stringify(selectedStatuses);
                
                $.ajax({
                    url: 'JobManagement', // Đường dẫn đến servlet xử lý
                    type: 'GET',
                    data: {
                        command: 'filterJobsByStatus',
                        statuses: statuses
                    },
                    success: function (response) {
                        $('#jobListContainer').html(response);
                    },
                    error: function (xhr, status, error) {
                        console.error('Error filtering jobs: ', error);
                    }
                });
            }
        </script>
        
        <script>
            function filterJobsByStatus(element) {
                var selectedStatuses = $('.selectpicker').val();
                var statuses = JSON.stringify(selectedStatuses);
                var currentPage = element.getAttribute("currentPage");
                
                $.ajax({
                    url: 'JobManagement', // Đường dẫn đến servlet xử lý
                    type: 'GET',
                    data: {
                        command: 'filterJobsByStatus',
                        statuses: statuses,
                        currentPage: currentPage
                    },
                    success: function (response) {
                        $('#jobListContainer','#pageDevide').html(response);
                    },
                    error: function (xhr, status, error) {
                        console.error('Error filtering jobs: ', error);
                    }
                });
            }
        </script>
        <script>
            function openPopup(element) { // Click vào button thì gán style cho Popup là display:block để hiển thị lên
                var jobId = element.getAttribute("data-jobid");
                console.log("Job ID: " + jobId);

                // Cập nhật URL của nút "Xác Nhận"
                var confirmButton = document.getElementById("confirmDeleteButton");
                confirmButton.href = "JobManagement?command=DELETE&jid=" + jobId;
                document.getElementById("popup").style.display = "block";
            }


        </script>

        <script>
            function closePopup() { // Click vào close thì gán style cho Popup là display:none để ẩn đi
                document.getElementById("popup").style.display = "none";
            }
        </script>

        <!-- Google API & Maps -->
        <!-- Geting an API Key: https://developers.google.com/maps/documentation/javascript/get-api-key -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaoOT9ioUE4SA8h-anaFyU4K63a7H-7bc&amp;libraries=places"></script>

    </body>

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/tasks-grid-layout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:39 GMT -->
</html>