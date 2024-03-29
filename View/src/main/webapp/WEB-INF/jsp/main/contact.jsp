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

<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Contact
        <small>Subheading</small>
    </h1>

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="index">Home</a>
        </li>
        <li class="breadcrumb-item active">Contact</li>
    </ol>

    <!-- Content Row -->
    <div class="row">
        <!-- Map Column -->
        <div class="col-lg-8 mb-4">
            <!-- Embedded Google Map -->
            <iframe
                    src=""
                    style="width: 100%; height: 400px; border: 0;"></iframe>
            <%--            <iframe style="width: 100%; height: 400px; border: 0;"--%>
            <%--                    src=""></iframe>--%>
        </div>
        <!-- Contact Details Column -->
        <div class="col-lg-4 mb-4">
            <h3>Contact Details</h3>
            <p>
                <br>中国
                <br>
            </p>
            <p>
                <abbr title="Phone">P</abbr>: (+1) 864-777-9606
            </p>
            <p>
                <abbr title="Email">E</abbr>:
                <a href="mailto:neko@neko.lv">neko@neko.lv
                </a>
            </p>
            <p>
                <abbr title="Hours">H</abbr>: Monday - Friday: 8:00 AM to 8:00 PM
            </p>
        </div>
    </div>
    <!-- /.row -->

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <div class="row">
        <div class="col-lg-8 mb-4">
            <h3>Send us a Message</h3>
            <form name="sentMessage" id="contactForm" novalidate>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>姓 名:</label>
                        <input type="text" class="form-control" id="name" required
                               data-validation-required-message="Please enter your name.">
                        <p class="help-block"></p>
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>联系电话:</label>
                        <input type="tel" class="form-control" id="phone" required
                               data-validation-required-message="Please enter your phone number.">
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>邮箱地址:</label>
                        <input type="email" class="form-control" id="email" required
                               data-validation-required-message="Please enter your email address.">
                    </div>
                </div>
                <div class="control-group form-group">
                    <div class="controls">
                        <label>信 息:</label>
                        <textarea rows="10" cols="100" class="form-control" id="message" required
                                  data-validation-required-message="Please enter your message" maxlength="999"
                                  style="resize:none"></textarea>
                    </div>
                </div>
                <div id="success"></div>
                <!-- For success/fail messages -->
                <button type="submit" class="btn btn-primary" id="sendMessageButton">Send Message</button>
            </form>
        </div>

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<%@ include file="footer.jsp" %>

<!-- Contact form JavaScript -->
<!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
<script src="<%=basePath%>/static/js/jqBootstrapValidation.js"></script>
<script src="<%=basePath%>/static/js/contact_me.js"></script>

</body>

</html>
