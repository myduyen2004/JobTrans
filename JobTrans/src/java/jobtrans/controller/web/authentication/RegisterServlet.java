/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package jobtrans.controller.web.authentication;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jobtrans.dal.UserDAO;
import jobtrans.model.User;
import java.util.logging.Logger;
import jobtrans.utils.Gmail;
import jobtrans.utils.RandomGenerator;

/**
 *
 * @author NGUYENVU
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/Register"})
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(RegisterServlet.class.getName());
    UserDAO ud = new UserDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private void sendVerificationMail(String userName,  String subject, String email, String code) {

        try {
            new Gmail(email)
                    .setContentType("text/html; charset=UTF-8")
                    .setSubject(subject)
                    .initMacro()
                    .appendMacro("NAME", userName)
                    .appendMacro("CODE", code)
                    .sendTemplate(new URL("http://localhost:8080/JobTrans/mail-noti/verify-account.jsp"));
        } catch (MalformedURLException ex) {
            Logger.getLogger(ForgotPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String cmd = request.getParameter("cmd");
        HttpSession mySession = request.getSession();
        User u = new User();
        if(cmd.equals("1")){
            String username = request.getParameter("username-register");
        String email = request.getParameter("emailaddress-register");
        String password = request.getParameter("password-register");
        String role = request.getParameter("account-type-radio");
        if(role.equals("freelancer")){
            role = "Seeker";
        }else{
            role = "Employer";
        }
        u = new User(username, email, password, u.getDefaultAvatarUrl(), true);
        u.setRole(role);
        if(ud.checkExistEmail(email)==false){
            
            String otpvalue = RandomGenerator.randString(RandomGenerator.NUMERIC_CHARACTER, 6);
            new Thread(() -> {
                        sendVerificationMail(username, "Xác thực đăng kí", email, otpvalue);
                    }).start();
            request.setAttribute("email", email);
            request.setAttribute("success", "Vui lòng kiểm tra email để xác nhận đăng kí!");
            mySession.setAttribute(email, otpvalue);
            mySession.setAttribute("user", u);
            request.getRequestDispatcher("authentication/verify-otp_1.jsp").forward(request, response);
        }else{
            request.setAttribute("error", "Email đã được đăng kí. Thất bại");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        }
        else if(cmd.equals("2")){
            String emailReceive = request.getParameter("email");
            String otp = request.getParameter("otp1")+request.getParameter("otp2")+request.getParameter("otp3")+request.getParameter("otp4")
                    +request.getParameter("otp5")+request.getParameter("otp6");
            String code = (String) mySession.getAttribute(emailReceive);
            User user = (User) mySession.getAttribute("user");
            if (otp.equals(code)) {
                ud.addUserByRegister(user);
                request.setAttribute("success", "Thành công! Hãy đăng nhập để tiếp tục");
                response.getWriter().print(user);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Xác minh mã OTP thất bại! Vui lòng thử lại");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
