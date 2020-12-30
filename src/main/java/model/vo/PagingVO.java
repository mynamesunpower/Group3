package model.vo;

public class PagingVO {
    private static final long serialVersionUID = 1L;

    /*
    *  rows : 현재 페이지에 보여질 row
    *  page : 현재 페이지에 보여질 페이지 수
    *  startPage : 시작 페이지 수?
    *  endPage : 끝 페이지 수?
    *  pageScale : 한 페이지에 보여질 페이지 수
    * */

    private int rows = 10;
    private int page = 1;
    private int totalPage;
    private int startPage = 1;
    private int endPage;
    private int pageScale = 2;

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public int getPageScale() {
        return pageScale;
    }

    public void setPageScale(int pageScale) {
        this.pageScale = pageScale;
    }
}
