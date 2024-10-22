<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách nhà tuyển dụng</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/colors/blue.css">
    </head>
    <body>
        <div id="wrapper">
            <header id="header-container" class="fullwidth">
                <%@include file="includes/header.jsp" %>%>
            </header>
            <div class="clearfix"></div>
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="companies-list">
                            <c:forEach items="${ListEmployer}" var="o">
                                <a href="detail?pid=${o.userId}" class="company">
                                    <div class="company-inner-alignment">
                                        <span class="company-logo"><img src="${o.avatarUrl}" alt=""></span>
                                        <h4>${o.userName}</h4>
                                        <div class="star-rating" data-rating="${o.quantityOfPostedJob}"></div>
                                    </div>
                                </a>
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
            <div class="margin-top-70"></div>
            <%@include file="includes/footer.jsp" %>%>
            <!-- Footer / End -->

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

    </body>

    <!-- Mirrored from www.vasterad.com/themes/hireo_21/browse-companies.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 14 Sep 2024 08:34:42 GMT -->
</html>