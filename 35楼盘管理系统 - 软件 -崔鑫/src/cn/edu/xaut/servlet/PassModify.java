package cn.edu.xaut.servlet;

import cn.edu.xaut.db.ConnDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/passModify")
public class PassModify extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        
        // 接收数据
        String newpass = request.getParameter("newpass");
        String username = request.getParameter("username");

        // 用来测试
//        PrintWriter out = response.getWriter();
//        out.println(12);
//        out.println(newpass);
//        out.println(username);
        
        // 连接数据库
        try {
            String sql = "update tb_user set 用户名 = '" + username + "', 密码 = '" + newpass + "' where 用户名 = '" + username + "'";             
            ConnDB.update(sql);
            ConnDB.close(); // 释放资源
            
            response.sendRedirect("pass.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
