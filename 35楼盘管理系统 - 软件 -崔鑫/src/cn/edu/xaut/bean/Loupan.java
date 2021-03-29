package cn.edu.xaut.bean;

public class Loupan {
    
    private String  houseID;        // 房屋编号
    private String houseType;       // 房屋户型
    private int area;               // 面积
    private int price;              // 单价
    private int sum;                // 总价
    private String lpID;            // 楼盘编号
    private String lpName;          // 楼盘名称
    private String address;         // 楼盘地址
    private String fac;             // 楼盘开发商

    public Loupan() {
        
    }

    public String getHouseID() {
        return houseID;
    }

    public void setHouseID(String houseID) {
        this.houseID = houseID;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public String getLpID() {
        return lpID;
    }

    public void setLpID(String lpID) {
        this.lpID = lpID;
    }

    public String getLpName() {
        return lpName;
    }

    public void setLpName(String lpName) {
        this.lpName = lpName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFac() {
        return fac;
    }

    public void setFac(String fac) {
        this.fac = fac;
    }

    @Override
    public String toString() {
        return "Loupan{" +
                "houseID='" + houseID + '\'' +
                ", houseType='" + houseType + '\'' +
                ", area=" + area +
                ", price=" + price +
                ", sum=" + sum +
                ", lpID='" + lpID + '\'' +
                ", lpName='" + lpName + '\'' +
                ", address='" + address + '\'' +
                ", fac='" + fac + '\'' +
                '}';
    }
}
