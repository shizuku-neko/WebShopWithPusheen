<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="header.jsp" %>

<body>

<!-- Navigation -->
<%@ include file="navbar.jsp"%>

<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">404
        <small>Page Not Found</small>
    </h1>

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="index">Home</a>
        </li>
        <li class="breadcrumb-item active">404</li>
    </ol>

    <div class="jumbotron">
        <h1 class="display-1">404</h1>
        <p>The page you're looking for could not be found. Here are some helpful links to get you back on track:</p>
        <ul>
            <li>
                <a href="index">Home</a>
            </li>
            <li>
                <a href="about">About</a>
            </li>
            <li>
                <a href="services">Services</a>
            </li>
            <li>
                <a href="contact">Contact</a>
            </li>
            <li>
                Portfolio
                <ul>
                    <li>
                        <a href="portfolio-1-col">1 Column Portfolio</a>
                    </li>
                    <li>
                        <a href="portfolio-2-col">2 Column Portfolio</a>
                    </li>
                    <li>
                        <a href="portfolio-3-col">3 Column Portfolio</a>
                    </li>
                    <li>
                        <a href="portfolio-4-col">4 Column Portfolio</a>
                    </li>
                </ul>
            </li>
            <li>
                Blog
                <ul>
                    <li>
                        <a href="blog-home-1">Blog Home 1</a>
                    </li>
                    <li>
                        <a href="blog-home-2">Blog Home 2</a>
                    </li>
                    <li>
                        <a href="blog-post">Blog Post</a>
                    </li>
                </ul>
            </li>
            <li>
                Other Pages
                <ul>
                    <li>
                        <a href="full-width-page">Full Width Page</a>
                    </li>
                    <li>
                        <a href="sidebar">Sidebar Page</a>
                    </li>
                    <li>
                        <a href="faq">FAQ</a>
                    </li>
                    <li>
                        <a href="404">404 Page</a>
                    </li>
                    <li>
                        <a href="pricing-table">Pricing Table</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- /.jumbotron -->

</div>
<!-- /.container -->

<%@ include file="footer.jsp"%>

</body>

</html>
