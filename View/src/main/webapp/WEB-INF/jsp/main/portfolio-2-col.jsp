<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <%@ include file="header.jsp" %>
    <style>
        ul {
            height: 100%;
            list-style-type: none;
        }

        li {
            line-height: 40px;
            float: left;
        }

        .page_btn {
            border-radius: 4px;
            border: 1px solid #e5e9ef;
            background: #fff;
            margin-right: 10px;
            text-align: center;
            width: 38px;
            height: 38px;
            line-height: 8px;
            margin-top: 6px;
            outline: 0;
        }

        .page_btn:hover {
            border: 1px solid #4f90fb;
            color: #4f90fb;
        }

        span.pages_span {
            margin-right: 10px;
            width: 38px;
            height: 38px;
            position: relative;
            top: 10px;
        }
    </style>

</head>

<body>

<!-- Navigation -->
<%@ include file="navbar.jsp" %>

<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Portfolio 2
        <small>Subheading</small>
    </h1>

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">Portfolio 2</li>
    </ol>

    <div class="row">
        <c:forEach items="${ list }" var="cc">
            <div class="col-lg-6 portfolio-item">
                <div class="card h-100">
                    <a href="details?id=${ cc.gId }"><img class="card-img-top"
                                                          src="<%=basePath%>static/image/${ cc.gPhoto }" alt=""></a>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="details?id=${ cc.gId }">${ cc.gName }</a>
                        </h4>
                        <p class="card-text">${ cc.gIntroduction }</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <!-- /.row -->

    <!-- Pagination -->
    <ul class="pagination justify-content-center">
        <%--        <li class="page-item">--%>
        <%--            <a class="page-link" href="#" aria-label="Previous">--%>
        <%--                <span aria-hidden="true">&laquo;</span>--%>
        <%--                <span class="sr-only">Previous</span>--%>
        <%--            </a>--%>
        <%--        </li>--%>
        <%--        <li class="page-item">--%>
        <%--            <a class="page-link" href="#">1</a>--%>
        <%--        </li>--%>
        <%--        <li class="page-item">--%>
        <%--            <a class="page-link" href="#">2</a>--%>
        <%--        </li>--%>
        <%--        <li class="page-item">--%>
        <%--            <a class="page-link" href="#">3</a>--%>
        <%--        </li>--%>
        <%--        <li class="page-item">--%>
        <%--            <a class="page-link" href="#" aria-label="Next">--%>
        <%--                <span aria-hidden="true">&raquo;</span>--%>
        <%--                <span class="sr-only">Next</span>--%>
        <%--            </a>--%>
        <%--        </li>--%>
        <li class="page_li" href="portfolio-2-col?pageIndex=${pageIndex-1 lt 1?1:pageIndex-1 }">
            <button class="page_btn" style="width:100px" id="prePage">上一页</button>
        </li>
        <li class="page_li">
            <button class="page_btn" id="page_btn1">1</button>
        </li>
        <li class="page_li">
            <span class="pages_span" id="prePoint">...</span>
        </li>
        <li class="page_li">
            <button class="page_btn" id="page_btn2"></button>
        </li>
        <li class="page_li">
            <button class="page_btn" id="page_btn3"></button>
        </li>
        <li class="page_li">
            <button class="page_btn" id="page_btn4"></button>
        </li>
        <li class="page_li">
            <button class="page_btn" id="page_btn5"></button>
        </li>
        <li class="page_li">
            <button class="page_btn" id="page_btn6"></button>
        </li>
        <li class="page_li">
            <span class="pages_span" id="sufPoint">...</span>
        </li>
        <li class="page_li">
            <button class="page_btn" id="page_btn7"></button>
        </li>
        <li class="page_li" href="portfolio-2-col?pageIndex=${pageIndex+1 gt pageTotal?pageTotal:pageIndex+1 }">
            <button class="page_btn" style="width:100px" id="sufPage">下一页</button>
        </li>
    </ul>

</div>
<!-- /.container -->

<%@ include file="footer.jsp" %>
<script>
    $(function () {
        var currentPage = Number(20);
        var pageNum = Number(50);

        $("#page_btn2").text(currentPage - 2);
        $("#page_btn3").text(currentPage - 1);
        $("#page_btn4").text(currentPage);
        $("#page_btn5").text(currentPage + 1);
        $("#page_btn6").text(currentPage + 2);
        $("#page_btn7").text(pageNum);


        $("#page_btn4").css("background-color", "#4f90fb");
        $("#page_btn4").css("border", "1px solid #ddd");
        $("#page_btn4").css("color", "#fff");


        if (currentPage == 1) {
            $("#prePage").hide();
        }

        if (currentPage == pageNum) {
            $("#sufPage").hide();
        }


        if (currentPage <= 3) {
            $("#prePoint").hide();
            $("##page_btn1").hide();
        } else if (currentPage == 4) {
            $("#prePoint").hide();
        }

        if (currentPage == 1) {
            $("##page_btn2").hide();
            $("##page_btn3").hide();
        } else if (currentPage == 2) {
            $("##page_btn2").hide();
        }

        if (currentPage >= pageNum - 2) {
            $("#sufPoint").hide();
            $("##page_btn7").hide();
        } else if (currentPage == pageNum - 3) {
            $("#sufPoint").hide();
        }

        if (currentPage == pageNum) {
            $("#page_btn5").hide();
            $("#page_btn6").hide();
        }

        if (currentPage == pageNum - 1) {
            $("#page_btn6").hide();
        }
    });
</script>

</body>

</html>
