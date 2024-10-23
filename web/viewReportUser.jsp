<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<style>
  
    #UserTable {
        border-collapse: collapse;
        width: 100%;
    }

    #UserTable th, #UserTable td {
        border: 1px solid #ddd;
        padding: 8px;
    }

    /* Định dạng dòng lẻ màu xám nhạt */
    #UserTable tr:nth-child(odd) {
        background-color: #f2f2f2;
    }

    /* Định dạng màu dòng khi hover */
    #UserTable tr:hover {
        background-color: #ddd;
    }

    /* Định dạng tiêu đề bảng */
    #UserTable th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: center;
        background-color: blue;
        color: white;
    }

    /* Định dạng nút trong các hành động */
    .button {
        background-color: #4CAF50;
        border: none;
        color: white;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 4px;
    }

    .button.ripple-effect:hover {
        background-color: #45a049;
    }

    /* Điều chỉnh phần pagination */
    .pagination-controls {
        margin-top: 15px;
    }
    /* Pagination CSS */
    .pagination-controls {
        text-align: right; /* Đặt phân trang sang phải */
        margin-top: 15px;
    }

    .pagination-button {
        background-color: #f0f0f0;
        border: 1px solid #ccc;
        color: #333;
        padding: 8px 12px;
        margin: 0 5px;
        cursor: pointer;
        border-radius: 4px;
        transition: background-color 0.3s ease;
    }

    .pagination-button:hover {
        background-color: #007bff;
        color: white;
    }

    .pagination-button.active {
        background-color: #007bff;
        color: white;
        border-color: #007bff;
    }
    table tr:nth-child(odd) {
    background-color: #f2f2f2; /* màu xám nhạt */
}
</style>
 <style>
    .status-processed {
        color: green; /* Màu xanh cho trạng thái "đã xử lí" */
    }
    
    .status-pending {
        color: orange; /* Màu vàng cho trạng thái "đang chờ xử lý" */
    }
    
    .status-rejected {
        color: red; /* Màu đỏ cho trạng thái "từ chối xử lý" */
    }
</style>
 
     

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/single-freelancer-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:45 GMT -->
    <head>

        <jsp:useBean id="UserDAO" class="jobtrans.dal.UserDAO" scope="session"></jsp:useBean>

            <!-- Basic Page Needs
            ================================================== -->
            <title>JobTrans</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

            <!-- CSS
            ================================================== -->
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/colors/blue.css">

        </head>
        <body>

            <!-- Wrapper -->
            <div id="wrapper">
            <%@include file="includes/header.jsp" %>
            <div class="clearfix"></div>    



            <!-- Titlebar
            ================================================== -->
            <div class="single-page-header freelancer-header" data-background-image="images/single-freelancer.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="single-page-header-inner">
                                <div class="left-side">
                                    <div class="header-image freelancer-avatar"><img src= alt="${u.avatarUrl}"></div>
                                    <div class="header-details">
                                        <h3>${u.userName} <span>${u.specification}</span></h3>
                                        <ul>
                                            <li><div class="star-rating" data-rating="5.0"></div></li>
                                            <li>${u.address}</li>
                                            <li><div class="verified-badge-with-title">Đã xác minh</div></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="right-side">

                                 

                           



                                </div> 
                            </div>

                        </div>
                    </div>
                </div>
            </div>
                                        
                                        <!-- Nội dung khiếu nại  -->
            <div class="row">

                <div class="col-xl-12">
                    <div class="dashboard-box margin-top-0">
                       <div class="content">
    <table id="UserTable" class="table table-striped" style="margin: auto; text-align: center;">
        <thead>
            <tr>
                <th style="background-color: blue; color: white; width: 10%;">Người tố cáo</th>
                <th style="background-color: blue; color: white; width: 30%; word-wrap: break-word; white-space: normal;">Nội dung báo cáo</th>
                <th style="background-color: blue; color: white; width: 20%;">Tệp đính kèm</th>
                <th style="background-color: blue; color: white;  width: 20%;">Tình trạng</th>
                <th style="background-color: blue; color: white; ; width: 20%;">Hành Động</th>
            </tr>
        </thead>
        <tbody id="tableBody">
            <c:forEach items="${ur}" var="ur">
                <c:if test="${not empty UserDAO.getUserById(ur.reportBy)}">
                    <tr>
                        <td>${UserDAO.getUserById(ur.reportBy).userName}</td>
                        <td>${ur.contentReport}</td>
                       <td>
                                        <a href="path/to/attachments/${ur.attachment}" download="${ur.attachment}">
                                            ${ur.attachment}
                                        </a>
                                    </td>
                          <td>
                                        <span class="${ur.status == 'Đã xử lí' ? 'status-processed' : 
                                                      ur.status == 'Đang chờ xử lí' ? 'status-pending' : 
                                                      ur.status == 'Từ chối xử lí' ? 'status-rejected' : ''}">
                                            ${ur.status}
                                        </span>
                                    </td>
                        <td>
                            <form id="banForm" action="AccountManagement" method="get" style="padding-left: 46px;">
                                <input type="hidden" name="userId" value="${u.userId}">
                                 <input type="hidden" name="userReportId" value="${ur.userReportId}">
                                <button type="button" name="action" value="banUser" class="button ripple-effect" onclick="confirmBan(event)">Xử lý</button>
                                <button type="submit" name="action" value="viewDetail" class="button ripple-effect"  onclick="confirmReport(event)">Từ chối xử lý</button>
                            </form>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
                    <!-- Pagination controls -->
                
        </tbody>
       
    </table>
    <!-- Pagination controls -->
    <div id="paginationControls" class="pagination-controls"></div>
