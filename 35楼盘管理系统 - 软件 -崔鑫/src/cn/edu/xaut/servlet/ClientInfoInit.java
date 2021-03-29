package cn.edu.xaut.servlet;

import cn.edu.xaut.bean.User;
import cn.edu.xaut.db.ConnDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/clientInfoInit")
public class ClientInfoInit extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        List<User> users = new ArrayList<>();
        
        // 连接数据库并查询
        try {
            String sql = "select * from tb_user";
            ResultSet rs = ConnDB.query(sql);
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("编号"));
                u.setName(rs.getString("姓名"));
                u.setUsername(rs.getString("用户名"));
                u.setPassword(rs.getString("密码"));
                u.setTel(rs.getString("手机号"));

                users.add(u);
            }

            HttpSession session = request.getSession();
            session.setAttribute("users", users);
            
            // 转发数据
            request.getRequestDispatcher("allClientInfo.jsp").forward(request, response);
            ConnDB.close(); // 释放资源
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
