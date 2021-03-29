<%@ page import="java.util.List" %>
<%@ page import="cn.edu.xaut.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/1/12
  Time: 21:39
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
    List<User> users = (List<User>) session.getAttribute("users");
    
%>


<form method="post" action="" id="listform">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>

        <div class="padding border-bottom">

            <input type="text" placeholder="请输入搜索关键字" name="searchText" id="searchText" class="input" style="width:250px; line-height:17px;display:inline-block" />
            <a href="" id="find" class="button border-main icon-search"> 搜索</a>


            <a class="button border-yellow" href="addClient.jsp?x=1"><span class="icon-plus-square-o"></span> 添加内容</a>
            
        </div>

        

        <table class="table table-hover text-center">
            <thead>
            <tr>
                <th>编号</th>
                <th>姓名</th>
                <th>用户名</th>
                <th>密码</th>
                <th>手机号</th>
                <th>操作</th>

            </tr>
            </thead>

            <tbody>
            
            <%
                for (User u : users) {
            %>
                
                <tr>
                    <td><%=u.getId()%></td>
                    <td><%=u.getName()%></td>
                    <td><%=u.getUsername()%></td>
                    <td><%=u.getPassword()%></td>
                    <td><%=u.getTel()%></td>
                    <td><div class="button-group">
                        <a class="button border-main" href="modifyClientInfo.jsp?id=<%=u.getId()%>"><span class="icon-edit"></span> 修改</a>
                        <a class="button border-red" href="deleteClientInfo?id=<%=u.getId()%>" onclick="return confirm('确定删除该客户？')"><span class="icon-trash-o"></span> 删除</a>
                    </div></td>
                </tr>
            
            <%       
                }
            %>

            </tbody>
            
        </table>
    </div>
</form>
</div>
</div>

<script>
    $(function () {
        
        $("#find").click(function () {
            $.post(
                "findProcess",         // 参数1：url
                {           // 参数2: 传递的数据
                    searchText: $("#searchText").val()
                },
                function (json) {   // 参数3：回调函数

                    if (json.length === 0) {
                        alert("未查询到客户信息，请重新输入……");
                        $("#searchText").val("");
                    } else {
                        $("tbody").empty();     // 清空 tbody 的内容
                        $.each(json, function (index, c) {
                            // 向 tbody 中添加内容
                            var id = $("<td></td>").append(c.id);
                            var name = $("<td></td>").append(c.name);
                            var username = $("<td></td>").append(c.username);
                            var password = $("<td></td>").append(c.password);
                            var tel = $("<td></td>").append(c.tel);

                            var tr = $("<tr></tr>").append(id, name, username, password, tel);
                            $("table>tbody").append(tr);

                        })
                    }
                }
            )
        })
    })
</script>


</body>
</html>
