<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Tables - SB Admin</title>
        <%@include file="header.jsp"%>
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%=basePath%>static/admin/js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="<%=basePath%>static/admin/assets/demo/datatables-demo.js"></script>
        <style>
            /* 触发弹窗图片的样式 */
            #myImg {
                border-radius: 5px;
                cursor: pointer;
                transition: 0.3s;
            }

            #myImg:hover {opacity: 0.7;}

            /* 弹窗背景 */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
            }

            /* 图片 */
            .modal-content {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
            }

            /* 文本内容 */
            #caption {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
                text-align: center;
                color: #ccc;
                padding: 10px 0;
                height: 150px;
            }

            /* 添加动画 */
            .modal-content, #caption {
                -webkit-animation-name: zoom;
                -webkit-animation-duration: 0.6s;
                animation-name: zoom;
                animation-duration: 0.6s;
            }

            @-webkit-keyframes zoom {
                from {-webkit-transform:scale(0)}
                to {-webkit-transform:scale(1)}
            }

            @keyframes zoom {
                from {transform:scale(0)}
                to {transform:scale(1)}
            }

            /* 关闭按钮 */
            .close {
                position: absolute;
                top: 15px;
                right: 35px;
                color: #f1f1f1;
                font-size: 40px;
                font-weight: bold;
                transition: 0.3s;
            }

            .close:hover,
            .close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }

            /* 小屏幕中图片宽度为 100% */
            @media only screen and (max-width: 700px){
                .modal-content {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
    <%@include file="nav.jsp"%>
        <div id="layoutSidenav">
            <%@include file="layoutSidenav.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Tables</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="adminindex">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>GId</th>
                                                <th>GName</th>
                                                <th>GPhoto</th>
                                                <th>GPrice</th>
                                                <th>GIntroduction</th>
                                                <th>GQuantity</th>
                                                <th>operating</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${ list }" var="cc">
                                            <tr>
                                                <td>${ cc.gId }</td>
                                                <td>${ cc.gName }</td>
                                                <td><img onclick="jQuery:imgChange('<%=basePath%>static/image/${ cc.gPhoto }')" id="myImg" src="<%=basePath%>static/image/${ cc.gPhoto }" alt="" width="108" height="129.6"></td>
                                                <td>${ cc.gPrice }</td>
                                                <td>${ cc.gIntroduction }</td>
                                                <td>${ cc.gQuantity }</td>
                                                <td></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <!-- 弹框图片 -->
                                    <div id="myModal" class="modal">
                                        <!-- 弹窗内容 -->
                                        <img class="modal-content" id="img01" src="">
                                        <!-- 关闭按钮 -->
                                        <span class="close" style="margin-top: 50px; right: 400px" onclick="document.getElementById('myModal').style.display='none'">&times;</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </body>
<script>
    function imgChange(data) {
        var modalImg = document.getElementById("img01");
        modal.style.display = "block";
        modalImg.src = data;
    }

    // // 获取图片插入到弹窗 - 使用 "alt" 属性作为文本部分的内容
    // var img = document.getElementById('myImg');
    // var modalImg = document.getElementById("img01");
    // var captionText = document.getElementById("caption");
    // img.onclick = function(){
    //     modal.style.display = "block";
    //     modalImg.src = this.src;
    //     captionText.innerHTML = this.alt;
    // };

    // 获取弹窗
    var modal = document.getElementById('myModal');

    // 获取 <span> 元素，设置关闭按钮
    var span = document.getElementsByClassName("close")[0];

    // 当点击 (x), 关闭弹窗
    span.onclick = function() {
        modal.style.display = "none";
    }
</script>
</html>
