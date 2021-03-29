package cn.edu.xaut.servlet;

import cn.edu.xaut.bean.Loupan;
import cn.edu.xaut.db.ConnDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.interfaces.RSAKey;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@WebServlet("/loupanInit")
public class LoupanInit extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

//        int id = request.getParameter("id");
        List<Loupan> list = new ArrayList<>();
        
        // 连接数据库
        try {
            String sql = "select h.编号 房屋编号, 户型 房屋户型, 面积, 平方米单价, 总价, 楼盘编号, 名称 楼盘名称, 地址 楼盘地址, 开发商 楼盘开发商\n" +
                    "from tb_house h, tb_loupan l\n" +
                    "where h.楼盘编号 = l.编号";
            
            ResultSet rs = ConnDB.query(sql);
            while (rs.next()) {
                Loupan lp = new Loupan();
                lp.setHouseID(rs.getString("房屋编号"));
                lp.setHouseType(rs.getString("房屋户型"));
                lp.setArea(rs.getInt("面积"));
                lp.setPrice(rs.getInt("平方米单价"));
                lp.setSum(rs.getInt("总价"));
                lp.setLpID(rs.getString("楼盘编号"));
                lp.setLpName(rs.getString("楼盘名称"));
                lp.setAddress(rs.getString("楼盘地址"));
                lp.setFac(rs.getString("楼盘开发商"));

                // 测试
//                PrintWriter out = response.getWriter();
//                out.println(lp);
                
                list.add(lp);
            }
            HttpSession session = request.getSession();
            session.setAttribute("list", list);
            
            ConnDB.close(); // 释放资源

            String mark = request.getParameter("mark");
            
            // 转发数据
            // 如果 mark 为 ‘m’ ，则转发到 allLpList.jsp（管理员界面）
            // 否则， 转发到 lpList.jsp（客户界面）
            if (mark.equals("m"))
                request.getRequestDispatcher("allLpList.jsp").forward(request, response);
            else {
                int id = Integer.parseInt(request.getParameter("id"));
                request.getRequestDispatcher("lpList.jsp?id=" + id).forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
