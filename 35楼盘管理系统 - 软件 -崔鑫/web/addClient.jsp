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

    int x = Integer.parseInt(request.getParameter("x"));

%>

<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加客户信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="addClientServlet?x=<%=x%>">

            <div class="form-group">
                <div class="label">
                    <label>姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" id="name" name="name" placeholder="填写姓名" data-validate="required:请填写姓名"/>

                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>用户名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" id="username" name="username" placeholder="填写用户名" data-validate="required:请填写用户名"/>

                </div>
            </div><div class="form-group">
            <div class="label">
                <label>密码：</label>
            </div>
            <div class="field">
                <input type="password" class="input w50" id="password" name="password" placeholder="填写密码" data-validate="required:请填写密码" />

            </div>
        </div><div class="form-group">
            <div class="label">
                <label>手机号：</label>
            </div>
            <div class="field">
                <input type="text" class="input w50" id="tel" name="tel" placeholder="填写手机号" data-validate="required:请填写手机号"/>

            </div></div>


            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit" id="submit" onclick="return checkAdd()"> 提交</button>
                    <a href="clientInfoInit" class="button bg-mix icon-backward" > 返回</a>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    function checkAdd() {
        if ($("#name").val() === "" || $("#username").val() === "" || $("#password").val() === "" || $("#tel").val() === "") {
            alert("请填写完整的信息！");
        } else {
            alert("保存成功！");
        }
    }
</script>

</body>
</html>
