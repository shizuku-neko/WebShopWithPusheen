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

    <!-- Page Heading/Breadcrumbs 结算页面 -->
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
        <div class="col-lg-3">
            <img src="<%=basePath%>static/image/${ pList.gPhoto }" width="260">
        </div>
        <div class="col-lg-3">
            <table>
                <tr>
                    <td>
                        商品Id: ${ pList.gId }
                    </td>
                    <td>
                        商品名称: ${ pList.gName }
                    </td>
                    <td>
                        商品价格: $${ pList.gPrice }
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-lg-3">
            ! 请认真核对 !
            地址:
            <input type="text" placeholder="${ uList.uAddress }">
            联系方式:
            <input type="email" placeholder="${ uList.uEmail }">
            姓名:
            <input type="text" placeholder="${ uList.uName }">
        </div>
        <div class="col-lg-3">
            支付方式:
            信用卡号:
            <input type="number" placeholder="${ uList.uCreditCard }">
        </div>
    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<%@ include file="footer.jsp" %>

</body>
</html>
