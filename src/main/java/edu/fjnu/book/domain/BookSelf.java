package edu.fjnu.book.domain;
/**
 * 书架表
 * @author hspcadmin
 *
 */
public class BookSelf {

	private String id;
	private String name;
	private String bookid;
	private int	categoryId;
	private String status;
	private String remrk;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemrk() {
		return remrk;
	}
	public void setRemrk(String remrk) {
		this.remrk = remrk;
	}
	public BookSelf() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookSelf(String id, String name, String bookid, int categoryId,
			String status, String remrk) {
		super();
		this.id = id;
		this.name = name;
		this.bookid = bookid;
		this.categoryId = categoryId;
		this.status = status;
		this.remrk = remrk;
	}
	@Override
	public String toString() {
		return "BookSelf [id=" + id + ", name=" + name + ", bookid=" + bookid
				+ ", categoryId=" + categoryId + ", status=" + status
				+ ", remrk=" + remrk + "]";
	}
	
}
