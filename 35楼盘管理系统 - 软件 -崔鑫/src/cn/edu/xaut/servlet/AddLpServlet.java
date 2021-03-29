package cn.edu.xaut.servlet;

import cn.edu.xaut.db.ConnDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addLpServlet")
public class AddLpServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        // 获取数据
        String houseType = request.getParameter("houseType");
        int area = Integer.parseInt(request.getParameter("area"));
        int price = Integer.parseInt(request.getParameter("price"));
        int lpID = Integer.parseInt(request.getParameter("lpID"));

        
        // 连接数据库并添加信息
        try {
            String sql = "insert into tb_house values(null, '" + houseType + "', " + area + ", " + price + ", " + (area * price) + ", " + lpID + ")";                                                                                        
            ConnDB.update(sql);
            
            ConnDB.close();
            
            // 重定向
            response.sendRedirect("loupanInit?mark=m");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
