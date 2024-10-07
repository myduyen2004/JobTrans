<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/dashboard-settings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:35:14 GMT -->
    <head>

        <!-- Basic Page Needs
        ================================================== -->
        <title>JobTrans</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <!-- CSS
        ================================================== -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/colors/blue.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    </head>
    <body class="gray">

        <!-- Wrapper -->
        <div id="wrapper">

            <!-- Header Container
            ================================================== -->
            <%@include file="/includes/header.jsp" %>
            <div class="clearfix"></div>
            <!-- Header Container / End -->


            <!-- Dashboard Container -->
            <div class="dashboard-container">

                <!-- Dashboard Sidebar
                ================================================== -->
                <div class="dashboard-sidebar">
                    <div class="dashboard-sidebar-inner" data-simplebar>
                            <div class="dashboard-nav-container">

                                    <!-- Responsive Navigation Trigger -->
                                    <a href="#" class="dashboard-responsive-nav-trigger">
                                            <span class="hamburger hamburger--collapse">
                                                    <span class="hamburger-box">
                                                            <span class="hamburger-inner"></span>
                                                    </span>
                                            </span>
                                            <span class="trigger-title">Điều Hướng</span>
                                    </a>

                                    <!-- Navigation -->
                                    <div class="dashboard-nav">
                                            <div class="dashboard-nav-inner">

                                                    <ul data-submenu-title="Bắt đầu">
                                                            <li><a href="dashboard.html"><i class="icon-material-outline-dashboard"></i> Bảng Điều Khiển</a></li>
                                                            <li><a href="dashboard-messages.html"><i class="icon-material-outline-question-answer"></i> Tin Nhắn <span class="nav-tag">2</span></a></li>
                                                            <li><a href="dashboard-bookmarks.html"><i class="icon-material-outline-star-border"></i> Đánh Dấu</a></li>
                                                            <li><a href="dashboard-reviews.html"><i class="icon-material-outline-rate-review"></i> Đánh Giá</a></li>
                                                    </ul>

                                                    <ul data-submenu-title="Tổ chức và Quản lý">
                                                            <li><a href="#"><i class="icon-material-outline-business-center"></i> Công Việc</a>
                                                                    <ul>
                                                                            <li><a href="dashboard-manage-jobs.html">Quản Lý Công Việc <span class="nav-tag">3</span></a></li>
                                                                            <li><a href="dashboard-manage-candidates.html">Quản Lý Ứng Viên</a></li>
                                                                            <li><a href="dashboard-post-a-job.html">Đăng Vông Việc</a></li>
                                                                    </ul>	
                                                            </li>
                                                            <li><a href="#"><i class="icon-material-outline-assignment"></i> Nhiệm Vụ</a>
                                                                    <ul>
                                                                            <li><a href="dashboard-manage-tasks.html">Quản Lý Nhiệm Vụ <span class="nav-tag">2</span></a></li>
                                                                            <li><a href="dashboard-manage-bidders.html">Quản Lý Người Đấu Thầu</a></li>
                                                                            <li><a href="dashboard-my-active-bids.html">Đấu Thầu Đang Hoạt Động <span class="nav-tag">4</span></a></li>
                                                                            <li><a href="dashboard-post-a-task.html">Đăng Nhiệm Vụ</a></li>
                                                                    </ul>	
                                                            </li>
                                                    </ul>

                                                    <ul data-submenu-title="Tài khoản">
                                                            <li class="active"><a href="dashboard-settings.html"><i class="icon-material-outline-settings"></i> Cài Đặt</a></li>
                                                            <li><a href="index-logged-out.html"><i class="icon-material-outline-power-settings-new"></i> Đăng Xuất</a></li>
                                                    </ul>

                                            </div>
                                    </div>
                                    <!-- Navigation / End -->

                            </div>
                    </div>
                </div>
                <!-- Dashboard Sidebar / End -->


                <!-- Dashboard Content
                ================================================== -->
                <div class="dashboard-content-container" data-simplebar>
                 
                        <div class="dashboard-content-inner" >

                        <!-- Dashboard Headline -->
                        <div class="dashboard-headline">
                            <h3>Cài Đặt</h3>

                            <!-- Breadcrumbs -->
                            <nav id="breadcrumbs" class="dark">
                                <ul>
                                    <li><a href="#">Trang Chủ</a></li>
                                    <li><a href="#">Bảng Điều Khiển</a></li>
                                    <li>Cài Đặt</li>
                                </ul>
                            </nav>
                        </div>
