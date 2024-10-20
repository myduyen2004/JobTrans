package jobtrans.controller.web.profile;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.dal.TransactionDAO;
import jobtrans.model.User;
import jobtrans.dal.UserDAO;
import static jobtrans.dal.UserDAO.getMd5;
import jobtrans.model.Transaction;

@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class ProfileServlet extends HttpServlet {

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
            case "editProfile":
                editProfile(request, response);
                break;
            default:
                response.sendRedirect("viewProfile.jsp"); // Trang lỗi nếu action không hợp lệ
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Date birthdate = new Date();
        String email = (String) session.getAttribute("account");

        String userName = request.getParameter("user_name");
        String description = request.getParameter("description");
        String specification = request.getParameter("specification");
        String address = request.getParameter("address");
        String birthdateStr = request.getParameter("birthdate");
        String avatarUrl = request.getParameter("avatar");

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            birthdate = formatter.parse(birthdateStr);

        } catch (ParseException ex) {
            Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        String baseUploadPath = "D:/FALL24/JobTrans/web/images/";
        String uniqueFolderName = "avatar_" + System.currentTimeMillis();
        File uploadDir = new File(baseUploadPath + uniqueFolderName);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                part.write(uploadDir.getAbsolutePath() + File.separator + fileName);
                avatarUrl = "images/" + uniqueFolderName + "/" + fileName;
            }
        }

        UserDAO dao = new UserDAO();
        User user = dao.getUserByEmail(email);
        if (user != null) {
            user.setUserName(userName);
            user.setAddress(address);
            user.setDescription(description);
            if (avatarUrl == null) {
                user.setAvatarUrl(request.getParameter("avatemp"));
            } else {
                user.setAvatarUrl(avatarUrl);
            }
            user.setSpecification(specification);
            user.setDateOfBirth(birthdate);
            request.setAttribute("user", user);
            if (dao.editProfile(user)) {
                request.setAttribute("success", "Cập nhật thành công");
                request.getRequestDispatcher("viewProfile.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Cập nhật thất bại");
                request.getRequestDispatcher("edit-profile.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Phiên làm việc hết hạn. Không tìm thấy người dùng");
            request.getRequestDispatcher("home").forward(request, response);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private void viewProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        UserDAO userDao = new UserDAO();
        User user = userDao.getUserByEmail(email);
        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("viewProfile.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("page-404.jsp").forward(request, response);
        }
    }

    private void editProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO uDao = new UserDAO();
        HttpSession session = request.getSession(true);
        String email = (String) session.getAttribute("account");
        User u = uDao.getUserByEmail(email);
        request.setAttribute("User", u);
        request.getRequestDispatcher("edit-profile.jsp").forward(request, response);
    }

    private void loadWallet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        UserDAO userDao = new UserDAO();
        User user = userDao.getUserByEmail(email);
        TransactionDAO transDao = new TransactionDAO();
        ArrayList<Transaction> transList = new ArrayList<>();
        try {
            transList = (ArrayList<Transaction>) transDao.getTransactionBySenderId(user.getUserId());
        } catch (Exception ex) {
            Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("user", user);
        request.setAttribute("transList", transList);
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
            trans.setAmount(Integer.parseInt(amount));
            trans.setStatus(true);
            trans.setTransactionType("Thêm tiền");
            trans.setDescription("Nộp tiền vào ví");
            Date createdDate = new Date();
            trans.setCreatedDate(createdDate);
            user.setBalance(user.getBalance() + Integer.parseInt(amount));

            try {
                transDao.addTransaction(trans);
            } catch (Exception ex) {
                Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            userDao.updateBalance(user);
            // Xóa 'amount-add' khỏi session sau khi xử lý
            session.removeAttribute("amount-add");
        }

        ArrayList<Transaction> transList = new ArrayList<>();
        try {
            transList = (ArrayList<Transaction>) transDao.getTransactionBySenderId(user.getUserId());
        } catch (Exception ex) {
            Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        user = userDao.getUserByEmail(email);
        request.setAttribute("user", user);
        request.setAttribute("transList", transList);
        request.getRequestDispatcher("wallet.jsp").forward(request, response);
    }

    private void loadPassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        UserDAO userDao = new UserDAO();
        User user = userDao.getUserByEmail(email);
        request.setAttribute("user", user);
        request.getRequestDispatcher("changePassword.jsp").forward(request, response);
    }

    private void changePassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String repeatNewPassword = request.getParameter("repeatNewPassword");

        String hashedCurrentPassword = getMd5(currentPassword);
        String hashedNewPassword = getMd5(newPassword);

        UserDAO userDao = new UserDAO();
        User user = userDao.getUserByEmail(email);
        if (user != null && user.getPassword() != null && user.getPassword().equals(hashedCurrentPassword) && newPassword.equals(repeatNewPassword)) {
            if (newPassword.equals(currentPassword)) {
                request.setAttribute("error", "Mật khẩu mới không được trùng với mật khẩu cũ");
                request.getRequestDispatcher("profile?action=loadPassword").forward(request, response);
            } else if (repeatNewPassword.length() >= 8) {
                user.setPassword(hashedNewPassword);
                userDao.changePassword(email, hashedNewPassword);
                request.setAttribute("success", "Đổi mật khẩu thành công");
                request.getRequestDispatcher("profile?action=view").forward(request, response);
            } else {
                request.setAttribute("error", "Mật khẩu phải nhiều hơn hoặc 8 kí tự");
                request.getRequestDispatcher("profile?action=loadPassword").forward(request, response);
            }
        } else if (user.getPassword() == null && newPassword.equals(repeatNewPassword)) {
            if (newPassword.equals(currentPassword)) {
                request.setAttribute("error", "Mật khẩu mới không được trùng với mật khẩu cũ");
                request.getRequestDispatcher("profile?action=loadPassword").forward(request, response);
            } else if (repeatNewPassword.length() >= 8) {
                user.setPassword(hashedNewPassword);
                userDao.changePassword(email, hashedNewPassword);
                request.setAttribute("success", "Đổi mật khẩu thành công");
                request.getRequestDispatcher("profile?action=view").forward(request, response);
            } else {
                request.setAttribute("error", "Mật khẩu phải nhiều hơn hoặc 8 kí tự");
                request.getRequestDispatcher("profile?action=loadPassword").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Mật khẩu không khớp");
            request.getRequestDispatcher("profile?action=loadPassword").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "ProfileController handles profile viewing and password changing.";
    }
}
