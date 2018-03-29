package edu.fjnu.book.domain;
/**用户实体类*/
public class User {
	private String userId;
	private String userName;
	private String userPwd;
	private String userType;
	private String userState;
	private String email;
	private String telephone;
	private String address;
	private String remark;
	private String hobby;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserState() {
		return userState;
	}
	public void setUserState(String userState) {
		this.userState = userState;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public User() {
		super();
	}
	public User(String userId, String userName, String userPwd,
			String userType, String userState, String email, String telephone,
			String address, String remark, String hobby) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userType = userType;
		this.userState = userState;
		this.email = email;
		this.telephone = telephone;
		this.address = address;
		this.remark = remark;
		this.hobby = hobby;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", userPwd=" + userPwd + ", userType=" + userType
				+ ", userState=" + userState + ", email=" + email
				+ ", telephone=" + telephone + ", address=" + address
				+ ", remark=" + remark + ", hobby=" + hobby + "]";
	}
}
