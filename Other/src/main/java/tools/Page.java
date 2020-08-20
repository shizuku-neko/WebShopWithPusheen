//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package tools;

import java.util.List;

public class Page {
    private int pageSize;
    private int pageIndex;
    private int totalCount;
    private int pageTotalCount;
    private List list;

    public Page() {
    }

    public int getPageSize() {
        return this.pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageIndex() {
        return this.pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        if (pageIndex < 1) {
            this.pageIndex = 1;
        } else if (pageIndex > this.pageTotalCount) {
            this.pageIndex = this.pageTotalCount;
        } else {
            this.pageIndex = pageIndex;
        }

    }

    public int getTotalCount() {
        return this.totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        if (totalCount == 0) {
            this.pageTotalCount = 1;
        } else if (this.totalCount % this.pageSize == 0) {
            this.pageTotalCount = this.totalCount / this.pageSize;
        } else {
            this.pageTotalCount = this.totalCount / this.pageSize + 1;
        }

    }

    public int getPageTotalCount() {
        return this.pageTotalCount;
    }

    public void setPageTotalCount(int pageTotalCount) {
        this.pageTotalCount = pageTotalCount;
    }

    public List getList() {
        return this.list;
    }

    public void setList(List list) {
        this.list = list;
    }
}
