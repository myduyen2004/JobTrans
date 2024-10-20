<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="en">
    <head>
        <title>Ví của tôi</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/colors/blue.css">
        <link rel="stylesheet" href="css/wallet-style.css">
    </head>
    <body class="gray">

        <div id="wrapper">

            <%@include file="/includes/header.jsp" %>
            <div class="clearfix"></div>

            <div class="dashboard-container">

                <%@include file="/includes/sidebar.jsp" %>

                <div class="dashboard-content-container" data-simplebar>
                    <div class="dashboard-content-inner" >
                        <div class="wallet-container">
                            <h2>Ví của tôi</h2>
                            <div class="wallet-header">
                                <div class="wallet-info">
                                    <div class="wallet-icon">💰</div> <!-- Biểu tượng ví -->
                                    <div>
                                        <p>Số dư tài khoản</p>
                                        <p><strong>
                                                <fmt:formatNumber value="${user.getBalance()}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" />
                                            </strong></p>
                                    </div>
                                </div>
                                <button class="btn-nap-tien" onclick="window.location.href = './vnpay.jsp';">Nạp tiền</button>
                            </div>

                            <div class="transaction-history">
                                <h3>Lịch sử giao dịch</h3>
                                <div class="filter-container">
                                    <label for="filter-date">Chọn ngày:</label>
                                    <input type="date" id="filter-date">
                                    <button class="btn-filter" onclick="filterTransactions()">Lọc</button>
                                </div>
                                <table id="transaction-table">
                                    <thead>
                                        <tr>
                                            <th>Ngày</th>
                                            <th>Số tiền</th>
                                            <th>Hành động</th>
                                            <th>Ghi chú</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="trans" items = "${transList}">
                                            <tr>
                                                <td>${trans.createdDate}</td>
                                                <td><fmt:formatNumber value="${trans.getAmount()}" type="currency" currencySymbol="₫" pattern="#,##0" groupingUsed="true" /></td>
                                                <td>${trans.getTransactionType()}</td>
                                                <td>${trans.getDescription()}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <button class="btn-xem-them" onclick="toggleView()">Xem thêm</button>
                        </div>

                        <!-- Row / End -->

                        <!-- Footer -->
                        <%@include file="/includes/subfooter.jsp" %>

                    </div>
                </div>
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

        <!-- Chart.js // documentation: http://www.chartjs.org/docs/latest/ -->
        <script src="js/chart.min.js"></script>
        <script>
            Chart.defaults.global.defaultFontFamily = "Nunito";
            Chart.defaults.global.defaultFontColor = '#888';
            Chart.defaults.global.defaultFontSize = '14';

            var ctx = document.getElementById('chart').getContext('2d');

            var chart = new Chart(ctx, {
                type: 'line',

                // The data for our dataset
                data: {
                    labels: ["January", "February", "March", "April", "May", "June"],
                    // Information about the dataset
                    datasets: [{
                            label: "Views",
                            backgroundColor: 'rgba(42,65,232,0.08)',
                            borderColor: '#2a41e8',
                            borderWidth: "3",
                            data: [196, 132, 215, 362, 210, 252],
                            pointRadius: 5,
                            pointHoverRadius: 5,
                            pointHitRadius: 10,
                            pointBackgroundColor: "#fff",
                            pointHoverBackgroundColor: "#fff",
                            pointBorderWidth: "2",
                        }]
                },

                // Configuration options
                options: {

                    layout: {
                        padding: 10,
                    },

                    legend: {display: false},
                    title: {display: false},

                    scales: {
                        yAxes: [{
                                scaleLabel: {
                                    display: false
                                },
                                gridLines: {
                                    borderDash: [6, 10],
                                    color: "#d8d8d8",
                                    lineWidth: 1,
                                },
                            }],
                        xAxes: [{
                                scaleLabel: {display: false},
                                gridLines: {display: false},
                            }],
                    },

                    tooltips: {
                        backgroundColor: '#333',
                        titleFontSize: 13,
                        titleFontColor: '#fff',
                        bodyFontColor: '#fff',
                        bodyFontSize: 13,
                        displayColors: false,
                        xPadding: 10,
                        yPadding: 10,
                        intersect: false
                    }
                },

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

                if ($('.submit-field')[0]) {
                    setTimeout(function () {
                        $(".pac-container").prependTo("#autocomplete-container");
                    }, 300);
                }
            }
        </script>
        <script>
            // Lọc theo ngày
            function filterTransactions() {
                const filterDate = document.getElementById("filter-date").value;
                const table = document.getElementById("transaction-table");
                const tbody = table.getElementsByTagName("tbody")[0];
                const rows = tbody.getElementsByTagName("tr");

                for (let i = 0; i < rows.length; i++) {
                    const dateCell = rows[i].getElementsByTagName("td")[0];
                    const transactionDate = new Date(dateCell.innerText.split(" ")[0]); // Lấy phần ngày từ cột "Ngày"
                    const filterDateObj = new Date(filterDate);

                    if (filterDate === "" || transactionDate.toDateString() === filterDateObj.toDateString()) {
                        rows[i].style.display = "";
                    } else {
                        rows[i].style.display = "none";
                    }
                }
            }
        </script>
        <script>
        // Xử lý hiển thị "Xem thêm" và "Thu gọn"
            function toggleView() {
                const tableRows = document.querySelectorAll('#transaction-table tbody tr');
                const button = document.querySelector('.btn-xem-them');
                const isExpanded = button.textContent === "Thu gọn";

                tableRows.forEach((row, index) => {
                    if (isExpanded && index >= 5) {
                        row.style.display = "none";
                    } else {
                        row.style.display = "table-row";
                    }
                });

                button.textContent = isExpanded ? "Xem thêm" : "Thu gọn";
            }
            function sortTransactions() {
                const tableBody = document.querySelector('#transaction-table tbody');
                const rows = Array.from(tableBody.querySelectorAll('tr'));

                rows.sort((a, b) => {
                    const dateA = new Date(a.cells[0].textContent.trim());
                    const dateB = new Date(b.cells[0].textContent.trim());

                    // Sắp xếp giảm dần (gần nhất đến xa nhất)
                    return dateB - dateA;
                });

                // Xóa tất cả các hàng hiện tại và thêm lại theo thứ tự sắp xếp
                rows.forEach(row => tableBody.appendChild(row));
            }

        // Gọi hàm sắp xếp khi tải trang
            window.onload = function () {
                sortTransactions(); // Sắp xếp theo ngày khi tải trang
            };

        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaoOT9ioUE4SA8h-anaFyU4K63a7H-7bc&amp;libraries=places&amp;callback=initAutocomplete"></script>
    </body>
</html>
