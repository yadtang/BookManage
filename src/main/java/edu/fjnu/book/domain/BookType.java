package edu.fjnu.book.domain;
/**
 * 图书分类表
 * @author hspcadmin
 *
 */
public class BookType {
	private int typeId;
	private String typeName;
	private String status;
	private String remark;
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
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
	public BookType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookType(int typeId, String typeName, String status, String remark) {
		super();
		this.typeId = typeId;
		this.typeName = typeName;
		this.status = status;
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "BookType [typeId=" + typeId + ", typeName=" + typeName
				+ ", status=" + status + ", remark=" + remark + "]";
	}
}
