/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package jobtrans.controller.web.job;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.dal.MessageDAO;
import jobtrans.dal.UserDAO;
import jobtrans.model.Message;
import jobtrans.model.User;

/**
 *
 * @author admin
 */
@MultipartConfig // Thêm chú thích này để hỗ trợ file upload
public class ChatServlet extends HttpServlet {

    // Lưu trữ tạm thời danh sách tin nhắn
    private static List<Message> messages = new ArrayList<>();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    if(request.getParameter("action") == null){
        response.setContentType("text/html;charset=UTF-8");

// Lấy các tham số từ request
    HttpSession session = request.getSession();
    String email = (String) session.getAttribute("account");
    UserDAO userDao = new UserDAO();
    MessageDAO msgDao = new MessageDAO();
    
    // Lấy jobId và receiverId từ request
    int jobId = Integer.parseInt(request.getParameter("jobId"));
    int receiverId = Integer.parseInt(request.getParameter("receiverId"));
    User sender = userDao.getUserByEmail(email);
    int senderId = sender.getUserId();

    // Lấy danh sách tin nhắn
    List<Message> msgList = new ArrayList<>();
    try {
        msgList = msgDao.getMessagesByJobId(jobId);
    } catch (Exception ex) {
        Logger.getLogger(ChatServlet.class.getName()).log(Level.SEVERE, null, ex);
    }

    // Đặt thuộc tính để gửi tới JSP
    request.setAttribute("msgList", msgList);
    request.setAttribute("senderId", senderId);
    request.setAttribute("receiverId", receiverId);
    request.setAttribute("jobId", jobId);

    // Chuyển hướng tới trang JSP chứa danh sách tin nhắn
//    request.getRequestDispatcher("chat-box.jsp").forward(request, response);
//response.getWriter().print(msgList);
            request.getRequestDispatcher("message-content.jsp").forward(request, response);
        }else{
//            response.getWriter().print(msgList);
                int jobId = Integer.parseInt(request.getParameter("jobId"));
        int receiverId = Integer.parseInt(request.getParameter("receiverId"));
            response.getWriter().print("test ở đây à phkpals");
            request.setAttribute("jobId", jobId);
            request.setAttribute("receiverId", receiverId);
            request.getRequestDispatcher("chat-box.jsp").forward(request, response);
        }
        
    }
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy nội dung tin nhắn
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        UserDAO userDao = new UserDAO();
        MessageDAO msgDao = new MessageDAO();
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        int receiverId = Integer.parseInt(request.getParameter("receiverId"));
        User sender = userDao.getUserByEmail(email);
        String fileName = "";
        
        String messageContent = request.getParameter("message");
        Part filePart = request.getPart("attachment");
        if(filePart != null){
            fileName = filePart.getSubmittedFileName();
            String path = getServletContext().getRealPath("") + "uploads";
            File file = new File(path);
            filePart.write(path + File.separator + fileName);
        }
        
        Message newMessage = new Message(sender.getUserId(), receiverId,fileName,messageContent,new Timestamp(System.currentTimeMillis()), jobId);
        try {
            msgDao.addMessage(newMessage);
        } catch (Exception ex) {
            Logger.getLogger(ChatServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        messages.add(newMessage);

        response.getWriter().write("Success");
    }
}
