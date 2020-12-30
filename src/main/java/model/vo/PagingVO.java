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

    private long rows = 10;
    private long page = 1;
    private long totalPage;
    private long startPage = 1;
    private long endPage;
    private long pageScale = 3;

    public long getRows() {
        return rows;
    }

    public void setRows(long rows) {
        this.rows = rows;
    }

    public long getPage() {
        return page;
    }

    public void setPage(long page) {
        this.page = page;
    }

    public long getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(long totalPage) {
        this.totalPage = totalPage;
    }

    public long getStartPage() {
        return startPage;
    }

    public void setStartPage(long startPage) {
        this.startPage = startPage;
    }

    public long getEndPage() {
        return endPage;
    }

    public void setEndPage(long endPage) {
        this.endPage = endPage;
    }

    public long getPageScale() {
        return pageScale;
    }

    public void setPageScale(long pageScale) {
        this.pageScale = pageScale;
    }
}
