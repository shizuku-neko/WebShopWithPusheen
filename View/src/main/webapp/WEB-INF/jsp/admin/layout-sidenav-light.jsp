<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sidenav Light - SB Admin</title>
    <%@include file="header.jsp" %>
</head>
<body class="sb-nav-fixed">
<%@include file="nav.jsp" %>
<div id="layoutSidenav">
    <%@include file="layoutSidenav.jsp" %>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <h1 class="mt-4">Sidenav Light</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="adminindex">Dashboard</a></li>
                    <li class="breadcrumb-item active">Sidenav Light</li>
                </ol>
                <div class="card mb-4">
                    <div class="card-body">
                        This page is an example of using the light side navigation option. By appending the
                        <code>.sb-sidenav-light</code>
                        class to the
                        <code>.sb-sidenav</code>
                        class, the side navigation will take on a light color scheme. The
                        <code>.sb-sidenav-dark</code>
                        is also available for a darker option.
                    </div>
                </div>
            </div>
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2020</div>
                    <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="<%=basePath%>static/admin/js/scripts.js"></script>
</body>
</html>
