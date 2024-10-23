<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jobtrans.model.JobCategory" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/tasks-grid-layout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:39 GMT -->
    <head>
        <jsp:useBean id="category" class="jobtrans.dal.JobCategoryDAO" scope="session"></jsp:useBean>
        <jsp:useBean id="user" class="jobtrans.dal.UserDAO" scope="session"></jsp:useBean>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/colors/blue.css">
            <link rel="stylesheet" href="css/other.css">
            <link rel="stylesheet" href="css/popup.css">
            
            <style>
                #job tr:nth-child(even){background-color: #DCDCDC;}
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
                        <div class="margin-top-20"></div>
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-11 col-lg-11 content-left-offset">

                                    <h2 class="text-center page-title">Thông Tin Chi Tiết Công Việc</h2>
                                    <div class="container tasks-list-container margin-top-15">
                                        <div class="row" id="jobListContainer">
                                            <!-- Task -->
                                            <table id="job" class="table">
                                                <tbody>
                                                    <tr class="align-content-center row">
                                                        <th class="col-xl-3" scope="col" style="color: white; background-color: #007bff;">Tên Công Việc</th>
                                                        <td class="col-xl-9"><h4>${job.jobTitle}</h4></td>
                                                    </tr>
                                                    <tr class="align-content-center row">
                                                        <th  class="col-xl-3" scope="col" style="color: white; background-color: #007bff;">Mô Tả Công Việc</th>
                                                        <td class="col-xl-9"><h4>${job.description}</h4></td>
                                                    </tr>
                                                    <tr class="align-content-center row">
                                                        <th  class="col-xl-3" scope="col" style="color: white; background-color: #007bff;">Phân Loại</th>
                                                        <td class="col-xl-9"><h4>${category.getCategoryById(job.categoryId).categoryName}</h4></td>
                                                    </tr>
                                                    <tr class="align-content-center row">
                                                        <th  class="col-xl-3" scope="col" style="color: white; background-color: #007bff;">Nhà tuyển dụng</th>
                                                        <td class="col-xl-9"><h4>${user.getUserById(job.userId).userName}</h4></td>
                                                    </tr>
                                                    <tr class="align-content-center row">
                                                        <th class="col-xl-3"  scope="col" style="color: white; background-color: #007bff;">Ngân Sách</th>
                                                        <td class="col-xl-9">
                                                            <h4>
                                                                <strong>
                                                                    <fmt:formatNumber value="${job.budget}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" />
                                                                </strong>
                                                            </h4>
                                                        </td>
                                                    </tr>
                                                    <tr class="align-content-center row">
                                                        <th  class="col-xl-3" scope="col" style="color: white; background-color: #007bff;">Tình Trạng</th>
                                                        <td class="col-xl-9"><h4>${job.status}</h4></td>
                                                    </tr>
                                                    <tr class="align-content-center row">
                                                        <th  class="col-xl-3" scope="col" style="color: white; background-color: #007bff;">Ngày hết hạn</th>
                                                        <td class="col-xl-9"><h4>${job.dueDate}</h4></td>
                                                    </tr>
                                                    <tr class="align-content-center row">
                                                        <th class="col-xl-3"  scope="col" style="color: white; background-color: #007bff;">Địa điểm</th>
                                                        <td class="col-xl-9"><h4>${job.address}</h4></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td>
                                                        <a href="job?command=manageSeeker&jobId=${job.jobId}"><button class="btn btn-secondary">Danh Sách Ứng Tuyển</button></a>
                                                    </td>
                                                    <td>
                                                        <a href="JobManagement?jid=${job.jobId}&command=REPORT"><button class="btn btn-secondary">Chi Tiết Khiếu Nại</button></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="mt-4 mb-2">
                                            <form action="JobManagement" method="get">
                                                <input type="hidden" name="command" value="PAYSALARY">
                                                <input type="hidden" name="jid" value="${job.jobId}">
                                                <input type="hidden" name="description" value="Nhận lương">
                                                <c:if test="${msgSalary != 'Trả Lương Hoàn Tất!'}">
                                                    <h4 style="font-style: italic; color: red;">${msgSalary}</h4>
                                                </c:if>
                                                <c:if test="${msgSalary == 'Trả Lương Hoàn Tất!'}">
                                                    <h4 style="font-style: italic; color: green;">${msgSalary}</h4>
                                                </c:if>
                                                <h3 class="mb-1">Thanh toán tiền lương: </h3>
                                                <button type="submit" class="button ripple-effect big margin-top-10">Trả lương</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Footer
                    ================================================== -->
                    <%@include file="includes/footer.jsp" %>
                    <!-- Footer / End -->
                </div>
            </div>

        </div>
        <!-- Wrapper / End -->
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
        <!-- Google API & Maps -->
        <!-- Geting an API Key: https://developers.google.com/maps/documentation/javascript/get-api-key -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaoOT9ioUE4SA8h-anaFyU4K63a7H-7bc&amp;libraries=places"></script>

    </body>

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/tasks-grid-layout.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:39 GMT -->
</html>