<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Charts - SB Admin</title>
    <%@include file="header.jsp" %>
</head>
<body class="sb-nav-fixed">
<%@include file="nav.jsp" %>
<div id="layoutSidenav">
    <%@include file="layoutSidenav.jsp" %>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <h1 class="mt-4">Charts</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="adminindex">Dashboard</a></li>
                    <li class="breadcrumb-item active">Charts</li>
                </ol>
                <div class="card mb-4">
                    <div class="card-body">
                        <c:forEach items="${ list }" var="cc">
                            <form action="update" method="post">
                                <table>
                                    <tr>
                                        <td><span>${ cc.gId }</span></td>
                                        <td><input type="text" value="${ cc.gName }" name="gName"></td>
                                        <td><img id="myImg" src="<%=basePath%>static/image/${ cc.gPhoto }" alt=""
                                                 width="108" height="129.6"></td>
                                        <td><input type="text" value="${ cc.gPrice }" name="gPrice"></td>
                                        <td><input type="text" value="${ cc.gIntroduction }" name="gIntroduction"></td>
                                        <td><input type="text" value="${ cc.gQuantity }" name="gQuantity"></td>
                                        <td><input type="submit" value="Submit"></td>
                                    </tr>
                                </table>
                            </form>
                        </c:forEach>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="<%=basePath%>static/admin/assets/demo/chart-area-demo.js"></script>
<script src="<%=basePath%>static/admin/assets/demo/chart-bar-demo.js"></script>
<script src="<%=basePath%>static/admin/assets/demo/chart-pie-demo.js"></script>
</body>
</html>
