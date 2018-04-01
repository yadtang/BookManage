package edu.fjnu.book.domain;

/** 出版社 */
public class Publisher {
	private String id;
	private String name;
	private String status;
	private String remark;
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
	public Publisher() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Publisher(String id, String name, String status, String remark) {
		super();
		this.id = id;
		this.name = name;
		this.status = status;
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Publisher [id=" + id + ", name=" + name + ", status=" + status
				+ ", remark=" + remark + "]";
	}
}
