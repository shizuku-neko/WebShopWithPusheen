<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Charts - SB Admin</title>
    <%@include file="header.jsp" %>
</head>
<body class="sb-nav-fixed">
<%@include file="nav.jsp" %>
<div id="layoutSidenav">
    <%@include file="layoutSidenav.jsp" %>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <h1 class="mt-4">Charts</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="adminindex">Dashboard</a></li>
                    <li class="breadcrumb-item active">Charts</li>
                </ol>
                <div class="card mb-4">
                    <div class="card-body">
                        <form method="post" enctype="multipart/form-data">
                            <table>
                                <tr>
                                    <td> ID:<span>${ list.gId }</span></td>
                                </tr>
                                <tr>
                                    <td>GoodsName:<input type="text" value="${ list.gName }" id="gName"></td>
                                </tr>
                                <tr>
                                    <td>GoodsPhoto:
                                        <div id="localImag">
                                            <img type="file" id="files"
                                                 src="<%=basePath%>static/image/${ list.gPhoto }" width="150"
                                                 height="180"
                                                 style="display: block; width: 150px;" alt="">
                                        </div>
                                        <input type="file" name="file" id="doc" style="width:150px;"
                                               onchange="javascript:setImagePreview();">
                                    </td>

                                </tr>
                                <tr>
                                    <td>GoodsPrice:<input type="text" value="${ list.gPrice }" id="gPrice"></td>
                                </tr>
                                <tr>
                                    <td>GoodsIntroduction:<input type="text" value="${ list.gIntroduction }"
                                                                 id="gIntroduction"></td>
                                </tr>
                                <tr>
                                    <td>GoodsQuantity:<input type="text" value="${ list.gQuantity }" id="gQuantity">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <button type="button"
                                                class="btn btn-secondary"
                                                onclick="goBack()">
                                            Close And Back
                                        </button>
                                        <button type="button"
                                                class="btn btn-primary"
                                                onclick="updateData(${ list.gId })">
                                            Save Change
                                        </button>
                                    </td>
                                </tr>
                            </table>
                        </form>
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="<%=basePath%>static/admin/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="<%=basePath%>static/admin/assets/demo/chart-area-demo.js"></script>
<script src="<%=basePath%>static/admin/assets/demo/chart-bar-demo.js"></script>
<script src="<%=basePath%>static/admin/assets/demo/chart-pie-demo.js"></script>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
    function goBack() {
        history.back();
    }

    function setImagePreview(avalue) {
        var docObj = document.getElementById("doc");
        var imgObjPreview = document.getElementById("preview");
        if (docObj.files && docObj.files[0]) {
            //火狐下，直接设img属性
            imgObjPreview.style.display = 'block';
            imgObjPreview.style.width = '150px';
            imgObjPreview.style.height = '180px';
            //imgObjPreview.src = docObj.files[0].getAsDataURL();

            //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
            imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
        } else {
            //IE下，使用滤镜
            docObj.select();
            var imgSrc = document.selection.createRange().text;
            var localImagId = document.getElementById("localImag");
            //必须设置初始大小
            localImagId.style.width = "150px";
            localImagId.style.height = "180px";
            //图片异常的捕捉，防止用户修改后缀来伪造图片
            try {
                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            } catch (e) {
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            imgObjPreview.style.display = 'none';
            document.selection.empty();
        }
        return true;
    }

    function updateData(state) {
        var formData = new FormData();
        formData.append("id", state);
        formData.append("gName", $(" input[ id='gName' ]").val());
        formData.append("gPrice", $(" input[ id='gPrice' ]").val());
        formData.append("gIntroduction", $(" input[ id='gIntroduction' ]").val());
        formData.append("gQuantity", $(" input[ id='gQuant  ity' ]").val());
        formData.append("files", $(" img[ id='files' ]")[0].img);
        if (formData.get("files") == null || formData.get("files") == "") {
            formData.delete("file");
        }
        // var $goodsName = $(" input[ id='goodsName' ]").val();
        // var $goodsPrice = $(" input[ id='goodsPrice' ]").val();
        // var $goodsQuantity = $(" input[ id='goodsQuantity' ]").val();
        // var $goodsIntroduction = $(" input[ id='goodsIntroduction' ]").val();
        $.ajax({
            url: '/updateCouponState',
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                console.log(data);
                console.log(data.countNum);
                if (data.countNum == 1) {
                    alert("修改成功");
                    history.go(-1);
                } else {
                    alert("修改失败");
                }
            }
        });
    }
</script>
</html>
