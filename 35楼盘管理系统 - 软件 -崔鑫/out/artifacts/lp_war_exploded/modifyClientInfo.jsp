<%@ page import="cn.edu.xaut.bean.User" %>
<%@ page import="cn.edu.xaut.db.ConnDB" %>
<%@ page import="java.sql.ResultSet" %>
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
    int id = Integer.parseInt(request.getParameter("id"));

    User u = new User();
    // 连接数据库并查询
    try {
        String sql = "select * from tb_user where 编号 = " + id;
        ResultSet rs = ConnDB.query(sql);
        while (rs.next()) {
            u.setId(id);
            u.setName(rs.getString("姓名"));
            u.setUsername(rs.getString("用户名"));
            u.setPassword(rs.getString("密码"));
            u.setTel(rs.getString("手机号"));
        }
        ConnDB.close();     // 释放资源
    } catch (Exception e) {
        e.printStackTrace();
    }

%>

<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改客户信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="modifyClientInfo">
            <div class="form-group">
                <div class="label">
                    <label>客户编号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=u.getId()%>" name="id" readonly="true" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=u.getName()%>" name="name" />

                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>用户名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=u.getUsername()%>" name="username" />

                </div>
            </div><div class="form-group">
            <div class="label">
                <label>密码：</label>
            </div>
            <div class="field">
                <input type="text" class="input w50" value="<%=u.getPassword()%>" name="password" />

            </div>
        </div><div class="form-group">
            <div class="label">
                <label>手机号：</label>
            </div>
            <div class="field">
                <input type="text" class="input w50" value="<%=u.getTel()%>" name="tel" />

            </div></div>

            
            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit" id="submit" onclick="alert('保存成功！')"> 提交</button>
                    <a href="clientInfoInit" class="button bg-mix icon-backward" > 返回</a>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
