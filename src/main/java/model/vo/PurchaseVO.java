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
    private String shipAddress;

    private MemberVO memberVO;
    private NonMemberVO nonMemberVO;
    private PurchaseBookVO purchaseBookVO;
    private BookVO bookVO;

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

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public MemberVO getMemberVO() {
        return memberVO;
    }

    public void setMemberVO(MemberVO memberVO) {
        this.memberVO = memberVO;
    }

    public NonMemberVO getNonMemberVO() {
        return nonMemberVO;
    }

    public void setNonMemberVO(NonMemberVO nonMemberVO) {
        this.nonMemberVO = nonMemberVO;
    }

    public PurchaseBookVO getPurchaseBookVO() {
        return purchaseBookVO;
    }

    public void setPurchaseBookVO(PurchaseBookVO purchaseBookVO) {
        this.purchaseBookVO = purchaseBookVO;
    }

    public BookVO getBookVO() {
        return bookVO;
    }

    public void setBookVO(BookVO bookVO) {
        this.bookVO = bookVO;
    }
}