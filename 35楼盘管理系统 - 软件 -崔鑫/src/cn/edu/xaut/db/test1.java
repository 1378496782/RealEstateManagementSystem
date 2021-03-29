package cn.edu.xaut.db;

import java.sql.ResultSet;

/**
 * 一个测试用例 test1
 * 测试数据库能否连通
 */
public class test1 {

    public static void main(String[] args) {

        try {
            String sql = "select * from db_loupan.tb_user";
            ResultSet rs = ConnDB.query(sql);
            while (rs.next()) {
                String id = rs.getString("编号");
                String name = rs.getString("姓名");
                System.out.println(id + " " + name);
            }
            ConnDB.close(); // 释放资源
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
