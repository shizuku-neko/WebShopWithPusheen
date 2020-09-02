<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <%@ include file="header.jsp" %>

</head>

<body>

<!-- Navigation -->
<%@ include file="navbar.jsp" %>

<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Pricing
        <small>Subheading</small>
    </h1>

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="index">Home</a>
        </li>
        <li class="breadcrumb-item active">Pricing</li>
    </ol>

    <!-- Content Row -->
    <div class="row">
        <div class="col-lg-4 mb-4">
            <div class="card h-100">
                <h3 class="card-header">Basic</h3>
                <div class="card-body">
                    <div class="display-4">$0.00</div>
                    <div class="font-italic">free</div>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">Get the latest goods information the first time</li>
                    <li class="list-group-item">Irregular discount</li>
                    <%--                    <li class="list-group-item">null</li>--%>
                    <li class="list-group-item">
                        <a href="#" class="btn btn-primary">Sign Up!</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-lg-4 mb-4">
            <div class="card card-outline-primary h-100">
                <h3 class="card-header bg-primary text-white">Plus</h3>
                <div class="card-body">
                    <div class="display-4">$29.99</div>
                    <div class="font-italic">per quarterly</div>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">All of Basic</li>
                    <li class="list-group-item">Exclusive discount</li>
                    <li class="list-group-item">Some gifts or...</li>
                    <li class="list-group-item">
                        <a href="#" class="btn btn-primary">Sign Up!</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-lg-4 mb-4">
            <div class="card h-100">
                <h3 class="card-header">Ultra</h3>
                <div class="card-body">
                    <div class="display-4">$99.99</div>
                    <div class="font-italic">per year</div>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">All of Plus</li>
                    <li class="list-group-item">Exclusive discount</li>
                    <li class="list-group-item">Better subscription price</li>
                    <li class="list-group-item">
                        <a href="#" class="btn btn-primary">Sign Up!</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<%@ include file="footer.jsp" %>

</body>

</html>
