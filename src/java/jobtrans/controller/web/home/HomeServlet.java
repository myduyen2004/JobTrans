/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package jobtrans.controller.web.home;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.dal.JobCategoryDAO;
import jobtrans.dal.JobDAO;
import jobtrans.dal.UserDAO;
import jobtrans.model.Job;
import jobtrans.model.JobCategory;
import jobtrans.model.User;
import jobtrans.utils.DateTimeUtils;

/**
 *
 * @author admin
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})

public class HomeServlet extends HttpServlet {
    public static final int BUFFER_SIZE = 1024*1000;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            if (action == null) {
                action = "home"; // Default action to list products
            }
            switch (action) {
                case "home":
                    homePage(request, response);
                    break;
                case "list":
                    listJob(request, response);
                    break;
                case "jobDetail":
                    jobDetail(request, response);
                    break;
                case "filterJobs":
                    filterJobs(request, response);
                    break;
                case "download":
                    downloadFile(request, response);
                    break;
                case "viewEmployer":
                    viewEmployer(request, response);
                    break;
                case "detailEmployer":
                    detailEmployer(request, response);
                    break;
                case "search":
                    searchJob(request, response);
                    break;
                case "downloadJG":
                    downloadJG(request, response);
                    break;
                default:
                    homePage(request, response);
                    break;
            }
        } catch (Exception ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void homePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        JobDAO jobDao = new JobDAO();
        JobCategoryDAO categoryDao = new JobCategoryDAO();
        UserDAO userDao = new UserDAO();
        request.setAttribute("categoryList", categoryDao.getAllCategory());
        request.setAttribute("jobList", jobDao.getAllJob());
        request.setAttribute("top5Job", jobDao.get5Job());
        request.setAttribute("userList", userDao.getAllUsers());
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
    
    private void listJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        JobDAO jobDao = new JobDAO();
        JobCategoryDAO categoryDao = new JobCategoryDAO();
        request.setAttribute("categoryList", categoryDao.getAllCategory());
        request.setAttribute("jobList", jobDao.getAllJob());
        request.getRequestDispatcher("job-list.jsp").forward(request, response);
    }
    
    private void jobDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DateTimeUtils utilDate = new DateTimeUtils();
        JobDAO jobDao = new JobDAO();
        UserDAO userDao = new UserDAO();
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        Job job = jobDao.getJobByJobId(jobId);
        request.setAttribute("user", userDao.getUserByEmail(email));
        request.setAttribute("job", job);
        request.setAttribute("due", utilDate.countdownDays(job.getDueDate()));
        request.getRequestDispatcher("job-page.jsp").forward(request, response);
    }
    private void filterJobs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoriesJson = request.getParameter("categories");
        
        List<Integer> categoryIds = new Gson().fromJson(categoriesJson, new TypeToken<List<Integer>>(){}.getType());

        JobDAO jobDAO = new JobDAO();
        List<Job> filteredJobs = jobDAO.getJobsByCategoryIds(categoryIds);
        request.setAttribute("jobList", filteredJobs);
        request.getRequestDispatcher("filter-job-list.jsp").forward(request, response);
    }
    public void downloadFile(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        String fileName = request.getParameter("fileName");
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        JobDAO jobDao = new JobDAO();
        if(fileName != null && !fileName.isEmpty() && !fileName.isBlank()){
        String path = getServletContext().getRealPath("")+"job-docs"+File.separator+fileName;
//        System.out.println(path);

        File file = new File(path);
        OutputStream os = null;
        FileInputStream fis = null;
        
        response.setHeader("Content-Disposition", String.format("attachment;filename=\"%s\"", file.getName()));
        response.setContentType("application/octet-stream");
        
        if(file.exists()){
            os=response.getOutputStream();
            fis = new FileInputStream(file);
            byte[] bf = new byte[BUFFER_SIZE];
            int byteRead = -1;
            while((byteRead = fis.read(bf))!=-1){
                os.write(bf, 0, byteRead);
            }
            
        }else{
            System.out.println("File Not Found: "+fileName);
        }
        }else{
            request.setAttribute("job", jobDao.getJobByJobId(jobId));
            request.getRequestDispatcher("job-page.jsp").forward(request, response);
        }
    }
    
    private void viewEmployer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO dao = new UserDAO();
        List<User> employers = dao.getAllEmployers();
        request.setAttribute("ListEmployer", employers);
        request.getRequestDispatcher("list-employer.jsp").forward(request, response);
    }
    
    private void detailEmployer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id= request.getParameter("id");
        UserDAO dao = new UserDAO();
        JobDAO jobDao = new JobDAO();
        User employer =dao.getUserById(Integer.parseInt(id));
        request.setAttribute("detail", employer);
        request.setAttribute("posted", jobDao.getJobByUserId(employer.getUserId()));
        request.setAttribute("feedback", jobDao.getEmployerFeedbackByUserId(employer.getUserId()));
        request.getRequestDispatcher("employer-infor.jsp").forward(request, response);
    }
    
    private void searchJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String keyword= request.getParameter("keyword");
        UserDAO dao = new UserDAO();
        JobDAO jobDao = new JobDAO();
        JobCategoryDAO cateDao = new JobCategoryDAO();
        ArrayList<Job> jobList = new ArrayList<>();
        try {
            jobList = (ArrayList<Job>) jobDao.searchJobsByKeyword(keyword);
        } catch (Exception ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        ArrayList<JobCategory> categoryList = new ArrayList<>();
        categoryList = (ArrayList<JobCategory>) cateDao.getAllCategory();
        request.setAttribute("jobList", jobList);
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("job-list.jsp").forward(request, response);
    }
    
    public void downloadJG(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        String fileName = request.getParameter("fileName");
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        JobDAO jobDao = new JobDAO();
        if(fileName != null && !fileName.isEmpty() && !fileName.isBlank()){
        String path = getServletContext().getRealPath("")+"job-docs"+File.separator+fileName;
//        System.out.println(path);

        File file = new File(path);
        OutputStream os = null;
        FileInputStream fis = null;
        
        response.setHeader("Content-Disposition", String.format("attachment;filename=\"%s\"", file.getName()));
        response.setContentType("application/octet-stream");
        
        if(file.exists()){
            os=response.getOutputStream();
            fis = new FileInputStream(file);
            byte[] bf = new byte[BUFFER_SIZE];
            int byteRead = -1;
            while((byteRead = fis.read(bf))!=-1){
                os.write(bf, 0, byteRead);
            }
        }else{
            System.out.println("File Not Found: "+fileName);
        }
        }else{
            request.setAttribute("job", jobDao.getJobByJobId(jobId));
            request.getRequestDispatcher("job-page.jsp").forward(request, response);
        }
    }
    
}
