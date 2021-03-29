<%@ page import="cn.edu.xaut.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/1/12
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
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

    // 接收数据
    User user = (User) session.getAttribute("user");
%>


<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 修改密码</strong></div>
    <div class="body-content">
        <form class="form-x" action="passModify">
            <div class="form-group">
                <div class="label">
                    <label>用户名：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" class="input w50" id="username" name="username" size="50" value="<%=user.getUsername()%>"/>
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="mpass">原始密码：</label>
                </div>
                <div class="field">
<%--                    <%=user.getPassword()%>--%>
<%--                    <input type="password" id="mpass">--%>
                    <input type="password" class="input w50" id="mpass" name="mpass" size="50" placeholder="请输入原始密码" data-validate="required:请输入原始密码" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="newpass">新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" id="newpass" name="newpass" size="50" placeholder="请输入新密码" data-validate="required:请输入新密码,length#>=5:新密码不能小于5位" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label for="renewpass">确认新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" id="renewpass" name="renewpass" size="50" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码,repeat#newpass:两次输入的密码不一致" />
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" id="submit" type="submit"> 提交</button>
                </div>
            </div>
        </form>
    </div>
</div>



<script>
    
    $(function () {

        $("#submit").click(function () {
            
            // 注意此处的字符类型转换，很容易出错
            if (parseInt($("#mpass").val()) !== <%=Integer.parseInt(user.getPassword())%>) {
                alert("原始密码不正确！");
            } else {
                alert("保存成功！");
            }
        })
    })
</script>

</body>
</html>
