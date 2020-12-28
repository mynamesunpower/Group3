package model.vo;

public class SalesDataVO {

    private String orderNumber;
    private String isbn;
    private int amountQuantity;
    private int amountPrice;

    public SalesDataVO() {
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

    public int getAmountQuantity() {
        return amountQuantity;
    }

    public void setAmountQuantity(int amountQuantity) {
        this.amountQuantity = amountQuantity;
    }

    public int getAmountPrice() {
        return amountPrice;
    }

    public void setAmountPrice(int amountPrice) {
        this.amountPrice = amountPrice;
    }
}
