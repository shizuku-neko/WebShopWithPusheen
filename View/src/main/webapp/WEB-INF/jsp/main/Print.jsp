<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE>
<html>
<head>
    <title>
        html2canvas example
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<%=basePath%>static/other/bootstrap.css" rel="stylesheet">
    <style>
        body {
            background: #ccc
        }

        #dw {
            position: absolute;
            top: 10px;
            left: 10%;
            height: 620px;
            width: 1030px;
            background: #fff;
            border: 1px solid black;
            padding: 10px
        }

        .close {
            position: relative;
            left: 10px;
            width: 0.2em;
            height: 1em;
            background: #333;
            -webkit-transform: rotate(45deg);
            -moz-transform: rotate(45deg);
            -o-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            transform: rotate(45deg);
            display: inline-block;
        }

        .close:after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 0.2em;
            height: 1em;
            background: #333;
            -webkit-transform: rotate(270deg);
            -moz-transform: rotate(270deg);
            -o-transform: rotate(270deg);
            -ms-transform: rotate(270deg);
            transform: rotate(270deg);
        }

    </style>
</head>
<body>
<button id="renderPdf">下载订单</button>
<div id="main">
    <div class="container">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>商品号码</th>
                <th>订单号码</th>
                <th>支付流水号</th>
                <th>金额</th>
                <th>姓名</th>
                <th>邮箱</th>
                <th>地址</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${ pList.gId }</td>
                <td>${ pNum }</td>
                <td>${ cFb }</td>
                <td>${ pList.gPrice }</td>
                <td>${ uList.uName }</td>
                <td>${ uList.uEmail }</td>
                <td>${ uList.uAddress }</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>static/other/html2canvas.js"></script>
<script type="text/javascript" src="<%=basePath%>static/other/jsPdf.debug.js"></script>
<script type="text/javascript" src="<%=basePath%>static/other/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>static/other/bootstrap.js"></script>
<script type="text/javascript">

    var downPdf = document.getElementById("renderPdf");

    downPdf.onclick = function () {
        html2canvas(document.body, {
            onrendered: function (canvas) {

                var contentWidth = canvas.width;
                var contentHeight = canvas.height;

                //一页pdf显示html页面生成的canvas高度;
                var pageHeight = contentWidth / 595.28 * 841.89;
                //未生成pdf的html页面高度
                var leftHeight = contentHeight;
                //pdf页面偏移
                var position = 0;
                //a4纸的尺寸[595.28,841.89]，html页面生成的canvas在pdf中图片的宽高
                var imgWidth = 555.28;
                var imgHeight = 555.28 / contentWidth * contentHeight;

                var pageData = canvas.toDataURL('image/jpeg', 1.0);

                var pdf = new jsPDF('', 'pt', 'a4');
                //有两个高度需要区分，一个是html页面的实际高度，和生成pdf的页面高度(841.89)
                //当内容未超过pdf一页显示的范围，无需分页
                if (leftHeight < pageHeight) {
                    pdf.addImage(pageData, 'JPEG', 20, 0, imgWidth, imgHeight);
                } else {
                    while (leftHeight > 0) {
                        pdf.addImage(pageData, 'JPEG', 20, position, imgWidth, imgHeight);
                        leftHeight -= pageHeight;
                        position -= 841.89;
                        //避免添加空白页
                        if (leftHeight > 0) {
                            pdf.addPage();
                        }
                    }
                }

                pdf.save('print.pdf');
            }
        })
    }
</script>
</body>
</html>