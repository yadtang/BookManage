package edu.fjnu.book.domain;
/**评价实体*/
public class Evaluate {
	private int id;
	private String content;
	private String bookid;
	private int score;
	private String remark;
	private String time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Evaluate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Evaluate(int id, String content, String bookid, int score,
			String remark, String time) {
		super();
		this.id = id;
		this.content = content;
		this.bookid = bookid;
		this.score = score;
		this.remark = remark;
		this.time = time;
	}
	@Override
	public String toString() {
		return "Evaluate [id=" + id + ", content=" + content + ", bookid="
				+ bookid + ", score=" + score + ", remark=" + remark
				+ ", time=" + time + "]";
	}
	
}
