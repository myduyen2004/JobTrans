/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package jobtrans.controller.manageCV;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import jobtrans.dal.CvDAO;
import jobtrans.dal.UserDAO;
import jobtrans.model.User;

/**
 *
 * @author mac
 */
@WebServlet(name = "CreateCV", urlPatterns = {"/create"})
public class CreateCV extends HttpServlet {

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
 
         String action = request.getParameter("action");
        switch (action) {
            case "create":            
                doPost(request, response);
              break;
            case "load":  
                loadProfile(request, response);
            default:
                
                response.sendRedirect("viewCV.jsp"); // Trang lỗi nếu action không hợp lệ
                break;
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
//     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String action = request.getParameter("action");
        switch (action) {
            case "create":            
                doPost(request, response);
                response.getWriter().print("CHECKKKK");
                break;
            case "load":  
                loadCV(request, response);
                break;
            default:
                
                response.sendRedirect("viewCV.jsp"); // Trang lỗi nếu action không hợp lệ
                break;
        }
        
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
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    String cid= request.getParameter("cid");
    int userId = Integer.parseInt(cid);
    // Ensure 'id' is present in the session
    String title = request.getParameter("title");
    String summary = request.getParameter("summary");
    Date createdAt = new Date();

    // Lấy dữ liệu cho kinh nghiệm làm việc
    String  companyId = request.getParameter("nameCompany");
    

    // Validate and parse yearsOfExperience safelyy

    String yearsOfExperience = request.getParameter("yearsOfExperience");

    String achievement = request.getParameter("achievement");
    

    // Lấy dữ liệu cho kỹ năng
    String skillid = request.getParameter("skillname");
    String proficiency = request.getParameter("proficiency");

    // Lấy dữ liệu cho giáo dục
    String fieldOfStudy = request.getParameter("field");
    String education_id = request.getParameter("schoolName");
    String startDate = request.getParameter("dateBegin");
    String endDate = request.getParameter("dateFinish");
    String degree = request.getParameter("degree");

    CvDAO cvDAO = new CvDAO();
    boolean isCVInserted = cvDAO.insertCV(title, summary, createdAt, userId);
    if (isCVInserted) {
        int cvId = cvDAO.getLastInsertedCVId(); 
        // Chèn thông tin kinh nghiệm làm việc
        boolean isExperienceInserted = cvDAO.insertCVExperience(cvId, companyId, yearsOfExperience, achievement);

        // Chèn thông tin kỹ năng
        boolean isSkillInserted = cvDAO.insertCVSkill(cvId, skillid, proficiency);

        // Chèn thông tin giáo dục
        boolean isEducationInserted = cvDAO.insertCVEducation(cvId,education_id,startDate, endDate,fieldOfStudy, degree);

        // Kiểm tra tất cả các phần đã chèn thành công
        if (isExperienceInserted && isSkillInserted && isEducationInserted) {
            // Điều hướng người dùng đến trang thành công
        //    response.sendRedirect("viewCV?cid=${sessionScope.id}");
           request.setAttribute("errorMessage", "thành công");
        } else {
            // Nếu có lỗi, chuyển đến trang lỗi
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi lưu dữ liệu.");
            
        }
    } 
}


   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
      public void loadProfile(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO uDao = new UserDAO();
        HttpSession session = request.getSession(true);
        String email = (String)session.getAttribute("account");
        User u = uDao.getUserByEmail(email);
        request.setAttribute("User", u);
        request.getRequestDispatcher("CreateCV.jsp").forward(request, response);
    }
      
     public void loadCV(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO uDao = new UserDAO();
        HttpSession session = request.getSession(true);
        String email = (String)session.getAttribute("account");
        User u = uDao.getUserByEmail(email);
        request.setAttribute("User", u);
        request.getRequestDispatcher("CreateCV.jsp").forward(request, response);
    } 
}
