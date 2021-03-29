package cn.edu.xaut.servlet;

import cn.edu.xaut.db.ConnDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteMySales")
public class DeleteMySales extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        // 接收数据
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        int id = Integer.parseInt(request.getParameter("id"));
        
        // 连接数据库并删除信息
        try {
            String sql = "delete from tb_sales where 订单编号 = " + orderID;
            ConnDB.update(sql);
            ConnDB.close();     // 释放资源
            
            // 重定向
            response.sendRedirect("myLPInit?id=" + id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
