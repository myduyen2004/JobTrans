<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jobtrans.model.JobCategory" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/tasks-grid-layout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:39 GMT -->
    <head>
        <jsp:useBean id="category" class="jobtrans.dal.JobCategoryDAO" scope="session"></jsp:useBean>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/colors/blue.css">
            <link rel="stylesheet" href="css/other.css">
            <link rel="stylesheet" href="css/popup.css">
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
                        <div class="margin-top-20"></div>
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-2 col-lg-4">
                                    <div class="sidebar-container">
                                        <div class="sidebar-widget">
                                            <h3>Trạng Thái</h3>
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
                                <div class="col-xl-10 col-lg-8 content-left-offset">

                                    <h3 class="page-title">Quản Lý Công Việc</h3>
                                    <div class="container tasks-list-container margin-top-15">
                                        <div class="row" id="jobListContainer">
                                            <!-- Task -->
                                            <table class="table table-bordered border-primary">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Tên Công Việc</th>
                                                        <th scope="col">Phân Loại</th>
                                                        <th scope="col">Tình Trạng</th>
                                                        <th scope="col">Hành Động</th>
                                                        <th scope="col">Duyệt</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${jobList}" var="o">
                                                        <tr>
                                                            <td><h4>${o.jobTitle}</h4></td>
                                                            <td><h4>${category.getCategoryById(o.categoryId).categoryName}</h4></td>
                                                            <td><h4>${o.status}</h4></td>
                                                            <td>
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <a href="#"><button class="btn btn-secondary btn-custom">Xem chi tiết</button></a>
                                                                        </td>
                                                                        <td>
                                                                            <a class="button gray ripple-effect ico" title="Xóa" data-tippy-placement="top" onclick="openPopup(this)" data-jobid="${o.jobId}"><i class="icon-feather-trash-2"></i></a>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td>
                                                                <c:if test="${o.labelVerify == 'Được duyệt'}">
                                                                    <button type="button" style="background-color: green" class="btn btn-success">Đã Duyệt</button>
                                                                </c:if>
                                                                <c:if test="${o.labelVerify != 'Được duyệt'}">
                                                                    <button type="button" style="background-color: red" class="btn btn-danger">Chưa Duyệt</button>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
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