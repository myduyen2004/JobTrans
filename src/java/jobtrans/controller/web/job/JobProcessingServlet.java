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
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.dal.JobDAO;
import jobtrans.dal.JobGreetingDAO;
import jobtrans.dal.JobProcessDAO;
import jobtrans.dal.NotificationDAO;
import jobtrans.dal.TransactionDAO;
import jobtrans.dal.UserDAO;
import jobtrans.model.Job;
import jobtrans.model.JobGreeting;
import jobtrans.model.Notification;
import jobtrans.model.Transaction;
import jobtrans.model.User;
import jobtrans.model.Process;

/**
 *
 * @author admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class JobProcessingServlet extends HttpServlet {

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
            out.println("<title>Servlet JobProcessingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JobProcessingServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        switch (action) {
            case "list-employer":
                myJobForEmployer(request, response);
                break;
            case "list-seeker":
                myJobForSeeker(request, response);
                break;
            case "load-deposit":
                loadDeposit(request, response);
                break;
            case "deposit-seeker":
                depositForJob(request, response);
                break;
            case "load-prepay":
                loadPrepay(request, response);
                break;
            case "prepay-employer":
                prepayForJob(request, response);
                break;

//            case "prepay-employer":
//                prepayForJob(request, response);
//                break;
            case "list-process":
                listProcessSeeker(request, response);
                break;

            case "request-process":
                requestProcess(request, response);
                break;
            case "result-process":
                loadResultSeeker(request, response);
                break;
            case "downloadRequirement":
                downloadRequirement(request, response);
                break;
            case "comments-process":
                loadCommentProcess(request, response);
                break;
            case "view-process-employer": {
                try {
                    viewProcessEmployer(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            break;
            case "load-creating":
                loadCreating(request, response);
                break;
//            case "prepay-employer":
//                prepayForJob(request, response);
//                break;

//            case "prepay-employer":
//                prepayForJob(request, response);
//                break;
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
        
        String command = (String) request.getParameter("command");
        switch(command){
            case "CREATE":
            {
                try {
                    createProcess(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                break;

            case "submit-process-result":
                submitProcess(request, response);
                break;
        }
        
    }
    public void loadCommentProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           HttpSession session = request.getSession();
        String name = request.getParameter("name");
        JobProcessDAO j = new JobProcessDAO();
        String processId = request.getParameter("processId");
        String jobIdParam = request.getParameter("jobId");
        // Kiểm tra nếu jobIdParam là null hoặc rỗng
        if (jobIdParam == null || jobIdParam.isEmpty()) {
            // Xử lý trường hợp không có jobId (ví dụ: trả về lỗi hoặc redirect)
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tham số jobId không hợp lệ");
            return;
        }
        int IntjobId;
        try {
            IntjobId = Integer.parseInt(jobIdParam);
        } catch (NumberFormatException e) {
            // Xử lý trường hợp jobId không phải là số nguyên hợp lệ
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Định dạng jobId không hợp lệ");
            return;
        }
        int IntprocessId;
        try {
            IntprocessId = Integer.parseInt(processId);
        } catch (NumberFormatException e) {
            // Xử lý trường hợp jobId không phải là số nguyên hợp lệ
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Định dạng jobId không hợp lệ");
            return;
        }
        Process pro = j.getProcessById(IntprocessId);
        JobDAO jobDao = new JobDAO();
        Job job = jobDao.getJobByJobId(IntjobId);
        request.setAttribute("name", name);
        request.setAttribute("j", job);
        request.setAttribute("pro", pro);
        request.setAttribute("processId", processId);
        request.getRequestDispatcher("comment-process.jsp").forward(request, response);
    }

    
    

    public void downloadRequirement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileUrl = request.getParameter("url");

        // Check if the URL is valid
        if (fileUrl == null || fileUrl.isEmpty()) {
            response.getWriter().write("Error: File URL is missing or invalid.");
            return;
        }

        // Create a connection to the file URL
        try {
            URL url = new URL(fileUrl);
            URLConnection connection = url.openConnection();

            // Get the input stream from the URL connection
            InputStream inputStream = connection.getInputStream();

            // Set response headers to force download
            String fileName = Paths.get(url.getPath()).getFileName().toString();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

            // Write the file to the response output stream
            OutputStream outputStream = response.getOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            inputStream.close();
            outputStream.close();
        } catch (MalformedURLException e) {
            response.getWriter().write("Error: Invalid URL format.");
            e.printStackTrace();
        } catch (IOException e) {
            response.getWriter().write("Error: Unable to download the file.");
            e.printStackTrace();
        }

    }

    public void requestProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        JobProcessDAO j = new JobProcessDAO();
        String processId = request.getParameter("processId");
        String jobIdParam = request.getParameter("jobId");
        // Kiểm tra nếu jobIdParam là null hoặc rỗng
        if (jobIdParam == null || jobIdParam.isEmpty()) {
            // Xử lý trường hợp không có jobId (ví dụ: trả về lỗi hoặc redirect)
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tham số jobId không hợp lệ");
            return;
        }
        int IntjobId;
        try {
            IntjobId = Integer.parseInt(jobIdParam);
        } catch (NumberFormatException e) {
            // Xử lý trường hợp jobId không phải là số nguyên hợp lệ
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Định dạng jobId không hợp lệ");
            return;
        }
        int IntprocessId;
        try {
            IntprocessId = Integer.parseInt(processId);
        } catch (NumberFormatException e) {
            // Xử lý trường hợp jobId không phải là số nguyên hợp lệ
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Định dạng jobId không hợp lệ");
            return;
        }
        Process pro = j.getProcessById(IntprocessId);
        JobDAO jobDao = new JobDAO();
        Job job = jobDao.getJobByJobId(IntjobId);
        request.setAttribute("name", name);
        request.setAttribute("j", job);
        request.setAttribute("pro", pro);
        request.setAttribute("processId", processId);
        request.getRequestDispatcher("request-process.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public void loadResultSeeker(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        JobProcessDAO j = new JobProcessDAO();
        String processId = request.getParameter("processId");
        String jobIdParam = request.getParameter("jobId");
        // Kiểm tra nếu jobIdParam là null hoặc rỗng
        if (jobIdParam == null || jobIdParam.isEmpty()) {
            // Xử lý trường hợp không có jobId (ví dụ: trả về lỗi hoặc redirect)
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tham số jobId không hợp lệ");
            return;
        }
        int IntjobId;
        try {
            IntjobId = Integer.parseInt(jobIdParam);
        } catch (NumberFormatException e) {
            // Xử lý trường hợp jobId không phải là số nguyên hợp lệ
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Định dạng jobId không hợp lệ");
            return;
        }
        JobDAO jobDao = new JobDAO();
        Job job = jobDao.getJobByJobId(IntjobId);
        request.setAttribute("name", name);
        request.setAttribute("j", job);
        request.setAttribute("processId", processId);
        request.getRequestDispatcher("result-process.jsp").forward(request, response);
    }

    public void listProcessSeeker(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");

        UserDAO userDao = new UserDAO();
        User u = userDao.getUserByEmail(email);

        String jobIdParam = request.getParameter("jobId");

        // Kiểm tra nếu jobIdParam là null hoặc rỗng
        if (jobIdParam == null || jobIdParam.isEmpty()) {
            // Xử lý trường hợp không có jobId (ví dụ: trả về lỗi hoặc redirect)
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tham số jobId không hợp lệ");
            return;
        }

        int jobId;
        try {
            jobId = Integer.parseInt(jobIdParam);
        } catch (NumberFormatException e) {
            // Xử lý trường hợp jobId không phải là số nguyên hợp lệ
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Định dạng jobId không hợp lệ");
            return;
        }

        JobDAO jobDao = new JobDAO();
        Job job = jobDao.getJobByJobId(jobId);

        JobProcessDAO processDAO = new JobProcessDAO();
        List<Process> processList = new ArrayList<>();

        try {
            ;
            processList = processDAO.getProcessesByJobId(jobId);

        } catch (Exception ex) {
            Logger.getLogger(JobProcessingServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("j", job);
        request.setAttribute("processList", processList);
        request.getRequestDispatcher("my-process-seeker.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public void myJobForEmployer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        User u = new UserDAO().getUserByEmail(email);
        JobDAO jobDao = new JobDAO();
        List<Job> jobList = new ArrayList<>();
        try {
            jobList = jobDao.selectJobsExcludingHiring(u);

        } catch (Exception ex) {
            Logger.getLogger(JobProcessingServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("jobList", jobList);
        request.getRequestDispatcher("my-job-employer.jsp").forward(request, response);

    }

    public void myJobForSeeker(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        User u = new UserDAO().getUserByEmail(email);
        JobDAO jobDao = new JobDAO();
        List<Job> jobList = new ArrayList<>();
        try {
            jobList = jobDao.getAcceptedJobOfSeeker(u.getUserId());

        } catch (Exception ex) {
            Logger.getLogger(JobProcessingServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("jobList", jobList);
        request.getRequestDispatcher("my-job-seeker.jsp").forward(request, response);

    }

    public void loadPrepay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        UserDAO userDao = new UserDAO();
        User u = userDao.getUserByEmail(email);
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        JobDAO jobDao = new JobDAO();
        Job job = jobDao.getJobByJobId(jobId);
        JobGreeting jg = new JobGreeting();
        try {
            jg = new JobGreetingDAO().getJobGreetingsByJobIdAndStatus(jobId, "Được chấp nhận");

        } catch (Exception ex) {
            Logger.getLogger(JobProcessingServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("role", u.getRole());
        TransactionDAO transDao = new TransactionDAO();
        try {
            if (transDao.checkTransactionExists(jobId, "Trả trước")) {
                request.setAttribute("prepay-check", "Đã trả trước");
            } else {
                request.setAttribute("prepay-check", "Chưa trả trước");

            }
        } catch (Exception ex) {
            Logger.getLogger(JobProcessingServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("job", job);
        request.setAttribute("user", u);
        request.setAttribute("prepayMoney", job.calcPrepayFee(jg));
        request.getRequestDispatcher("deposit.jsp").forward(request, response);

    }

    public void prepayForJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        int prepayMoney = Integer.parseInt(request.getParameter("prepayMoney"));
        UserDAO userDao = new UserDAO();
        User u = userDao.getUserByEmail(email);
        JobDAO jobDao = new JobDAO();
        TransactionDAO transDao = new TransactionDAO();
        request.setAttribute("role", u.getRole());
        JobGreeting jg = new JobGreeting();
        NotificationDAO notiDao = new NotificationDAO();
        try {
            jg = new JobGreetingDAO().getJobGreetingsByJobIdAndStatus(jobId, "Được chấp nhận");

        } catch (Exception ex) {
            Logger.getLogger(JobProcessingServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        try {
            if (!transDao.checkTransactionExists(jobId, "Trả trước")) {
                Job job = jobDao.getJobByJobId(jobId);
                //Update số dư
                Transaction trans = new Transaction(u.getUserId(), prepayMoney, new Date(), true, "Trừ tiền", "Trả trước", jobId);

                if (u.getBalance() >= prepayMoney) {
                    jobDao.updateJobStatusAndWallet(jobId, "Chờ đặt cọc", prepayMoney);
                    job = jobDao.getJobByJobId(jobId);
                    if (job.getSecureWallet() == job.calcSecureWallet(jg)) {
                        jobDao.updateJobStatus(jobId, "Đang làm việc");
                    }
                    u.setBalance(u.getBalance() - prepayMoney);
                    try {
                        transDao.addTransactionForJob(trans);
                    } catch (Exception ex) {
                        request.setAttribute("error", ex);
                        Logger
                                .getLogger(JobProcessingServlet.class
                                        .getName()).log(Level.SEVERE, null, ex);
                    }
                    userDao.updateBalance(u);
                    Notification notification = new Notification(jg.getJobSeekerId(), "Đối tác của bạn đã trả trước cho công việc", "Đối tác " + u.getUserName() + " của bạn đã trả trước cho công việc " + job.getJobTitle() + ". Hãy theo dõi hoàn tất thanh toán để chính thức tham gia vào công việc!", new Date(), false);
                    notiDao.insertNotification(notification);
                    request.setAttribute("success", "Trả trước thành công");
                    request.setAttribute("prepay-check", "Đã trả trước");
                } else {
                    request.setAttribute("job", job);
                    request.setAttribute("user", u);
                    request.setAttribute("prepayMoney", job.calcPrepayFee(jg));
                    request.setAttribute("prepay-check", "Chưa trả trước");
                    request.setAttribute("error", "Số dư của bạn không đủ. Vui lòng nộp thêm tiền để thực hiện giao dịch này");
                }
                request.getRequestDispatcher("deposit.jsp").forward(request, response);
            } else {
                request.setAttribute("prepay-check", "Đã trả trước");
                request.getRequestDispatcher("deposit.jsp").forward(request, response);

            }
        } catch (Exception ex) {
            Logger.getLogger(JobProcessingServlet.class
                    .getName()).log(Level.SEVERE, null, ex);

        }

    }

    public void loadDeposit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        UserDAO userDao = new UserDAO();
        User u = userDao.getUserByEmail(email);
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        JobDAO jobDao = new JobDAO();
        Job job = jobDao.getJobByJobId(jobId);
        JobGreeting jg = new JobGreeting();
        try {
            jg = new JobGreetingDAO().getJobGreetingBySeekerAndJob(u.getUserId(), jobId);

        } catch (Exception ex) {
            Logger.getLogger(JobProcessingServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("role", u.getRole());
        TransactionDAO transDao = new TransactionDAO();
        try {
            if (transDao.checkTransactionExists(jobId, "Đặt cọc nhận việc")) {
                request.setAttribute("deposit-check", "Đã cọc");
            } else {
                request.setAttribute("deposit-check", "Chưa cọc");

            }
        } catch (Exception ex) {
            Logger.getLogger(JobProcessingServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("job", job);
        request.setAttribute("user", u);
        request.setAttribute("depositMoney", jg.calcDepositFee());
        request.getRequestDispatcher("deposit.jsp").forward(request, response);

    }

    public void depositForJob(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        int depositMoney = Integer.parseInt(request.getParameter("depositMoney"));
        UserDAO userDao = new UserDAO();
        User u = userDao.getUserByEmail(email);
        JobDAO jobDao = new JobDAO();
        TransactionDAO transDao = new TransactionDAO();
        request.setAttribute("role", u.getRole());
        JobGreeting jg = new JobGreeting();
        NotificationDAO notiDao = new NotificationDAO();
        try {
            jg = new JobGreetingDAO().getJobGreetingBySeekerAndJob(u.getUserId(), jobId);

        } catch (Exception ex) {
            Logger.getLogger(JobProcessingServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        try {
            if (!transDao.checkTransactionExists(jobId, "Đặt cọc nhận việc")) {
                Job job = jobDao.getJobByJobId(jobId);
                //Update số dư
                Transaction trans = new Transaction(u.getUserId(), depositMoney, new Date(), true, "Trừ tiền", "Đặt cọc nhận việc", jobId);

                if (u.getBalance() >= depositMoney) {
                    jobDao.updateJobStatusAndWallet(jobId, "Chờ đặt cọc", depositMoney);
                    job = jobDao.getJobByJobId(jobId);
                    if (job.getSecureWallet() == job.calcSecureWallet(jg)) {
                        jobDao.updateJobStatus(jobId, "Đang làm việc");
                    }
                    u.setBalance(u.getBalance() - depositMoney);
                    try {
                        transDao.addTransactionForJob(trans);
                    } catch (Exception ex) {
                        request.setAttribute("error", ex);
                        Logger
                                .getLogger(JobProcessingServlet.class
                                        .getName()).log(Level.SEVERE, null, ex);
                    }
                    userDao.updateBalance(u);
                    Notification notification = new Notification(job.getUserId(), "Đối tác của bạn đã đặt cọc nhận việc", "Đối tác " + u.getUserName() + " của bạn đã đặt cọc nhận công việc " + job.getJobTitle() + ". Hãy theo dõi hoàn tất thanh toán để chính thức tham gia vào công việc!", new Date(), false);
                    notiDao.insertNotification(notification);
                    request.setAttribute("success", "Đặt cọc nhận việc thành công");
                    request.setAttribute("deposit-check", "Đã cọc");
                } else {
                    request.setAttribute("job", job);
                    request.setAttribute("user", u);
                    request.setAttribute("depositMoney", jg.calcDepositFee());
                    request.setAttribute("deposit-check", "Chưa cọc");
                    request.setAttribute("error", "Số dư của bạn không đủ. Vui lòng nộp thêm tiền để thực hiện giao dịch này");
                }
                request.getRequestDispatcher("deposit.jsp").forward(request, response);
            } else {
                request.setAttribute("deposit-check", "Đã cọc");
                request.getRequestDispatcher("deposit.jsp").forward(request, response);

            }
        } catch (Exception ex) {
            Logger.getLogger(JobProcessingServlet.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void viewProcessEmployer(HttpServletRequest request, HttpServletResponse response)
            throws IOException, Exception {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");

        if (email == null) {
            response.sendRedirect("login.jsp"); // Chuyển hướng đến trang đăng nhập
            return;
        }
        int jobId = Integer.parseInt(request.getParameter("jobId"));

        JobProcessDAO processDAO = new JobProcessDAO();
        List<Process> processes = new ArrayList<>();

        // Gọi DAO để lấy danh sách quy trình cho công việc theo jobId
        processes = processDAO.getProcessesByJobId(jobId);

        // Gửi danh sách quy trình sang trang JSP
        request.setAttribute("processes", processes);
        request.setAttribute("jobId", jobId);

        // Điều hướng đến trang JSP để hiển thị
        request.getRequestDispatcher("view-process-of-job-employer.jsp").forward(request, response);
    }

    public void loadCreating(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        session.setAttribute("jobId", jobId);
        session.setAttribute("createdProcessId", jobId);
        request.getRequestDispatcher("post-a-process.jsp").forward(request, response);
    }

    protected void createProcess(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException, Exception {
        HttpSession session = request.getSession(true);
        JobProcessDAO processDAO = new JobProcessDAO();
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        session.setAttribute("jobId", jobId);

        String stageName = request.getParameter("stageName");
        String requirements = request.getParameter("requirements");
        String date = request.getParameter("endDate");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date endDate = null;

        try {
            endDate = dateFormat.parse(date);
        } catch (ParseException ex) {
            request.setAttribute("errorMessage", "Định dạng ngày không hợp lệ.");
            request.getRequestDispatcher("post-a-process.jsp").forward(request, response);
            return;
        }

        String url = null;
        String baseUploadPath = "D:/FALL24/JobTrans/web/process_docs/";
        String uniqueFolderName = "process_docs_" + System.currentTimeMillis();
        File uploadDir = new File(baseUploadPath + uniqueFolderName);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                part.write(uploadDir.getAbsolutePath() + File.separator + fileName);
                url = "process_docs/" + uniqueFolderName + "/" + fileName; // Cập nhật URL nếu có file
            }
        }

        Process process = new Process();
        process.setJobId(jobId);
        process.setStageName(stageName);
        process.setRequirements(requirements);
        process.setEndDate(endDate);
        process.setResultUrl(url);

        Process processes = processDAO.createProcess(process);

        request.setAttribute("processes", processes);
        response.sendRedirect("myjob?action=view-process-employer&jobId=" + jobId);

    }

   private void submitProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    String processIdStr = request.getParameter("processId");
    int jobId = Integer.parseInt(request.getParameter("job"));
    
    if (processIdStr == null || processIdStr.isEmpty()) {
        response.getWriter().write("Error: processId is missing or invalid.");
        return;
    }

    try {

        int processId = Integer.parseInt(processIdStr);
        String description = request.getParameter("description");
        String uploadPath = null;
        String fileURL = null;

        // Handle file upload (if any file is uploaded)
        Part filePart = request.getPart("fileUpload");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String baseUploadPath = "D:/FALL24/JobTrans/web/job_docs/";
            String uniqueFolderName = "job_docs_" + System.currentTimeMillis();
            File uploadDir = new File(baseUploadPath + uniqueFolderName);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();  // Create directory if it doesn't exist
            }
            uploadPath = uploadDir.getAbsolutePath() + File.separator + fileName;
            filePart.write(uploadPath);
            fileURL = "http://localhost:8080/JobTrans/job_docs/" + uniqueFolderName + "/" + fileName;
            System.out.println("File URL: " + fileURL);
        } else {
            System.out.println("No file was uploaded.");
        }

        // Update the process description
        JobProcessDAO processDAO = new JobProcessDAO();
        boolean descriptionResult = processDAO.updateProcessDescription(processId, description);
        boolean fileResult = true;

        // Update the file URL only if a file was uploaded
        if (uploadPath != null) {
            fileResult = processDAO.updateProcessFile(processId, fileURL);
        }

        // Check if both updates succeeded
        if (descriptionResult) {
             Boolean updatestatus =processDAO.updateProcessStatus(processId);
             request.getSession().setAttribute("message", "Nộp bài thành công"); 
        } else {
            // Store failure message in the session
            request.getSession().setAttribute("message", "Nộp bài thất bại!");
            
        }
    response.sendRedirect("myjob?action=list-process&jobId=" +jobId);
    } catch (NumberFormatException e) {
        response.getWriter().write("Error: processId is not a valid integer.");
        e.printStackTrace();
    } catch (Exception e) {
        response.getWriter().write("Error: " + e.getMessage());
        e.printStackTrace();
    }
   }
}
