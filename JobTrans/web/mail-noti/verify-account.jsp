<%-- 
    Document   : verify-account
    Created on : Sep 17, 2024, 8:07:17 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Xác nhận tài khoản</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            .email-container {
                max-width: 600px;
                margin: 0 auto;
                background-color: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .email-header {
                background-color: #fff;
                padding: 10px;
                text-align: center;
                border-radius: 8px 8px 0 0;
            }
            .email-header img {
                width: 100px;
            }
            .email-body {
                padding: 20px;
                color: #333;
            }
            .email-body h2 {
                color: #3742fa;
            }
            .email-footer {
                text-align: center;
                padding: 10px;
                font-size: 12px;
                color: #888;
            }
            .email-footer a {
                color: #3742fa;
                text-decoration: none;
            }
            .btn {
                display: inline-block;
                padding: 10px 20px;
                margin-top: 20px;
                background-color: #3742fa;
                color: #fff;
                text-decoration: none;
                border-radius: 4px;
            }
            .code-block {
                background-color: #3742fa;
                padding: 12px 0;
                color: #fff;
                text-align: center;
                font-weight: bold;
                font-size: 25px;
                letter-spacing: 1.5px;
                margin: 25px 0;
                border-radius: 5px;
            }
            .body1 {
                font-size: 20px;
                font-weight: bold;
                color: #555;
                margin-bottom: 10px;
            }
            .body2 {
                font-size: 17px;
                color: #666;
                margin-bottom: 15px;
                line-height: 1.5;
            }
        </style>
    </head>
    <body>
        <div class="email-container">
            <!-- Email Header -->
            <div class="email-header">
                <img src="http://localhost:8080/JobTrans/images/logo.png" alt="Logo">
            </div>
            
            <!-- Email Body -->
            <div class="email-body">
                <h1>Yêu cầu xác minh tài khoản</h1>
                <h2>Xin chào [Recipient's Name],</h2>
                <p>Cảm ơn bạn đã đăng ký tài khoản trên hệ thống <b>JOBTRANS</b>. Vui lòng sử dụng mã dưới đây để xác minh địa chỉ email của bạn.</p>
                <div class="code-block">[CODE]</div>
                <p class="body1">Đấy không phải tôi!</p>
                <p class="body2">
                    Nếu bạn không phải là người gửi yêu cầu này cho chúng tôi, vui lòng bỏ qua email này. Chúng tôi xin
                    lỗi đã làm phiền bạn. Chúc bạn một ngày vui vẻ!
                </p>
                <p class="body2">
                    Chúng tôi chỉ có duy nhất một email để gửi thông báo cho bạn là 
                    <a class="link" href="duyenvo31032004@gmail.com">duyenvo31032004@gmail.com</a>. Để tránh bị lừa đảo
                    bởi những email giả, xin vui lòng xem kĩ địa chỉ email gửi đến.
                </p>
            </div>

            <!-- Email Footer -->
            <div class="email-footer">
                <p>© 2024 JobTrans. All Rights Reserved.</p>
            </div>
        </div>
    </body>
</html>

