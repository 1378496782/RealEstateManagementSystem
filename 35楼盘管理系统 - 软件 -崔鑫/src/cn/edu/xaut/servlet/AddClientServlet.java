package cn.edu.xaut.servlet;

import cn.edu.xaut.db.ConnDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addClientServlet")
public class AddClientServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        // 接收数据
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String tel = request.getParameter("tel");
        int x = Integer.parseInt(request.getParameter("x"));
        
        // 连接数据库并添加信息
        try {
            String sql = "insert into tb_user values(null, '" + name + "', '" + username + "', '" + password + "', '" + tel + "', null)";                                                                               
            ConnDB.update(sql);
            ConnDB.close();     // 释放资源
            
            // 重定向
            if (x == 1)
                response.sendRedirect("clientInfoInit");
            else 
                response.sendRedirect("loginSuccess.html");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
