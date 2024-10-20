package jobtrans.controller.web.job;

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
import java.util.ArrayList;
import java.util.Collection;
import jobtrans.dal.CategoryDAO;
import jobtrans.dal.JobDAO;
import jobtrans.dal.UserDAO;
import jobtrans.model.Job;
import jobtrans.model.User;

/**
 *
 * @author ADM
 */
public class CRUDJobServerlet extends HttpServlet {
   
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
            out.println("<title>Servlet CRUDJobServerlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CRUDJobServerlet at " + request.getContextPath () + "</h1>");
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
        String command = request.getParameter("command");
        switch(command){
            case "LIST":
                viewJobList(request, response);
                break;
            case "DELETE":
                deleteJob(request, response);
                break;
            case "VIEW":
                viewJobDetail(request, response);
                break;
            case "LOAD":
                loadJob(request, response);
                break;
            case "LOADINTERVIEW":
                loadInterview(request, response);
                break;
            default:
                break;
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
        
        String command = request.getParameter("command");
        switch(command){
            case "CREATE":
                createJob(request, response);
                break;
            case "UPDATE":
                updateJob(request, response);
                break;
            case "INTERVIEW":
                updateJobInterview(request, response);
                break;
            default:
                viewJobList(request, response);
                break;
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void createJob(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession(true);
        UserDAO userDAO = new UserDAO();
        JobDAO jobDAO = new JobDAO();
        CategoryDAO catDao = new CategoryDAO();
        
        String email = (String)session.getAttribute("email");
        out.println(email);
        int uid = userDAO.getUserByEmail(email).getUserId();
        out.println(uid);
        String title = request.getParameter("projectName");
        out.println(title);
        float budget = Float.parseFloat(request.getParameter("budget"));
        out.println(budget);
        String des = request.getParameter("description");
        out.println(des);
        String date = request.getParameter("date");
        out.println(date);
        String status = "Đang tuyển";
        out.println(status);
        String cate = request.getParameter("category");
        if(cate==null || cate.isEmpty()){
            cate = "Không xác định";
        }
        int cateId = catDao.getCateByName(cate).getCategoryId();
        out.println(cateId);
        String address = request.getParameter("address");
        //UploadFile
        
        String url = null;
        String baseUploadPath = "D:/Workspace/Chuyên_ngành_5/SWP391/JobTrans/JobTrans/web/job_docs/";
        String uniqueFolderName = "job_docs_" + System.currentTimeMillis();
        File uploadDir = new File(baseUploadPath + uniqueFolderName);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        Collection<Part> parts = request.getParts();
        out.println(parts);
        for (Part part : parts) {
            out.println(1);
            if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()){
                out.print(part);
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                part.write(uploadDir.getAbsolutePath()+File.separator+fileName);
                response.getWriter().print(fileName);
                response.getWriter().print("\n");
                response.getWriter().print(uploadDir.getAbsolutePath()+File.separator+fileName);
                url = "job_docs/" + uniqueFolderName + "/" + fileName;
                response.getWriter().print("\n");
                response.getWriter().print(url);
            }
        }
        out.println(url);
        Job job = new Job(uid, title, budget, des, date, status, cateId, url, address);
        out.println(job);
        jobDAO.createJob(job);
        
    }
    
    public void viewJobList(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession(true);
        UserDAO userDAO = new UserDAO();
        JobDAO jobDAO = new JobDAO();
        String email = (String)session.getAttribute("email");
        ArrayList<Job> jobList = jobDAO.getAllJobByUserEmail(email);
        out.println(jobList);
        request.setAttribute("jobList", jobList);
        request.getRequestDispatcher("manage-job.jsp").forward(request, response);
    }
    
    public void viewJobDetail(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        PrintWriter out = response.getWriter();
        String sid = request.getParameter("jid");
        int id = Integer.parseInt(sid);
        response.getWriter().write(id);
        HttpSession session = request.getSession(true);
        UserDAO userDAO = new UserDAO();
        JobDAO jobDAO = new JobDAO();
        String email = (String)session.getAttribute("email");
        User u = userDAO.getUserByEmail(email);
        Job job = jobDAO.getJobById(id);
        out.print(email);
        request.setAttribute("employer", u);
        request.setAttribute("job", job);
        request.getRequestDispatcher("manage-job-detail.jsp").forward(request, response);
    }
    
    public void deleteJob(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        PrintWriter out = response.getWriter();
        String sid = request.getParameter("jid");
        int id = Integer.parseInt(sid);
        JobDAO jobDAO = new JobDAO();
        jobDAO.deleteJobById(id);
        viewJobList(request, response);
    }
    
    public void loadJob(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        PrintWriter out = response.getWriter();
        String sid = request.getParameter("jid");
        int id = Integer.parseInt(sid);
        JobDAO jobDAO = new JobDAO();
        Job job = jobDAO.getJobById(id);
        request.setAttribute("job", job);
        request.getRequestDispatcher("update-job.jsp").forward(request, response);
    }
    
    public void loadInterview(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        PrintWriter out = response.getWriter();
        String sid = request.getParameter("jid");
        int id = Integer.parseInt(sid);
        JobDAO jobDAO = new JobDAO();
        Job job = jobDAO.getJobById(id);
        request.setAttribute("job", job);
        request.getRequestDispatcher("updateInterview.jsp").forward(request, response);
    }
    
    public void updateJob(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession(true);
        UserDAO userDAO = new UserDAO();
        JobDAO jobDAO = new JobDAO();
        CategoryDAO catDao = new CategoryDAO();
        
        int id = Integer.parseInt(request.getParameter("jid"));        
        String title = request.getParameter("projectName");
        String des = request.getParameter("description");
        String date = request.getParameter("date");
        float budget = Float.parseFloat(request.getParameter("budget"));
        String cate = request.getParameter("category");
        if(cate==null || cate.isEmpty()){
            cate = "Không xác định";
        }
        int cateId = catDao.getCateByName(cate).getCategoryId();
        String address = request.getParameter("address");
        
        Job j = new Job(id, title, des, date, budget, cateId, address);
        
        jobDAO.updateJob(j);
        viewJobDetail(request, response);
    }
    
    public void updateJobInterview(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        PrintWriter out = response.getWriter();
        JobDAO jobDAO = new JobDAO();
        int id = Integer.parseInt(request.getParameter("jid"));        
        String url = request.getParameter("interURL");
        String date = request.getParameter("dateInter");
        Job j = new Job(id, url, date);
        
        jobDAO.updateJobInterview(j);
        viewJobDetail(request, response);
    }
}
