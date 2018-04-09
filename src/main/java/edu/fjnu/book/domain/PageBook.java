package edu.fjnu.book.domain;

import java.util.List;

public class PageBook {
	private int pageid;
	private List<Book> book;
	private String remark;
	public int getPageid() {
		return pageid;
	}
	public void setPageid(int pageid) {
		this.pageid = pageid;
	}
	
	public List<Book> getBook() {
		return book;
	}
	public void setBook(List<Book> book) {
		this.book = book;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public PageBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PageBook(int pageid, List<Book> book, String remark) {
		super();
		this.pageid = pageid;
		this.book = book;
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "PageBook [pageid=" + pageid + ", book=" + book + ", remark="
				+ remark + "]";
	}
	
}
