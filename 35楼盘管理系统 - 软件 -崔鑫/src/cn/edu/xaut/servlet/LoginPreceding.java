package cn.edu.xaut.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/loginPreceding")
public class LoginPreceding extends HttpServlet {

    public LoginPreceding() {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置编码格式
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        // 确认session里是否有loginSuccess
        HttpSession session = request.getSession();
        if (session.getAttribute("loginSuccess") == null) {
            response.sendRedirect("login.html");
        } else {

        }
    }
}
