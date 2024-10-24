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
        <style>
            #job tr:nth-child(even){
                background-color: #DCDCDC;
            }

            .dropdown-toggle::after {
                content: none; /* Loại bỏ nội dung */
                display: none; /* Ẩn phần tử */
            }

            nav {
                display: flex;
                justify-content: center;
            }
        </style>
        <table id="job" class="align-content-center table">
            <thead>
                <tr>
                    <th scope="col" style="color: white; background-color: #2a41e8;">Tên Công Việc</th>
                    <th scope="col" style="color: white; background-color: #2a41e8;">Phân Loại</th>
                    <th scope="col" style="color: white; background-color: #2a41e8;">Tình Trạng</th>
                    <th scope="col" style="color: white; background-color: #2a41e8;">Hành Động</th>
                    <th scope="col" style="color: white; background-color: #2a41e8;">Duyệt</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${jobList}" var="o">
                <tr>
                    <td class="align-content-center" ><h4>${o.jobTitle}</h4></td>
                    <td class="align-content-center" ><h4>${category.getCategoryById(o.categoryId).categoryName}</h4></td>
                    <td class="align-content-center" ><h4>${o.status}</h4></td>
                    <td class="align-content-center" >
                        <table>
                            <tr>
                                <td class="align-content-center" >
                                    <a href="JobManagement?jid=${o.jobId}&command=DETAIL"><button class="btn btn-secondary" style="font-size: 14px; padding: 10px 5px 10px 5px;">Xem chi tiết</button></a>
                                </td>
                                <td class="align-content-center" >
                                    <a class="button gray ripple-effect ico border border-primary" title="Xóa" data-tippy-placement="top" onclick="openPopup(this)" data-jobid="${o.jobId}"><i class="icon-feather-trash-2"></i></a>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="align-content-center" >
                        <c:if test="${o.labelVerify == 'Được duyệt'}">
                            <button type="button" style="background-color: green; font-size: 14px; padding: 10px 5px 10px 5px;" class="btn btn-success">Đã Duyệt</button>
                        </c:if>
                        <c:if test="${o.labelVerify != 'Được duyệt'}">
                            <button type="button" style="background-color: red; font-size: 14px; padding: 10px 5px 10px 5px;" class="btn btn-danger">Chưa Duyệt</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <nav id="pageDevide">
        <ul class="pagination">
            <c:if test="${currentPage != 1}">
                <c:if test="${sessionScope.conditionPage == 'true'}">
                    <li class="page-item"><a type="button" class="page-link" currentPage="${currentPage-1}" onclick="filterJobsByStatus(this)">PreviousFilter</a></li>
                    </c:if>
                    <c:if test="${sessionScope.conditionPage == 'false'}">
                    <li class="page-item"><a class="page-link" href="JobManagement?command=LIST&currentPage=${currentPage-1}">Previous</a></li>
                    </c:if>
                </c:if>

            <c:forEach begin="1" end="${noOfPages}" var="i">
                <c:choose>
                    <c:when test="${currentPage eq i}">
                        <li class="page-item active">
                            <a class="page-link">${i} <span class="sr-only">(current)</span></a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${sessionScope.conditionPage == 'true'}">
                            <li class="page-item"><a type="button" class="page-link" currentPage="${i}" onclick="filterJobsByStatus(this)">${i}----</a></li>
                            </c:if>
                            <c:if test="${sessionScope.conditionPage == 'false'}">
                            <li class="page-item"><a class="page-link" href="JobManagement?command=LIST&currentPage=${i}">${i}</a></li>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

            <c:if test="${currentPage lt noOfPages}">
                <c:if test="${sessionScope.conditionPage == 'true'}">
                    <li class="page-item"><a class="page-link" currentPage="${currentPage+1}" onclick="filterJobsByStatus(this)">Next</a></li>
                    </c:if>
                    <c:if test="${sessionScope.conditionPage == 'false'}">
                    <li class="page-item"><a class="page-link" href="JobManagement?command=LIST&currentPage=${currentPage+1}">Next</a></li>
                    </c:if>
                </c:if>
        </ul>
    </nav>
    <p>filter page</p>
    <script>
        const textElement = document.getElementById("taskText");
        const maxLength = 100; // Số ký tự bạn muốn giới hạn
        let text = textElement.innerText;

        if (text.length > maxLength) {
            textElement.innerText = text.substring(0, maxLength) + "...";
        }
    </script>      
    <script>
        function filterJobsByStatus(element) {
            var currentPage = element.getAttribute("currentPage");

            $.ajax({
                url: 'JobManagement', // Đường dẫn đến servlet xử lý
                type: 'GET',
                data: {
                    command: 'filterJobsByStatus',
                    currentPage: currentPage
                },
                success: function (response) {
                    $('#jobListContainer', '#pageDevide').html(response);
                },
                error: function (xhr, status, error) {
                    console.error('Error filtering jobs: ', error);
                }
            });
        }
    </script>
</html>