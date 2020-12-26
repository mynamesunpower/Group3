package model.vo;

public class PurchaseVO {
    private String orderNumber;
    private String isbn;
    private String receiver;
    private String memberTel;
    private String nonMemberTel;
    private String state;
    private int totalPrice;
    private String purchaseDate;
    private String deliveryDate;

    public PurchaseVO() {
    }


    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getMemberTel() {
        return memberTel;
    }

    public void setMemberTel(String memberTel) {
        this.memberTel = memberTel;
    }

    public String getNonMemberTel() {
        return nonMemberTel;
    }

    public void setNonMemberTel(String nonMemberTel) {
        this.nonMemberTel = nonMemberTel;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(String deliveryDate) {
        this.deliveryDate = deliveryDate;
    }
}
