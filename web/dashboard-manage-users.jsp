<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

    
    
<!-- Mirrored from www.vasterad.com/themes/hireo_21/dashboard-manage-jobs.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:47 GMT -->
<head>

<!-- Basic Page Needs
================================================== -->

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<style>
button[name="action"][value="banUser"] {
    background-color: red;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
}

button[name="action"][value="banUser"]:hover {
    background-color: darkred;
}

table#UserTable th,
table#UserTable td {
    width: 33.33%; /* Mỗi cột chiếm 1/3 của bảng */
    text-align: center; /* Canh giữa nội dung trong cột */ 
}
table#UserTable th,
table#UserTable td {
    width: 33.33%; /* Mỗi cột chiếm 1/3 của bảng */
    text-align: center; /* Canh giữa nội dung trong cột */ 
}
table#UserBanTable th,
table#UserBanTable td {
   width: 33.33%; /* Mỗi cột chiếm 1/3 của bảng */
    text-align: center; /* Canh giữa nội dung trong cột */  
}
</style>
 

<!-- CSS
================================================== -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/colors/blue.css">

</head>
<body class="gray">

<!-- Wrapper -->
<div id="wrapper">

<!-- Header Container
================================================== -->
<header id="header-container" class="fullwidth dashboard-header not-sticky">

	<!-- Header -->
	<%@include file="/includes/header.jsp" %>
	<!-- Header / End -->

</header>
<div class="clearfix"></div>
<!-- Header Container / End -->


<!-- Dashboard Container -->
<div class="dashboard-container">

    <!-- Dashboard Sidebar -->
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
                    <span class="trigger-title">Dashboard Navigation</span>
                </a>

                <!-- Navigation -->
                <div class="dashboard-nav">
                    <%@include file="/includes/sidebar.jsp" %>
                </div>
                <!-- Navigation / End -->
            </div>
        </div>
    </div>
    <!-- Dashboard Sidebar / End -->

    <div class="dashboard-content-container" data-simplebar>
        <div class="dashboard-content-inner">
            <!-- Dashboard Headline -->
            <div class="dashboard-headline">
                <h3>Quản lý người dùng</h3>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs" class="dark">
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Dashboard</a></li>
                        <li>Quản lý người dùng</li>
                    </ul>
                </nav>
            </div>

            <!-- Action Buttons -->
         <div class="row">
             <div class="col-xl-12" style="margin-bottom: 40px;margin-left: 160px">
        <form action="AccountManagement" method="get">
            <div class="row">
                <!-- Mỗi nút chiếm 4 cột -->
                <div class="col-md-4">
                    <button type="submit" name="action" value="viewSeeker" class="button ripple-effect btn-block">Người tìm việc</button>
                </div>
                <div class="col-md-4">
                    <button type="submit" name="action" value="viewEmployer" class="button ripple-effect btn-block">Người tuyển dụng</button>
                </div>
                <div class="col-md-4">
                    <button type="submit" name="action" value="viewUnBan" class="button ripple-effect btn-block">Đã Chặn</button>
                </div>
            </div>
        </form>
    </div>
</div>

            <!-- User List Row -->
<div class="row">
    <div class="col-xl-12">
        <div class="dashboard-box margin-top-0">
            <div class="content">
                <table id="UserTable" class="table table-striped">
                    <thead>
                        <tr>
                            <th style="padding-left: 150px">Tên Người Dùng</th>
                            <th style="padding-left: 200px">Vai Trò</th>
                            <th style="padding-left: 200px">Hành Động</th>
                        </tr>
                    </thead>
                    <tbody id="tableBody">
                        <c:forEach items="${list}" var="o">
                            <c:if test="${o.status == true}">
                                <tr>
                                    <td>${o.userName}</td>
                                    <td style="padding-left: 200px">
                                        <c:choose>
                                            <c:when  test="${o.role == 'Seeker'} ">
                                                 Người tìm việc
                                            </c:when>
                                            <c:when test="${o.role == 'Employer'}">
                                                Nhà tuyển dụng
                                            </c:when>
                                            <c:otherwise>
                                                Không xác định
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td style="padding-left: 150px">
                                        <form id="banForm" action="AccountManagement" method="get">
                                            <input type="hidden" name="userId" value="${o.userId}">
                                            <button type="submit" name="action" value="viewDetail" class="button ripple-effect">Xem Chi Tiết</button>
                                            <button type="button" name="action" value="banUser" class="button ripple-effect" onclick="confirmBan(event)">Chặn</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
                <!-- Pagination controls -->
                <div id="paginationControls" class="pagination-controls"></div>
            </div>
        </div>
    </div>
</div>




             <div class="row">
    <div class="col-xl-12">
        <div class="dashboard-box margin-top-0">
            <div class="content">
                <table id="UserBanTable" class="table table-striped">
                    <thead>
                      
                    </thead>
                    <tbody id="tableBodyBan">
                        <c:forEach items="${listBan}" var="o">
                            <tr>
                                <td style="padding-left: 80px">${o.userName}</td>
                                <td style="padding-left: 80px">
                                    <c:choose>
                                        <c:when test="${o.role == 'Seeker'}">
                                            Người tìm việc
                                        </c:when>
                                        <c:when test="${o.role == 'Employer'}">
                                            Nhà tuyển dụng
                                        </c:when>
                                        <c:otherwise>
                                            Không xác định
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td style="padding-left: 80px">
                                     <form id="unbanForm" action="AccountManagement" method="get">
                                        <input type="hidden" name="userId" value="${o.userId}">
                                        <button type="submit" name="action" value="viewDetail" class="button ripple-effect">Xem Chi Tiết</button>
                                        <button type="button" class="button ripple-effect" onclick="confirmUnban(event)">Gỡ Chặn</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!-- Pagination controls -->
                <div id="paginationControlsBan" class="pagination-controls"></div>
            </div>
        </div>
    </div>
