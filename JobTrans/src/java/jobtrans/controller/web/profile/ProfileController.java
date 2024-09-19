package jobtrans.controller.web.profile;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import jobtrans.model.User;
import jobtrans.dal.UserDAO;

@WebServlet(name="ProfileController", urlPatterns={"/profile"})

public class ProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "view":
                viewProfile(request, response);
                break;
            case "loadPassword":
                loadPassword(request, response);
                break;
            case "changePassword":
                changePassword(request, response);
                break;
            default:
                response.sendRedirect("viewProfile.jsp"); // Trang lỗi nếu action không hợp lệ
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    }

    // Phương thức để xử lý việc hiển thị thông tin người dùng
   private void viewProfile(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("account");

        UserDAO userDao = new UserDAO();
        User user = null;
        try {
            // Gọi phương thức getUserById với userId lấy từ session
            user = userDao.getUserByEmail(email);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp"); // Chuyển hướng đến trang lỗi nếu có ngoại lệ
            return;
        }

        if (user != null) {
            String role = user.getRole(); // Lấy role của người dùng
            request.setAttribute("user", user);

            // Điều hướng tới trang phù hợp dựa trên role
            RequestDispatcher dispatcher = null;
            if ("Seeker".equalsIgnoreCase(role)) {
                dispatcher = request.getRequestDispatcher("viewProfileSeeker.jsp");
            } else if ("Employer".equalsIgnoreCase(role)) {
                dispatcher = request.getRequestDispatcher("viewProfileEmployer.jsp");
            }

            // Chuyển hướng tới trang profile phù hợp
            if (dispatcher != null) {
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("errorPage.jsp"); // Redirect đến trang lỗi nếu role không hợp lệ
            }
        }
    }


    // Phương thức để xử lý việc thay đổi mật khẩu
    private void loadPassword(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("account");
        UserDAO userDao = new UserDAO();
        User user = userDao.getUserByEmail(email);
        request.setAttribute("user", user);
        request.getRequestDispatcher("changePassword.jsp").forward(request, response);
    }
   
    private void changePassword(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("account");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String repeatNewPassword = request.getParameter("repeatNewPassword");
        
        UserDAO userDao = new UserDAO();
        User user = userDao.getUserByEmail(email);

        if (user != null && user.getPassword().equals(currentPassword)) {
            user.setPassword(newPassword); // Lưu mật khẩu mới
            userDao.changePassword(user); // Cập nhật thông tin user
            request.getRequestDispatcher("profile?action=view").forward(request, response);
        } else {
            // Mật khẩu hiện tại không khớp
            request.getRequestDispatcher("profile?action=view").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "ProfileController handles profile viewing and password changing.";
    }
}