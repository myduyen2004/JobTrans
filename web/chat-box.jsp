<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/dashboard-messages.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:47 GMT -->
    <head>

        <!-- Basic Page Needs
        ================================================== -->
        <title>Hireo</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <!-- CSS
        ================================================== -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/colors/blue.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
        <style>
            #chat-box {
    overflow-y: auto;
}

        </style>
    </head>
    <body class="gray">

        <!-- Wrapper -->
        <div id="wrapper">

            <!-- Header Container
            ================================================== -->
            <%@include file="includes/header.jsp" %>
            <div class="clearfix"></div>
            <!-- Header Container / End -->


            <!-- Dashboard Container -->
            <div class="dashboard-container">

                <!-- Dashboard Sidebar
                ================================================== -->
                <%@include file="includes/sidebar.jsp" %>
                <!-- Dashboard Sidebar / End -->


                <!-- Dashboard Content
                ================================================== -->
                <form id="message-box" class="message-box" autocomplete="off" enctype="multipart/form-data" style="width: 1200px; display: flex; align-items: flex-start; border: 1px solid #ccc; border-radius: 5px; padding:10px; background-color: #fff; margin-top: 10px;">

                    <!-- Dashboard Headline -->
                    <div style="width: 100%; margin: 10px; padding: 20px; border: 1px solid #ccc; border-radius: 8px; background-color: #f9f9f9;">
                        <h2 style="text-align: center;">Tin nhắn trò chuyện</h2>
                        <div id="chat-box" style="border: 1px solid #ddd; height: 450px; margin: 20px; overflow-y: auto; padding: 0px; border-radius: 5px; background-color: #fff; margin-bottom: 10px;">
                        </div>
                        <div id="file-name" class="file-attachment" style="margin-left: 10px; font-size: 14px; color: #555;"></div>
                        <input type="hidden" name="jobId" value="${jobId}">
                        <input type="hidden" name="receiverId" value="${receiverId}">
                        <input type="file" name="attachment" id="attachment" multiple onchange="updateFileName()" style="display: none;">
                        <div style="display: flex; align-items: center; margin-top: 10px;"> <!-- Thêm display: flex để các phần tử nằm trên cùng một hàng -->
                            <span class="attach-icon" onclick="document.getElementById('attachment').click();" style="cursor: pointer; margin-right: 10px;">
                                <i class="fas fa-paperclip" style="font-size: 24px; color: #2a41e8;"></i>
                            </span>
                            <input name="message" id="message" placeholder="Type a message here..." rows="1" style="flex: 1; padding: 10px; border-radius: 5px; border: 1px solid #ccc; resize: none; outline: none; margin-right: 10px;"  onkeydown="checkEnter(event)">
                            <button type="button" onclick="sendMessage()" style="padding: 10px 15px; border: none; border-radius: 5px; background-color: #2a41e8; color: #fff; cursor: pointer; transition: background-color 0.3s;">
                                Send
                            </button>
                        </div>
                    </div>
                </form>







                <!-- Dashboard Container / End -->


                <!-- Wrapper / End -->


                <!-- Apply for a job popup
                ================================================== -->
                <!-- Apply for a job popup / End -->


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
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script>
                    
                    function checkEnter(event) {
    // Kiểm tra xem phím Enter có được nhấn hay không
    if (event.key === "Enter") {
        event.preventDefault(); // Ngăn chặn hành động mặc định (submit form)
        sendMessage(); // Gọi hàm gửi tin nhắn
    }
}

                        function sendMessage() {
    var formData = new FormData();
    formData.append('message', $('#message').val());
    formData.append('jobId', $('input[name="jobId"]').val());
    formData.append('receiverId', $('input[name="receiverId"]').val());

    // Thêm file vào formData nếu có
    var files = $('#attachment')[0].files;
    for (var i = 0; i < files.length; i++) {
        formData.append('attachment', files[i]);
    }

    $.ajax({
        url: 'ChatServlet',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function () {
            $('#message').val('');
            $('#attachment').val('');
            $('#file-name').html(''); // Xóa tên file hiển thị
            
            loadMessages(); // Load lại tin nhắn

            // Cuộn xuống cuối hộp tin nhắn
            setTimeout(function() {
                var chatBox = document.getElementById('chat-box');
                chatBox.scrollTop = chatBox.scrollHeight;
            }, 100); // Đặt timeout để đảm bảo tin nhắn được load xong trước khi cuộn
        },
        error: function (error) {
            console.log('Error: ', error);
        }
    });
}


                        function updateFileName() {
                            var fileInput = $('#attachment')[0];
                            var fileName = '';
                            if (fileInput.files.length > 0) {
                                for (var i = 0; i < fileInput.files.length; i++) {
                                    fileName += fileInput.files[i].name + '<br>'; // Thêm tên file vào biến
                                }
                            }
                            $('#file-name').html(fileName); // Cập nhật tên file lên giao diện
                        }

                        function loadMessages() {
    var jobId = $('input[name="jobId"]').val();
    var receiverId = $('input[name="receiverId"]').val();

    $.ajax({
        url: 'ChatServlet',
        type: 'GET',
        data: {
            jobId: jobId,
            receiverId: receiverId
        },
        success: function(response) {
            $('#chat-box').html(response); // Cập nhật nội dung chat-box bằng dữ liệu trả về
        },
        error: function(error) {
            console.log('Error: ', error);
        }
    });
}


                // Tự động tải tin nhắn mới mỗi 2 giây
                        setInterval(loadMessages, 500);
                        


                </script>


                </body>

                <!-- Mirrored from www.vasterad.com/themes/hireo_21/dashboard-messages.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:47 GMT -->
                </html>