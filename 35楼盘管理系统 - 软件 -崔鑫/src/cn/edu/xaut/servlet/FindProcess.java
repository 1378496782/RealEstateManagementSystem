package cn.edu.xaut.servlet;

import cn.edu.xaut.bean.User;
import cn.edu.xaut.db.ConnDB;
import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/findProcess")
public class FindProcess extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        
        // 连接数据库并查询信息
        try {
            String message = request.getParameter("searchText");        // 获取文本框中的信息
            String sql = "select * from tb_user ";
            if (message != null && !message.equals("")) {
                sql += "where 编号 = " + message + " or 姓名 like '%" + message + "%' or 用户名 like '%" + message + "%' or 手机号 like '%" + message + "%'";                                                                                                                        
            }
            ResultSet rs = ConnDB.query(sql);
            
            // 将查询到的数据放到 list 中，然后存入 json
            List<User> list = new ArrayList<>();
            while (rs.next()) {

                User u = new User();

                u.setId(rs.getInt("编号"));
                u.setName(rs.getString("姓名"));
                u.setUsername(rs.getString("用户名"));
                u.setPassword(rs.getString("密码"));
                u.setTel(rs.getString("手机号"));

                list.add(u);    // 将查询到的数据装入 list 表中
            }

            String json = JSON.toJSONString(list);      // FASTJSON
            PrintWriter out = response.getWriter();
            out.println(json);      // 将 json 文件打印到该 servlet, 以便其他文件的提取
            
            
            ConnDB.close();     // 释放资源
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
