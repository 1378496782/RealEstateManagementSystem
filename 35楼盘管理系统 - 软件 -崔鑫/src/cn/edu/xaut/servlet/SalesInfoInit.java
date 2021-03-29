package cn.edu.xaut.servlet;

import cn.edu.xaut.bean.Sales;
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

@WebServlet("/salesInfoInit")
public class SalesInfoInit extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        List<Sales> list = new ArrayList<>();
        
        // 连接数据库并查询信息
        try {
            String sql = "select 订单编号, u.编号 用户编号, u.姓名 户主姓名,手机号,户型 所选户型, 面积, 总价, 名称 楼盘名字, 地址 楼盘地址, 开发商 楼盘开发商\n" +
                    "from tb_user u, tb_sales s, tb_house h, tb_loupan l\n" +
                    "where s.户主编号 = u.编号 and s.房屋编号 = h.编号 and h.楼盘编号 = l.编号";
            ResultSet rs = ConnDB.query(sql);
            while (rs.next()) {
                Sales s = new Sales();
                s.setOrderID(rs.getInt("订单编号"));
                s.setID(rs.getInt("用户编号"));
                s.setName(rs.getString("户主姓名"));
                s.setTel(rs.getString("手机号"));
                s.sethType(rs.getString("所选户型"));
                s.setArea(rs.getInt("面积"));
                s.setSum(rs.getInt("总价"));
                s.setLpName(rs.getString("楼盘名字"));
                s.setLpAdd(rs.getString("楼盘地址"));
                s.setLpFac(rs.getString("楼盘开发商"));

                list.add(s);
            }

            HttpSession session = request.getSession();
            session.setAttribute("list", list);
            
            // 转发数据
            request.getRequestDispatcher("salesInfo.jsp").forward(request, response);
            
            ConnDB.close(); // 释放资源
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
