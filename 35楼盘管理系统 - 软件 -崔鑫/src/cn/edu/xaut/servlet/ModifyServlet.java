package cn.edu.xaut.servlet;

import cn.edu.xaut.bean.Loupan;
import cn.edu.xaut.db.ConnDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/modifyServlet")
public class ModifyServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        
        // 接收数据
        Loupan lp = new Loupan();
        lp.setHouseID(request.getParameter("houseID"));
        lp.setHouseType(request.getParameter("houseType"));
        lp.setArea(Integer.parseInt(request.getParameter("area")));
        lp.setPrice(Integer.parseInt(request.getParameter("price")));
        lp.setSum(Integer.parseInt(request.getParameter("area")) * Integer.parseInt(request.getParameter("price")));
        lp.setLpID(request.getParameter("lpID"));
        lp.setLpName(request.getParameter("lpName"));
        lp.setAddress(request.getParameter("address"));
        lp.setFac(request.getParameter("fac"));
        
        
        // 连接数据库并修改数据
        try {

            String sql1 = "update tb_house set 户型 = '" + lp.getHouseType() + "', 面积 = " + lp.getArea() + ", 平方米单价 = " + lp.getPrice() + ", 总价 = " + (lp.getPrice() * lp.getArea()) + " where 编号 = '" + lp.getHouseID() + "'";                                                                                                                                                                                                                             
            String sql2 = "update tb_loupan set 名称 = '" + lp.getLpName() + "', 地址 = '" + lp.getAddress() + "', 开发商 = '" + lp.getFac() + "' where 编号 = '" + lp.getLpID() + "'";
            ConnDB.update(sql1);
            ConnDB.update(sql2);
            
            ConnDB.close(); // 释放资源
            
            
            // 重定向
            response.sendRedirect("loupanInit?mark=m");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
