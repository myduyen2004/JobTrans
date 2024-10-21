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
import java.nio.file.Paths;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.dal.JobDAO;
import jobtrans.dal.JobGreetingDAO;
import jobtrans.dal.UserDAO;
import jobtrans.model.Job;
import jobtrans.model.JobGreeting;
import jobtrans.model.User;
import jobtrans.utils.DateTimeUtils;

/**
 *
 * @author admin
 */
@WebServlet(name = "JobApplicationServlet", urlPatterns = {"/apply"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class JobApplicationServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ApplyServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApplyServlet at " + request.getContextPath () + "</h1>");
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
        DateTimeUtils utilDate = new DateTimeUtils();
        String email = (String)session.getAttribute("account");
        UserDAO userDao = new UserDAO();
        User user = userDao.getUserByEmail(email);
        JobDAO jdao = new JobDAO();
        JobGreetingDAO jgDao = new JobGreetingDAO();
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        int userId = user.getUserId();
        int price = Integer.parseInt(request.getParameter("price"));
        int exday = Integer.parseInt(request.getParameter("days"));
        String intro = request.getParameter("intro");
        int cvId = Integer.parseInt(request.getParameter("cv"));
        
        Part p=request.getPart("file");
        String fileName = p.getSubmittedFileName();
        //Luu file vao folder imgs
        String path = getServletContext().getRealPath("") + "job_greetings";
        File file = new File(path);
        p.write(path + File.separator + fileName);
        System.out.println(path);
        String url = fileName;
        String status ="Chưa phản hồi";
        
        JobGreeting jg = new JobGreeting(userId, jobId, intro, url, price, status, exday, cvId);
        try {
            response.getWriter().print(jgDao.addJobGreeting(jg));
        } catch (Exception ex) {
            Logger.getLogger(JobApplicationServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print(ex);
        }
        request.setAttribute("success", "Gửi đơn ứng tuyển thành công");
        request.setAttribute("user", userDao.getUserByEmail(email));
        request.setAttribute("job", jdao.getJobByJobId(jobId));
        request.setAttribute("due", utilDate.countdownDays(jdao.getJobByJobId(jobId).getDueDate()));
        
        response.sendRedirect("home?action=jobDetail&jobId="+jobId);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    

}
