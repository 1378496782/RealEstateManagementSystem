package cn.edu.xaut.servlet;

import cn.edu.xaut.bean.User;
import cn.edu.xaut.db.ConnDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/modifyClientInfo")
public class ModifyClientInfo extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        // 接收数据
        User u = new User();
        u.setId(Integer.parseInt(request.getParameter("id")));
        u.setName(request.getParameter("name"));
        u.setUsername(request.getParameter("username"));
        u.setPassword(request.getParameter("password"));
        u.setTel(request.getParameter("tel"));
        
        // 连接数据库并修改信息
        try {
            String sql = "update tb_user set 姓名 = '" + u.getName() + "', 用户名 = '" + u.getUsername() + "', 密码 = '" + u.getPassword() + "', 手机号 = '" + u.getTel() + "' where 编号 = " + u.getId();                                                                                                             
            ConnDB.update(sql);
            ConnDB.close(); // 释放资源
            
            // 重定向
            response.sendRedirect("clientInfoInit");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
