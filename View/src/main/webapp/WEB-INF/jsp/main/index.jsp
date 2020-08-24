<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="header.jsp" %>


<body>

<!-- Navigation -->
<%@ include file="navbar.jsp" %>

<header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <!-- Slide One - Set the background image for this slide in the line below -->
            <div class="carousel-item active"
                 style="background-image: url('http://localhost:8080/static/image/Slide3.png')"></div>
            <%--                <div class="carousel-caption d-none d-md-block">--%>
            <%--                    <h3>First Slide</h3>--%>
            <%--                    <p>This is a description for the first slide.</p>--%>
            <%--                </div>--%>
            <!-- Slide Two - Set the background image for this slide in the line below -->

            <div class="carousel-item" style="background-image: url('http://localhost:8080/static/image/Slide2.png')"
                 onclick="window.open('http://localhost:8080/blog-post');"></div>
            <%--                <div class="carousel-caption d-none d-md-block">--%>
            <%--                    <h3>Second Slide</h3>--%>
            <%--                    <p>This is a description for the second slide.</p>--%>
            <%--                </div>--%>
            <!-- Slide Three - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('http://localhost:8080/static/image/Slide1.png')">
                <%--                <div class="carousel-caption d-none d-md-block">--%>
                <%--                    <h3>Third Slide</h3>--%>
                <%--                    <p>This is a description for the third slide.</p>--%>
                <%--                </div>--%>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</header>

<!-- Page Content -->
<div class="container">

    <%--    <h1 class="my-4">Welcome to Modern Business</h1>--%>


    <!-- Portfolio Section -->
    <h1 style="color: #e2a2af; font-size: 3.5rem">新 品 展 示</h1>
    <h2 style="overflow: hidden; text-align: center; background-color: transparent; background-image: url(http://localhost:8080/static/image/pink-dot.svg); background-repeat: space; background-size: auto 1em; background-position: 0 50%;">
        &nbsp;</h2>
    <div class="row">
        <c:forEach items="${ list }" var="cc">
            <div class="col-lg-4 col-sm-6 portfolio-item">
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

    <!-- Features Section -->
    <div class="row">
        <div class="col-lg-6">
            <h2>Modern Business Features</h2>
            <p>The Modern Business template by Start Bootstrap includes:</p>
            <ul>
                <li>
                    <strong>Bootstrap v4</strong>
                </li>
                <li>jQuery</li>
                <li>Font Awesome</li>
                <li>Working contact form with validation</li>
                <li>Unstyled page elements for easy customization</li>
            </ul>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis, omnis doloremque non cum id
                reprehenderit, quisquam totam aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis quia
                dolorum ducimus unde.</p>
        </div>
        <div class="col-lg-6">
            <img class="img-fluid rounded" src="http://placehold.it/700x450" alt="">
        </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Call to Action Section -->
    <div class="row mb-4">
        <div class="col-md-8">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Molestias, expedita, saepe, vero rerum deleniti
                beatae veniam harum neque nemo praesentium cum alias asperiores commodi.</p>
        </div>
        <div class="col-md-4">
            <a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a>
        </div>
    </div>

</div>
<!-- /.container -->

<%@ include file="footer.jsp" %>

</body>

</html>
