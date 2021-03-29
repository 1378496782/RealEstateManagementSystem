<%@ page import="cn.edu.xaut.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/1/12
  Time: 14:40
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
    <title>网站信息</title>
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
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 个人信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="">
            <div class="form-group">
                <div class="label">
                    <label>姓名：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <%=user.getName()%>
                    </label>
                </div>

            </div>
            <div class="form-group">
                <div class="label">
                    <label>手机：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <%=user.getTel()%>
                    </label>
                </div>

            </div>
            
            <div class="form-group">
                <div class="label">
                    <label>用户名：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <%=user.getUsername()%>
                    </label>
                </div>
                
            </div> 
        </form>
    </div>
</div>
</body></html>
