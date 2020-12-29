package model.vo;

public class ReviewVO {
    private String reviewNumber;
    private String orderNumber;
    private String isbn;
    private String writingTime;
    private String content;
    private int score;

    private MemberVO memberVO;
    private PurchaseVO purchaseVO;

    public ReviewVO() {
    }

    public String getReviewNumber() {
        return reviewNumber;
    }

    public void setReviewNumber(String reviewNumber) {
        this.reviewNumber = reviewNumber;
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

    public String getWritingTime() {
        return writingTime;
    }

    public void setWritingTime(String writingTime) {
        this.writingTime = writingTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public MemberVO getMemberVO() {
        return memberVO;
    }

    public void setMemberVO(MemberVO memberVO) {
        this.memberVO = memberVO;
    }

    public PurchaseVO getPurchaseVO() {
        return purchaseVO;
    }

    public void setPurchaseVO(PurchaseVO purchaseVO) {
        this.purchaseVO = purchaseVO;
    }
}
