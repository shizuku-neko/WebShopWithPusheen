<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <%@ include file="header.jsp" %>

</head>

<body>

<!-- Navigation -->
<%@ include file="navbar.jsp"%>

<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Full Width
        <small>Subheading</small>
    </h1>

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">Full Width</li>
    </ol>

    <p>Most of Start Bootstrap's unstyled templates can be directly integrated into the Modern Business template. You
        can view all of our unstyled templates on our website at
        <a href="https://startbootstrap.com/template-categories/unstyled">https://startbootstrap.com/template-categories/unstyled</a>.
    </p>

</div>
<!-- /.container -->

<%@ include file="footer.jsp" %>

</body>

</html>
