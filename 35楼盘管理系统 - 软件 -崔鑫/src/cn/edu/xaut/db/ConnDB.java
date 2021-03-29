package cn.edu.xaut.db;

import java.sql.*;

public class ConnDB {

    // 连接信息
    private static final String URL = "jdbc:mysql://localhost:3306/db_loupan?serverTimezone=UTC";
    private static final String DRIVERCLASS = "com.mysql.cj.jdbc.Driver";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";


    // 数据库操作变量
    private static Connection con = null;
    private static ResultSet rs = null;
    private static Statement stmt = null;
    private static PreparedStatement pstmt = null;
    private static int rows = 0;


    /**
     * 建立连接
     */
    public static Connection getConnection() throws Exception {

        // 注册驱动
        Class.forName(DRIVERCLASS);
        // 获得连接
        con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        return con;
    }

    /**
     * 查询
     */
    public static ResultSet query(String sql) throws Exception {
        con = getConnection();
        stmt = con.createStatement();
        rs = stmt.executeQuery(sql);
        return rs;
    }

    /**
     * 通过PreparedStatement执行查询，能够有效防止SQL注入漏洞
     * @param sql
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public static ResultSet queryByPstmt(String sql) throws Exception {
        con = getConnection();
        pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);
        rs = pstmt.executeQuery();
        return rs;
    }

    /**
     * 增加、删除、修改
     * @param sql
     * @return
     * @throws Exception
     */
    public static int update(String sql)throws Exception {
        con = getConnection();
        stmt = con.createStatement();
        rows = stmt.executeUpdate(sql);
        return rows;
    }

    /**
     * 通过PreparedStatement执行更新，能够有效防止SQL注入漏洞
     * @param sql
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public static int updateByPstmt(String sql)throws Exception {
        con = getConnection();
        pstmt = con.prepareStatement(sql);  // 预编译
        rows = pstmt.executeUpdate();
        return rows;
    }

    /**
     * 释放资源
     * @throws Exception
     */
    public static void close() throws Exception{
        if (rs != null)
            rs.close();
        if (stmt != null)
            stmt.close();
        if (pstmt != null)
            pstmt.close();
        if (con != null)
            con.close();
    }
}
