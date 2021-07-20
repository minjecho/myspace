package loginPage.model.vo;

public class Login implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private int userNo;
	private String userName;
	private String userId;
	private String userPwd;
	private String email;
	private String phone;
	private String address;
	private int shoesSize;
	private int point;
	private String mgr;
	private String bankName;
	private String accountNo;
	private String loginOk;
	
	public Login() {
		super();
	}

	public Login(int userNo, String userName, String userId, String userPwd, String email, String phone, String address,
			int shoesSize, int point, String mgr, String bankName, String accountNo, String loginOk) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.shoesSize = shoesSize;
		this.point = point;
		this.mgr = mgr;
		this.bankName = bankName;
		this.accountNo = accountNo;
		this.loginOk = loginOk;
	}



	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getShoesSize() {
		return shoesSize;
	}

	public void setShoesSize(int shoesSize) {
		this.shoesSize = shoesSize;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getMgr() {
		return mgr;
	}

	public void setMgr(String mgr) {
		this.mgr = mgr;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	
	public String getLoginOk() {
		return loginOk;
	}

	public void setLoginOk(String loginOk) {
		this.loginOk = loginOk;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Login [userNo=" + userNo + ", userName=" + userName + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", email=" + email + ", phone=" + phone + ", address=" + address + ", shoesSize=" + shoesSize
				+ ", point=" + point + ", mgr=" + mgr + ", bankName=" + bankName + ", accountNo=" + accountNo
				+ ", loginOk=" + loginOk + "]";
	}
}