</div>

                    </div>
                </div>
            </div>



            <!-- Spacer -->
            <div class="margin-top-15"></div>
            <!-- Spacer / End-->

            <!-- Footer
            ================================================== -->
            <%@include file="includes/footer.jsp" %>

            <!-- Footer / End -->

        </div>
        <!-- Wrapper / End -->


        <!-- Make an Offer Popup
        ================================================== -->
        <div id="small-dialog" class="zoom-anim-dialog mfp-hide dialog-with-tabs">

            <!--Tabs -->
            <div class="sign-in-form">

                <ul class="popup-tabs-nav">
                    <li><a href="#tab">Gửi Đề Nghị</a></li>
                </ul>

                <div class="popup-tabs-container">

                    <!-- Tab -->
                    <div class="popup-tab-content" id="tab">

                        <!-- Welcome Text -->
                        <div class="welcome-text">
                            <h3>Thảo luận về dự án của bạn với David</h3>
                        </div>

                        <!-- Form -->
                        <form method="post">

                            <div class="input-with-icon-left">
                                <i class="icon-material-outline-account-circle"></i>
                                <input type="text" class="input-text with-border" name="name" id="name" placeholder="Họ và Tên"/>
                            </div>

                            <div class="input-with-icon-left">
                                <i class="icon-material-baseline-mail-outline"></i>
                                <input type="text" class="input-text with-border" name="emailaddress" id="emailaddress" placeholder="Địa Chỉ Email"/>
                            </div>

                            <textarea name="textarea" cols="10" placeholder="Tin Nhắn" class="with-border"></textarea>

                            <div class="uploadButton margin-top-25">
                                <input class="uploadButton-input" type="file" accept="image/*, application/pdf" id="upload" multiple/>
                                <label class="uploadButton-button ripple-effect" for="upload">Thêm Tệp Đính Kèm</label>
                                <span class="uploadButton-file-name">Các loại tệp được phép: zip, pdf, png, jpg <br> Kích thước tối đa: 50 MB.</span>
                            </div>

                        </form>

                        <!-- Button -->
                        <button class="button margin-top-35 full-width button-sliding-icon ripple-effect" type="submit">Gửi Đề Nghị <i class="icon-material-outline-arrow-right-alt"></i></button>

                    </div>
                    <!-- Login -->
                    <div class="popup-tab-content" id="loginn">

                        <!-- Welcome Text -->
                        <div class="welcome-text">
                            <h3>Thảo luận về dự án của bạn với Tom</h3>
                        </div>

                        <!-- Form -->
                        <form method="post" id="make-an-offer-form">

                            <div class="input-with-icon-left">
                                <i class="icon-material-outline-account-circle"></i>
                                <input type="text" class="input-text with-border" name="name2" id="name2" placeholder="Họ và Tên" required/>
                            </div>

                            <div class="input-with-icon-left">
                                <i class="icon-material-baseline-mail-outline"></i>
                                <input type="text" class="input-text with-border" name="emailaddress2" id="emailaddress2" placeholder="Địa Chỉ Email" required/>
                            </div>

                            <textarea name="textarea" cols="10" placeholder="Tin Nhắn" class="with-border"></textarea>

                            <div class="uploadButton margin-top-25">
                                <input class="uploadButton-input" type="file" accept="image/*, application/pdf" id="upload-cv" multiple/>
                                <label class="uploadButton-button" for="upload-cv">Thêm Tệp Đính Kèm</label>
                                <span class="uploadButton-file-name">Các loại tệp được phép: zip, pdf, png, jpg <br> Kích thước tối đa: 50 MB.</span>
                            </div>

                        </form>

                        <!-- Button -->
                        <button class="button full-width button-sliding-icon ripple-effect" type="submit" form="make-an-offer-form">Gửi Đề Nghị <i class="icon-material-outline-arrow-right-alt"></i></button>

                    </div>

                </div>
            </div>
        </div>

        <!-- Make an Offer Popup / End -->



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
                                            // Hàm hiển thị pop-up xác nhận
                                        function confirmReport(event) {
                                            event.preventDefault(); // Ngăn chặn việc submit form ngay lập tức

                                            // Hiển thị hộp thoại xác nhận
                                            var confirmation = confirm("Bạn có chắc chắn muốn từ chối xử lý yêu cầu này không người dùng này không?");

                                            // Nếu người dùng xác nhận, submit form
                                            if (confirmation) {
                                                // Thay đổi giá trị action của form để hướng đến banUser
                                                var form = document.getElementById("banForm");
                                                var actionInput = document.createElement("input"); // Tạo một input ẩn
                                                actionInput.type = "hidden"; // Thiết lập type là hidden
                                                actionInput.name = "action"; // Thiết lập tên cho input
                                                actionInput.value = "unReportUser"; // Thiết lập giá trị là "banUser"
                                                form.appendChild(actionInput); // Thêm input vào form
                                                form.submit(); // Submit form
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
    const rowsPerPageBan = 3; // Số hàng trên mỗi trang
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

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/single-freelancer-profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:45 GMT -->
</html>