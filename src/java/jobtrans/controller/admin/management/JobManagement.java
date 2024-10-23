/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package jobtrans.controller.admin.management;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.controller.web.job.JobServlet;
import jobtrans.dal.JobCategoryDAO;
import jobtrans.dal.JobDAO;
import jobtrans.dal.JobGreetingDAO;
import jobtrans.dal.JobReportDAO;
import jobtrans.dal.TransactionDAO;
import jobtrans.dal.UserDAO;
import jobtrans.model.Job;
import jobtrans.model.JobCategory;
import jobtrans.model.JobGreeting;
import jobtrans.model.JobReport;
import jobtrans.model.Transaction;
import jobtrans.model.User;

/**
 *
 * @author admin
 */
public class JobManagement extends HttpServlet {
   
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
            out.println("<title>Servlet JobManagement</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JobManagement at " + request.getContextPath () + "</h1>");
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
                viewListJob(request, response);
                break;
            case "filterJobsByStatus":
                filterJobByStatuses(request, response);
                break;
            case "DELETE":
                deleteJob(request, response);
                break;
            case "DETAIL":
                viewDetailJob(request, response);
                break;
            case "REPORT":
                viewReport(request, response);
                break;
            case "DENYREPORT":
                denyReport(request, response);
                break;
            case "PAYSALARY":
            {
                try {
                    paySalary(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(JobManagement.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
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
    
    public void viewListJob(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        JobDAO jobDao = new JobDAO();
        
        List<Job> jobList = jobDao.getAllJob();
        
        request.setAttribute("jobList", jobList);
        request.getRequestDispatcher("manage-job-admin.jsp").forward(request, response);
    }
    
    private void filterJobByStatuses(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String statusesJson = request.getParameter("statuses");
        
        List<String> statuses = new Gson().fromJson(statusesJson, new TypeToken<List<String>>(){}.getType());
        
        JobDAO jobDAO = new JobDAO();
        List<Job> filteredJobs = jobDAO.getJobsByStatuses(statuses);
        request.setAttribute("jobList", filteredJobs);
        request.getRequestDispatcher("filter-manage-job-admin.jsp").forward(request, response);
    }
    
    public void deleteJob(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        JobGreetingDAO greetingDao = new JobGreetingDAO();
        JobDAO jobDAO = new JobDAO();
        String sid = request.getParameter("jid");
        int id = Integer.parseInt(sid);
        List<JobGreeting> greetingList = new ArrayList<>();
        try {
            greetingDao.getJobGreetingByJobId(id);
        } catch (Exception ex) {
            Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (!greetingList.isEmpty()) {
            try {
                greetingDao.deleteJobGreetingByJobId(id);
            } catch (Exception ex) {
                Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            jobDAO.deleteJobById(id);
        } else {
            jobDAO.deleteJobById(id);
        }
        viewListJob(request, response);
    }
    
    public void viewDetailJob(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        JobDAO jobDAO = new JobDAO();
        String sid = request.getParameter("jid");
        int id = Integer.parseInt(sid);
        
        Job j = jobDAO.getJobByJobId(id);
        
        request.setAttribute("job", j);
        request.getRequestDispatcher("manage-job-page-ad.jsp").forward(request, response);
    }
    
    public void viewReport(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        JobReportDAO jrDAO = new JobReportDAO();
        JobDAO jobDAO = new JobDAO();
        
        String sid = request.getParameter("jid");
        int id = Integer.parseInt(sid);
        
        List<JobReport> jrList = jrDAO.getAllReportByJobId(id);  
        Job j = jobDAO.getJobByJobId(id);
        
        request.setAttribute("jobinfo", j);
        request.setAttribute("jobReportList", jrList);
        request.getRequestDispatcher("manage-report-admin.jsp").forward(request, response);
    }
    
    public void denyReport(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        JobReportDAO jrDAO = new JobReportDAO();
        
        String sid = request.getParameter("rid");
        int id = Integer.parseInt(sid);
        
        jrDAO.denyJobReportByReportId(id);
        
        viewReport(request, response);
    }
    
    public void paySalary(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, Exception {
        HttpSession session = request.getSession(true);
        String email = (String) session.getAttribute("account");
        
        String sid = request.getParameter("jid");
        int id = Integer.parseInt(sid);
        String des = request.getParameter("description");
        
        JobDAO jobDAO = new JobDAO();
        JobGreetingDAO jgDAO = new JobGreetingDAO();
        TransactionDAO tDAO = new TransactionDAO();
        UserDAO uDAO = new UserDAO();
        
        User admin = uDAO.getUserByEmail(email);
        Job job = jobDAO.getJobByJobId(id);
        
        Date date=new java.util.Date(); 
        
        JobGreeting jg = jgDAO.getJobGreetingsByJobIdAndStatus(id, "Được chấp nhận");
        
        if(jg == null){
            request.setAttribute("msgSalary", "Công việc chưa bắt đầu!");
            viewDetailJob(request, response);
        }else{
            if (!job.getStatus().equalsIgnoreCase("Đã hoàn thành")) {
                request.setAttribute("msgSalary", "Công việc chưa hoàn thành!");
                viewDetailJob(request, response);
            }else{
                Transaction t = new Transaction(admin.getUserId(), (int) (job.getSecureWallet() - jg.getPrice() * 0.03), date, true, "Trừ tiền", des, id);
                tDAO.addTransactionForJob(t);

                jobDAO.updateJobStatusAndWallet(id, "Đã trả lương", -job.getSecureWallet());

                User seeker = uDAO.getUserById(jg.getJobSeekerId());
                seeker.setBalance(seeker.getBalance() + (int) (job.getSecureWallet() - jg.getPrice() * 0.03));
                uDAO.updateBalance(seeker);

                admin.setBalance((int) (admin.getBalance() + jg.getPrice() * 0.03));
                uDAO.updateBalance(admin);
                
                request.setAttribute("msgSalary", "Trả Lương Hoàn Tất!");
                viewDetailJob(request, response);
            }
        }
    }
}
