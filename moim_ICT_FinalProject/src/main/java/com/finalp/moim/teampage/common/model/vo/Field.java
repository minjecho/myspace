package com.finalp.moim.teampage.common.model.vo;

public class Field implements java.io.Serializable {
	private static final long serialVersionUID = 2222L;
	
	private int field_num;
	private String field_name;
	
	public Field() {}

	public Field(int field_num, String field_name) {
		super();
		this.field_num = field_num;
		this.field_name = field_name;
	}

	public int getField_num() {
		return field_num;
	}

	public void setField_num(int field_num) {
		this.field_num = field_num;
	}

	public String getField_name() {
		return field_name;
	}

	public void setField_name(String field_name) {
		this.field_name = field_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Field [field_num=" + field_num + ", field_name=" + field_name + "]";
	}

}
