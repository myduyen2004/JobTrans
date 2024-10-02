<%-- 
    Document   : index-login-logout
    Created on : Sep 17, 2024, 10:15:11 AM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import= "jobtrans.utils.CookieUtils" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/index-logged-out.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:35:00 GMT -->
    <head>

        <!-- Basic Page Needs
        ================================================== -->
        <title>JobTrans</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <!-- CSS
        ================================================== -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/colors/blue.css">
        <link rel="stylesheet" href="css/other.css">
        <link rel="stylesheet" href="css/deposit.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    </head>
    <%@include file="/includes/header.jsp" %>
    <body>
        <%
            String role = request.getAttribute("role");
            if(role.equals("Employer")){
        %>
        <!-- Wrapper -->
        <div class="payment-container">
        <h2>Trả trước cho bài đăng</h2>
        <%
            String check = request.getAttribute("deposit-check");
            if(check.equals("Hai bên đã đặt cọc")|| check.equals("Nhà tuyển dụng đã đặt cọc") ){
        %>
        <div class="payment-info">
            <span>Bạn đã đặt cọc cho công việc này</span>
            <button class="btn-tra-truoc" onclick="window.location.href = './profile?action=wallet';">Xem lịch sử giao dịch</button>
        </div>
        <%}else{%>
        <p>Để đăng tuyển công việc này, người đăng cần nộp trước số tiền lương đã đặt ra.</p>
        
        <div class="payment-info">
            <span>Số tiền cần trả:</span>
            <strong>
                <fmt:formatNumber value="${deposit-money}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" />
            </strong>
            <button class="btn-tra-truoc" onclick="window.location.href = './job?action=deposit-employer';">Trả trước</button>
        </div>

        <div class="payment-note">
            <p class="note-green">Số tiền được trả sẽ được hệ thống tạm thời giữ, sau khi công việc xác nhận hoàn thành sẽ được thanh lý bởi hệ thống</p>
            <p class="note-red">Trong trường hợp công việc bị gián đoạn, hệ thống sẽ hoàn trả</p>
        </div>
        
        <%}%>
        </div>
        <%} else if(role.equals("Seeker")){%>
        <div class="payment-container">
        <h2>Trả trước cho bài đăng</h2>
        <%
            String check = request.getAttribute("deposit-check");
            if(check.equals("Hai bên đã đặt cọc")|| check.equals("Người tìm việc đã đặt cọc") ){
        %>
        <div class="payment-info">
            <span>Bạn đã đặt cọc cho công việc này</span>
            <button class="btn-tra-truoc" onclick="window.location.href = './profile?action=wallet';">Xem lịch sử giao dịch</button>
        </div>
        <%}else{%>
        <p>Để nhận công việc này, người bạn cần trả 10% số tiền đã chào giá.</p>
        
        <div class="payment-info">
            <span>Số tiền cần trả:</span>
            <strong>
                <fmt:formatNumber value="${deposit-money}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" />
            </strong>
            <button class="btn-tra-truoc" onclick="window.location.href = './job?action=deposit-employer';">Trả trước</button>
        </div>
        <div class="payment-note">
            <p class="note-green">Số tiền được trả sẽ được hệ thống tạm thời giữ, sau khi công việc xác nhận hoàn thành sẽ được thanh lý bởi hệ thống</p>
            <p class="note-red">Trong trường hợp công việc bị gián đoạn, hệ thống sẽ hoàn trả</p>
        </div>
        <%}%>
        </div>
        <%%>
        <button class="btn-nap-tien">Quay về trang chủ</button>
        
        
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
        <script>
            // Thiết lập Toastr options
            toastr.options = {
                "positionClass": "toast-bottom-right", // Vị trí hiển thị
                "timeOut": "3000", // Thời gian tự động đóng (tính bằng ms)
                "closeButton": true, // Hiển thị nút đóng
                "progressBar": true // Hiển thị thanh tiến trình
            };

            <% if (request.getAttribute("success") != null) { %>
    toastr.success('<%= request.getAttribute("success") %>');
            <% } %>

            <% if (request.getAttribute("error") != null) { %>
            // Thiết lập lại vị trí cho error nếu bị ghi đè
    toastr.error('<%= request.getAttribute("error") %>');
            <% } %>
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

            // Autocomplete adjustment for homepage
            if ($('.intro-banner-search-form')[0]) {
                setTimeout(function () {
                    $(".pac-container").prependTo(".intro-search-field.with-autocomplete");
                }, 300);
            }

        </script>

        <script>
            document.getElementById('register-account-form').addEventListener('submit', function (event) {
                event.preventDefault(); // Prevent immediate form submission
                let isValid = true;

                // Get form values
                const email = document.getElementById('emailaddress-register').value;
                const password = document.getElementById('password-register').value;
                const passwordRepeat = document.getElementById('password-repeat-register').value;

                // Email validation regex
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email)) {
                    document.getElementById('email-error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('email-error').style.display = 'none';
                }

                // Password length validation (at least 8 characters)
                if (password.length < 8) {
                    document.getElementById('password-error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('password-error').style.display = 'none';
                }

                // Password matching validation
                if (password !== passwordRepeat) {
                    document.getElementById('password-repeat-error').style.display = 'block';
                    isValid = false;
                } else {
                    document.getElementById('password-repeat-error').style.display = 'none';
                }

                // If all validations pass, submit the form
                if (isValid) {
                    this.submit();
                }
            });
        </script>
        <script>
            // Thiết lập Toastr options
            toastr.options = {
                "positionClass": "toast-bottom-right", // Vị trí hiển thị
                "timeOut": "3000", // Thời gian tự động đóng (tính bằng ms)
                "closeButton": true, // Hiển thị nút đóng
                "progressBar": true // Hiển thị thanh tiến trình
            };

            <% if (request.getAttribute("success") != null) { %>
    toastr.success('<%= request.getAttribute("success") %>');
            <% } %>

            <% if (request.getAttribute("error") != null) { %>
            // Thiết lập lại vị trí cho error nếu bị ghi đè
    toastr.error('<%= request.getAttribute("error") %>');
            <% } %>
        </script>

        <!-- Google API & Maps -->
        <!-- Geting an API Key: https://developers.google.com/maps/documentation/javascript/get-api-key -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaoOT9ioUE4SA8h-anaFyU4K63a7H-7bc&amp;libraries=places"></script>

    </body>
    <%@include file="/includes/footer.jsp" %>
    <!-- Mirrored from www.vasterad.com/themes/hireo_21/index-logged-out.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:35:00 GMT -->
</html>