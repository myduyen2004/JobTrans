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
import jobtrans.dal.UserDAO;
import jobtrans.model.GoogleAccount;
import jobtrans.model.User;
import jobtrans.utils.CookieUtils;
import jobtrans.utils.GoogleLogin;

/**
 *
 * @author ADM
 */
@WebServlet(name="LoginServlet", urlPatterns={"/login"})

public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     * 
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        response.getWriter().println("something");
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        HttpSession session = request.getSession();
        response.getWriter().print(code);
        // neu nguoi dung huy uy quyen
        if (error != null) {
            request.getRequestDispatcher("index-logged-out.jsp").forward(request, response);
        }
        GoogleLogin gg = new GoogleLogin();
        String accessToken = gg.getToken(code);
        GoogleAccount acc = gg.getUserInfo(accessToken);
        // check tk da dky chua
        String email = acc.getEmail();
        String userName = acc.getName();
        String avatar = acc.getPicture();
        UserDAO userDao = new UserDAO();
        User user = new User();
        if (userDao.checkExistEmail(email)) {
            user = userDao.getUserByEmail(email);
            session.setAttribute("account", email);
            session.setAttribute("userName", user.getUserName());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("avatarUrl", user.getAvatarUrl());
        }else{
            user = new User(userName, email, "Google", code, avatar, true);
            userDao.addUserByLoginGoogle(user);
            session.setAttribute("account", email);
            session.setAttribute("userName", user.getUserName());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("avatarUrl", user.getAvatarUrl());
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     * 
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * 
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mail = request.getParameter("emailaddress");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        response.getWriter().print(mail);

        UserDAO userDAO = new UserDAO();
        User user = userDAO.checkLogin(new User(mail, password));
        response.getWriter().print(user);

        if (user != null) {
            if (request.getParameter("remember") != null) {
                String remember = request.getParameter("remember");
                CookieUtils.add("cookemail", mail, 15, response);
                CookieUtils.add("cookpass", password, 15, response);
                CookieUtils.add("cookrem", remember, 15, response);
            }
            session.setAttribute("account", mail);
            User u = userDAO.getUserByEmail(mail);
            session.setAttribute("userName", u.getUserName());
            session.setAttribute("email", u.getEmail());
            session.setAttribute("avatarUrl", u.getAvatarUrl());
            response.getWriter().print(mail);
            response.getWriter().print(u);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "Authenticate failure!");
            request.getRequestDispatcher("index-logged-out.jsp").forward(request, response);
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
