package itemPage.model.vo;

import java.sql.Date;

public class Item implements java.io.Serializable{

	private static final long serialVersionUID = 2L;
	
	private int itemNo;
	private String itemName;
	private String brand;
	private int price;
	private java.sql.Date regDate;
	private java.sql.Date dropDate;
	private int shoesSize;
	
	public Item() {
		super();
	}

	public Item(int itemNo, String itemName, String brand, int price, Date regDate, Date dropDate, int shoesSize) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.brand = brand;
		this.price = price;
		this.regDate = regDate;
		this.dropDate = dropDate;
		this.shoesSize = shoesSize;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public java.sql.Date getRegDate() {
		return regDate;
	}

	public void setRegDate(java.sql.Date regDate) {
		this.regDate = regDate;
	}

	public java.sql.Date getDropDate() {
		return dropDate;
	}

	public void setDropDate(java.sql.Date dropDate) {
		this.dropDate = dropDate;
	}

	public int getShoesSize() {
		return shoesSize;
	}

	public void setShoesSize(int shoesSize) {
		this.shoesSize = shoesSize;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Item [itemNo=" + itemNo + ", itemName=" + itemName + ", brand=" + brand + ", price=" + price
				+ ", regDate=" + regDate + ", dropDate=" + dropDate + ", shoesSize=" + shoesSize + "]";
	}
}