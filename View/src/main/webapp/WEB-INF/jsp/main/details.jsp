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
    <h1 class="mt-4 mb-3"
        style="font-family: Roboto, Helvetica, Arial, sans-serif; margin-top: 0; font-size: 2.25rem; font-weight: 700;">
        Settlement
    </h1>

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="index">Home</a>
        </li>
        <li class="breadcrumb-item active">Settlement</li>
    </ol>

    <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-4">

            <!-- Preview Image -->
            <img class="" src="<%=basePath%>static/image/${ list.gPhoto }" alt="" style="width: 450px">

        </div>

        <div class="col-lg-1">

        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-7">

            <br/>
            <br/>
            <!-- Search Widget -->
            <div class="mb-4">
                <h2 style="font-family: Lulo, Arial, sans-serif; font-size: 1.5em; font-weight: bold;">
                    <font style="vertical-align: inherit">
                        <font style="-webkit-font-smoothing: antialiased; text-rendering: optimizeLegibility; box-sizing: border-box; vertical-align: inherit">${ list.gName }</font>
                    </font>
                </h2>
            </div>

            <div>
                <p>${ list.gIntroduction }</p>
            </div>

            <h2 style="overflow: hidden; text-align: center; background-color: transparent; background-image: url(<%=basePath%>static/image/pink-dot.svg); background-repeat: space; background-size: auto 1em; background-position: 0 50%;">
                &nbsp;</h2>

            <div style="">
                <div align="right"><h4 style="font-size: 3.0rem;">Price: $${ list.gPrice }</h4></div>

                <a class="btn btn-lg btn-secondary btn-block" href="shop?id=${ list.gId }"
                   style="background-color: pink">Buy Now!</a>
            </div>

        </div>

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<%@ include file="footer.jsp" %>

</body>

</html>
