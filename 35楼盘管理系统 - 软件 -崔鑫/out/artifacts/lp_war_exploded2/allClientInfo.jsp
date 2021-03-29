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
            <a class="button border-yellow" href=""><span class="icon-plus-square-o"></span> 添加内容</a>
        </div>

        <table class="table table-hover text-center">
            <tr>
                <th>编号</th>
                <th>姓名</th>
                <th>用户名</th>
                <th>密码</th>
                <th>手机号</th>
                <th>操作</th>

            </tr>

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
                        <a class="button border-main" href="#"><span class="icon-edit"></span> 修改</a>
                        <a class="button border-red" href="#" onclick="return confirm('确定删除该客户？')"><span class="icon-trash-o"></span> 删除</a>
                    </div></td>
                </tr>
            
            <%       
                }
            %>
            
            
            <%--<tr>
                <td>1</td>
                <td>张富伟</td>
                <td>zfw</td>
                <td>123</td>
                <td>13835956459</td>
                <td><div class="button-group">
                    <a class="button border-main" href="#"><span class="icon-edit"></span> 修改</a>
                    <a class="button border-red" href="#" onclick="return confirm('确定删除该客户？')"><span class="icon-trash-o"></span> 删除</a>
                </div></td>
            </tr>

            <tr>
                <td>1</td>
                <td>张富伟</td>
                <td>zfw</td>
                <td>123</td>
                <td>13835956459</td>
                <td><div class="button-group">
                    <a class="button border-main" href="#"><span class="icon-edit"></span> 修改</a>
                    <a class="button border-red" href="#" onclick="return confirm('确定删除该客户？')"><span class="icon-trash-o"></span> 删除</a>
                </div></td>
            </tr>

            <tr>
                <td>1</td>
                <td>张富伟</td>
                <td>zfw</td>
                <td>123</td>
                <td>13835956459</td>
                <td><div class="button-group">
                    <a class="button border-main" href="#"><span class="icon-edit"></span> 修改</a>
                    <a class="button border-red" href="#" onclick="return confirm('确定删除该客户？')"><span class="icon-trash-o"></span> 删除</a>
                </div></td>
            </tr>

            <tr>
                <td>1</td>
                <td>张富伟</td>
                <td>zfw</td>
                <td>123</td>
                <td>13835956459</td>
                <td><div class="button-group">
                    <a class="button border-main" href="#"><span class="icon-edit"></span> 修改</a>
                    <a class="button border-red" href="#" onclick="return confirm('确定删除该客户？')"><span class="icon-trash-o"></span> 删除</a>
                </div></td>
            </tr>--%>
            
        </table>
    </div>
</form>
</div>
</div>
</body></html>
