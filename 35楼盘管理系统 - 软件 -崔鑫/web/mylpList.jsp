<%@ page import="cn.edu.xaut.bean.Loupan" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/1/12
  Time: 17:50
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
    List<Loupan> list = (List<Loupan>) session.getAttribute("list");
    int orderID = (int) session.getAttribute("orderID");
    int id = Integer.parseInt(request.getParameter("id"));
%>





<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 我的楼盘</strong></div>
    <div class="body-content">
        <table class="table table-hover text-center">
            <tr>
<%--                <th>订单编号</th>--%>
                <th>房屋编号</th>
                <th>房屋户型</th>
                <th>面积</th>
                <th>平方米单价</th>
                <th>总价</th>
                <th>楼盘编号</th>
                <th>楼盘名称</th>
                <th>楼盘地址</th>
                <th>楼盘开发商</th>
                <th>操作</th>
            </tr>
            
            <%
                if (list == null || list.size() == 0) {
            %>
            
            
            <%
                }
                for (Loupan lp : list) {
            %>

            <tr>
<%--                <td><%=orderID%></td>--%>
                <td><%=lp.getHouseID()%></td>
                <td><%=lp.getHouseType()%></td>
                <td><%=lp.getArea()%></td>
                <td><%=lp.getPrice()%></td>
                <td><%=lp.getSum()%></td>
                <td><%=lp.getLpID()%></td>
                <td><%=lp.getLpName()%></td>
                <td><%=lp.getAddress()%></td>
                <td><%=lp.getFac()%></td>
                <td><a href="deleteMySales?orderID=<%=orderID%>&id=<%=id%>" onclick="return confirm('确定该订单？')" class="button border-red"><span class="icon-trash-o"></span> 删除 </a></td>

            </tr>
            
            <%
                }
            %>
            
        </table>
    </div>
</div>
</body>
</html>
