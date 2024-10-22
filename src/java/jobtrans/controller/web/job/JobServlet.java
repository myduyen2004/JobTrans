package jobtrans.controller.web.job;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import static jobtrans.controller.web.home.HomeServlet.BUFFER_SIZE;
import jobtrans.dal.JobCategoryDAO;
import jobtrans.dal.JobDAO;
import jobtrans.dal.JobGreetingDAO;
import jobtrans.dal.NotificationDAO;
import jobtrans.dal.UserDAO;
import jobtrans.model.Job;
import jobtrans.model.JobGreeting;
import jobtrans.model.Notification;
import jobtrans.model.User;
import jobtrans.utils.DateTimeUtils;

/**
 *
 * @author ADM
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class JobServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CRUDJobServerlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CRUDJobServerlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        switch (command) {
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
            case "manageSeeker":
                listSeeker(request, response);
                break;
            case "bidderDetail":
                bidderDetail(request, response);
                break;
            case "load-creating":
                loadCreating(request, response);
                break;
            case "accept-bidder":
                acceptBidder(request, response);
                break;
            case "reject-bidder":
                rejectBidder(request, response);
                break;
            case "accept-interview":
                acceptInterview(request, response);
                break;
            case "reject-interview":
                rejectInterview(request, response);
                break;
            case "DOWNLOAD":
                downloadFile(request, response);
                break;
            case "appliedList":
                appliedJobList(request, response);
                break;
            default:
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

        String command = request.getParameter("command");
        switch (command) {
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
     *
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
        DateTimeUtils utilDate = new DateTimeUtils();
        JobCategoryDAO catDao = new JobCategoryDAO();
        String email = (String) session.getAttribute("account");
        User u = userDAO.getUserByEmail(email);
        request.setAttribute("employer", u);
        if (session.getAttribute("createdJobId") != null) {
            int jobId = (int) session.getAttribute("createdJobId");
            Job job = jobDAO.getJobByJobId(jobId);
            request.setAttribute("job", job);
            request.getRequestDispatcher("manage-job-detail.jsp").forward(request, response);
            return;
        }
        int uid = userDAO.getUserByEmail(email).getUserId();
        String title = request.getParameter("projectName");
        int budget = Integer.parseInt(request.getParameter("budget"));
        String des = request.getParameter("description");
        String date = request.getParameter("date");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date dueDate = new Date();
        try {
            dueDate = dateFormat.parse(date);
        } catch (ParseException ex) {
            Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        String status = "Đang tuyển";
        String cate = request.getParameter("category");
        if (cate == null || cate.isEmpty()) {
            cate = "Không xác định";
        }
        int cateId = catDao.getJobCategoryByName(cate).getCategoryId();
        String address = request.getParameter("address");
        Part p=request.getPart("file");
        String fileName = p.getSubmittedFileName();
        //Luu file vao folder imgs
        String path = getServletContext().getRealPath("") + "job_docs";
        File file = new File(path);
        p.write(path + File.separator + fileName);
        System.out.println(path);
        String url = fileName;
        
        Job job = new Job();
        job.setUserId(uid);
        job.setJobTitle(title);
        job.setBudget(budget);
        job.setDescription(des);
        job.setDueDate(dueDate);
        job.setStatus(status);
        job.setCategoryId(cateId);
        job.setDocUrl(url);
        job.setAddress(address);
        int jobId = -1;
        try {
            jobId = jobDAO.addJobAndGetId(job);
            session.setAttribute("createdJobId", jobId);
        } catch (Exception ex) {
            Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        job.setJobId(jobId);

        request.setAttribute("job", job);
        request.setAttribute("due", utilDate.countdownDays(job.getDueDate()));

        request.getRequestDispatcher("manage-job-detail.jsp").forward(request, response);
    }

    public void viewJobList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(true);
        UserDAO userDAO = new UserDAO();
        JobDAO jobDAO = new JobDAO();
        String email = (String) session.getAttribute("email");
        User user = userDAO.getUserByEmail(email);
        ArrayList<Job> jobList = (ArrayList<Job>) jobDAO.getJobByUserId(user.getUserId());
        out.println(jobList);
        request.setAttribute("jobList", jobList);
        request.getRequestDispatcher("manage-job.jsp").forward(request, response);
    }

    public void viewJobDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        DateTimeUtils utilDate = new DateTimeUtils();
        String sid = request.getParameter("jid");
        int id = Integer.parseInt(sid);
        response.getWriter().print(id);
        HttpSession session = request.getSession(true);
        UserDAO userDAO = new UserDAO();
        JobDAO jobDAO = new JobDAO();
        String email = (String) session.getAttribute("account");
        User u = userDAO.getUserByEmail(email);
        Job job = jobDAO.getJobByJobId(id);
        out.print(email);
        request.setAttribute("employer", u);
        request.setAttribute("job", job);
        request.setAttribute("due", utilDate.countdownDays(job.getDueDate()));
        out.print(job);
        out.print(u);
        request.getRequestDispatcher("manage-job-detail.jsp").forward(request, response);
    }

    public void deleteJob(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        viewJobList(request, response);
    }

    public void loadJob(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String sid = request.getParameter("jid");
        int id = Integer.parseInt(sid);
        JobDAO jobDAO = new JobDAO();
        Job job = jobDAO.getJobByJobId(id);
        request.setAttribute("job", job);
        request.getRequestDispatcher("update-job.jsp").forward(request, response);
    }

    public void loadInterview(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String sid = request.getParameter("jid");
        int id = Integer.parseInt(sid);
        JobDAO jobDAO = new JobDAO();
        Job job = jobDAO.getJobByJobId(id);
        request.setAttribute("job", job);
        request.getRequestDispatcher("updateInterview.jsp").forward(request, response);
    }

    public void updateJob(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        JobDAO jobDAO = new JobDAO();
        JobCategoryDAO catDao = new JobCategoryDAO();
        DateTimeUtils utilDate = new DateTimeUtils();

        int id = Integer.parseInt(request.getParameter("jid"));
        String title = request.getParameter("projectName");
        String des = request.getParameter("description");
        String date = request.getParameter("date");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date dueDate = new Date();
        try {
            dueDate = dateFormat.parse(date);
        } catch (ParseException ex) {
            Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        int budget = Integer.parseInt(request.getParameter("budget"));
        String cate = request.getParameter("category");
        if (cate == null || cate.isEmpty()) {
            cate = "Không xác định";
        }
        int cateId = catDao.getJobCategoryByName(cate).getCategoryId();
        String address = request.getParameter("address");
        Part p=request.getPart("file");
        String fileName = p.getSubmittedFileName();
        //Luu file vao folder job_docs
        String path = getServletContext().getRealPath("") + "job_docs";
        File file = new File(path);
        p.write(path + File.separator + fileName);
        System.out.println(path);
        String url = fileName;
        
        Job job = jobDAO.getJobByJobId(id);

        job.setJobId(id);
        job.setJobTitle(title);
        if (url != null) {
            job.setDocUrl(url);
        }

        job.setBudget(budget);
        job.setDescription(des);
        job.setDueDate(dueDate);
        job.setAddress(address);
        if (cateId != job.getCategoryId()) {
            job.setCategoryId(cateId);
        }
        jobDAO.updateJob(job);
        request.setAttribute("due", utilDate.countdownDays(job.getDueDate()));
        request.setAttribute("job", job);
        
        response.sendRedirect("job?command=VIEW&jid="+id);
    }

    public void updateJobInterview(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        JobDAO jobDAO = new JobDAO();
        int id = Integer.parseInt(request.getParameter("jid"));
        String url = request.getParameter("interURL");
        String date = request.getParameter("dateInter");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date dueDate = new Date();
        try {
            dueDate = dateFormat.parse(date);
        } catch (ParseException ex) {
            Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        jobDAO.updateInterview(id, url, dueDate);
        viewJobDetail(request, response);
    }

    protected void listSeeker(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String jobIdParam = request.getParameter("jobId");
        if (jobIdParam != null && !jobIdParam.isEmpty()) {
            int jobId = Integer.parseInt(jobIdParam);
            JobGreetingDAO jobGreetingDAO = new JobGreetingDAO();
            List<JobGreeting> jobGreetings = new ArrayList<>();
            try {
                jobGreetings = jobGreetingDAO.getJobGreetingByJobId(jobId);
            } catch (Exception ex) {
                Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("jobGreetings", jobGreetings);
            if (!jobGreetings.isEmpty()) {

                request.getRequestDispatcher("manage-bidder.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("manage-bidder.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("manage-bidder.jsp").forward(request, response);
        }

    }

    public void downloadFile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fileName = request.getParameter("fileName");
        if (fileName != null) {
            String path = getServletContext().getRealPath("") + "job_docs" + File.separator + fileName;
//        System.out.println(path);
//        response.getWriter().print(path);

            File file = new File(path);
            OutputStream os = null;
            FileInputStream fis = null;

            response.setHeader("Content-Disposition", String.format("attachment;filename=\"%s\"", file.getName()));
            response.setContentType("application/octet-stream");

            if (file.exists()) {
                os = response.getOutputStream();
                fis = new FileInputStream(file);
                byte[] bf = new byte[BUFFER_SIZE];
                int byteRead = -1;
                while ((byteRead = fis.read(bf)) != -1) {
                    os.write(bf, 0, byteRead);
                }
            } else {
                System.out.println("File Not Found: " + fileName);
            }
        }
    }

    public void loadCreating(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("createdJobId");
        request.getRequestDispatcher("post-a-job.jsp").forward(request, response);
    }

    //Xét duyệt ứng viên dành cho Employer
    public void acceptBidder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        int jobGreetingId = Integer.parseInt(request.getParameter("jgId"));
        JobGreetingDAO jgDao = new JobGreetingDAO();
        NotificationDAO notiDao = new NotificationDAO();
        JobDAO jobDao = new JobDAO();
        try {
            jgDao.updateStatus(jobGreetingId, "Chờ phỏng vấn");
            Notification notification = new Notification(jgDao.getJobGreetingsByJGId(jobGreetingId).getJobSeekerId(), "Chào giá của bạn được chấp nhận", "Bạn có một chào giá được chấp nhận từ công việc "+jobDao.getJobByJobId(jobId).getJobTitle()+". Hãy chuẩn bị cho phỏng vấn!", new Date(), false);
            notiDao.insertNotification(notification);
        } catch (Exception ex) {
            Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        ArrayList<JobGreeting> jobGreetings = new ArrayList<>();
        try {
            jobGreetings = (ArrayList<JobGreeting>) jgDao.getJobGreetingByJobId(jobId);
            
        } catch (Exception ex) {
            Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("jobGreetings", jobGreetings);
        request.getRequestDispatcher("manage-bidder.jsp").forward(request, response);
    }

    public void rejectBidder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        int jobGreetingId = Integer.parseInt(request.getParameter("jgId"));
        JobGreetingDAO jgDao = new JobGreetingDAO();
        NotificationDAO notiDao = new NotificationDAO();
        JobDAO jobDao = new JobDAO();
        try {
            jgDao.updateStatus(jobGreetingId, "Bị từ chối");
            Notification notification = new Notification(jgDao.getJobGreetingsByJGId(jobGreetingId).getJobSeekerId(), "Chào giá của bạn bị từ chối", "Rất tiếc! Bạn có một chào giá đã bị từ chối từ công việc "+jobDao.getJobByJobId(jobId).getJobTitle()+". Hãy chào giá công việc khác!", new Date(), false);
            notiDao.insertNotification(notification);
        } catch (Exception ex) {
            Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        ArrayList<JobGreeting> jobGreetings = new ArrayList<>();
        try {
            jobGreetings = (ArrayList<JobGreeting>) jgDao.getJobGreetingByJobId(jobId);
            
        } catch (Exception ex) {
            Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("jobGreetings", jobGreetings);
        request.getRequestDispatcher("manage-bidder.jsp").forward(request, response);
    }

    public void acceptInterview(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        int jobGreetingId = Integer.parseInt(request.getParameter("jgId"));
        JobDAO jobDao = new JobDAO();
        JobGreetingDAO jgDao = new JobGreetingDAO();
        boolean check = false;
        NotificationDAO notiDao = new NotificationDAO();
        try {
            check = jgDao.checkJobHasAcceptedGreeting(jobId);
        } catch (Exception ex) {
            Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == false) {
            try {
                jgDao.updateStatus(jobGreetingId, "Được chấp nhận");
                Notification notification = new Notification(jgDao.getJobGreetingsByJGId(jobGreetingId).getJobSeekerId(), "Phỏng vấn thành công", "Bạn đã được chấp nhận qua phỏng vấn công việc "+jobDao.getJobByJobId(jobId).getJobTitle()+". Để chính thức làm việc, vui lòng đặt cọc trước để đảm bảo!", new Date(), false);
                notiDao.insertNotification(notification);
            } catch (Exception ex) {
                Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            jobDao.updateJobStatus(jobId, "Chờ đặt cọc");
        }else{
            request.setAttribute("error", "Bạn đã chọn ứng viên cho công việc này");
        }
        ArrayList<JobGreeting> jobGreetings = new ArrayList<>();
        try {
            jobGreetings = (ArrayList<JobGreeting>) jgDao.getJobGreetingByJobId(jobId);
        } catch (Exception ex) {
            Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("jobGreetings", jobGreetings);
        request.getRequestDispatcher("manage-bidder.jsp").forward(request, response);

    }

    public void rejectInterview(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        int jobGreetingId = Integer.parseInt(request.getParameter("jgId"));
        JobGreetingDAO jgDao = new JobGreetingDAO();
        NotificationDAO notiDao = new NotificationDAO();
        JobDAO jobDao = new JobDAO();
        try {
            jgDao.updateStatus(jobGreetingId, "Bị từ chối");
            Notification notification = new Notification(jgDao.getJobGreetingsByJGId(jobGreetingId).getJobSeekerId(), "Phỏng vấn thất bại", "Rất tiếc! Bạn đã bị từ chối sau phỏng vấn công việc "+jobDao.getJobByJobId(jobId).getJobTitle()+". Hãy chào giá cho công việc khác!", new Date(), false);
            notiDao.insertNotification(notification);
        } catch (Exception ex) {
            Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        ArrayList<JobGreeting> jobGreetings = new ArrayList<>();
        try {
            jobGreetings = (ArrayList<JobGreeting>) jgDao.getJobGreetingByJobId(jobId);
        } catch (Exception ex) {
            Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("jobGreetings", jobGreetings);
        request.getRequestDispatcher("manage-bidder.jsp").forward(request, response);

    }

    public void appliedJobList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        User u = new UserDAO().getUserByEmail(email);
        JobDAO jobDao = new JobDAO();
        JobGreetingDAO jgDao = new JobGreetingDAO();
        List<JobGreeting> jobGreetingList = new ArrayList<>();
        try {
            jobGreetingList = jgDao.getJobGreetingBySeekerId(u.getUserId());
        } catch (Exception ex) {
            Logger.getLogger(JobServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("jgList", jobGreetingList);
        request.getRequestDispatcher("applied-jobs.jsp").forward(request, response);

    }

    public void bidderDetail(HttpServletRequest request, HttpServletResponse response) {

    }
}
