package edu.fjnu.book.domain;


/**首页展示实体类*/
public class HomePage {
	private int id;
	private String name;
	private PageBook pageBook; 
	private String remark;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public PageBook getPageBook() {
		return pageBook;
	}
	public void setPageBook(PageBook pageBook) {
		this.pageBook = pageBook;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public HomePage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HomePage(int id, String name, PageBook pageBook, String remark) {
		super();
		this.id = id;
		this.name = name;
		this.pageBook = pageBook;
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "HomePage [id=" + id + ", name=" + name + ", pageBook="
				+ pageBook + ", remark=" + remark + "]";
	}
}