<form action="create" method="post" enctype="multipart/form-data">
    <!-- Row -->
    <div class="row">

        <!-- Dashboard Box -->
        <div class="col-xl-12">
            <div class="dashboard-box margin-top-0">
                <div class="content with-padding padding-bottom-0">
                    <div class="row">

                        <div class="col-auto">
                            <div class="avatar-wrapper" data-tippy-placement="bottom" title="Change Avatar">
                                <img class="profile-pic" src="${User.avatarUrl != null ? User.avatarUrl : 'images/user-avatar-placeholder.png'}" alt="" />
                                <div class="upload-button"></div>
                                <input class="file-upload" type="file" name="avatar" accept="image/*" />
                            </div>
                        </div>

                        <div class="col">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="submit-field">
                                        <h5>${User.userName}</h5>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <div class="submit-field">
                                        <h5>${User.email}</h5>
                                    </div>
                                </div>
                                <div class="col-xl-12">
                                    <div class="submit-field">
                                        <input type="text" id="title" name="title" value="" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- Career Summary Section -->
        <div class="col-xl-12">
            <div class="dashboard-box">
                <div class="col-xl-12">
                    <div class="submit-field">
                        <h3>Career summary</h3>
                        <textarea cols="30" rows="5" placeholder="Nhập mô tả" name="summary" class="with-border"></textarea>
                    </div>
                </div>
            </div>
        </div>

        <!-- Work Experience Section -->
        <div class="col-xl-12">
            <div class="dashboard-box">
                <div class="row">
                    <div class="col-xl-6">
                        <div class="submit-field">
                            <div style="border: 1px solid #ccc; padding: 15px; margin-bottom: 20px; border-radius: 8px;">
                                <h4>Work Experience</h4>
                                <div id="work-experience-container">
                                    <div class="work-experience" style="margin-bottom: 10px;">
                                        <label for="nameCompany">Company Name:</label>
                                        <select id="nameCompany" name="nameCompany" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                            <option value="1">VinGroup</option>
