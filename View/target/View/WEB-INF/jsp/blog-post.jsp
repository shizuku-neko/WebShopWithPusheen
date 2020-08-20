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
    <h1 class="mt-4 mb-3" style="font-family: Roboto, Helvetica, Arial, sans-serif; margin-top: 0; font-size: 2.25rem; font-weight: 700;">
        Get Exclusive Deals & More When You Shop with the New Pusheen Shop App!
    </h1>

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="index">Home</a>
        </li>
        <li class="breadcrumb-item active">Blog post</li>
    </ol>

    <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-4">

            <!-- Preview Image -->
            <img class="" src="<%=basePath%>static/image/MobileApp.png" alt="" style="width: 450px">

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
                        <font style="-webkit-font-smoothing: antialiased; text-rendering: optimizeLegibility; box-sizing: border-box; vertical-align: inherit">Available on the App Store and Google Play</font>
                    </font>
                </h2>
                <font style="font-size: 1em">
                    <a href="https://shop.pusheen.com/app"><strong><span style="color: #e2a2af;"><font style="vertical-align: inherit;">The Pusheen Shop App !</font></span></strong></a>is now available for download on your favorite mobile device! Our new app offers a quick and easy way to browse and shop for all the latest items and newest collections available from Pusheen Shop.

                    Take advantage of the benefits when shopping using the Pusheen Shop app! Save on products you’re just waiting to pounce on and with a new Wishlist feature that makes an easy to access list! Plus when you use the app, you’ll be among the first to hear about new arrivals in the shop, along with exclusive deals!
                </font>
                <br/>
                <br/>
                <font style="font-size: 1em">
                    Take advantage of the benefits when shopping using the Pusheen Shop app! Save on products you’re just waiting to pounce on and with a new Wishlist feature that makes an easy to access list! Plus when you use the app, you’ll be among the first to hear about new arrivals in the shop, along with exclusive deals!
                </font>
            </div>

            <h2 style="overflow: hidden; text-align: center; background-color: transparent; background-image: url(<%=basePath%>static/image/pink-dot.svg); background-repeat: space; background-size: auto 1em; background-position: 0 50%;">&nbsp;</h2>

            <!-- Categories Widget -->
            <div class="my-4">
                <font style="font-size: 1em">
                    Help us celebrate the launch of the new Pusheen Shop App and save 20% on any orders placed on the app through July 30th. Just use the code<font style="font-weight: bold;">HAPPYSHOPPING</font>at checkout to receive your discount.
                </font>
                <br/>
                <br/>
                <font style="font-size: 1em">
                    Make sure to also keep an eye on the app for even more upcoming goodies, including exclusive downloadable freebies and wallpapers for your phone!
                </font>
            </div>

            <h2 style="overflow: hidden; text-align: center; background-color: transparent; background-image: url(<%=basePath%>static/image/pink-dot.svg); background-repeat: space; background-size: auto 1em; background-position: 0 50%;">&nbsp;</h2>

            <!-- Side Widget -->
            <div class="my-4">
                <font style="font-size: 1em">
                    <a href="https://shop.pusheen.com/app"><strong><span style="color: #e2a2af;"><font style="vertical-align: inherit;">The Pusheen Shop App </font></span></strong></a>is available now for download from both <strong><span style="color: #e2a2af;"><a style="color: #e2a2af;" href="https://apps.apple.com/us/app/id1521915205"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> App Store</font></font></a></span></strong> and <strong><span style="color: #e2a2af;"><a style="color: #e2a2af;" href="https://play.google.com/store/apps/details?id=co.tapcart.app.id_Tufs7pE3Tq"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> Google Play</font></font></a></span></strong>
                </font>
                <br/>
                <br/>
                <font style="font-size: 1em">
                    Get the app and start shopping today!
                </font>
            </div>

        </div>

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<%@ include file="footer.jsp" %>

</body>

</html>
