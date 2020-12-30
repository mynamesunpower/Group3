package model.vo;

public class ShoppingCartVO {
    private String tel;
    private String isbn;
    private int quantity;

    private BookVO bookVO;
    private MemberVO memberVO;


    public ShoppingCartVO() {
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public int getQuantity() {
        return quantity;
    }

    public BookVO getBookVO() {
        return bookVO;
    }

    public void setBookVO(BookVO bookVO) {
        this.bookVO = bookVO;
    }

    public MemberVO getMemberVO() {
        return memberVO;
    }

    public void setMemberVO(MemberVO memberVO) {
        this.memberVO = memberVO;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