<option value="2">Viettel</option>
<option value="3">FPT Corporation</option>
<option value="4">PetroVietnam</option>
<option value="5">Vinamilk</option>
<option value="6">Masan Group</option>
<option value="7">Hoa Phat Group</option>
<option value="8">BIDV</option>
<option value="9">Vietcombank</option>
<option value="10">Techcombank</option>
<option value="11">Vietnam Airlines</option>
<option value="12">Thaco</option>
<option value="13">Sabeco</option>
<option value="14">Habeco</option>
<option value="15">Novaland</option>
<option value="16">Sovico Group</option>
<option value="17">VPBank</option>
<option value="18">Kido Group</option>
<option value="19">Vingroup Retail</option>
<option value="20">Saigon Co.op</option>
                                        </select>
                                    </div>
                                    <div class="yearsOfExperience" style="margin-bottom: 10px;">
                                        <label for="description">years of experience:</label>
                                        <input type="number" id="yearsOfExperience" name="yearsOfExperience" value="" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                    </div>
                               

                                    <div class="work-experience" style="margin-bottom: 10px;">
                                        <label for="achievement">Achievement:</label>
                                        <input type="text" id="achievement" name="achievement" value="" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                    </div>
                                </div>
                                <button id="add-experience" style="margin-top: 10px;">+</button>
                            </div>
                        </div>
                    </div>

                    <!-- Skills & Tools Section -->
                    <div class="col-xl-6">
                        <div class="submit-field">
                            <div style="border: 1px solid #ccc; padding: 15px; margin-bottom: 20px; border-radius: 8px;">
                                <h4>Skills & Tools</h4>
                                <div id="skills-tools-container">
                                    <div class="skill-tool" style="width: 100%; margin-bottom: 10px;">
                                        <select name="skillname" style="width: 49%; display: inline-block; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                            <option value="1">Java Programming</option>
    <option value="2">SQL Server</option>
    <option value="3">HTML/CSS</option>
    <option value="4">JavaScript</option>
    <option value="5">Python Programming</option>
    <option value="6">Angular</option>
    <option value="7">React</option>
    <option value="8">Node.js</option>
    <option value="9">Spring Framework</option>
    <option value="10">Docker</option>
    <option value="11">Kubernetes</option>
    <option value="12">Git</option>
    <option value="13">Linux Administration</option>
    <option value="14">AWS Cloud</option>
    <option value="15">Azure Cloud</option>
    <option value="16">Agile Methodology</option>
    <option value="17">Machine Learning</option>
    <option value="18">Data Analysis</option>
    <option value="19">UI/UX Design</option>
    <option value="20">Cybersecurity</option>
                                            
                                        </select>
                                        <select name="proficiency" style="width: 49%; display: inline-block; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                            <option value="Beginner">Beginner</option>
                                            <option value="Intermediate">Intermediate</option>
                                            <option value="Advanced">Advanced</option>
                                            <option value="Expert">Expert</option>
                                        </select>
                                    </div>
                                </div>
                                <button id="add-skill-tool" style="margin-top: 10px;">+</button>
                            </div>

                            <!-- Education Section -->
                            <div style="border: 1px solid #ccc; padding: 15px; margin-bottom: 20px; border-radius: 8px;">
                                <h4>Education</h4>
                                <div id="education-container">
                                    <div class="education-entry" style="margin-bottom: 10px;">
                                        <label for="schoolName">School name:</label>
                                        <select id="schoolName" name="schoolName" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                            <option value="1">Đại học Quốc gia Hà Nội</option>
    <option value="2">Đại học Quốc gia Thành phố Hồ Chí Minh</option>
    <option value="3">Đại học Bách Khoa Hà Nội</option>
    <option value="4">Đại học Đà Nẵng</option>
    <option value="5">Đại học Huế</option>
    <option value="6">Đại học Ngoại thương</option>
    <option value="7">Đại học Kinh tế Thành phố Hồ Chí Minh</option>
    <option value="8">Đại học Giao thông Vận tải</option>
    <option value="9">Đại học Cần Thơ</option>
    <option value="10">Đại học Y Dược Thành phố Hồ Chí Minh</option>
    <option value="11">Đại học Y Hà Nội</option>
    <option value="12">Đại học Khoa học Xã hội và Nhân văn Hà Nội</option>
    <option value="13">Đại học Khoa học Xã hội và Nhân văn Thành phố Hồ Chí Minh</option>
    <option value="14">Đại học Tôn Đức Thắng</option>
    <option value="15">Đại học Luật Thành phố Hồ Chí Minh</option>
    <option value="16">Đại học Kiến trúc Thành phố Hồ Chí Minh</option>
    <option value="17">Đại học Công nghệ Thành phố Hồ Chí Minh</option>
    <option value="18">Đại học Sư phạm Thành phố Hồ Chí Minh</option>
    <option value="19">Đại học FPT</option>
    <option value="20">Đại học RMIT Việt Nam</option>

                                    <div class="education-entry" style="margin-bottom: 10px;">
                                        <label for="field">Field of study:</label>
                                        <input type="text" id="field" name="field" value="" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                    </div>

                                    <div class="education-entry" style="margin-bottom: 10px;">
                                        <input type="date" name="dateBegin" value="startDay" style="width: 49%; display: inline-block; margin-right: -4px; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                        <input type="date" name="dateFinish" value="endDay" style="width: 49%; display: inline-block; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                    </div>

                                    <div class="education-entry" style="margin-bottom: 10px;">
                                        <label for="degree">Degree:</label>
                                        <select id="degree" name="degree" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                            <option value="bachelor">Bachelor's Degree</option>
                                            <option value="master">Master's Degree</option>
                                            <option value="phd">PhD</option>
                                        </select>
                                    </div>
                                </div>
                                <button id="add-education" style="margin-top: 10px;">+</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-12">
            <a href="create?action=create"  class="button ripple-effect big margin-top-30">Lưu CV</a>
        </div>

    </div>
