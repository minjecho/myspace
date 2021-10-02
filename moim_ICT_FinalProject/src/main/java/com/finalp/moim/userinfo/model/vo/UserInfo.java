package com.finalp.moim.userinfo.model.vo;

public class UserInfo implements java.io.Serializable {
	private static final long serialVersionUID = 1006L;
	
	private int user_no;
	private String user_id;
	private String user_nn;
	private String user_name;
	private String user_pwd;
	private int age;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private String interest;
	private String login_ok;
	private String admin;

	public UserInfo() {}

	public UserInfo(int user_no, String user_id, String user_nn, String user_name, String user_pwd, int age,
			String gender, String email, String phone, String address, String interest, String login_ok, String admin) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_nn = user_nn;
		this.user_name = user_name;
		this.user_pwd = user_pwd;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.interest = interest;
		this.login_ok = login_ok;
		this.admin = admin;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_nn() {
		return user_nn;
	}

	public void setUser_nn(String user_nn) {
		this.user_nn = user_nn;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public String getLogin_ok() {
		return login_ok;
	}

	public void setLogin_ok(String login_ok) {
		this.login_ok = login_ok;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "UserInfo [user_no=" + user_no + ", user_id=" + user_id + ", user_nn=" + user_nn + ", user_name="
				+ user_name + ", user_pwd=" + user_pwd + ", age=" + age + ", gender=" + gender + ", email=" + email
				+ ", phone=" + phone + ", address=" + address + ", interest=" + interest + ", login_ok=" + login_ok
				+ ", admin=" + admin + "]";
	}
	
}
