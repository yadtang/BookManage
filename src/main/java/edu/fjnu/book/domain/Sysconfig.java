package edu.fjnu.book.domain;
/** 系统配置 */
public class Sysconfig {
	private int id;
	private String paramName;
	private String paramValue;
	private String status;
	private String remark;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getParamName() {
		return paramName;
	}
	public void setParamName(String paramName) {
		this.paramName = paramName;
	}
	public String getParamValue() {
		return paramValue;
	}
	public void setParamValue(String paramValue) {
		this.paramValue = paramValue;
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
	public Sysconfig() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Sysconfig(int id, String paramName, String paramValue,
			String status, String remark) {
		super();
		this.id = id;
		this.paramName = paramName;
		this.paramValue = paramValue;
		this.status = status;
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Sysconfig [id=" + id + ", paramName=" + paramName
				+ ", paramValue=" + paramValue + ", status=" + status
				+ ", remark=" + remark + "]";
	}
}
