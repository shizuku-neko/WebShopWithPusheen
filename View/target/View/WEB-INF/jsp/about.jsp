
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
    <h1 class="mt-4 mb-3">About
        <small>Subheading</small>
    </h1>

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="index">Home</a>
        </li>
        <li class="breadcrumb-item active">关于</li>
    </ol>

    <!-- Intro Content -->
    <div class="row">
        <div class="col-lg-6">
            <img class="rounded mb-4" src="<%=basePath%>static/image/pusheen.gif" alt="" style="max-width: 100%; height: 100%;">
        </div>
        <div class="col-lg-6">
            <h2 style="text-align:center"><span style="color: #e2a2af">WHO IS PUSHEEN?</span></h2>
            <p style="text-align:center">Pusheen is a tubby tabby cat who brings smiles and laughter to people all around the world. She became famous through her animated comics and GIFs posted on Pusheen.com, as well as through her widely used animated stickers on Facebook, Instagram, iMessage, and other platforms.</p>
            <h3 style="font-weight: bold; text-align:center">PROFILE</h3>
            <p style="text-align:center">
                <span style="font-weight: bold">Name:</span> Pusheen <br/>
                <span style="font-weight: bold">Gender:</span> Girl <br/>
                <span style="font-weight: bold">Age:</span> All 9 lives left <br/>
                <span style="font-weight: bold">Birthday:</span> February 18th <br/>
                <span style="font-weight: bold">Best Feature:</span> Toes look like beans <br/></p>
        </div>
    </div>
    <!-- /.row -->
    <br/>
    <br/>
    <!-- Team Members -->
    <h2 style="text-align:center"><span style="color: #e2a2af">ABOUT PUSHEEN CORP.</span></h2>

    <div class="col-lg-12">
        <p style="text-align:center">
            Pusheen Corp. is an Illinois-based company dedicated to bringing smiles to the faces of fans around the world. Founded in 2010, Pusheen Corp. develops Pusheen content and products, working with more than 100 licensees globally. Pusheen herself made her first appearance online in a 2010 short series of comics by Creator/Founder Claire Belton written together with Co-Founder, Andrew Duff. That project,<a href="http://everyday-cute.tumblr.com/"><span style="color: #e2a2af" onmouseover="function x() {}"> Everyday Cute,</span></a> quickly spun off into <a href="http://pusheen.tumblr.com/"><span style="color: #e2a2af" onmouseover="function x() {}"> the original Pusheen.com Tumblr blog.</span></a> Within a short period of time, the comics and GIFs posted to Tumblr became a viral sensation, with images of Pusheen being shared across the internet hundreds of thousands of times every week.
        </p>
            <br/>
        <p style="text-align:center">
            In 2013, a comic compilation titled “I am Pusheen the Cat” was published by Simon & Schuster, which has since been translated into more than 12 languages. That same year, Facebook’s “chat sticker” feature launched, in which licensed Pusheen images were made available as emoji-style graphics to over one billion users, sending the cute kitty into super stardom overnight. It is estimated that Pusheen images and GIFs have been sent between friends more than 20 billion times across popular social media platforms since her creation.
        </p>
            <br/>
        <p style="text-align:center">
            Today, the Pusheen brand is a global phenomenon with a growing cast of characters, tens of millions of fans worldwide, and licensed merchandise available in more than 60 countries.
        </p>
    </div>
    <!-- /.row -->

    <!-- Our Customers -->
    <h2 style="text-align:center"><span style="color: #e2a2af">MORE PUSHEEN!!!</span></h2>
    <div class="row">
        <div class="col-lg-2 col-sm-4 mb-4">
            <img class="img-fluid" src="<%=basePath%>static/image/partner1.gif" alt="">
        </div>
        <div class="col-lg-2 col-sm-4 mb-4">
            <img class="img-fluid" src="<%=basePath%>static/image/partner2.gif" alt="">
        </div>
        <div class="col-lg-2 col-sm-4 mb-4">
            <img class="img-fluid" src="<%=basePath%>static/image/partner3.gif" alt="">
        </div>
        <div class="col-lg-2 col-sm-4 mb-4">
            <img class="img-fluid" src="<%=basePath%>static/image/partner4.gif" alt="">
        </div>
        <div class="col-lg-2 col-sm-4 mb-4">
            <img class="img-fluid" src="<%=basePath%>static/image/partner5.gif" alt="">
        </div>
        <div class="col-lg-2 col-sm-4 mb-4">
            <img class="img-fluid" src="<%=basePath%>static/image/partner6.gif" alt="">
        </div>
    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<%@ include file="footer.jsp" %>

</body>


</html>
