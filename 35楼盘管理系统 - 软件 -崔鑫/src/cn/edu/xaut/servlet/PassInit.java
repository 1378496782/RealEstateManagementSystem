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

@WebServlet("/passInit")
public class PassInit extends HttpServlet {

    public PassInit() {
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        // 获取参数
//        String id = request.getParameter("id");
        int id = Integer.parseInt(request.getParameter("id"));


        User user = new User();
        // 连接数据库并查询
        try {
            String sql = "select * from tb_user where 编号 = " + id;                // 查询语句
            ResultSet rs = ConnDB.query(sql);
            while (rs.next()) {
                String name = rs.getString("姓名");
                String username = rs.getString("用户名");
                String password = rs.getString("密码");
                String tel = rs.getString("手机号");

                user.setId(id);
                user.setName(name);
                user.setUsername(username);
                user.setPassword(password);
                user.setTel(tel);
            }
            
            /*// 测试语句
            PrintWriter out = response.getWriter();
            out.println(user);*/

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // 转发 session 数据到 pass.jsp
            request.getRequestDispatcher("pass.jsp").forward(request, response);

            ConnDB.close(); // 释放资源
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
