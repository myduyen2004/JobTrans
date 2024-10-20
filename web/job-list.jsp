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
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/colors/blue.css">
            <link rel="stylesheet" href="css/other.css">
        </head>
        <body class="gray">

            <!-- Wrapper -->
            <div id="wrapper">
            <%@include file="includes/header.jsp" %>
            <div class="clearfix"></div>
            <div class="margin-top-90"></div>
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-4">
                        <div class="sidebar-container">
                            <div class="sidebar-widget">
                                <h3>Phân loại</h3>
                                <select class="selectpicker default" multiple data-selected-text-format="count" data-size="11" title="Tất cả danh mục" onchange="filterJobsByCategory()">
                                    <c:forEach var="cat" items="${categoryList}">
                                        <option value="${cat.categoryId}">${cat.categoryName}</option>
                                    </c:forEach>
                                </select>

                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-8 content-left-offset">

                        <h3 class="page-title">Tất cả công việc</h3>
                        <div class="container tasks-list-container margin-top-15">
                            <div class="row" id="jobListContainer">
                                <!-- Task -->

                                <c:forEach items="${jobList}" var="o">
                                    <div class="col-12">
                                        <a href="home?action=jobDetail&jobId=${o.jobId}" class="task-listing">
                                            <div class="task-listing-details row">
                                                <div class="task-listing-description col-8">
                                                    <h3 class="task-listing-title">${o.jobTitle}</h3>
                                                    <ul class="task-icons">
                                                        <li>${o.dueDate}</li>
                                                            <c:if test="${o.labelVerify == 'Được duyệt'}">
                                                            <li><div class="verified-badge-with-title">Phê duyệt bởi QTV</div></li>
                                                            </c:if>
                                                    </ul>
                                                    <p class="task-listing-text" id="taskText">${o.description}</p>
                                                    <div class="task-tags">
                                                        <span>${category.getCategoryById(o.categoryId).categoryName}</span>
                                                    </div>
                                                </div>
                                                <div class="task-listing-bid col-4">
                                                    <div class="task-listing-bid-inner">
                                                        <div class="task-offers">
                                                            <strong>
                                                                <fmt:formatNumber value="${o.budget}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" /></strong>
                                                            <span>Chi phí</span>
                                                        </div>
                                                        <span class="button button-sliding-icon ripple-effect">Chào giá<i class="icon-material-outline-arrow-right-alt"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>

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
                var selectedCategories = $('.selectpicker').val();
                var categories = JSON.stringify(selectedCategories);

                $.ajax({
                    url: 'home', // Đường dẫn đến servlet xử lý
                    type: 'GET',
                    data: {
                        action: 'filterJobs',
                        categories: categories
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