package orders.model.vo;

import java.sql.Date;

public class Orders implements java.io.Serializable {
	// Serial ID
	private static final long serialVersionUID = 2L;

	// Field
	private int ordersNo;
	private int userNo;
	private int itemNo;
	private String userID;
	private java.sql.Date purDate;
	private int count;
	private String progress;
	private int price;
	private String address;
	private int size;
	private String phone;
	private int delFee;
	private String payment;
	
	// Constructor
	public Orders() {}

	public Orders(int ordersNo, int userNo, int itemNo, String userID, Date purDate, int count, String progress,
			int price, String address, int size, String phone, int delFee, String payment) {
		super();
		this.ordersNo = ordersNo;
		this.userNo = userNo;
		this.itemNo = itemNo;
		this.userID = userID;
		this.purDate = purDate;
		this.count = count;
		this.progress = progress;
		this.price = price;
		this.address = address;
		this.size = size;
		this.phone = phone;
		this.delFee = delFee;
		this.payment = payment;
	}

	// Getter & Setter
	public int getOrdersNo() {
		return ordersNo;
	}

	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public java.sql.Date getPurDate() {
		return purDate;
	}

	public void setPurDate(java.sql.Date purDate) {
		this.purDate = purDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getDelFee() {
		return delFee;
	}

	public void setDelFee(int delFee) {
		this.delFee = delFee;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	// toString()
	@Override
	public String toString() {
		return "Orders [ordersNo=" + ordersNo + ", userNo=" + userNo + ", itemNo=" + itemNo + ", userID=" + userID
				+ ", purDate=" + purDate + ", count=" + count + ", progress=" + progress + ", price=" + price
				+ ", address=" + address + ", size=" + size + ", phone=" + phone + ", delFee=" + delFee + ", payment="
				+ payment + "]";
	}
	
	
}
