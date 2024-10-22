<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="jobtrans.model.Message" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${not empty msgList}">
            <c:forEach var="msg" items="${msgList}">
                <div style="margin-bottom: 10px;">
                    <div style="display: flex; align-items: center; justify-content: ${msg.senderId == senderId ? 'flex-end' : 'flex-start'};">
                        <!-- Tin nhắn gửi -->
                        <c:if test="${msg.senderId == senderId}">
                            <div style="background-color: #2a41e8; color: white; padding: 10px; border-radius: 10px; max-width: 70%; word-wrap: break-word; margin-right: 10px;">
                                ${msg.content}
                                <br>
                                <span style="font-size: 12px; color: #ccc;">${msg.sentTime}</span>
                                
                                <!-- Hiển thị phần đính kèm nếu có -->
                                <c:if test="${not empty msg.attachment}">
                                    <br>
                                    <a href="uploads/${msg.attachment}" target="_blank" style="color: #ffffff; text-decoration: underline;">Mở tệp đính kèm</a>
                                </c:if>
                            </div>
                            <img src="images/default-avatar.jpg" alt="Sender Avatar" style="width: 40px; height: 40px; border-radius: 50%; margin-right: 10px;">
                        </c:if>

                        <!-- Tin nhắn nhận -->
                        <c:if test="${msg.senderId != senderId}">
                            <img src="images/default-avatar.jpg" alt="Receiver Avatar" style="width: 40px; height: 40px; border-radius: 50%; margin-left: 10px;">
                            <div style="background-color: #f1f1f1; color: black; padding: 10px; border-radius: 10px; max-width: 70%; word-wrap: break-word;">
                                ${msg.content}
                                <br>
                                <span style="font-size: 12px; color: #ccc;">${msg.sentTime}</span>

                                <!-- Hiển thị phần đính kèm nếu có -->
                                <c:if test="${not empty msg.attachment}">
                                    <br>
                                    <a href="uploads/${msg.attachment}" target="_blank" style="color: #2a41e8; text-decoration: underline;">Mở tệp đính kèm</a>
                                </c:if>
                            </div>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </body>
</html>
