/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package jobtrans.controller.admin.management;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.controller.web.home.HomeServlet;
import jobtrans.dal.UserDAO;
import jobtrans.model.User;

/**
 *
 * @author admin
 */
public class AccountManagement extends HttpServlet {
   UserDAO ud = new UserDAO();
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet AccountManagement</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountManagement at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    try {
        String action = request.getParameter("action");
        int page = Integer.parseInt(request.getParameter("page") != null ? request.getParameter("page") : "1");
        int pageSize = 3; // Number of items per page

        if (action == null) {
            action = "viewAll"; 
        }

        switch (action) {
            case "viewAll":
                viewAll(request, response);
                break;
            case "viewEmployer":
                viewEmployer(request, response);
                break;
                
              case "viewSeeker":
                viewSeeker(request, response);
                break;    
            case "viewDetail": 
                viewdetail(request,response);
                break;
            case "banUser":
                banUser(request,response);
                break;
               case "viewUnBan":
                viewUnbanUser(request,response);
                break;   
              case "UnbanUser":
                unbanUser(request,response);
                break;  
            default:
                throw new AssertionError();
        }
    } catch (Exception ex) {
        Logger.getLogger(AccountManagement.class.getName()).log(Level.SEVERE, null, ex);
    }
}

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

   private void viewSeeker(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       List<User> list = ud.getAllSeeker();
        request.setAttribute("list", list);
    request.getRequestDispatcher("dashboard-manage-users.jsp").forward(request, response);
}

  private void viewEmployer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
      List<User> list = ud.getAllEmployers();
      request.setAttribute("list", list);
    request.getRequestDispatcher("dashboard-manage-users.jsp").forward(request, response);
}

    private void viewdetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        User u = ud.getUserById(userId);
        request.setAttribute("user", u);
        request.getRequestDispatcher("single-freelancer-profile.jsp").forward(request, response);
    }

    private void banUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       int userId = Integer.parseInt(request.getParameter("userId"));
       User u = new User(userId, false);
       ud.updateStatus(u);
      request.getRequestDispatcher("AccountManagement?action=viewAll").forward(request, response);

    }

    private void viewAll(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<User> list = ud.getAllUsers();
        request.setAttribute("list", list);
       request.getRequestDispatcher("dashboard-manage-users.jsp").forward(request, response);

        
    }

    private void viewUnbanUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> listBan = ud.getAllBanUser();
         request.setAttribute("listBan", listBan);
       request.getRequestDispatcher("dashboard-manage-users.jsp").forward(request, response);
    }

    private void unbanUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 int userId = Integer.parseInt(request.getParameter("userId"));
       User u = new User(userId, true);
       ud.updateStatus(u);
      request.getRequestDispatcher("AccountManagement?action=viewAll").forward(request, response);
    }    
}



