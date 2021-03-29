package cn.edu.xaut.servlet;

import cn.edu.xaut.db.ConnDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

@WebServlet("/loginManage")
public class LoginManage extends HttpServlet {

    public LoginManage() {
        
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        
        // 获取参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {

            String sql = "select * from tb_admin where 用户名 = '" + username + "' and 密码 = '" + password + "'";
            ResultSet rs = ConnDB.queryByPstmt(sql);
            rs.last();
            PrintWriter out = response.getWriter();
            out.println(rs.getRow());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