</form>

                                                        
                    

                </div>
                <!-- Row / End -->

                <!-- Footer -->
                <div class="dashboard-footer-spacer"></div>
                <div class="small-footer margin-top-15">
                    <div class="small-footer-copyrights">
                        © 2024 <strong>JOBTRANS</strong>. All Rights Reserved.
                    </div>
                    <ul class="footer-social-links">
                        <li>
                            <a href="#" title="Facebook" data-tippy-placement="top">
                                <i class="icon-brand-facebook-f"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#" title="Twitter" data-tippy-placement="top">
                                <i class="icon-brand-twitter"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#" title="Google Plus" data-tippy-placement="top">
                                <i class="icon-brand-google-plus-g"></i>
                            </a>
                        </li>
                        <li>
                            <a href="#" title="LinkedIn" data-tippy-placement="top">
                                <i class="icon-brand-linkedin-in"></i>
                            </a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <!-- Footer / End -->

            </div>
        </div>
        <!-- Dashboard Content / End -->

    </div>
    <!-- Dashboard Container / End -->

</div>
<!-- Wrapper / End -->


<!-- Scripts
================================================== -->
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/jquery-migrate-3.1.0.min.html"></script>
<script src="js/mmenu.min.js"></script>
<script src="js/tippy.all.min.js"></script>
<script src="js/simplebar.min.js"></script>
<script src="js/bootstrap-slider.min.js"></script>
<script src="js/bootstrap-select.min.js"></script>
<script src="js/snackbar.js"></script>
<script src="js/clipboard.min.js"></script>
<script src="js/counterup.min.js"></script>
<script src="js/magnific-popup.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/custom.js"></script>

<!-- Snackbar // documentation: https://www.polonel.com/snackbar/ -->
<script>
// Snackbar for user status switcher
    $('#snackbar-user-status label').click(function () {
        Snackbar.show({
            text: 'Your status has been changed!',
            pos: 'bottom-center',
            showAction: false,
            actionText: "Dismiss",
            duration: 3000,
            textColor: '#fff',
            backgroundColor: '#383838'
        });
    });
</script>

<!-- Chart.js // documentation: http://www.chartjs.org/docs/latest/ -->
<script src="js/chart.min.js"></script>
<script>
    Chart.defaults.global.defaultFontFamily = "Nunito";
    Chart.defaults.global.defaultFontColor = '#888';
    Chart.defaults.global.defaultFontSize = '14';

    var ctx = document.getElementById('chart').getContext('2d');

    var chart = new Chart(ctx, {
        type: 'line',

        // The data for our dataset
        data: {
            labels: ["January", "February", "March", "April", "May", "June"],
            // Information about the dataset
            datasets: [{
                    label: "Views",
                    backgroundColor: 'rgba(42,65,232,0.08)',
                    borderColor: '#2a41e8',
                    borderWidth: "3",
                    data: [196, 132, 215, 362, 210, 252],
                    pointRadius: 5,
                    pointHoverRadius: 5,
                    pointHitRadius: 10,
                    pointBackgroundColor: "#fff",
                    pointHoverBackgroundColor: "#fff",
                    pointBorderWidth: "2",
                }]
        },

        // Configuration options
        options: {

            layout: {
                padding: 10,
            },

            legend: {display: false},
            title: {display: false},

            scales: {
                yAxes: [{
                        scaleLabel: {
                            display: false
                        },
                        gridLines: {
                            borderDash: [6, 10],
                            color: "#d8d8d8",
                            lineWidth: 1,
                        },
                    }],
                xAxes: [{
                        scaleLabel: {display: false},
                        gridLines: {display: false},
                    }],
            },

            tooltips: {
                backgroundColor: '#333',
                titleFontSize: 13,
                titleFontColor: '#fff',
                bodyFontColor: '#fff',
                bodyFontSize: 13,
                displayColors: false,
                xPadding: 10,
                yPadding: 10,
                intersect: false
            }
        },

    });

</script>

