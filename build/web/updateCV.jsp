x<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jobtrans.model.JobGreeting" %>
<!DOCTYPE html>
<html lang="en"> 
    <head>
        <jsp:useBean id="CVDAO" class="jobtrans.dal.CVDAO" scope="session"></jsp:useBean>
            <title>Tạo CV</title>

            <!-- Meta -->
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <link rel="shortcut icon" href="favicon.ico"> 
            <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900" rel="stylesheet">
            <script defer src="assets/fontawesome/js/all.min.js"></script>

            <link id="theme-style" rel="stylesheet" href="css/CV.css">
            <link rel="stylesheet" href="css/style.css">
            <link rel="stylesheet" href="css/colors/blue.css">

        </head> 

        <body>	
            <div id="wrapper">
                <!-- Header -->
            <%@include file="includes/header.jsp" %>
            <!-- Header / End -->
            <form action="CV" method="GET">
                <input type="hidden" name="action" value="update"><!-- comment -->
                <input type="hidden" name="cvId" value="${CV.cvId}"><!-- comment -->
                <article class="resume-wrapper text-center position-relative">
                    <div class="resume-wrapper-inner mx-auto text-start bg-white shadow-lg">
                        <header style="background-color: #102C57; padding: 20px; border-radius: 15px; margin: 10px 20px;">
                            <div class="row align-items-center">
                                <div class="col-md-3">
                                    <img class="picture" src="${user.avatarUrl}" alt="Avatar" style="border-radius: 50%; width: 120px; height: 120px; object-fit: cover; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                                </div>
                                <div class="col-md-9">
                                    <input type="text" id="title" name="title" placeholder="Vị trí ứng tuyển" value="${CV.title}" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                    <h2 style="color: #F3F7EC; font-weight: bold; font-size: 26px;">${user.userName}</h2>
                                    <h3 style="color: #F3F7EC; font-size: 18px;">✉️ ${user.email}</h3>
                                </div>
                            </div>
                        </header>

                        <div class="resume-body p-5">
                            <section style="background-color: #D0E6F9; padding: 30px; border-radius: 12px; margin-bottom: 20px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);">
                                <h2 style="background-color: #B3D7EA; color: #000; padding: 15px; border-radius: 8px; font-size: 26px; font-weight: bold; margin-bottom: 20px; text-align: center; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);">
                                    MỤC TIÊU NGHỀ NGHIỆP
                                </h2>
                                <div class="resume-section-content">
                                    <textarea cols="30" rows="5" name="summary" class="with-border" 
                                              style="color: #000; font-size: 19px; line-height: 1.8; text-align: justify;
                                              margin: 0; background-color: #E8F5FA; padding: 10px; border-radius: 5px;
                                              box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);">${CV.summary}</textarea>
                                </div>

                            </section>


                            <div class="row">
                                <div class="col-lg-6">
                                    <div style="background-color: #D0E6F9; padding: 30px; border-radius: 12px; margin-bottom: 20px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);" id="experience-section">
                                        <h2 style="background-color: #B3D7EA; color: #000; padding: 15px; border-radius: 8px; font-size: 28px; font-weight: bold; margin-bottom: 20px; text-align: center; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);">
                                            Kinh nghiệm làm việc
                                        </h2>
                                        <c:forEach items="${CV.listExperience}" var="o">                                 
                                            <div class="resume-section-content">
                                                <div class="resume-timeline position-relative work-experience">
                                                    <article class="resume-timeline-item position-relative pb-5">
                                                        <div class="resume-timeline-item-header mb-2">
                                                            <select style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="companyId[]">
                                                                <option value="">Chọn công ty</option>
                                                                <c:forEach items="${CVDAO.getAllCompanyNames()}" var="company">
                                                                    <option value="${CVDAO.getCompanyIdByName(company)}"
                                                                            <c:if test="${CVDAO.getCompanyIdByName(company) == o.experienceId}">
                                                                                selected="selected"
                                                                            </c:if>>
                                                                        ${company}
                                                                    </option>

                                                                </c:forEach>
                                                            </select>
                                                            <input type="text" name="otherCompanyName[]" value="${o.companyCustom}" placeholder="Tên công ty khác" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; display: none;" class="other-company-input">
                                                            <input type="date" name="experienceStartDate[]" value="${o.startAt}" style="width: 49%; display: inline-block; margin-right: -4px; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                                            <input type="date" name="experienceEndDate[]" value="${o.endAt}" style="width: 49%; display: inline-block; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                                            <input type="text" name="position[]" placeholder="Vị trí" value="${o.jobPosition}" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                                            <textarea name="experienceDescription[]" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">${o.description}</textarea>
                                                            <button class="remove-experience" type="button" style="color: black; padding: 5px; border: none; border-radius: 4px;">-</button>
                                                        </div>
                                                    </article>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <button type="button" id="add-experience" style="background-color: #007bff; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; margin-top: 15px;">Thêm Kinh Nghiệm</button>
                                    </div>

                                    <!--Phần Chứng chỉ--> 

                                    <section style="background-color: #D0E6F9; padding: 30px; border-radius: 12px; margin-bottom: 20px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);" id="certification-section">
                                        <h2 style="background-color: #B3D7EA; color: #000; padding: 15px; border-radius: 8px; font-size: 28px; font-weight: bold; margin-bottom: 20px; text-align: center; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);">
                                            Chứng Chỉ
                                        </h2>
                                        <c:forEach items="${CV.listCertification}" var="o">
                                            <input type="text" name="test" style="display:none;">
                                            <div class="resume-section-content">
                                                <div class="resume-timeline position-relative certifications">
                                                    <article class="resume-timeline-item position-relative pb-5">
                                                        <div class="resume-timeline-item-header mb-2">
                                                            <select style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="certificationId[]">
                                                                <option value="">Chọn chứng chỉ</option>
                                                                <c:forEach items="${CVDAO.getAllCertificationNames()}" var="cer">
                                                                    <option value="${CVDAO.getCertificationIdByName(cer)}"
                                                                        <c:if test="${CVDAO.getCertificationIdByName(cer) == o.certificationId}">
                                                                            selected="selected"
                                                                        </c:if>>
                                                                        ${cer}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                            <input type="text" name="otherCertificationName[]" value="${o.certificationCustom}" placeholder="Tên chứng chỉ khác" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; display: none;" class="other-certification-input">
                                                            <input type="date" name="awardYear[]" value="${o.year}" placeholder="Năm được giải" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                                            <button class="remove-certification" type="button" style="color: black; padding: 5px; border: none; border-radius: 4px;">-</button>
                                                        </div>
                                                    </article>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <button type="button" id="add-certification" style="background-color: #007bff; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; margin-top: 15px;">Thêm Chứng Chỉ</button>
                                    </section>



                                </div>
                                
                                <div class="col-lg-6">
                                    <section style="background-color: #D0E6F9; padding: 30px; border-radius: 12px; margin-bottom: 20px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);" id="skills-section">
                                        <h2 style="background-color: #B3D7EA; color: #000; padding: 15px; border-radius: 8px; font-size: 28px; font-weight: bold; margin-bottom: 20px; text-align: center; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);">Kỹ Năng</h2>
                                        <div class="resume-section-content">
                                            <c:forEach items="${CV.listSkill}" var="o">
                                            <div class="resume-timeline position-relative skills">
                                                <article class="resume-timeline-item position-relative pb-5">
                                                    <div class="resume-timeline-item-header mb-2">
                                                        <select style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="skillId[]">
                                                            <option value="">Chọn kỹ năng</option>
                                                            <c:forEach items="${CVDAO.getAllSkillNames()}" var="skill">
                                                                <option value="${CVDAO.getSkillIdByName(skill)}"
                                                                        <c:if test="${CVDAO.getSkillIdByName(skill) == o.skillId}">
                                                                            selected="selected"
                                                                        </c:if>>${skill}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <input type="text" name="otherSkillName[]" value="${o.skillCustom}" placeholder="Tên kỹ năng khác" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; display: none;" class="other-skill-input">
                                                        <button class="remove-skill" type="button" style="color: black; padding: 5px; border: none; border-radius: 4px;">-</button>
                                                    </div>
                                                </article>
                                            </div>
                                            </c:forEach>
                                            <button type="button" id="add-skill" style="background-color: #007bff; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; margin-top: 15px;">Thêm Kỹ Năng</button>

                                        </div>
                                    </section>


                                    <section style="padding: 30px; border-radius: 12px; margin-bottom: 20px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);" id="education-section">
                                        <h2 style="background-color: #B3D7EA; color: #000; padding: 15px; border-radius: 8px; font-size: 28px; font-weight: bold; margin-bottom: 20px; text-align: center; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);">Học Vấn</h2>
                                        <c:forEach items="${CV.listEdu}" var="o">
                                        <div class="resume-section-content">
                                            <div class="resume-timeline position-relative education">
                                                <article class="resume-timeline-item position-relative pb-5">
                                                    <div class="resume-timeline-item-header mb-2">
                                                        <select style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;" name="schoolId[]">
                                                            <option value="">Chọn trường học</option>
                                                            <c:forEach items="${CVDAO.getAllSchoolNames()}" var="school">
                                                                <option value="${CVDAO.getSchoolIdByName(school)}"
                                                                        <c:if test="${CVDAO.getSchoolIdByName(school) == o.educationId}">
                                                                            selected="selected"
                                                                        </c:if>>${school}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <input type="text" name="otherSchoolName[]" value="${o.schoolCustom}"placeholder="Tên trường khác" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc; display: none;" class="other-school-input">
                                                        <input type="date" name="educationStartDate[]" value="${o.startDate}" style="width: 49%; display: inline-block; margin-right: -4px; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                                        <input type="date" name="educationEndDate[]" value="${o.endDate}" style="width: 49%; display: inline-block; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                                        <input type="text" name="degree[]" placeholder="Bằng cấp" value="${o.degree}" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                                        <input type="text" name="major[]" placeholder="Chuyên ngành" value="${o.fieldOfStudy}" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                                        <button class="remove-education" type="button" style="color: black; padding: 5px; border: none; border-radius: 4px;">-</button>
                                                    </div>
                                                </article>
                                            </div>
                                        </div>
                                        </c:forEach>
                                        <button type="button" id="add-education" style="background-color: #007bff; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; margin-top: 15px;">Thêm Học Vấn</button>
                                    </section>



                                </div>
                            </div>
                            <button type="submit" style="background-color: #007BFF; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer;">Cập nhật CV</button>
                        </div>
                    </div>
                </article>
            </form>
        </div>

        <footer class="footer text-center pt-2 pb-5">
            <!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
            <small class="copyright">Designed with <span class="sr-only">love</span><i class="fas fa-heart"></i> by <a href="http://themes.3rdwavemedia.com" target="_blank">JOBTRANS 2024</a> for job seeker</small>
        </footer>

    </body>
    <script>
        function toggleOtherCompanyInput(event) {
            const selectedValue = event.target.value;
            const otherCompanyInput = event.target.parentElement.querySelector('.other-company-input');
            otherCompanyInput.style.display = selectedValue === '32' ? 'block' : 'none';
        }

        function assignExperienceChangeEvents() {
            const experienceSelects = document.querySelectorAll('#experience-section select[name="companyId[]"]');
            experienceSelects.forEach(select => {
                select.removeEventListener('change', toggleOtherCompanyInput);
                select.addEventListener('change', toggleOtherCompanyInput);
            });
        }
        function assignExperienceRemoveEvents() {
            const removeExperienceButtons = document.querySelectorAll('.remove-experience');
            removeExperienceButtons.forEach(button => {
                button.onclick = function (e) {
                    const items = document.querySelectorAll('#experience-section .resume-timeline-item');
                    if (items.length > 1) {
                        e.target.closest('.resume-timeline-item').remove();
                    } else {
                        alert("Bạn không thể xóa mục cuối cùng!");
                    }
                };
            });
        }
        document.getElementById('add-experience').addEventListener('click', function () {
            const newExperience = document.querySelector('#experience-section .resume-timeline-item').cloneNode(true);
            newExperience.querySelectorAll('input').forEach(input => input.value = '');
            newExperience.querySelector('select').value = '';
            newExperience.querySelector('.other-company-input').style.display = 'none';
            document.querySelector('#experience-section .resume-timeline').appendChild(newExperience);
            assignExperienceChangeEvents(); // Gọi hàm để gán lại sự kiện
            assignExperienceRemoveEvents(); // Gán lại sự kiện xóa
        });

        assignExperienceChangeEvents(); // Gọi hàm để gán lại sự kiện
        assignExperienceRemoveEvents();

    </script>
    <script>

        function toggleOtherCertificationInput(event) {
            const selectedValue = event.target.value;
            const otherCertificationInput = event.target.parentElement.querySelector('.other-certification-input');
            otherCertificationInput.style.display = selectedValue === '35' ? 'block' : 'none';
        }

        function assignChangeEvents() {
            const certificationSelects = document.querySelectorAll('#certification-section select[name="certificationId[]"]');
            certificationSelects.forEach(select => {
                select.removeEventListener('change', toggleOtherCertificationInput);
                select.addEventListener('change', toggleOtherCertificationInput);
            });
        }

        function assignRemoveEvents() {
            const removeCertificationButtons = document.querySelectorAll('.remove-certification');
            removeCertificationButtons.forEach(button => {
                button.onclick = function (e) {
                    const items = document.querySelectorAll('#certification-section .resume-timeline-item');
                    if (items.length > 1) {
                        e.target.closest('.resume-timeline-item').remove();
                    } else {
                        alert("Bạn không thể xóa mục cuối cùng!");
                    }
                };
            });
        }

        document.getElementById('add-certification').addEventListener('click', function () {
            const newCertification = document.querySelector('#certification-section .resume-timeline-item').cloneNode(true);
            newCertification.querySelectorAll('input').forEach(input => input.value = '');
            newCertification.querySelector('select').value = '';
            newCertification.querySelector('.other-certification-input').style.display = 'none';
            document.querySelector('#certification-section .resume-timeline').appendChild(newCertification);
            assignChangeEvents(); // Gọi hàm để gán lại sự kiện
            assignRemoveEvents(); // Gán lại sự kiện xóa
        });
        // Gán sự kiện cho các mục đã tồn tại ban đầu
        assignChangeEvents();
        assignRemoveEvents();
    </script>

    <script>
        // Hàm để ẩn/hiện input "Khác"
        function toggleOtherSkillInput(event) {
            const selectedValue = event.target.value;
            const otherSkillInput = event.target.parentElement.querySelector('.other-skill-input');
            otherSkillInput.style.display = selectedValue === '31' ? 'block' : 'none';
        }
        function assignSkillChangeEvents() {
            const skillSelects = document.querySelectorAll('#skills-section select[name="skillId[]"]');
            skillSelects.forEach(select => {
                select.removeEventListener('change', toggleOtherSkillInput);
                select.addEventListener('change', toggleOtherSkillInput);
            });
        }
        // Hàm gán sự kiện xóa cho các mục kỹ năng và trường học
        function assignRemoveSkillEvents() {
            const removeSkillButtons = document.querySelectorAll('.remove-skill');
            removeSkillButtons.forEach(button => {
                button.onclick = function (e) {
                    const items = document.querySelectorAll('#skills-section .resume-timeline-item');
                    if (items.length > 1) {
                        e.target.closest('.resume-timeline-item').remove();
                    } else {
                        alert("Bạn không thể xóa mục cuối cùng!");
                    }
                };
            });
        }
        document.getElementById('add-skill').addEventListener('click', function () {
            const newSkill = document.querySelector('#skills-section .resume-timeline-item').cloneNode(true);
            newSkill.querySelectorAll('input').forEach(input => input.value = '');
            newSkill.querySelector('select').value = '';
            newSkill.querySelector('.other-skill-input').style.display = 'none';
            document.querySelector('#skills-section .resume-timeline').appendChild(newSkill);
            assignSkillChangeEvents(); // Gán lại sự kiện thay đổi
            assignRemoveSkillEvents(); // Gán lại sự kiện xóa
        });
        assignSkillChangeEvents();
        assignRemoveSkillEvents();

    </script>
    <script>
        // Gán sự kiện cho tất cả các lựa chọn trong mục kỹ năng
        function toggleOtherSchoolInput(event) {
            const selectedValue = event.target.value;
            const otherSchoolInput = event.target.parentElement.querySelector('.other-school-input');
            otherSchoolInput.style.display = selectedValue === '95' ? 'block' : 'none';
        }
        // Gán sự kiện cho tất cả các lựa chọn trong mục trường học
        function assignSchoolChangeEvents() {
            const schoolSelects = document.querySelectorAll('#education-section select[name="schoolId[]"]');
            schoolSelects.forEach(select => {
                select.removeEventListener('change', toggleOtherSchoolInput);
                select.addEventListener('change', toggleOtherSchoolInput);
            });
        }

        function assignRemoveEducationEvents() {
            const removeEducationButtons = document.querySelectorAll('.remove-education');
            removeEducationButtons.forEach(button => {
                button.onclick = function (e) {
                    const items = document.querySelectorAll('#education-section .resume-timeline-item');
                    if (items.length > 1) {
                        e.target.closest('.resume-timeline-item').remove();
                    } else {
                        alert("Bạn không thể xóa mục cuối cùng!");
                    }
                };
            });
        }
        document.getElementById('add-education').addEventListener('click', function () {
            const newEducation = document.querySelector('#education-section .resume-timeline-item').cloneNode(true);
            newEducation.querySelectorAll('input').forEach(input => input.value = '');
            newEducation.querySelector('select').value = '';
            newEducation.querySelector('.other-school-input').style.display = 'none';
            document.querySelector('#education-section .resume-timeline').appendChild(newEducation);
            assignSchoolChangeEvents(); // Gán lại sự kiện thay đổi
            assignRemoveEducationEvents(); // Gán lại sự kiện xóa
        });



        // Gán sự kiện cho các mục đã tồn tại ban đầu
        assignSchoolChangeEvents();
        assignRemoveEducationEvents();
    </script>



</html> 

