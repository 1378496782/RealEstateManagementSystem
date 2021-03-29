<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
</head>
<body>

<%
    // 设置编码格式
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");

%>

<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加房屋信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="addLpServlet">

            <div class="form-group">
                <div class="label">
                    <label>房屋户型：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" id="houseType" name="houseType" placeholder="填写房屋户型" data-validate="required:请填写房屋户型"/>

                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>面积：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" id="area" name="area" placeholder="填写房屋面积" data-validate="required:请填写房屋面积"/>

                </div>
            </div><div class="form-group">
            <div class="label">
                <label>平方米单价：</label>
            </div>
            <div class="field">
                <input type="text" class="input w50" id="price" name="price" placeholder="填写房屋单价" data-validate="required:请填写房屋单价"/>

            </div>
 
            </div>
            
            <div class="form-group">
            <div class="label">
                <label>楼盘名称：</label>
            </div>
            <div class="field">
                <input type="text" class="input w50" id="lpID" name="lpID" placeholder="填写楼盘编号" data-validate="required:请填写楼盘编号"/>

            </div>
        

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field" style="padding: 30px 0 0 0">
                    <button class="button bg-main icon-check-square-o" type="submit" id="submit" onclick="return checkAdd()"> 添加</button>
                    <a href="loupanInit?mark=m" class="button bg-mix icon-backward" > 返回</a>
                </div>
            </div></div>
        </form>
    </div>
</div>

<script>
    function checkAdd() {
        if ($("#houseType").val() === "" || $("#area").val() === "" || $("#price").val() === "" || $("#lpID").val() === "") {
            alert("请填写完整的信息！");
        } else {
            alert("保存成功！");
        }
    }
</script>

</body>
</html>