<script>
    document.getElementById('add-experience').addEventListener('click', function () {
        var newWorkExperience = document.createElement('div');
        newWorkExperience.className = 'work-experience'; // Thêm class để dễ dàng quản lý
        newWorkExperience.style.marginBottom = '10px';

        // Tạo nội dung HTML cho phần Work Experience mới, bao gồm nút "-"
        newWorkExperience.innerHTML = `
            <div style="margin-bottom: 10px;">
                <label for="nameCompany">Company Name:</label>
               <select id="nameCompany" name="nameCompany" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
            <option value="1">VinGroup</option>
<option value="2">Viettel</option>
<option value="3">FPT Corporation</option>
<option value="4">PetroVietnam</option>
<option value="5">Vinamilk</option>
<option value="6">Masan Group</option>
<option value="7">Hoa Phat Group</option>
<option value="8">BIDV</option>
<option value="9">Vietcombank</option>
<option value="10">Techcombank</option>
<option value="11">Vietnam Airlines</option>
<option value="12">Thaco</option>
<option value="13">Sabeco</option>
<option value="14">Habeco</option>
<option value="15">Novaland</option>
<option value="16">Sovico Group</option>
<option value="17">VPBank</option>
<option value="18">Kido Group</option>
<option value="19">Vingroup Retail</option>
<option value="20">Saigon Co.op</option>
            <!-- Bạn có thể thêm các công ty khác tại đây -->
        </select>
            </div>
            <div style="margin-bottom: 10px;">
                                        <label for="description">years of experience:</label>
                                        <input type="number" id="yearsOfExperience" name="yearsOfExperience" value="" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                                    </div>

            <div style="margin-bottom: 10px;">
                <label for="achievement">Achievement:</label>
                <input type="text" name="achievement" value="" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
            </div>

            <!-- Nút xóa dấu "-" -->
            <button class="remove-experience"  color: white;">-</button>
        `;

        // Thêm phần Work Experience mới vào container
        document.getElementById('work-experience-container').appendChild(newWorkExperience);

        // Lắng nghe sự kiện click từ nút "-" để xóa phần tử Work Experience này
        newWorkExperience.querySelector('.remove-experience').addEventListener('click', function () {
            newWorkExperience.remove(); // Xóa phần tử Work Experience này
        });
    });
</script>



<script>
    document.getElementById('add-skill-tool').addEventListener('click', function () {
        var newSkillTool = document.createElement('div');
        newSkillTool.className = 'skill-tool'; // Thêm class để quản lý
        newSkillTool.style.width = '100%';
        newSkillTool.style.marginBottom = '10px';

        // Tạo nội dung HTML cho phần Skill & Tool mới, bao gồm nút "-"
        newSkillTool.innerHTML = `
            <select name="skillName" style="width: 49%; display: inline-block; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                <option value="1">Java Programming</option>
    <option value="2">SQL Server</option>
    <option value="3">HTML/CSS</option>
    <option value="4">JavaScript</option>
    <option value="5">Python Programming</option>
    <option value="6">Angular</option>
    <option value="7">React</option>
    <option value="8">Node.js</option>
    <option value="9">Spring Framework</option>
    <option value="10">Docker</option>
    <option value="11">Kubernetes</option>
    <option value="12">Git</option>
    <option value="13">Linux Administration</option>
    <option value="14">AWS Cloud</option>
    <option value="15">Azure Cloud</option>
    <option value="16">Agile Methodology</option>
    <option value="17">Machine Learning</option>
    <option value="18">Data Analysis</option>
    <option value="19">UI/UX Design</option>
    <option value="20">Cybersecurity</option>             
            </select>
            <select name="proficiency" style="width: 49%; display: inline-block; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                 <option value="Beginner">Beginner</option>
                                            <option value="Intermediate">Intermediate</option>
                                            <option value="Advanced">Advanced</option>
                                            <option value="Expert">Expert</option>            
            </select>
            

            <!-- Nút xóa dấu "-" -->
            <button class="remove-skill-tool"  color: white; margin-left: 10px;">-</button>
        `;

        // Thêm phần Skill & Tool mới vào container
        document.getElementById('skills-tools-container').appendChild(newSkillTool);

        // Lắng nghe sự kiện click từ nút "-" để xóa phần Skill & Tool này
        newSkillTool.querySelector('.remove-skill-tool').addEventListener('click', function () {
            newSkillTool.remove(); // Xóa phần Skill & Tool này
        });
    });
</script>

