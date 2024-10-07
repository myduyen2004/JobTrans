/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package jobtrans.controller.web.job;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jobtrans.dal.JobDAO;
import jobtrans.dal.UserDAO;
import jobtrans.model.JobGreetings;
import jobtrans.model.User;

/**
 *
 * @author NGUYENVU
 */
@WebServlet(name="JobGreetingServlet", urlPatterns={"/JobGreetingServlet"})
public class JobGreetingServlet extends HttpServlet {
   
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
            out.println("<title>Servlet JobGreetingServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JobGreetingServlet at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
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
        HttpSession session = request.getSession();
       
        String email = (String)session.getAttribute("account");
        
        UserDAO userDao = new UserDAO();
        User user = userDao.getUserByEmail(email);
       
        JobDAO jdao = new JobDAO();
      int jobId = Integer.parseInt(request.getParameter("jobId"));
      int userId = user.getUserId();
      Double price = Double.parseDouble(request.getParameter("price"));
      int exday = Integer.parseInt(request.getParameter("days"));
      String intro = request.getParameter("intro");
      
      String file = request.getParameter("fileUpload");
      String status ="Đang phê duyệt";
        JobGreetings jg = new JobGreetings(userId, jobId, intro, status, price, status, exday);
        jdao.insertJGreeting(jg);
        
        request.setAttribute("success", "Gửi đơn ứng tuyển thành công");
      request.getRequestDispatcher("JobDetail").forward(request, response);
      
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
