package edu.fjnu.book.domain;
/**
 * 书架分类
 * @author hspcadmin
 *
 */
public class Category {
	private int id;
	private String name;
	private String status;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(int id, String name, String status, String remark) {
		super();
		this.id = id;
		this.name = name;
		this.status = status;
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", status=" + status
				+ ", remark=" + remark + "]";
	}
	
}
