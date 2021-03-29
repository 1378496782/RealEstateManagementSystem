package cn.edu.xaut.servlet;

import cn.edu.xaut.db.ConnDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/buyServlet")
public class BuyServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        
        // 接收数据
        int id = Integer.parseInt(request.getParameter("id"));
        int houseID = Integer.parseInt(request.getParameter("houseID"));
        
        // 连接数据库并修改数据
        try {
            String sql = "insert into tb_sales values(null, " + id + ", " + houseID + ")";
            ConnDB.update(sql);
            ConnDB.close();     // 释放资源
            
            // 重定向
            response.sendRedirect("loupanInit?mark=c&id=" + id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
