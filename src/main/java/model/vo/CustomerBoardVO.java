package model.vo;

public class CustomerBoardVO {

    private int articleId;
    private String writingTime;
    private String title;
    private String content;
    private String tel;
    private String id;
    private int readCount;

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public String getWritingTime() {
        return writingTime;
    }

    public void setWritingTime(String writingTime) {
        this.writingTime = writingTime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getReadCount() {
        return readCount;
    }

    public void setReadCount(int readCount) {
        this.readCount = readCount;
    }
//    create table customer_service (

//    article_id number(10),
//    writing_time date,
//    content varchar2(300),
//    tel varchar2(13),
//    id varchar2(20),
//    read_count number(10),

//    constraint customer_service_fk_tel foreign key(tel)
//    references member(tel),
//    constraint customer_service_fk_id foreign key(id)
//    references manager(id));

//    create sequence seq_article_id;
}
