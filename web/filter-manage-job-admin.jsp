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
        <table class="table table-bordered border-primary">
            <thead>
                <tr>
                    <th scope="col">Tên Công Việc</th>
                    <th scope="col">Phân Loại</th>
                    <th scope="col">Tình Trạng</th>
                    <th scope="col">Hành Động</th>
                    <th scope="col">Duyệt</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${jobList}" var="o">
                <tr>
                    <td><h4>${o.jobTitle}</h4></td>
                    <td><h4>${category.getCategoryById(o.categoryId).categoryName}</h4></td>
                    <td><h4>${o.status}</h4></td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <a href="#"><button class="btn btn-secondary btn-custom">Xem chi tiết</button></a>
                                </td>
                                <td>
                                    <a class="button gray ripple-effect ico" title="Xóa" data-tippy-placement="top" onclick="openPopup(this)" data-jobid="${o.jobId}"><i class="icon-feather-trash-2"></i></a>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <c:if test="${o.labelVerify == 'Được duyệt'}">
                            <button type="button" style="background-color: green" class="btn btn-success">Đã Duyệt</button>
                        </c:if>
                        <c:if test="${o.labelVerify != 'Được duyệt'}">
                            <button type="button" style="background-color: red" class="btn btn-danger">Chưa Duyệt</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script>
        const textElement = document.getElementById("taskText");
        const maxLength = 100; // Số ký tự bạn muốn giới hạn
        let text = textElement.innerText;

        if (text.length > maxLength) {
            textElement.innerText = text.substring(0, maxLength) + "...";
        }
    </script>                  
</html>