package model.vo;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Date;

/**
 * TODO Book테이블 타입 명확히할것
 * ex) publisher_number isbn total_page 등등 ==> 연산할 필요가없어서 varchar2로 해도될거같음
 */
public class BookVO {
    //    private long isbn;
    private String publisherNumber;
    private String isbn;
    private String genre;
    private int totalPage;
    private int price;
    private String title;
    private int stock;
    private String author;
    private String publicationDate;
    private String content;
    private String keyword;

    private MultipartFile imageFile;

    public MultipartFile getImageFile() {
        return imageFile;
    }

    public void setImageFile(MultipartFile imageFile) {
        this.imageFile = imageFile;

        if (!imageFile.isEmpty()) {
            File file = new File("E:\\Group3\\Group3\\web\\imgs\\book\\"+isbn+".PNG");

            try {
                imageFile.transferTo(file);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private Sales_DateVO salesDataVO;


    public BookVO() {
    }

    public String getPublisherNumber() {
        return publisherNumber;
    }

    public void setPublisherNumber(String publisherNumber) {
        this.publisherNumber = publisherNumber;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(String publicationDate) {
        this.publicationDate = publicationDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

}
