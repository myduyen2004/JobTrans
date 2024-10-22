/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package jobtrans.controller.web.profile;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobtrans.dal.CVDAO;
import jobtrans.dal.UserDAO;
import jobtrans.model.CV;
import jobtrans.model.Certification;
import jobtrans.model.Education;
import jobtrans.model.Experience;
import jobtrans.model.Job;
import jobtrans.model.Skill;
import jobtrans.model.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "CVServlet", urlPatterns = {"/CV"})
public class CVServlet extends HttpServlet {

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
            case "create":
            {
                try {
                    response.getWriter().print("In ra j đó");
                    createCV(request, response);
                } catch (ParseException ex) {
                    response.getWriter().print("Lỗi à"+ex);
                    Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                break;
            case "list":
                viewList(request, response);
                break;
            case "load-creating":
                loadCreating(request, response);
                break;
            case "view":
                viewCV(request, response);
                break;
            case "delete":
                deleteCv(request, response);
                break;
            case "load-editing":
                loadEditing(request, response);
                break;
            case "update":
            {
                try {
                    updateCV(request, response);
                } catch (ParseException ex) {
                    Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
                break;
            case "view-applied-cv":
                viewAppliedCVForAJob(request, response);
            default:
                response.getWriter().print("Ủaaa alo");
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void viewList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        response.getWriter().print(email);
        CVDAO Cvdao = new CVDAO();
        UserDAO userDao = new UserDAO();
        User u = userDao.getUserByEmail(email);
        List<CV> listCV = Cvdao.getCVByUserId(u.getUserId());
        request.setAttribute("listcv", listCV);
        request.getRequestDispatcher("viewCV.jsp").forward(request, response);
    }

    private void createCV(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        PrintWriter out = response.getWriter();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        
        CVDAO cvDao = new CVDAO();
        UserDAO userDao = new UserDAO();
        User u = userDao.getUserByEmail(email);
        String action = request.getParameter("action");
        String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        
        if (session.getAttribute("cvId") != null) {
                    int cvId = (int) session.getAttribute("cvId");
                    CV cv = new CV();
            try {
                cv = cvDao.getCvById(cvId);
            } catch (Exception ex) {
                Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
                    request.setAttribute("CV", cv);
                    request.setAttribute("user", u);
                    
                    request.getRequestDispatcher("viewCV_detail.jsp").forward(request, response);
                    return;
        }   
        
        CV cv = new CV();
        cv.setTitle(title);
        cv.setUserId(u.getUserId());
        cv.setSummary(summary);
        cv.setCreatedAt(new Date());
        
        String[] companyIds = request.getParameterValues("companyId[]");
        String[] otherCompanyNames = request.getParameterValues("otherCompanyName[]");
        String[] experienceStartDates = request.getParameterValues("experienceStartDate[]");
        String[] experienceEndDates = request.getParameterValues("experienceEndDate[]");
        String[] positions = request.getParameterValues("position[]");
        String[] experienceDescriptions = request.getParameterValues("experienceDescription[]");

        List<Experience> experiences = new ArrayList<>();
        if (companyIds != null && experienceStartDates != null
                && experienceEndDates != null && positions != null && experienceDescriptions != null) {
            int length = companyIds.length;
            for (int i = 0; i < length; i++) {
                Experience experience = new Experience();
                try {
                    int companyId = Integer.parseInt(companyIds[i]);
                    String otherCompanyName = null;

                    if (companyId == 32) {
                        otherCompanyName = otherCompanyNames[i];
                    } else {
                        otherCompanyName = null; 
                    }
                    Date startDate = dateFormat.parse(experienceStartDates[i]);
                    Date endDate = dateFormat.parse(experienceEndDates[i]);
                    String position = positions[i];
                    String description = experienceDescriptions[i];
                    experience.setExperienceId(companyId);
                    experience.setJobPosition(position);
                    experience.setDescription(description);
                    experience.setStartAt(startDate);
                    experience.setEndAt(endDate);
                    experience.setCompanyCustom(otherCompanyName);
                    experiences.add(experience);
                } catch (NumberFormatException e) {
                    response.getWriter().print(e);
                } catch (ArrayIndexOutOfBoundsException e) {
                    response.getWriter().print(e);
                    break; 
                }
            }
        }
        
        cv.setListExperience((ArrayList<Experience>) experiences);
        response.getWriter().println(cv);
        String[] certificationIds = request.getParameterValues("certificationId[]");
        String[] otherCertificationNames = request.getParameterValues("otherCertificationName[]");
        String[] awardYears = request.getParameterValues("awardYear[]");

        List<Certification> certifications = new ArrayList<>();
        if (certificationIds != null && awardYears != null) {
            response.getWriter().print("Testttt");
            int length = certificationIds.length; 
            response.getWriter().print(length);
            for (int i = 0; i < length; i++) {
                Certification certification = new Certification();
                try {
                    int certificationId = Integer.parseInt(certificationIds[i]);
                    String otherCertificationName = null;

                    if (certificationId == 35) {
                        otherCertificationName = otherCertificationNames[i]; 
                    } else {
                        otherCertificationName = null; 
                    }
                    Date awardYear = dateFormat.parse(awardYears[i]);
                    
                    certification.setCertificationId(certificationId);
                    certification.setYear(awardYear);
                    certification.setCertificationCustom(otherCertificationName);
                    
                    certifications.add(certification);
                } catch (NumberFormatException e) {
                    response.getWriter().print(e);
                } catch (ArrayIndexOutOfBoundsException e) {
                    response.getWriter().print(e);
                    break; // Hoặc xử lý tùy ý
                }
            }
        }
        
        cv.setListCertification((ArrayList<Certification>) certifications);
        
        
        String[] skillIds = request.getParameterValues("skillId[]");
        String[] otherSkillNames = request.getParameterValues("otherSkillName[]");
        
        List<Skill> skills = new ArrayList<>();
        if (skillIds != null) {
            int length = skillIds.length; 
            for (int i = 0; i < length; i++) {
                Skill skill = new Skill();
                try {
                    int skillId = Integer.parseInt(skillIds[i]);
                    String otherSkillName = null;

                    if (skillId == 31) {
                        otherSkillName = otherSkillNames[i]; 
                    } else {
                        otherSkillName = null; 
                    }
                    
                    skill.setSkillId(skillId);
                    skill.setSkillCustom(otherSkillName);
                    
                    skills.add(skill);
                } catch (NumberFormatException e) {
                    response.getWriter().print(e);
                } catch (ArrayIndexOutOfBoundsException e) {
                    response.getWriter().print(e);
                    break; // Hoặc xử lý tùy ý
                }
            }
        }
        response.getWriter().print(cv);
        cv.setListSkill((ArrayList<Skill>) skills);

        String[] schoolIds = request.getParameterValues("schoolId[]");
        String[] otherSchoolNames = request.getParameterValues("otherSchoolName[]");
        String[] educationStartDates = request.getParameterValues("educationStartDate[]");
        String[] educationEndDates = request.getParameterValues("educationEndDate[]");
        String[] degrees = request.getParameterValues("degree[]");
        String[] majors = request.getParameterValues("major[]");
        
        List<Education> educations = new ArrayList<>();
        if (schoolIds != null && educationStartDates != null && educationEndDates != null && majors != null && degrees != null) {
            int length = schoolIds.length; 
            for (int i = 0; i < length; i++) {
                Education education = new Education();

                try {
                    int schoolId = Integer.parseInt(schoolIds[i]);
                    String otherSchoolName = null;

                    if (schoolId == 95) {
                        otherSchoolName = otherSchoolNames[i]; 
                    } else {
                        otherSchoolName = null; 
                    }
                    Date startDate = dateFormat.parse(educationStartDates[i]);
                    Date endDate = dateFormat.parse(educationEndDates[i]);
                    String major = majors[i];
                    String degree = degrees[i];

                    education.setEducationId(schoolId);
                    education.setDegree(degree);
                    education.setFieldOfStudy(major);
                    education.setSchoolCustom(otherSchoolName);
                    education.setStartDate(startDate);
                    education.setEndDate(endDate);
                    
                    educations.add(education);
                } catch (NumberFormatException e) {
                    response.getWriter().print(e);
                } catch (ArrayIndexOutOfBoundsException e) {
                    response.getWriter().print(e);
                    break; // Hoặc xử lý tùy ý
                }
            }
        }
        cv.setListEdu((ArrayList<Education>) educations);
        
        try {
            int cvId = cvDao.addCV(cv);
            session.setAttribute("cvId", cvId);
            cv.setCvId(cvId);
        } catch (Exception ex) { 
            Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("CV", cv);
        request.setAttribute("user", u);
        request.getRequestDispatcher("viewCV_detail.jsp").forward(request, response);

    }

    private void loadCreating(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("cvId");
        String email = (String) session.getAttribute("account");
        UserDAO userDao = new UserDAO();
        request.setAttribute("user", userDao.getUserByEmail(email));
        request.getRequestDispatcher("create-CV.jsp").forward(request, response);

    }
    
    private void deleteCv(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        UserDAO userDao = new UserDAO();
        int cvId = Integer.parseInt(request.getParameter("cvId"));
        CVDAO cvDao = new CVDAO();
        try {
            cvDao.deleteCvByCvId(cvId);
        } catch (Exception ex) {
            Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("success", "Xóa CV thành công");
        viewList(request, response);
        session.removeAttribute("cvId");
    }

    private void viewCV(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        int cvId = Integer.parseInt(request.getParameter("cvId"));
        UserDAO userDao = new UserDAO();
        User user = userDao.getUserByEmail(email);
        CVDAO cvDao = new CVDAO();
        CV cv = new CV();
        try {
            cv = cvDao.getCvById(cvId);
        } catch (Exception ex) {
            Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("user", user);
        request.setAttribute("CV", cv);
        request.getRequestDispatcher("viewCV_detail.jsp").forward(request, response);
    }
    
    private void loadEditing(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("account");
        UserDAO userDao = new UserDAO();
        int cvId = Integer.parseInt(request.getParameter("cvId"));
        CVDAO cvDao = new CVDAO();
        CV cv = new CV();
        try {
            cv = cvDao.getCvById(cvId);
        } catch (Exception ex) {
            Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("user", userDao.getUserByEmail(email));
        request.setAttribute("CV", cv);
        request.getRequestDispatcher("updateCV.jsp").forward(request, response);

    }
    private void updateCV(HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException, ServletException{
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        HttpSession session = request.getSession();
        CVDAO cvDao = new CVDAO();
        UserDAO userDao = new UserDAO();

        String email = (String) session.getAttribute("account");
        int cvId = Integer.parseInt(request.getParameter("cvId"));
        CV cv = new CV();
        try {
            cv = cvDao.getCvById(cvId);
        } catch (Exception ex) {
            Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        User u = userDao.getUserByEmail(email);
        
        String action = request.getParameter("action");
        String title = request.getParameter("title");
        String summary = request.getParameter("summary");
        
        cv.setTitle(title);
        cv.setUserId(u.getUserId());
        cv.setSummary(summary);
        cv.setCreatedAt(new Date());
        
        String[] companyIds = request.getParameterValues("companyId[]");
        String[] otherCompanyNames = request.getParameterValues("otherCompanyName[]");
        String[] experienceStartDates = request.getParameterValues("experienceStartDate[]");
        String[] experienceEndDates = request.getParameterValues("experienceEndDate[]");
        String[] positions = request.getParameterValues("position[]");
        String[] experienceDescriptions = request.getParameterValues("experienceDescription[]");

        List<Experience> experiences = new ArrayList<>();
        if (companyIds != null && experienceStartDates != null
                && experienceEndDates != null && positions != null && experienceDescriptions != null) {
            int length = companyIds.length;
            for (int i = 0; i < length; i++) {
                Experience experience = new Experience();
                try {
                    int companyId = Integer.parseInt(companyIds[i]);
                    String otherCompanyName = null;

                    if (companyId == 32) {
                        otherCompanyName = otherCompanyNames[i];
                    } else {
                        otherCompanyName = null; 
                    }
                    Date startDate = dateFormat.parse(experienceStartDates[i]);
                    Date endDate = dateFormat.parse(experienceEndDates[i]);
                    String position = positions[i];
                    String description = experienceDescriptions[i];
                    experience.setExperienceId(companyId);
                    experience.setJobPosition(position);
                    experience.setDescription(description);
                    experience.setStartAt(startDate);
                    experience.setEndAt(endDate);
                    experience.setCompanyCustom(otherCompanyName);
                    experiences.add(experience);
                } catch (NumberFormatException e) {
                    response.getWriter().print(e);
                } catch (ArrayIndexOutOfBoundsException e) {
                    response.getWriter().print(e);
                    break; 
                }
            }
        }
        
        cv.setListExperience((ArrayList<Experience>) experiences);
        response.getWriter().println(cv);
        String[] certificationIds = request.getParameterValues("certificationId[]");
        String[] otherCertificationNames = request.getParameterValues("otherCertificationName[]");
        String[] awardYears = request.getParameterValues("awardYear[]");

        List<Certification> certifications = new ArrayList<>();
        if (certificationIds != null && awardYears != null) {
            response.getWriter().print("Testttt");
            int length = certificationIds.length; 
            response.getWriter().print(length);
            for (int i = 0; i < length; i++) {
                Certification certification = new Certification();
                try {
                    int certificationId = Integer.parseInt(certificationIds[i]);
                    String otherCertificationName = null;

                    if (certificationId == 35) {
                        otherCertificationName = otherCertificationNames[i]; 
                    } else {
                        otherCertificationName = null; 
                    }
                    Date awardYear = dateFormat.parse(awardYears[i]);
                    
                    certification.setCertificationId(certificationId);
                    certification.setYear(awardYear);
                    certification.setCertificationCustom(otherCertificationName);
                    
                    certifications.add(certification);
                } catch (NumberFormatException e) {
                    response.getWriter().print(e);
                } catch (ArrayIndexOutOfBoundsException e) {
                    response.getWriter().print(e);
                    break; // Hoặc xử lý tùy ý
                }
            }
        }
        
        cv.setListCertification((ArrayList<Certification>) certifications);
        
        
        String[] skillIds = request.getParameterValues("skillId[]");
        String[] otherSkillNames = request.getParameterValues("otherSkillName[]");
        
        List<Skill> skills = new ArrayList<>();
        if (skillIds != null) {
            int length = skillIds.length; 
            for (int i = 0; i < length; i++) {
                Skill skill = new Skill();
                try {
                    int skillId = Integer.parseInt(skillIds[i]);
                    String otherSkillName = null;

                    if (skillId == 31) {
                        otherSkillName = otherSkillNames[i]; 
                    } else {
                        otherSkillName = null; 
                    }
                    
                    skill.setSkillId(skillId);
                    skill.setSkillCustom(otherSkillName);
                    
                    skills.add(skill);
                } catch (NumberFormatException e) {
                    response.getWriter().print(e);
                } catch (ArrayIndexOutOfBoundsException e) {
                    response.getWriter().print(e);
                    break; // Hoặc xử lý tùy ý
                }
            }
        }
        response.getWriter().print(cv);
        cv.setListSkill((ArrayList<Skill>) skills);

        String[] schoolIds = request.getParameterValues("schoolId[]");
        String[] otherSchoolNames = request.getParameterValues("otherSchoolName[]");
        String[] educationStartDates = request.getParameterValues("educationStartDate[]");
        String[] educationEndDates = request.getParameterValues("educationEndDate[]");
        String[] degrees = request.getParameterValues("degree[]");
        String[] majors = request.getParameterValues("major[]");
        
        List<Education> educations = new ArrayList<>();
        if (schoolIds != null && educationStartDates != null && educationEndDates != null && majors != null && degrees != null) {
            int length = schoolIds.length; 
            for (int i = 0; i < length; i++) {
                Education education = new Education();

                try {
                    int schoolId = Integer.parseInt(schoolIds[i]);
                    String otherSchoolName = null;

                    if (schoolId == 95) {
                        otherSchoolName = otherSchoolNames[i]; 
                    } else {
                        otherSchoolName = null; 
                    }
                    Date startDate = dateFormat.parse(educationStartDates[i]);
                    Date endDate = dateFormat.parse(educationEndDates[i]);
                    String major = majors[i];
                    String degree = degrees[i];

                    education.setEducationId(schoolId);
                    education.setDegree(degree);
                    education.setFieldOfStudy(major);
                    education.setSchoolCustom(otherSchoolName);
                    education.setStartDate(startDate);
                    education.setEndDate(endDate);
                    
                    educations.add(education);
                } catch (NumberFormatException e) {
                    response.getWriter().print(e);
                } catch (ArrayIndexOutOfBoundsException e) {
                    response.getWriter().print(e);
                    break; // Hoặc xử lý tùy ý
                }
            }
        }
        cv.setListEdu((ArrayList<Education>) educations);
        
        
        try {
            cvDao.updateCV(cv);
        } catch (Exception ex) {
            Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("CV", cv);
        request.setAttribute("user", u);
        request.getRequestDispatcher("viewCV_detail.jsp").forward(request, response);

    }
    
    private void viewAppliedCVForAJob(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession();
    String email = (String) session.getAttribute("account");
    int jobId = Integer.parseInt(request.getParameter("jobId"));

    UserDAO userDao = new UserDAO();
    User user = userDao.getUserByEmail(email);

    CVDAO cvDao = new CVDAO();
    CV cv = new CV();

    try {
        cv = cvDao.getAppliedCVByUserIdAndJobId(user.getUserId(), jobId);
    } catch (Exception ex) {
        Logger.getLogger(CVServlet.class.getName()).log(Level.SEVERE, null, ex);
    }

    request.setAttribute("user", user);
    request.setAttribute("CV", cv);
    request.getRequestDispatcher("viewCV_detail.jsp").forward(request, response);
}

}
