<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jobtrans.model.JobCategory" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">
    <jsp:useBean id="category" class="jobtrans.dal.JobCategoryDAO" scope="session"></jsp:useBean>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/colors/blue.css">
        <link rel="stylesheet" href="css/other.css">
    <c:forEach items="${jobList}" var="o">
        <div class="col-12">
            <a href="home?action=jobDetail&jobId=${o.jobId}" class="task-listing">
                <div class="task-listing-details row">
                    <div class="task-listing-description col-8">
                        <h3 class="task-listing-title">${o.jobTitle}</h3>
                        <ul class="task-icons">
                            <li>${o.dueDate}</li>
                        </ul>
                        <p class="task-listing-text" id="taskText">${o.description}</p>
                        <div class="task-tags">
                            <span>${category.getCategoryById(o.categoryId).categoryName}</span>
                        </div>
                    </div>
                    <div class="task-listing-bid col-4">
                        <div class="task-listing-bid-inner">
                            <div class="task-offers">
                                <strong>
                                    <fmt:formatNumber value="${o.budget}" type="currency" pattern="#,##0" currencySymbol="₫" groupingUsed="true" /></strong>
                                <span>Chi phí</span>
                            </div>
                            <span class="button button-sliding-icon ripple-effect">Chào giá<i class="icon-material-outline-arrow-right-alt"></i></span>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </c:forEach>
    <script>
        const textElement = document.getElementById("taskText");
        const maxLength = 100; // Số ký tự bạn muốn giới hạn
        let text = textElement.innerText;

        if (text.length > maxLength) {
            textElement.innerText = text.substring(0, maxLength) + "...";
        }
    </script>                  
</html>