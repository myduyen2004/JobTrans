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
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.dal.JobDAO;
import jobtrans.dal.JobGreetingDAO;
import jobtrans.dal.JobProcessDAO;
import jobtrans.dal.TransactionDAO;
import jobtrans.dal.UserDAO;
import jobtrans.model.Job;
import jobtrans.model.JobGreeting;
import jobtrans.model.Transaction;
import jobtrans.model.User;
import jobtrans.model.process;

/**
 *
 * @author admin
 */
@MultipartConfig
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
       String processIdStr = request.getParameter("processId");
    if (processIdStr == null || processIdStr.isEmpty()) {
        response.getWriter().write("Error: processId is missing or invalid.");
        return;
    }
    try {
        int processId = Integer.parseInt(processIdStr);
        String description = request.getParameter("description");
        // Initialize file upload path to null
        String uploadPath = null;
        String fileURL = null;

// Xử lý việc tải tệp (nếu có tệp được tải lên)
Part filePart = request.getPart("fileUpload");
if (filePart != null && filePart.getSize() > 0) {
    // Lấy tên tệp từ phần tải lên
    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
    
    // Đường dẫn thư mục lưu trữ tệp
    String baseUploadPath = "D:/FALL24/JobTrans/web/job_docs/";
    
    // Tạo tên thư mục duy nhất để lưu trữ tệp theo thời gian
    String uniqueFolderName = "job_docs_" + System.currentTimeMillis();
    
    // Tạo thư mục mới để lưu tệp
    File uploadDir = new File(baseUploadPath + uniqueFolderName);
    if (!uploadDir.exists()) {
        uploadDir.mkdirs();  // Tạo thư mục nếu nó chưa tồn tại
    }
    
    // Đường dẫn đầy đủ để lưu tệp
    uploadPath = uploadDir.getAbsolutePath() + File.separator + fileName;
    
    // Ghi tệp vào thư mục đã tạo
    filePart.write(uploadPath);
    
    // Tạo URL công khai để có thể truy cập tệp qua ứng dụng web
    fileURL = "http://localhost:8080/JobTrans/job_docs/" + uniqueFolderName + "/" + fileName;
    
    // In URL của tệp đã tải lên ra màn hình console (hoặc có thể lưu vào cơ sở dữ liệu)
    System.out.println("File URL: " + fileURL);
} else {
    System.out.println("No file was uploaded.");
}
        // Update the process description
        JobProcessDAO processDAO = new JobProcessDAO();
        boolean descriptionResult = processDAO.updateProcessDescription(processId, description);
        // Update the file URL only if a file was uploaded
        boolean fileResult = true;
        if (uploadPath != null) {
            fileResult = processDAO.updateProcessFile(processId, fileURL);
        }
        // Check if both updates succeeded
        if (descriptionResult) {
            response.getWriter().write("Cập nhật thành công!");
        } else {
            response.getWriter().write("Cập nhật thất bại!");
        }
    } catch (NumberFormatException e) {
        response.getWriter().write("Error: processId is not a valid integer.");
        e.printStackTrace();
    }
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
    process pro = j.getProcessById(IntprocessId);
    JobDAO jobDao = new JobDAO();
    Job job = jobDao.getJobByJobId(IntjobId);
    request.setAttribute("name",name);
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
    request.setAttribute("name",name);
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
    List<process> processList = new ArrayList<>();
    
    try {
        ;
        processList = processDAO.getProcessesByJobId(jobId);
    } catch (Exception ex) {
        Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
    }
    request.setAttribute("j", job);
    request.setAttribute("processList", processList);
    request.getRequestDispatcher("my-process-seeker.jsp").forward(request, response);
    request.getRequestDispatcher("result-process.jsp").forward(request, response);
  
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
            Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            jg = new JobGreetingDAO().getJobGreetingsByJobIdAndStatus(jobId, "Được chấp nhận");
        } catch (Exception ex) {
            Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
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
                        Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    userDao.updateBalance(u);
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
            Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);

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
            Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            jg = new JobGreetingDAO().getJobGreetingBySeekerAndJob(u.getUserId(), jobId);
        } catch (Exception ex) {
            Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
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
                        Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    userDao.updateBalance(u);
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
            Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
