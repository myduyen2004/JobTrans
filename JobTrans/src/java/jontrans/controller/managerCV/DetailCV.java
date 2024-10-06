/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package jontrans.controller.managerCV;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import jobtrans.dal.CvDAO;
import jobtrans.dal.UserDAO;
import jobtrans.model.CV;
import jobtrans.model.CV_Skill;
import jobtrans.model.CV_education;
import jobtrans.model.CV_experience;
import jobtrans.model.User;

/**
 *
 * @author mac
 */
@WebServlet(name = "DetailCV", urlPatterns = {"/detailCV"})
public class DetailCV extends HttpServlet {

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
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String action = request.getParameter("action");
        switch (action) {
            case "view":
                viewCV(request, response);
                break;
            case "update":
               
                break;
            case "delete":
                deleteCV(request, response);
                break;
            
            default:
                response.sendRedirect("viewCV.jsp"); // Trang lỗi nếu action không hợp lệ
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    
   private void viewCV(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    HttpSession session = request.getSession();
    String email = (String) session.getAttribute("account");
    
    // DAOs
    UserDAO userDao = new UserDAO();
    CvDAO cvDao = new CvDAO();
    
    // Get user by email
    User user = userDao.getUserByEmail(email);
    
    // Get cvId from request parameter
    String cvId = request.getParameter("cvId");
    
    // Get list of CV_experience by the cvId
    List<CV_experience> experiencesList = cvDao.getCV_experiencesByID(cvId);
    //
    List<CV_education> educationList = cvDao.getCV_educationsByID(cvId);
    // Set attributes
    List<CV_Skill> skillList = cvDao.getCV_SkillsByID(cvId);
    //
    CV getCV = cvDao.getCVByCVId(cvId);
    request.setAttribute("us", user);
    request.setAttribute("exp", experiencesList);
    request.setAttribute("edu", educationList);
    request.setAttribute("skill", skillList);
    request.setAttribute("c", getCV);
    
    // Forward to JSP
    request.getRequestDispatcher("viewCV_detail.jsp").forward(request, response);
     }
   private void deleteCV(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8"); 
    // DAOs
    UserDAO userDao = new UserDAO();
    CvDAO cvDao = new CvDAO();
    
    // Get user by email
   
    
    // Get cvId from request parameter
    String cvId = request.getParameter("cvId");
   cvDao.deleteCVByID(cvId);
   cvDao.deleteCV_SkillByID(cvId);
   cvDao.deleteCV_experiencesByID(cvId);
   cvDao.deleteCV_educationByID(cvId);
    
    
    // Forward to JSP
    request.getRequestDispatcher("viewCV").forward(request, response);
   }
   
 
}
