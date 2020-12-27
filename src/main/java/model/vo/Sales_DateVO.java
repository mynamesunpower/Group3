package model.vo;

public class Sales_DateVO {

    private String ordernumber;
    private String isbn;
    private String amountprice;
    private int amountquantity;


    public String getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(String ordernumber) {
        this.ordernumber = ordernumber;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getAmountprice() {
        return amountprice;
    }

    public void setAmountprice(String amountprice) {
        this.amountprice = amountprice;
    }

    public int getAmountquantity() {
        return amountquantity;
    }

    public void setAmountquantity(int amountquantity) {
        this.amountquantity = amountquantity;
    }
}
