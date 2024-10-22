<%-- 
    Document   : chat
    Created on : Oct 21, 2024, 11:17:43 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Application</title>
    <style>
        .chat-container {
            width: 100%;
            max-width: 800px;
            margin: auto;
        }
        .chat-box {
            border: 1px solid #ccc;
            padding: 10px;
            height: 400px;
            overflow-y: scroll;
            background-color: #f4f4f4;
        }
        .chat-message {
            margin: 5px 0;
            padding: 10px;
            border-radius: 5px;
            width: 60%;
        }
        .chat-message.sender {
            background-color: #e1ffc7;
            text-align: right;
            float: right;
        }
        .chat-message.receiver {
            background-color: #fff;
            text-align: left;
        }
        .message-box {
            display: flex;
            margin-top: 10px;
        }
        textarea {
            width: 100%;
            resize: none;
        }
        button {
            padding: 10px 20px;
            background-color: #2a41e8;
            color: white;
            border: none;
            cursor: pointer;
        }
        .file-attachment {
            margin-top: 5px;
        }
    </style>
</head>
<body>

<div class="chat-container">
    <h2>Chat between two users</h2>
    <div class="chat-box" id="chat-box">
        <!-- Tin nhắn sẽ được hiển thị ở đây -->
    </div>

    <form id="message-box" class="message-box" autocomplete="off">
        <input type="hidden" name="senderId" value="1"> <!-- ID người gửi -->
        <input type="hidden" name="receiverId" value="2"> <!-- ID người nhận -->
        <input type="file" name="attachment" id="attachment" style="display:none;" onchange="updateFileName()">
        
        <span class="attach-icon" onclick="triggerFileInput()"><i class="fas fa-paperclip"></i></span>
        <textarea name="message" id="message" placeholder="Type a message here..." rows="1"></textarea>
        <button type="button" onclick="sendMessage()">Send</button>
        <div id="file-name" class="file-attachment"></div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // Hiển thị tên file đính kèm
    function updateFileName() {
        var fileInput = document.getElementById('attachment');
        var fileName = fileInput.files[0] ? fileInput.files[0].name : '';
        document.getElementById('file-name').textContent = fileName;
    }

    // Kích hoạt file input
    function triggerFileInput() {
        $('#attachment').click();
    }

    // Hàm gửi tin nhắn
    function sendMessage() {
        var formData = new FormData();
        formData.append('message', $('#message').val());
        formData.append('attachment', $('#attachment')[0].files[0]);
        formData.append('senderId', $('input[name="senderId"]').val());
        formData.append('receiverId', $('input[name="receiverId"]').val());

        $.ajax({
            url: 'ChatServlet',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                $('#message').val(''); // Xóa nội dung trong textarea
                $('#attachment').val(''); // Xóa file đã chọn
                $('#file-name').text(''); // Xóa tên file hiển thị
                loadMessages(); // Cập nhật lại danh sách tin nhắn
            },
            error: function(error) {
                console.log('Error: ', error);
            }
        });
    }

    // Hàm lấy tin nhắn
    function loadMessages() {
        $.ajax({
            url: 'ChatServlet',
            type: 'GET',
            success: function(response) {
                $('#chat-box').html(response); // Cập nhật danh sách tin nhắn
            },
            error: function(error) {
                console.log('Error: ', error);
            }
        });
    }

    // Lấy tin nhắn mỗi 2 giây
    setInterval(loadMessages, 2000);
</script>
</body>
</html>

