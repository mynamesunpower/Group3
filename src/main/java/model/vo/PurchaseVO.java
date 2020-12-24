package model.vo;

public class PurchaseVO {
    private int order_Number;
    private String memberTel;
    private String nonMemberTel;
    private int quantity;
    private String state;
    private int total_Price;
    private String purchase_Date;


    public int getOrder_Number() {
        return order_Number;
    }

    public String getMemberTel() {
        return memberTel;
    }

    public String getNonMemberTel() {
        return nonMemberTel;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getState() {
        return state;
    }

    public int getTotal_Price() {
        return total_Price;
    }

    public String getPurchase_Date() {
        return purchase_Date;
    }

    public void setOrder_Number(int order_Number) {
        this.order_Number = order_Number;
    }

    public void setMemberTel(String memberTel) {
        this.memberTel = memberTel;
    }

    public void setNonMemberTel(String nonMemberTel) {
        this.nonMemberTel = nonMemberTel;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setTotal_Price(int total_Price) {
        this.total_Price = total_Price;
    }

    public void setPurchaseDate(String purchase_Date) {
        this.purchase_Date = purchase_Date;
    }
}