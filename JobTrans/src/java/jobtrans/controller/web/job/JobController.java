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
import java.util.ArrayList;
import jobtrans.dal.JobDAO;
import jobtrans.dal.TransactionDAO;
import jobtrans.dal.UserDAO;
import jobtrans.model.Job;
import jobtrans.model.JobGreetings;
import jobtrans.model.Transaction;
import jobtrans.model.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "JobController", urlPatterns = {"/job"})
public class JobController extends HttpServlet {

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
            out.println("<title>Servlet JobController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JobController at " + request.getContextPath() + "</h1>");
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
            case "load-deposit":
                loadDeposit(request, response);
                break;
            case "deposit-employer":
                doPost(request, response);
                break;

            default:
                response.sendRedirect("page-404.jsp"); // Trang lỗi nếu action không hợp lệ
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
        processRequest(request, response);
    }

    protected void loadDeposit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        JobDAO jobDao = new JobDAO();
        String email = (String) session.getAttribute("account");
        int jobId = Integer.parseInt(request.getParameter("job-id"));
        String status = jobDao.getJobById(jobId).getStatus();
        request.setAttribute("deposit-check", status);
        UserDAO userDao = new UserDAO();
        User user = userDao.getUserByEmail(email);
        double depositMoney = new JobGreetings().getSumPrice(jobDao.getGreetingAcceptList(jobDao.getJobById(jobId)));
        request.setAttribute("user", user);
        request.setAttribute("deposit-money", depositMoney);
        request.setAttribute("role", user.getRole());
        request.getRequestDispatcher("deposit.jsp").forward(request, response);
    }

    protected void depositEmployer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDAO userDao = new UserDAO();
        JobDAO jobDao = new JobDAO();
        TransactionDAO transDao = new TransactionDAO();
        String email = (String) session.getAttribute("account");
        User user = userDao.getUserByEmail(email);
        request.setAttribute("user", user);
        int jobId = Integer.parseInt(request.getParameter("job-id"));
        Job job = jobDao.getJobById(jobId);
        double depositMoney =0;
        JobGreetings greeting = jobDao.getGreetingAccept(job, user);
        ArrayList<JobGreetings> list = jobDao.getGreetingAcceptList(job);
        if (user.getRole().equals("Employer")) {
             depositMoney= new JobGreetings().getSumPrice(list);
            if (user.getBalance() >= depositMoney) {
                //Update user balance
                Transaction trans = new Transaction();
                user.setBalance(user.getBalance() - depositMoney);
                transDao.updateBalance(user);
                //Add new transaction
                trans.setSenderId(user.getUserId());
                trans.setAmount(depositMoney);
                trans.setStatus(true);
                trans.setTransactionType("Trừ tiền");
                trans.setDescription("Trừ tiền đặt cọc thuê người tìm việc");
                transDao.addTransaction(trans);
                //Update secure Wallet
                job.setStatus("Nhà tuyển dụng đã đặt cọc");
                job.setSecureWallet(depositMoney);
                jobDao.updateJobStatusAndDeposit(job);
                if (job.calcTotalDeposit(depositMoney, list) == jobDao.getJobById(jobId).getSecureWallet()) {
                    job.setStatus("Hai bên đã đặt cọc");
                    jobDao.updateJobStatus(job);
                }
                //
                request.setAttribute("deposit-check", job.getStatus());
                request.getRequestDispatcher("deposit.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Số sư tài khoản chưa đủ để thực hiện giao dịch này!");
                request.getRequestDispatcher("deposit.jsp").forward(request, response);
            }
        } else if (user.getRole().equals("Seeker")) {
                depositMoney= greeting.getDepositSeeker();
            if (user.getBalance() >= depositMoney) {
                //Update user balance
                Transaction trans = new Transaction();
                user.setBalance(user.getBalance() - depositMoney);
                transDao.updateBalance(user);
                //Add new transaction
                trans.setSenderId(user.getUserId());
                trans.setAmount(depositMoney);
                trans.setStatus(true);
                trans.setTransactionType("Trừ tiền");
                trans.setDescription("Trừ tiền đặt cọc để nhận công việc");
                transDao.addTransaction(trans);
                //Update secure Wallet
                job.setStatus("Người tìm việc đã đặt cọc");
                job.setSecureWallet(depositMoney);
                jobDao.updateJobStatusAndDeposit(job);
                if (job.calcTotalDeposit(depositMoney, list) == jobDao.getJobById(jobId).getSecureWallet()) {
                    job.setStatus("Hai bên đã đặt cọc");
                    jobDao.updateJobStatus(job);
                }
                request.setAttribute("deposit-check", job.getStatus());
                request.getRequestDispatcher("deposit.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Số sư tài khoản chưa đủ để thực hiện giao dịch này!");
                request.getRequestDispatcher("deposit.jsp").forward(request, response);
            }
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

}
