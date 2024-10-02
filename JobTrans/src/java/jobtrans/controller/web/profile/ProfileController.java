package jobtrans.controller.web.profile;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import jobtrans.dal.TransactionDAO;
import jobtrans.model.User;
import jobtrans.dal.UserDAO;
import jobtrans.model.Transaction;

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
            case "wallet":
                loadWallet(request, response);
                break;
            case "addWallet":
                addWallet(request, response);
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
            if(role.equals("Employer")){
                user.setQuantityOfPostedJob(userDao.getQuantityOfPostedJob(user));
            }else if(role.equals("Seeker")){
                user.setQuantityOfAppliedJob(userDao.getQuantityOfAppliedJob(user));
            }
            // Điều hướng tới trang phù hợp dựa trên role
            RequestDispatcher dispatcher = null;
            
            request.getRequestDispatcher("viewProfile.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("page-404.jsp").forward(request, response);
        }
    }
    private void loadWallet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("account");
        UserDAO userDao = new UserDAO();
        User user = userDao.getUserByEmail(email);
        TransactionDAO transDao = new TransactionDAO();
        ArrayList<Transaction> transList = transDao.getTransactionBySender(user);
        request.setAttribute("user", user);
        request.setAttribute("transList", transList);
//        response.getWriter().print(transList);
//        response.getWriter().print(user);
//        response.getWriter().print(email);
        request.getRequestDispatcher("wallet.jsp").forward(request, response);
    }
    
    private void addWallet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
         HttpSession session = request.getSession();
    String email = (String) session.getAttribute("account");
    UserDAO userDao = new UserDAO();
    User user = userDao.getUserByEmail(email);
    TransactionDAO transDao = new TransactionDAO();
    // Kiểm tra xem 'amount-add' có tồn tại trong session không
    String amount = (String) session.getAttribute("amount-add");
    if (amount != null) {
        Transaction trans = new Transaction();
        trans.setSenderId(user.getUserId());
        trans.setAmount(Double.parseDouble(amount));
        user.setBalance(user.getBalance() + Double.parseDouble(amount)); // Cộng số tiền vào balance
        trans.setStatus(true);
        trans.setTransactionType("Thêm tiền");
        trans.setDescription("Nộp tiền vào ví");

        transDao.addTransaction(trans);
        transDao.updateBalance(user);

        // Xóa 'amount-add' khỏi session sau khi xử lý
        session.removeAttribute("amount-add");
    }

    ArrayList<Transaction> transList = transDao.getTransactionBySender(user);
    user = userDao.getUserByEmail(email);
    request.setAttribute("user", user);
    request.setAttribute("transList", transList);
    request.getRequestDispatcher("wallet.jsp").forward(request, response);
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