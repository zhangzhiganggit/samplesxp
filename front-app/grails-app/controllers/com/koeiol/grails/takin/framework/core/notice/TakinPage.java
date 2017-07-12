package com.koeiol.grails.takin.framework.core.notice;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @param <T>
 */
public class TakinPage<T extends Serializable> {

    private int max = 10;
    private int offset = 0;
    private String sort = "id";
    private String order = "desc";

    private List<T> items;
    private int totalCount;

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
}
