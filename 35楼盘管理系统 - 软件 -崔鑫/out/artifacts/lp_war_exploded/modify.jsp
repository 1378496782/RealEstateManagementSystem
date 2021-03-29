<%@ page import="cn.edu.xaut.db.ConnDB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="cn.edu.xaut.bean.Loupan" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2021/1/13
  Time: 10:57
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
    String houseID = request.getParameter("houseID");
    String lpID = request.getParameter("lpID");

    Loupan lp = new Loupan();
    // 连接数据库并查询
    try {
        String sql1 = "select *\n" +
                "from tb_house\n" +
                "WHERE 编号 = '" + houseID + "'";
        String sql2 = "select *\n" +
                "from tb_loupan\n" +
                "where 编号 = '" + lpID + "'";
        ResultSet rs1 = ConnDB.query(sql1);
        
        while (rs1.next()) {
            lp.setHouseID(rs1.getString("编号"));
            lp.setHouseType(rs1.getString("户型"));
            lp.setArea(rs1.getInt("面积"));
            lp.setPrice(rs1.getInt("平方米单价"));
            lp.setSum(lp.getArea() * lp.getPrice());
            lp.setLpID(rs1.getString("楼盘编号"));
        }
        ResultSet rs2 = ConnDB.query(sql2);
        while (rs2.next()) {
            lp.setLpName(rs2.getString("名称"));
            lp.setAddress(rs2.getString("地址"));
            lp.setFac(rs2.getString("开发商"));
        }
        
        ConnDB.close(); // 释放资源
    } catch (Exception e) {
        e.printStackTrace();
    }
    
%>

<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改楼盘信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="modifyServlet">
            <div class="form-group">
                <div class="label">
                    <label>房屋编号：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=houseID%>" name="houseID" readonly="true" />
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>房屋户型：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=lp.getHouseType()%>" name="houseType" />

                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>面积：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="<%=lp.getArea()%>" name="area" />

                </div>
            </div><div class="form-group">
            <div class="label">
                <label>平方米单价：</label>
            </div>
            <div class="field">
                <input type="text" class="input w50" value="<%=lp.getPrice()%>" name="price" />

            </div>
        </div><div class="form-group">
            <div class="label">
                <label>楼盘编号：</label>
            </div>
            <div class="field">
                <input type="text" class="input w50" value="<%=lp.getLpID()%>" name="lpID" readonly="true" />

            </div>
        </div><div class="form-group">
            <div class="label">
                <label>楼盘名称：</label>
            </div>
            <div class="field">
                <input type="text" class="input w50" value="<%=lp.getLpName()%>" name="lpName" />

            </div>
        </div><div class="form-group">
            <div class="label">
                <label>楼盘地址：</label>
            </div>
            <div class="field">
                <input type="text" class="input w50" value="<%=lp.getAddress()%>" name="address" />

            </div>
        </div><div class="form-group">
            <div class="label">
                <label>楼盘开发商：</label>
            </div>
            <div class="field">
                <input type="text" class="input w50" value="<%=lp.getFac()%>" name="fac" />

            </div>
        </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit" id="submit" onclick="alert('保存成功！')"> 提交</button>
                    <a href="loupanInit?mark=m" class="button bg-mix icon-backward" > 返回</a>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
