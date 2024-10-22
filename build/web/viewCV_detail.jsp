x<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jobtrans.model.CV" %>
<!DOCTYPE html>
<html lang="en"> 
    <head>
        <jsp:useBean id="CVDAO" class="jobtrans.dal.CVDAO" scope="session"></jsp:useBean>
            <title>Pillar - Bootstrap Resume/CV Template for Developers</title>

            <!-- Meta -->
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="description" content="Responsive Resume Template">
            <meta name="author" content="Xiaoying Riley at 3rd Wave Media">    
            <link rel="shortcut icon" href="favicon.ico"> 

            <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900" rel="stylesheet">

            <script defer src="assets/fontawesome/js/all.min.js"></script>

            <!-- Theme CSS -->  
            <link id="theme-style" rel="stylesheet" href="css/CV.css">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/colors/blue.css">
            <style>

                pre {
                    font-family: Arial, sans-serif; /* Thay đổi font chữ nếu cần */
                    white-space: pre-wrap; /* Để xuống dòng tự động */
                    overflow-wrap: break-word; /* Ngăn ngừa tràn dòng */
                    max-height: 300px; /* Đặt chiều cao tối đa nếu cần */
                    overflow-y: auto; /* Hiện thanh cuộn dọc nếu văn bản dài */
                    padding: 10px; /* Thêm khoảng cách bên trong */
                    border: 1px solid #ccc; /* Thêm đường viền nếu cần */
                    border-radius: 5px; /* Làm mềm góc */
                }

            </style>



        </head> 
    
    <body>	
        <div id="wrapper">

            <!-- Header Container
            ================================================== -->

                <!-- Header -->
                <%@include file="includes/header.jsp" %>
                <!-- Header / End -->
                <article class="resume-wrapper text-center position-relative">
                    <div class="resume-wrapper-inner mx-auto text-start bg-white shadow-lg">

                        <header style="background-color: #102C57; padding: 20px; border-radius: 15px; margin-left: 20px; margin-right: 20px;margin-top: 10px; margin-bottom: -13px ; padding: 20px 40px ">
                            <div class="row align-items-center">
                                <!-- Avatar Section -->
                                <div class="col-md-3">
                                    <img class="picture" src="${user.avatarUrl}" alt="" style="border-radius: 50%; width: 120px; height: 120px; object-fit: cover; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                                </div><!--//col-->

                                <!-- Info Section -->
                                <div class="col-md-9">
                                    <div class="">
                                        <h2 style="color: #F3F7EC; font-weight: bold; margin-bottom: 8px; font-size: 26px;">${user.userName}</h2>
                                        <h3 style="color: #F3F7EC; font-size: 25px; margin-bottom: 5px; font-size: 18px;">🔗${CV.title}</h3>
                                        <h3 style="color: #F3F7EC; font-size: 23px; margin-bottom: 5px; font-size: 18px;">✉️ ${user.email}</h3>

                                    </div><!--//primary-info-->
                                </div><!--//col-->
                            </div><!--//row-->
                        </header>



                        <div class="resume-body p-5">
                            <section style="background-color: #D0E6F9; padding: 30px; border-radius: 12px; margin-bottom: 20px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);">
                                <h2 style="background-color: #B3D7EA; color: #000; padding: 15px; border-radius: 8px; font-size: 26px; font-weight: bold; margin-bottom: 20px; text-align: center; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);">
                                    MỤC TIÊU NGHỀ NGHIỆP
                                </h2>
                                <div class="resume-section-content">
                                    <p style="color: #000; font-size: 19px; line-height: 1.8; text-align: justify; margin: 0; background-color: #E8F5FA; padding: 10px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);">
                                        ${CV.summary}
                                    </p>
                                </div>
                            </section>

                            <!--//summary-section-->
                            <div class="row">
                                <div class="col-lg-6">
                                    <section style="background-color: #D0E6F9; padding: 30px; border-radius: 12px; margin-bottom: 20px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);">
                                        <h2 style="background-color: #B3D7EA; color: #000; padding: 15px; border-radius: 8px; font-size: 28px; font-weight: bold; margin-bottom: 20px; text-align: center; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);">
                                            Kinh nghiệm làm việc
                                        </h2>

                                        <div class="resume-section-content">
                                            <c:forEach items="${CV.listExperience}" var="o">
                                                <div class="resume-timeline position-relative">
                                                    <article class="resume-timeline-item position-relative pb-5" style="border-left: 3px solid #004080; padding-left: 20px; margin-bottom: 20px;">
                                                        <div class="resume-timeline-item-header mb-2">
                                                            <div>
                                                                <c:if test="${o.experienceId != 32}">
                                                                    <h4 style="color: #000; font-weight: bold; margin-bottom: 5px; font-size: 22px;">${CVDAO.getCompanyNameById(o.experienceId)}</h4>
                                                                </c:if>
                                                                <c:if test="${o.experienceId == 32}">
                                                                    <br>
                                                                    <h4 style="color: #000; font-weight: bold; margin-bottom: 5px; font-size: 22px;">${o.companyCustom}</h4>
                                                                </c:if>
                                                                <span class="resume-position-time" style="color: #000; font-size: 16px; font-style: italic;">${o.startAt} đến ${o.endAt}</span>
                                                            </div>
                                                            <div class="resume-timeline-item-desc">
                                                                <h4 style="color: #000; font-weight: bold; margin-top: 10px; font-size: 20px;">Vị trí công việc:</h4>
                                                                <p style="color: #000; margin-bottom: 5px; font-size: 16px; line-height: 1.5; font-weight: bold; background-color: #E8F5FA; padding: 10px; border-radius: 5px; display: inline-block; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);">
                                                                    ${o.jobPosition}
                                                                </p>
                                                                <h4 style="color: #000; font-weight: bold; margin-top: 10px; font-size: 20px;">Mô tả:</h4>
                                                                <pre style="color: #000; margin-bottom: 8px; font-size: 16px; background-color: #E8F5FA; padding: 10px; border-radius: 5px;">${o.description}</pre>
                                                            </div>
                                                        </div>
                                                    </article>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </section>


                                    <section style="background-color: #D0E6F9; padding: 30px; border-radius: 12px; margin-bottom: 20px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);">
                                        <h2 style="background-color: #B3D7EA; color: #000; padding: 15px; border-radius: 8px; font-size: 28px; font-weight: bold; margin-bottom: 20px; text-align: center; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);">
                                            Chứng chỉ và Giải thưởng
                                        </h2>

                                        <div class="resume-section-content">
                                            <c:forEach items="${CV.listCertification}" var="o">                                 
                                                <div class="resume-timeline position-relative">
                                                    <article class="resume-timeline-item position-relative pb-5">
                                                        <h3 style="color: #3b5998; font-weight: normal; margin-bottom: 8px; font-size: 17px;">${o.year}</h3> <!-- Nhạt màu chữ năm -->
                                                        <c:if test="${o.certificationId != 35}">
                                                            <h3 style="color: #192655; font-weight: bold; margin-bottom: 8px; font-size: 20px;">${CVDAO.getCertificationNameById(o.certificationId)}</h3>
                                                        </c:if>
                                                        <c:if test="${o.certificationId == 35}">
                                                            <h3 style="color: #192655; font-weight: bold; margin-bottom: 8px; font-size: 20px;">${o.certificationCustom}</h3>
                                                        </c:if>
                                                    </article><!--//resume-timeline-item-->
                                                </div><!--//resume-timeline-->
                                            </c:forEach>				    
                                        </div>
                                    </section>



                                </div>
                                <div class="col-lg-6">
                                    <section style="background-color: #D0E6F9; padding: 30px; border-radius: 12px; margin-bottom: 20px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);">
                                        <h2 style="background-color: #B3D7EA; color: #000; padding: 15px; border-radius: 8px; font-size: 28px; font-weight: bold; margin-bottom: 20px; text-align: center; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);">Các kỹ năng</h2>

                                        <div class="resume-section-content">
                                            <div class="resume-skill-item">
                                                <ul>
                                                    <c:forEach items="${CV.listSkill}" var="o">  
                                                        <li class="mb-2">
                                                            <div style="display: flex; align-items: center;">
                                                                <c:if test="${o.skillId != 31}">
                                                                    <h3 style="color: #000; font-weight: bold; margin-bottom: 0px; font-size: 20px;">${CVDAO.getSkillNameById(o.skillId)}</h3> <!-- Màu chữ đen cho kỹ năng -->
                                                                </c:if>
                                                                <c:if test="${o.skillId == 31}">
                                                                    <h3 style="color: #000; font-weight: bold; margin-bottom: 0px; font-size: 20px;">${o.skillCustom}</h3> <!-- Màu chữ đen cho kỹ năng -->
                                                                </c:if>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div><!--//resume-skill-item-->
                                        </div><!--resume-section-content-->
                                    </section>

                                    <!--//skills-section-->
                                    <section style="padding: 30px; border-radius: 12px; margin-bottom: 20px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);">
                                        <h2 style="background-color: #B3D7EA; color: #000; padding: 15px; border-radius: 8px; font-size: 28px; font-weight: bold; margin-bottom: 20px; text-align: center; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);">
                                            Học vấn
                                        </h2>

                                        <div class="resume-section-content">
                                            <c:forEach items="${CV.listEdu}" var="o"> 
                                                <div class="resume-timeline position-relative">
                                                    <article class="resume-timeline-item position-relative pb-5" style="border-left: 3px solid #004080; padding-left: 20px; margin-bottom: 20px;">
                                                        <div class="resume-timeline-item-header mb-2">
                                                            <div>
                                                                <c:if test="${o.educationId == 95}">
                                                                    <div style="color: #000; font-weight: bold; margin-bottom: 8px; font-size: 20px;">${o.schoolCustom}</div>    
                                                                </c:if>
                                                                <c:if test="${o.educationId != 95}">
                                                                    <div style="color: #000; font-weight: bold; margin-bottom: 8px; font-size: 20px;">${CVDAO.getSchoolNameById(o.educationId)}</div>    
                                                                </c:if>
                                                                <span class="resume-degree-time" style="color: #000; font-size: 16px; font-style: italic;">${o.startDate} - ${o.endDate}</span>
                                                            </div>

                                                            <div>
                                                                <div style="display: flex; align-items: center; margin-bottom: 8px;">
                                                                    <div style="color: #000; font-weight: bold; font-size: 18px; margin-right: 10px;">Lĩnh vực nghiên cứu:</div>
                                                                    <div style="color: #000;">${o.fieldOfStudy}</div>
                                                                </div>

                                                                <div style="display: flex; align-items: center; margin-bottom: 8px;">
                                                                    <div style="color: #000; font-weight: bold; font-size: 18px; margin-right: 10px;">Bằng cấp:</div>
                                                                    <div style="color: #000;">${o.degree}</div>
                                                                </div>   
                                                            </div>
                                                        </div>
                                                    </article>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </section>
                                    <!--//education-section-->



                                </div>
                            </div><!--//row-->
                        </div><!--//resume-body-->


                    </div>
                </article> 
                <footer class="footer text-center pt-2 pb-5">
                    <!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
                    <small class="copyright">Designed with <span class="sr-only">love</span><i class="fas fa-heart"></i> by <a href="http://themes.3rdwavemedia.com" target="_blank">Xiaoying Riley</a> for developers</small>
                </footer>
        </div>
                </body>
                </html> 

