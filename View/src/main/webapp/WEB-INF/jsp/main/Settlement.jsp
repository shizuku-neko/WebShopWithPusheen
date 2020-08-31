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
                </tr>
                <tr>
                    <td>
                        商品名称: ${ pList.gName }
                    </td>
                </tr>
                <tr>
                    <td>
                        商品价格: $${ pList.gPrice }
                    </td>
                </tr>
            </table>
        </div>
        <form action="conformShop" method="post">
            <div class="col-lg-6">
                <div class="col-lg-6">
                    ! 请认真核对 !
                    地址:
                    <input type="text" placeholder="${ uList.uAddress }" name="uAddress">
                    联系方式:
                    <input type="email" placeholder="${ uList.uEmail }" name="uEmail">
                    姓名:
                    <input type="text" placeholder="${ uList.uName }" name="uName">
                </div>
                <div class="col-lg-6">
                    支付方式:
                    信用卡号:
                    <input id="cardNumber" type="text" value="${ uList.uCreditCard }" onblur="jQuery:creditCard()"
                           name="uCreditCard">
                    <span id="CardSpan"></span>
                    <div style="display: none">
                        <input type="text" name="pId" value="${ pList.gId }">
                    </div>
                    <input type="submit" value="提交订单" id="submitInput">
                </div>
            </div>
        </form>
    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<%@ include file="footer.jsp" %>

</body>
<script>
    $(document).ready(function () {
        var $CardNumber = $(" input[ id='cardNumber' ]").val();
        if ($CardNumber == null) {
            $("#submitInput").prop('disabled', true);
        }
    });

    function creditCard() {
        var $CardNumber = $(" input[ id='cardNumber' ]").val();
        if ($CardNumber == null) {
            $("#submitInput").prop('disabled', true);
            return;
        }
        var formData = new FormData();
        formData.append("CardNumber", $CardNumber);
        $.ajax({
            url: '/CreditCardVerify',
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                console.log(data);
                if (num != 1) {
                    $("#CardSpan").append(
                        "<p style='color: red'>信用卡号不正确</p>"
                    );
                    $("#submitInput").prop('disabled', true);
                } else {
                    $("#CardSpan").append(
                        "<p style='color: greenyellow'>信用卡可用</p>"
                    );
                    $("#submitInput").prop('disabled', false);
                }
            }
        })
    }
</script>
</html>
