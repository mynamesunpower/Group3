package model.vo;

public class ReviewVO {
    private String reveiwNumber;
    private String orderNumber;
    private String writingTime;
    private String content;
    private Long score;

    public ReviewVO() {
    }

    public String getReveiwNumber() {
        return reveiwNumber;
    }

    public void setReveiwNumber(String reveiwNumber) {
        this.reveiwNumber = reveiwNumber;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
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

    public Long getScore() {
        return score;
    }

    public void setScore(Long score) {
        this.score = score;
    }
}