</div>

            
            
        </div>
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
    // Hàm hiển thị pop-up xác nhận
    function confirmBan(event) {
        event.preventDefault(); // Ngăn chặn việc submit form ngay lập tức

        // Hiển thị hộp thoại xác nhận
        var confirmation = confirm("Bạn có chắc chắn muốn chặn người dùng này không?");
        
        // Nếu người dùng xác nhận, submit form
             if (confirmation) {
            // Thay đổi giá trị action của form để hướng đến banUser
            var form = document.getElementById("banForm");
            var actionInput = document.createElement("input"); // Tạo một input ẩn
            actionInput.type = "hidden"; // Thiết lập type là hidden
            actionInput.name = "action"; // Thiết lập tên cho input
            actionInput.value = "banUser"; // Thiết lập giá trị là "banUser"
            form.appendChild(actionInput); // Thêm input vào form
            form.submit(); // Submit form
        }
    }
</script>
<script>
    function confirmUnban(event) {
    event.preventDefault(); // Ngăn chặn hành động submit mặc định của nút

    // Hiển thị hộp thoại xác nhận
    var confirmation = confirm("Bạn có chắc chắn muốn gỡ chặn người dùng này không?");
    
    // Nếu người dùng xác nhận
    if (confirmation) {
        // Lấy form từ nút được nhấn
        var form = event.target.closest('form'); // Lấy form cha của nút được nhấn
        
        // Tạo một input ẩn để lưu giá trị action
        var actionInput = document.createElement("input"); 
        actionInput.type = "hidden"; // Thiết lập type là hidden
        actionInput.name = "action"; // Thiết lập tên cho input
        actionInput.value = "UnbanUser"; // Thiết lập giá trị là "UnbanUser"
        
        // Thêm input vào form
        form.appendChild(actionInput);
        
        // Gửi form
        form.submit(); 
    }
}

</script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
    const rowsPerPage = 5; // Số hàng trên mỗi trang
    const table = document.getElementById('UserTable');
    const tbody = document.getElementById('tableBody');
    const paginationControls = document.getElementById('paginationControls');
    
    let currentPage = 1;
    const rows = Array.from(tbody.getElementsByTagName('tr'));
    const totalPages = Math.ceil(rows.length / rowsPerPage);

    function displayRows(page) {
        const start = (page - 1) * rowsPerPage;
        const end = start + rowsPerPage;

        rows.forEach((row, index) => {
            row.style.display = (index >= start && index < end) ? '' : 'none';
        });
    }

    function setupPagination() {
        paginationControls.innerHTML = '';
        for (let i = 1; i <= totalPages; i++) {
            const button = document.createElement('button');
            button.textContent = i;
            button.classList.add('pagination-button');
            if (i === currentPage) {
                button.classList.add('active');
            }
            button.addEventListener('click', function () {
                currentPage = i;
                displayRows(currentPage);
                updatePaginationButtons();
            });
            paginationControls.appendChild(button);
        }
    }

    function updatePaginationButtons() {
        const buttons = paginationControls.getElementsByTagName('button');
        for (let button of buttons) {
            button.classList.remove('active');
        }
        buttons[currentPage - 1].classList.add('active');
    }

    displayRows(currentPage);
    setupPagination();
});

    
    document.addEventListener('DOMContentLoaded', function () {
    const rowsPerPageBan = 5; // Số hàng trên mỗi trang
    const tableBodyBan = document.getElementById('tableBodyBan');
    const paginationControlsBan = document.getElementById('paginationControlsBan');
    
    let currentPageBan = 1;
    const rowsBan = Array.from(tableBodyBan.getElementsByTagName('tr'));
    const totalPagesBan = Math.ceil(rowsBan.length / rowsPerPageBan);

    function displayRowsBan(page) {
        const start = (page - 1) * rowsPerPageBan;
        const end = start + rowsPerPageBan;

        rowsBan.forEach((row, index) => {
            row.style.display = (index >= start && index < end) ? '' : 'none';
        });
    }

    function setupPaginationBan() {
        paginationControlsBan.innerHTML = '';
        for (let i = 1; i <= totalPagesBan; i++) {
            const buttonBan = document.createElement('button');
            buttonBan.textContent = i;
            buttonBan.classList.add('pagination-button');
            if (i === currentPageBan) {
                buttonBan.classList.add('active');
            }
            buttonBan.addEventListener('click', function () {
                currentPageBan = i;
                displayRowsBan(currentPageBan);
                updatePaginationButtonsBan();
            });
            paginationControlsBan.appendChild(buttonBan);
        }
    }

    function updatePaginationButtonsBan() {
        const buttonsBan = paginationControlsBan.getElementsByTagName('button');
        for (let button of buttonsBan) {
            button.classList.remove('active');
        }
        buttonsBan[currentPageBan - 1].classList.add('active');
    }

    displayRowsBan(currentPageBan);
    setupPaginationBan();
});

    
</script>


</body>

<!-- Mirrored from www.vasterad.com/themes/hireo_21/dashboard-manage-jobs.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:47 GMT -->
</html>