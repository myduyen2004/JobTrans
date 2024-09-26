/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package jobtrans.controller.web.profile;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.Collection;
import jobtrans.dal.UserDAO;
import jobtrans.model.User;

/**
 *
 * @author admin
 */
public class UpdateServlet extends HttpServlet {
   
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
            out.println("<title>Servlet UpdateServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath () + "</h1>");
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
        String action = request.getParameter("action");
        switch (action) {
            case "load":
                loadProfile(request, response);
                break;
            case "edit":
                doPost(request, response);
                break;
        }
    }
    public void loadProfile(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO uDao = new UserDAO();
        HttpSession session = request.getSession(true);
        String email = (String)session.getAttribute("account");
        User u = uDao.getUserByEmail(email);
        request.setAttribute("User", u);
        request.getRequestDispatcher("edit-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         
        String avatarUrl = null;
        
        String userName = request.getParameter("user_name");
        String role = request.getParameter("account-type-radio");
        String specification = request.getParameter("specification");
        String address = request.getParameter("address");
        String description = request.getParameter("description");
        String baseUploadPath = "D:/FALL24/JobTrans Website/JobTrans/web/images/";
        String uniqueFolderName = "avatar_" + System.currentTimeMillis();
        File uploadDir = new File(baseUploadPath + uniqueFolderName);
        int count =0;
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()){
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                part.write(uploadDir.getAbsolutePath()+File.separator+fileName);
                avatarUrl = "images/" + uniqueFolderName + "/" + fileName;
            }
        }
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        UserDAO dao = new UserDAO();
        User user = dao.getUserByEmail(email);
        if (user != null) {          
        user.setUserName(userName);
        user.setRole(role);
        user.setAddress(address);
        user.setDescription(description);
        if(avatarUrl != null){
            user.setAvatarUrl(avatarUrl);
        }else{
            user.setAvatarUrl(user.getDefaultAvatarUrl());
        }
        user.setSpecification(specification);
        session.setAttribute("account", user);
        request.setAttribute("user", user);
        boolean isUpdated = dao.editProfile(user);
            if (isUpdated==true) {
                request.setAttribute("success", "Cập nhật thành công");
                request.getRequestDispatcher("viewProfile.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Cập nhật thất bại");
                request.getRequestDispatcher("edit-profile.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Phiên làm việc hết hạn. Không tìm thấy người dùng");
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
