package edu.fjnu.book.domain;

public class Mark {
	private int id;
	private String name;
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
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Mark() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Mark(int id, String name, String remark) {
		super();
		this.id = id;
		this.name = name;
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Mark [id=" + id + ", name=" + name + ", remark=" + remark + "]";
	}
	
}
