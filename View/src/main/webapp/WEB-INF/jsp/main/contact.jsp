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
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3298.0704960159314!2d117.1931305239811!3d34.24674475604742!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa2be4f9bc4976d2!2z5YyX5aSn6Z2S6bif5Lit5Y2a6L2v5Lu25a2m6Zmi!5e0!3m2!1szh-CN!2sus!4v1597024455370!5m2!1szh-CN!2sus"
                    style="width: 100%; height: 400px; border: 0;"></iframe>
            <%--            <iframe style="width: 100%; height: 400px; border: 0;"--%>
            <%--                    src="http://maps.google.com/maps?hl=en&amp;ie=UTF8&amp;ll=37.0625,-95.677068&amp;spn=56.506174,79.013672&amp;t=m&amp;z=4&amp;output=embed"></iframe>--%>
        </div>
        <!-- Contact Details Column -->
        <div class="col-lg-4 mb-4">
            <h3>Contact Details</h3>
            <p>
                解放路 解放南路181号 (221009)
                <br>中国 江苏省 徐州市 云龙区
                <br>
            </p>
            <p>
                <abbr title="Phone">P</abbr>: (+1) 864-777-9606
            </p>
            <p>
                <abbr title="Email">E</abbr>:
                <a href="mailto:neko@neko.lc">neko@neko.lv
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
