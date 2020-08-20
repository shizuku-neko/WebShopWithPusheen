<%--
  Created by IntelliJ IDEA.
  User: Shizuku
  Date: 2020/8/10
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Navigation -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index">Shizuku_neko</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="about">关 于</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="services">服 务</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact">联系我们</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        Portfolio
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                        <a class="dropdown-item" href="portfolio-1-col">1 Column Portfolio</a>
                        <a class="dropdown-item" href="portfolio-2-col">2 Column Portfolio</a>
                        <a class="dropdown-item" href="portfolio-3-col">3 Column Portfolio</a>
                        <a class="dropdown-item" href="portfolio-4-col">4 Column Portfolio</a>
                        <a class="dropdown-item" href="portfolio-item">Single Portfolio Item</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        Blog
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                        <a class="dropdown-item" href="blog-home-1">Blog Home 1</a>
                        <a class="dropdown-item" href="blog-home-2">Blog Home 2</a>
                        <a class="dropdown-item" href="blog-post">Blog Post</a>
                    </div>
                </li>
                <li class="nav-item active dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        Other Pages
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                        <a class="dropdown-item" href="full-width">Full Width Page</a>
                        <a class="dropdown-item" href="sidebar">Sidebar Page</a>
                        <a class="dropdown-item" href="faq">faq</a>
                        <a class="dropdown-item active" href="404">404</a>
                        <a class="dropdown-item" href="pricing">Pricing Table</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
