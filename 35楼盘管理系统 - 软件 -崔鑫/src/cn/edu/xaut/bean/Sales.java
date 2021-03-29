package cn.edu.xaut.bean;

/**
 * 承载销售信息的 javaBean
 */
public class Sales {
    
    private int orderID;    // 订单编号
    private int ID;         // 用户编号
    private String name;    // 户主姓名
    private String tel;     // 手机号
    private String hType;   // 所选户型
    private int area;       // 面积
    private int sum;        // 总价
    private String lpName;  // 楼盘名字
    private String lpAdd;   // 楼盘地址
    private String lpFac;   // 楼盘开发商

    public Sales() {
        
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String gethType() {
        return hType;
    }

    public void sethType(String hType) {
        this.hType = hType;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public String getLpName() {
        return lpName;
    }

    public void setLpName(String lpName) {
        this.lpName = lpName;
    }

    public String getLpAdd() {
        return lpAdd;
    }

    public void setLpAdd(String lpAdd) {
        this.lpAdd = lpAdd;
    }

    public String getLpFac() {
        return lpFac;
    }

    public void setLpFac(String lpFac) {
        this.lpFac = lpFac;
    }

    @Override
    public String toString() {
        return "Sales{" +
                "orderID=" + orderID +
                ", ID=" + ID +
                ", name='" + name + '\'' +
                ", tel='" + tel + '\'' +
                ", hType='" + hType + '\'' +
                ", area=" + area +
                ", sum=" + sum +
                ", lpName='" + lpName + '\'' +
                ", lpAdd='" + lpAdd + '\'' +
                ", lpFac='" + lpFac + '\'' +
                '}';
    }
}
