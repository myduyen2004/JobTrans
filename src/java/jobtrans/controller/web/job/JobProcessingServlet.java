/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package jobtrans.controller.web.job;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.dal.JobDAO;
import jobtrans.dal.JobGreetingDAO;
import jobtrans.dal.MessageDAO;
import jobtrans.dal.NotificationDAO;
import jobtrans.dal.TransactionDAO;
import jobtrans.dal.UserDAO;
import jobtrans.model.Job;
import jobtrans.model.JobGreeting;
import jobtrans.model.Message;
import jobtrans.model.Notification;
import jobtrans.model.Transaction;
import jobtrans.model.User;

/**
 *
 * @author admin
 */
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
                
            case "load-chat":
            {
                try {
                    loadChat(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
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
        String action = request.getParameter("action");
        switch(action){
            case "sendMessages":
                break;
        }
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
        NotificationDAO notiDao = new NotificationDAO();
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
                    Notification notification = new Notification(jg.getJobSeekerId(), "Đối tác của bạn đã trả trước cho công việc", "Đối tác "+u.getUserName()+" của bạn đã trả trước cho công việc "+job.getJobTitle()+". Hãy theo dõi hoàn tất thanh toán để chính thức tham gia vào công việc!", new Date(), false);
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
        NotificationDAO notiDao = new NotificationDAO();
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
                    Notification notification = new Notification(job.getUserId(), "Đối tác của bạn đã đặt cọc nhận việc", "Đối tác "+u.getUserName()+" của bạn đã đặt cọc nhận công việc "+job.getJobTitle()+". Hãy theo dõi hoàn tất thanh toán để chính thức tham gia vào công việc!", new Date(), false);
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
            Logger.getLogger(JobProcessingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public void loadChat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        UserDAO userDao = new UserDAO();
        User u = userDao.getUserByEmail(email);
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        JobDAO jobDao = new JobDAO();
        Job job = jobDao.getJobByJobId(jobId);
        MessageDAO msgDao = new MessageDAO();
        List<Message> msgList = msgDao.getMessagesByJobId(jobId);
        for (Message message : msgList) {
            response.getWriter().print(message);
        }
        
    }
    
    
    
}