<script>
    document.getElementById('add-education').addEventListener('click', function () {
        var newEducationEntry = document.createElement('div');
        newEducationEntry.className = 'education-entry'; // Thêm class để quản lý
        newEducationEntry.style.marginBottom = '10px';

        // Tạo nội dung HTML cho phần Education mới, bao gồm nút "-"
        newEducationEntry.innerHTML = `
            <div style="margin-bottom: 10px;">
                <label for="schoolName">School name:</label>
                <select name="schoolName" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                    <option value="1">Đại học Quốc gia Hà Nội</option>
    <option value="2">Đại học Quốc gia Thành phố Hồ Chí Minh</option>
    <option value="3">Đại học Bách Khoa Hà Nội</option>
    <option value="4">Đại học Đà Nẵng</option>
    <option value="5">Đại học Huế</option>
    <option value="6">Đại học Ngoại thương</option>
    <option value="7">Đại học Kinh tế Thành phố Hồ Chí Minh</option>
    <option value="8">Đại học Giao thông Vận tải</option>
    <option value="9">Đại học Cần Thơ</option>
    <option value="10">Đại học Y Dược Thành phố Hồ Chí Minh</option>
    <option value="11">Đại học Y Hà Nội</option>
    <option value="12">Đại học Khoa học Xã hội và Nhân văn Hà Nội</option>
    <option value="13">Đại học Khoa học Xã hội và Nhân văn Thành phố Hồ Chí Minh</option>
    <option value="14">Đại học Tôn Đức Thắng</option>
    <option value="15">Đại học Luật Thành phố Hồ Chí Minh</option>
    <option value="16">Đại học Kiến trúc Thành phố Hồ Chí Minh</option>
    <option value="17">Đại học Công nghệ Thành phố Hồ Chí Minh</option>
    <option value="18">Đại học Sư phạm Thành phố Hồ Chí Minh</option>
    <option value="19">Đại học FPT</option>
    <option value="20">Đại học RMIT Việt Nam</option>
                    <!-- Thêm nhiều trường học tại đây -->
                </select>
            </div>

            <div style="margin-bottom: 10px;">
                <label for="field">Field of study:</label>
                <input type="text" name="field" value="" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
            </div>

            <div style="margin-bottom: 10px;">
                <input type="date" name="dateBegin" value="startDay" style="width: 49%; display: inline-block; margin-right: -4px; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                <input type="date" name="dateFinish" value="endDay" style="width: 49%; display: inline-block; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
            </div>

            <div style="margin-bottom: 10px;">
                <label for="degree">Degree:</label>
                <select name="degree" style="width: 100%; padding: 8px; border-radius: 4px; border: 1px solid #ccc;">
                    <option value="bachelor">Bachelor's Degree</option>
                    <option value="master">Master's Degree</option>
                    <option value="phd">PhD</option>
                    <!-- Thêm các bằng cấp khác tại đây -->
                </select>
            </div>

            <!-- Nút xóa dấu "-" -->
            <button class="remove-education"  color: white; margin-left: 10px;">-</button>
        `;

        // Thêm phần Education mới vào container
        document.getElementById('education-container').appendChild(newEducationEntry);

        // Lắng nghe sự kiện click từ nút "-" để xóa phần Education này
        newEducationEntry.querySelector('.remove-education').addEventListener('click', function () {
            newEducationEntry.remove(); // Xóa phần Education này
        });
    });
</script>

<!-- Google Autocomplete -->
<script>
    function initAutocomplete() {
        var options = {
            types: ['(cities)'],
            // componentRestrictions: {country: "us"}
        };

        var input = document.getElementById('autocomplete-input');
        var autocomplete = new google.maps.places.Autocomplete(input, options);

        if ($('.submit-field')[0]) {
            setTimeout(function () {
                $(".pac-container").prependTo("#autocomplete-container");
            }, 300);
        }
    }
</script>

<!-- Google API -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaoOT9ioUE4SA8h-anaFyU4K63a7H-7bc&amp;libraries=places&amp;callback=initAutocomplete"></script>
<script>
        // Kiểm tra xem có thông báo thành công hay không//
            <% if (request.getAttribute("success") != null) { %>
                toastr.success('<%= request.getAttribute("success") %>');
            <% } %>
            <% if (request.getAttribute("error") != null) { %>
                toastr.error('<%= request.getAttribute("error") %>');
            <% } %>
</script>

</body>

<!-- Mirrored from www.vasterad.com/themes/hireo_21/dashboard-settings.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:35:14 GMT -->
</html>