package com.yan1less.otakus.utils;

import java.util.List;

public class Page<T> {
    
	private int currentPage;		//当前页
	private int currentCount;		//当前页显示条数
	private int totalPage;			//总页
	private int totalCount;			//总数据条数
    private List<T> rows;


	@Override
	public String toString() {
		return "Page{" +
				"currentPage=" + currentPage +
				", currentCount=" + currentCount +
				", totalPage=" + totalPage +
				", totalCount=" + totalCount +
				", rows=" + rows +
				'}';
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getCurrentCount() {
		return currentCount;
	}

	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}
}
