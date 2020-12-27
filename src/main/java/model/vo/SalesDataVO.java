package model.vo;

public class SalesDataVO {
    private String orderNumber;
    private String isbn;
    private int amountPrice;
    private int amountQuantity;

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

    public int getAmountPrice() {
        return amountPrice;
    }

    public void setAmountPrice(int amountPrice) {
        this.amountPrice = amountPrice;
    }

    public int getAmountQuantity() {
        return amountQuantity;
    }

    public void setAmountQuantity(int amountQuantity) {
        this.amountQuantity = amountQuantity;
    }
}
