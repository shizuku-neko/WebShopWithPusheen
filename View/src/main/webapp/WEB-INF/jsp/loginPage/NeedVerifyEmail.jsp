<%--
  Created by IntelliJ IDEA.
  User: Shizuku
  Date: 2020/8/31
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Email</title>
</head>
<body>
<h2>请 验 证 邮 箱</h2>
<a href="reVerify?verifyEmail=${ uList.uEmail }">
    <h2>单击此处重发验证码</h2>
    <div style="display: none">
        <h1>${ uList.uEmail }</h1>
    </div>
</a>
</body>
</html>
