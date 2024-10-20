/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package jobtrans.controller.web.job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jobtrans.dal.JobDAO;
import jobtrans.dal.JobGreetingDAO;
import jobtrans.model.Job;

@WebServlet(name = "JobController", urlPatterns = {"/jobController"})
public class JobController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        // Kiểm tra nếu userId là null (người dùng chưa đăng nhập)
        if (userId == null) {
            // Chuyển hướng đến trang đăng nhập nếu người dùng chưa đăng nhập
            request.getRequestDispatcher("login").forward(request, response);
            return;
        }
        JobDAO jobDao = new JobDAO();
        List<Job> listJob = jobDao.getJobsByUserId(userId);
        request.setAttribute("listJob", listJob);
        request.getRequestDispatcher("manage-job.jsp").forward(request, response);
        //response.sendRedirect("manage-job.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "manageSeeker":
                viewJobGreetings(request, response);
                break;
            case "confirmSeeker":
                acceptSeeker(request, response);
                break;
            case "viewJobConfirmed":
                jobsConfirmed(request, response);
                break;
            default:
                break;
        }
    }

    private void viewJobGreetings(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        JobDAO jobDao = new JobDAO();

        // Lấy jobId từ request
        String jobIdParam = request.getParameter("jobId");

        // Kiểm tra nếu jobId là null hoặc không hợp lệ
        if (jobIdParam == null || jobIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Job ID is missing or invalid.");
            return;
        }

        // Chuyển đổi jobId sang kiểu Integer
        Integer jobId;
        try {
            jobId = Integer.parseInt(jobIdParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Job ID is invalid.");
            return;
        }

        // Sử dụng hàm getJobAndGreetingsByJobId
        List<Object> combinedList = jobDao.getJobAndGreetingsByJobId(jobId);

        // Kiểm tra nếu danh sách rỗng hoặc job không tồn tại
        if (combinedList.isEmpty() || !(combinedList.get(0) instanceof Job)) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Job not found.");
            return;
        }

        // Gán danh sách cho request và chuyển tiếp đến trang JSP
        request.setAttribute("combinedList", combinedList);
        request.getRequestDispatcher("manage-seeker.jsp").forward(request, response);
    }

    public void acceptSeeker(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String greetingIdStr = request.getParameter("greetingId"); // Lấy greetingId từ request
        String jobIdStr = request.getParameter("jobId"); // Lấy jobId từ request

        // Kiểm tra xem các giá trị có null hoặc rỗng hay không
        if (greetingIdStr == null || greetingIdStr.isEmpty() || jobIdStr == null || jobIdStr.isEmpty()) {
            response.sendRedirect("page-404.jsp"); // Chuyển hướng đến trang lỗi nếu null hoặc rỗng
            return;
        }

        try {
            int greetingId = Integer.parseInt(greetingIdStr); // Chuyển đổi thành số nguyên
            int jobId = Integer.parseInt(jobIdStr); // Chuyển đổi thành số nguyên

            JobGreetingDAO jobDao = new JobGreetingDAO(); // Khởi tạo JobService
            jobDao.confirmSeekerForJob(greetingId, jobId); // Gọi hàm chấp nhận seeker
            response.sendRedirect("jobController"); // Chuyển hướng đến trang manage-seeker.jsp
        } catch (IOException e) {
            e.printStackTrace();
        } catch (NumberFormatException e) {
            // Xử lý lỗi nếu không thể chuyển đổi chuỗi thành số nguyên
            response.sendRedirect("error.jsp"); // Chuyển hướng đến trang lỗi
        }
    }

     public void jobsConfirmed(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        JobDAO jobDao = new JobDAO();
        String userIdParam = request.getParameter("userId");

        if (userIdParam != null) {
            try {
                int userId = Integer.parseInt(userIdParam);
                
                // Gọi DAO để lấy danh sách job
                List<Job> jobs = jobDao.getJobsConfirmedByUserId(userId);
                
                // Đưa danh sách job vào request attribute để truyền sang JSP
                request.setAttribute("jobs", jobs);
                
                
           if (jobs.isEmpty() || !(jobs.get(0) instanceof Job)) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Job not found.");
            return;
        }

            // Gán danh sách cho request và chuyển tiếp đến trang JSP
            request.setAttribute("jobs", jobs);
            request.getRequestDispatcher("my-job.jsp").forward(request, response);
                
            } catch (NumberFormatException e) {
                // Xử lý lỗi nếu userId không hợp lệ hoặc lỗi SQL
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid User ID or SQL Error.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User ID is required.");
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
