package edu.fjnu.book.domain;
/**喜欢的图书实体类*/
public class LoveBook {
	private int id;
	private String userId;
	private Book book;
	private String remark;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public LoveBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoveBook(int id, String userId, Book book, String remark) {
		super();
		this.id = id;
		this.userId = userId;
		this.book = book;
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "LoveBook [id=" + id + ", userId=" + userId + ", book=" + book
				+ ", remark=" + remark + "]";
	}
	
}
