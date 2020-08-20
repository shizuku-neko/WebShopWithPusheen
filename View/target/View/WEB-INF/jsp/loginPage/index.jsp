<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />
  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="<%=basePath%>static/loginPage/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="<%=basePath%>static/loginPage/css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="<%=basePath%>static/loginPage/css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="<%=basePath%>static/loginPage/css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="<%=basePath%>static/loginPage/css/magnific-popup.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="<%=basePath%>static/loginPage/css/owl.carousel.min.css">
	<link rel="stylesheet" href="<%=basePath%>static/loginPage/css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="<%=basePath%>static/loginPage/css/style.css">

	<!-- Modernizr JS -->
	<script src="<%=basePath%>static/loginPage/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->

	</head>
	<body>
		
	<div class="gtco-loader"></div>
	
	<div id="page">

	
	<div class="page-inner">
        <nav class="gtco-nav" role="navigation">
            <div class="gtco-container">
                <div class="row">
                    <div class="col-sm-4 col-xs-12">
                        <div id="gtco-logo"><a href="index.jsp">Shizuku_neko <em>.</em></a></div>
                    </div>
                    <div class="col-xs-8 text-right menu-1">
                        <ul>
                            <li class="btn-cta"><a href="index"><span>Back To Shop</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
	
        <header id="gtco-header" class="gtco-cover" role="banner" style="background-image: url(<%=basePath%>static/loginPage/images/img_4.jpg)">
            <div class="overlay"></div>
            <div class="gtco-container">
                <div class="row">
                    <div class="col-md-12 col-md-offset-0 text-left">


                        <div class="row row-mt-15em">
                            <div class="col-md-7 mt-text animate-box" data-animate-effect="fadeInUp">
                                <span class="intro-text-small">Welcome to Pusheen Shop</span>
                                <h1>Build By Shizuku_neko</h1>
                            </div>
                            <div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
                                <div class="form-wrap">
                                    <div class="tab">
                                        <ul class="tab-menu">
                                            <li class="active gtco-first"><a href="#" data-tab="signup">Sign up</a></li>
                                            <li class="gtco-second"><a href="#" data-tab="login">Login</a></li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-content-inner active" data-content="signup">
                                                <form action="<%=basePath%>reg" method="post" >
                                                    <div class="row form-group">
                                                        <div class="col-md-12">
                                                            <label for="uName">UserName</label>
                                                            <input type="text" class="form-control" id="uName" name="uName">
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col-md-12">
                                                            <label for="uEmail">Email</label>
                                                            <input type="text" class="form-control" id="uEmail" name="uEmail">
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col-md-12">
                                                            <label for="uPwd">Password</label>
                                                            <input type="password" class="form-control" id="uPwd" name="uPwd">
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col-md-12">
                                                            <label for="uPwdConfig">Repeat Password</label>
                                                            <input type="password" class="form-control" id="uPwdConfig">
                                                        </div>
                                                    </div>

                                                    <div class="row form-group">
                                                        <div class="col-md-12">
                                                            <input type="submit" class="btn btn-primary" value="Sign up">
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>

                                            <div class="tab-content-inner" data-content="login">
                                                <form action="<%=basePath%>login" method="post">
                                                    <div class="row form-group">
                                                        <div class="col-md-12">
                                                            <label for="uEmail">Email</label>
                                                            <input type="text" class="form-control" id="uEmail" name="uName">
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col-md-12">
                                                            <label for="uPwd">Password</label>
                                                            <input type="password" class="form-control" id="uPwd" name="uPwd">
                                                        </div>
                                                    </div>

                                                    <div class="row form-group">
                                                        <div class="col-md-12">
                                                            <input type="submit" class="btn btn-primary" value="Login">
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </div>

	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>

	<!-- jQuery -->
	<script src="<%=basePath%>static/loginPage/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="<%=basePath%>static/loginPage/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="<%=basePath%>static/loginPage/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="<%=basePath%>static/loginPage/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="<%=basePath%>static/loginPage/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="<%=basePath%>static/loginPage/js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script src="<%=basePath%>static/loginPage/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=basePath%>static/loginPage/js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="<%=basePath%>static/loginPage/js/main.js"></script>

	</body>
</html>

